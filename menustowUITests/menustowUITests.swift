import XCTest

final class menustowUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testMenuBarLayoutScreenshot() {
        runScenario("menuBarLayout", name: "menu-bar-layout", waitForText: "Drag to arrange")
    }

    func testMenuBarAppearanceScreenshot() {
        runScenario("menuBarAppearance", name: "menu-bar-appearance", waitForText: "Menu Bar Shape")
    }

    func testMenuBarSpacingScreenshot() {
        runScenario("generalSpacing", name: "menu-bar-spacing", waitForText: "Menu bar item spacing")
    }

    func testMenuBarSearchScreenshot() {
        runScenario("search", name: "menu-bar-search", waitForText: "Search menu bar items")
    }

    private func runScenario(_ scenario: String, name: String, waitForText: String? = nil) {
        let app = XCUIApplication()
        app.launchEnvironment["MENUSTOW_SCREENSHOT_MODE"] = "1"
        app.launchEnvironment["MENUSTOW_SCREENSHOT_SCENARIO"] = scenario
        app.launch()

        let window = app.windows.firstMatch
        XCTAssertTrue(window.waitForExistence(timeout: 12), "Expected window for scenario \(scenario)")

        if let waitForText {
            let predicate = NSPredicate(format: "label CONTAINS %@", waitForText)
            let text = app.staticTexts.containing(predicate).firstMatch
            if !text.waitForExistence(timeout: 4) {
                let scrollView = app.scrollViews.firstMatch
                for _ in 0..<6 {
                    scrollView.swipeUp()
                    if text.waitForExistence(timeout: 1) {
                        break
                    }
                }
            }
        }

        captureScreenshot(named: name)
    }

    private func captureScreenshot(named name: String) {
        let screenshot = XCUIScreen.main.screenshot()

        if let outputDir = ProcessInfo.processInfo.environment["SCREENSHOT_DIR"], !outputDir.isEmpty {
            let dirURL = URL(fileURLWithPath: outputDir, isDirectory: true)
            do {
                try FileManager.default.createDirectory(at: dirURL, withIntermediateDirectories: true)
                let fileURL = dirURL.appendingPathComponent("\(name).png")
                try screenshot.pngRepresentation.write(to: fileURL)
            } catch {
                let attachment = XCTAttachment(screenshot: screenshot)
                attachment.name = name
                attachment.lifetime = .keepAlways
                add(attachment)
            }
        } else {
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.name = name
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }
}
