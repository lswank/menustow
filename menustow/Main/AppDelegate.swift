//
//  AppDelegate.swift
//  menustow
//
//  Adapted from stonerl/Ice (my-build) by @stonerl.

import OSLog
import SwiftUI

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate {
    /// The shared app state.
    let appState = AppState()

    // MARK: NSApplicationDelegate Methods

    func applicationWillFinishLaunching(_ notification: Notification) {
        // Initial chore work.
        NSSplitViewItem.swizzle()
        MigrationManager(appState: appState).migrateAll()
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide the main menu's items to add additional space to the
        // menu bar when we are the focused app.
        for item in NSApp.mainMenu?.items ?? [] {
            item.isHidden = true
        }

        // Allow hiding the mouse while the app is in the background
        // to make menu bar item movement less jarring.
        Bridging.setConnectionProperty(true, forKey: "SetsCursorInBackground")

        if handleScreenshotModeIfNeeded() {
            return
        }

        #if DEBUG
        // Don't perform setup if running as a preview.
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return
        }
        #endif

        // Depending on the permissions state, either perform setup
        // or prompt to grant permissions.
        switch appState.permissions.permissionsState {
        case .hasAll:
            appState.permissions.logger.debug("Passed all permissions checks")
            appState.performSetup(hasPermissions: true)
        case .hasRequired:
            appState.permissions.logger.debug("Passed required permissions checks")
            appState.performSetup(hasPermissions: true)
        case .missing:
            appState.permissions.logger.debug("Failed required permissions checks")
            appState.performSetup(hasPermissions: false)
        }
    }

    private func handleScreenshotModeIfNeeded() -> Bool {
        guard ProcessInfo.processInfo.environment["MENUSTOW_SCREENSHOT_MODE"] == "1" else {
            return false
        }

        let scenario = ProcessInfo.processInfo.environment["MENUSTOW_SCREENSHOT_SCENARIO"] ?? "menuBarLayout"

        appState.performSetup(hasPermissions: true)

        switch scenario {
        case "menuBarAppearance":
            appState.navigationState.settingsNavigationIdentifier = .menuBarAppearance
        case "generalSpacing":
            appState.navigationState.settingsNavigationIdentifier = .general
        case "hotkeys":
            appState.navigationState.settingsNavigationIdentifier = .hotkeys
        case "advanced":
            appState.navigationState.settingsNavigationIdentifier = .advanced
        case "about":
            appState.navigationState.settingsNavigationIdentifier = .about
        default:
            appState.navigationState.settingsNavigationIdentifier = .menuBarLayout
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [appState] in
            if scenario == "search" {
                appState.activate(withPolicy: .regular)
                appState.menuBarManager.searchPanel.show()
            } else {
                appState.activate(withPolicy: .regular)
                appState.openWindow(.settings)
            }
        }

        return true
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows: Bool) -> Bool {
        Logger.default.debug("Handling reopen")
        openSettingsWindow()
        return true
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        if
            sender.isActive,
            sender.activationPolicy() != .accessory,
            appState.navigationState.isAppFrontmost
        {
            Logger.default.debug("All windows closed - deactivating with accessory activation policy")
            appState.deactivate(withPolicy: .accessory)
        }
        return false
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    // MARK: Other Methods

    /// Opens the settings window and activates the app.
    @objc func openSettingsWindow() {
        // Delay makes this more reliable for some reason.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [appState] in
            appState.activate(withPolicy: .regular)
            appState.openWindow(.settings)
        }
    }
}
