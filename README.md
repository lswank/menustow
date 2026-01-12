<div align="center">
    <img src="menustow/Resources/Assets.xcassets/AppIcon.appiconset/icon_256x256.png" width=200 height=200>
    <h1>menustow</h1>
</div>

menustow is a powerful menu bar management tool. While its primary function is hiding and showing menu bar items, it aims to cover a wide variety of additional features to make it one of the most versatile menu bar tools available.

About: [menustow.com](https://menustow.com)

![Banner](https://github.com/user-attachments/assets/4423085c-4e4b-4f3d-ad0f-90a217c03470)

[![Download](https://img.shields.io/badge/download-latest-brightgreen?style=flat-square)](https://github.com/lswank/menustow/releases/latest)
![Platform](https://img.shields.io/badge/platform-macOS-blue?style=flat-square)
![Requirements](https://img.shields.io/badge/requirements-macOS%2014%2B-fa4e49?style=flat-square)
[![Sponsor](https://img.shields.io/badge/Sponsor%20%E2%9D%A4%EF%B8%8F-8A2BE2?style=flat-square)](https://github.com/sponsors/lswank)
[![Website](https://img.shields.io/badge/Website-015FBA?style=flat-square)](https://menustow.com)
[![License](https://img.shields.io/github/license/lswank/menustow?style=flat-square)](LICENSE)

> [!IMPORTANT]
> menustow is a fork of [Ice](https://github.com/jordanbaird/Ice) by Jordan Baird, maintained under the GPL-3.0 license. Original notices are preserved.

> [!NOTE]
> menustow is currently in active development. Some features have not yet been implemented. Download the latest release [here](https://github.com/lswank/menustow/releases/latest) and see the roadmap below for upcoming features.

<a href="https://www.buymeacoffee.com/jordanbaird" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;">
</a>

## Install

### Manual Installation

Download the "menustow.zip" file from the [latest release](https://github.com/lswank/menustow/releases/latest) and move the unzipped app into your `Applications` folder.

### Homebrew

Install via the custom tap:

```sh
brew install lswank/homebrew-tap/menustow
```

## Website

The homepage lives in `site/`.

## Features/Roadmap

### Menu bar item management

- [x] Hide menu bar items
- [x] "Always-hidden" menu bar section
- [x] Show hidden menu bar items when hovering over the menu bar
- [x] Show hidden menu bar items when an empty area in the menu bar is clicked
- [x] Show hidden menu bar items by scrolling or swiping in the menu bar
- [x] Automatically rehide menu bar items
- [x] Hide application menus when they overlap with shown menu bar items
- [x] Drag and drop interface to arrange individual menu bar items
- [x] Display hidden menu bar items in a separate bar (e.g. for MacBooks with the notch)
- [x] Search menu bar items
- [x] Menu bar item spacing (BETA)
- [ ] Profiles for menu bar layout
- [ ] Individual spacer items
- [ ] Menu bar item groups
- [ ] Show menu bar items when trigger conditions are met

### Menu bar appearance

- [x] Menu bar tint (solid and gradient)
- [x] Menu bar shadow
- [x] Menu bar border
- [x] Custom menu bar shapes (rounded and/or split)
- [ ] Remove background behind menu bar
- [ ] Rounded screen corners
- [ ] Different settings for light/dark mode

### Hotkeys

- [x] Toggle individual menu bar sections
- [x] Show the search panel
- [x] Enable/disable the menustow bar
- [x] Show/hide section divider icons
- [x] Toggle application menus
- [ ] Enable/disable auto rehide
- [ ] Temporarily show individual menu bar items

### Other

- [x] Launch at login
- [x] Automatic updates
- [ ] Menu bar widgets

## Why does menustow only support macOS 14 and later?

menustow uses a number of system APIs that are available starting in macOS 14. As such, there are no plans to support earlier versions of macOS.

## Gallery

Screenshots are generated via `task screenshots` into `docs/screenshots/`.

#### Show hidden menu bar items below the menu bar

_Screenshots needed. These were pre-fork images and are now stale. PRs with updated screenshots are welcome!_

#### Drag-and-drop interface to arrange menu bar items

_Screenshots needed. These were pre-fork images and are now stale. PRs with updated screenshots are welcome!_

#### Customize the menu bar's appearance

_Screenshots needed. These were pre-fork images and are now stale. PRs with updated screenshots are welcome!_

#### Menu bar item search

_Screenshots needed. These were pre-fork images and are now stale. PRs with updated screenshots are welcome!_

#### Custom menu bar item spacing

_Screenshots needed. These were pre-fork images and are now stale. PRs with updated screenshots are welcome!_

## License

menustow is available under the [GPL-3.0 license](LICENSE).
