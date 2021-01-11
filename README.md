# Table of Contents (How to setup my PC)

[1) Software (without configuration)](#1-Software-without-configuration)  
[2) Software (with configuration)](#2-Software-with-configuration)  

[3) Windows Configurations](#3-Windows-Configurations)  
[4) Browser](browser.md)  

[5) Windows Settings](windows-settings.md)  
[6) Taskbar Tools](taskbar-tools/taskbar-tools.md)  
[7) Shell Tools](shell-tools/)

[? HowToDos](how-to-dos.md)






# 1) Software (without configuration)

1. Install [WhatsApp Desktop](https://www.microsoft.com/de-de/p/whatsapp-desktop/9nksqgp7f2nh?activetab=pivot:overviewtab) <br>
Swtich to `Dark` Theme
1. Install [Gitkraken](https://www.gitkraken.com/download/windows64) <br>
Sign in using Github
1. Install [Recuva](https://www.ccleaner.com/recuva/download)
1. Install [7-Zip](https://www.7-zip.org/)
1. Install [Adobe Reader](https://get.adobe.com/reader/)
1. Install [Adobe Photoshop Express](https://www.microsoft.com/de-de/p/adobe-photoshop-express-image-editor-adjustments-filters-effects-borders/9wzdncrfj27n?activetab=pivot:overviewtab) <br>
Set as default app for .jpg files
1. Install [TreeSize](https://www.microsoft.com/de-de/p/treesize-free/9nblggh40881?activetab=pivot:overviewtab)
1. Install [Resource Hacker](http://www.angusj.com/resourcehacker/#download)
1. Install [Discord](https://discord.com/new) <br>
Don't run at [startup](how-to-dos.md#edit-startup-apps)
1. Install [Windscribe](https://windscribe.com/download)
1. Install [Samsung Flow](https://www.microsoft.com/de-de/p/samsung-flow/9nblggh5gb0m?rtc=1&wa=wsignin1.0&activetab=pivot:overviewtab)
1. Install [Minecraft Java Edition](https://www.minecraft.net/en-us/download/)
1. Install [Minecraft Bedrock Edition](https://www.microsoft.com/de-de/p/minecraft-for-windows-10/9nblggh2jhxj)
1. Install [Factorio](https://factorio.com/download)
1. Install [AusweisApp](https://www.ausweisapp.bund.de/download/windows-und-mac/)





# 2. Software (with configuration)

### Install [KeePass](https://keepass.info/download.html)
- Install plugin [KeeAnywhere](https://github.com/Kyrodan/KeeAnywhere/releases) and add OneDrive account
- Install plugin [WinHelloUnlock](https://github.com/Angelelz/WinHelloUnlock/releases) and setup fingerprint unlock

Open `Tools>Options>Security`
- `30` Lock Workspace after KeePass iniactivity (seconds):
- [x] Lock workspace when locking the computer or switching the user
- [x] Lock workspace when the computer is about to be suspended
- [x] Lock workspace when the remote control mode changes
- [x] Enter master key on secure desktop

Open `Tools>Options>Interface`
- [x] Drop to background after copying data to the clipboard
- [x] Close button [X] minimizes main windows instead of terminating the application
- [x] Focus entry list after a successful quick search
- [x] Focus quick search box when restoring from taskbar
- [x] Focus quick search box when restoring from tray
___
### Install [Lenovo Vantage](https://www.microsoft.com/de-de/p/lenovo-vantage/9wzdncrfj4mv?activetab=pivot:overviewtab) <br>
Open `Device>My device settings>Input & Accessories>User defined key`
- `Control Panel` Open application or files
- Test it: `Fn + F12`
___
### Install Visual Studio Code
- Install **System Installer** from https://code.visualstudio.com/#alt-downloads
- During setup progress tick _Open with_ options for context menu
- Rename scipts in `C:\Program Files\Microsoft VS Code\bin`

Open `File>Preferences>Settings>User>Commonly Used`
- ``onFocusChange`` Files: Auto Save

Open `File>Preferences>Settings>User>Text Editor>Formatting`
- [x] Editor: Format On Save
___

### Install [SharpKeys](https://github.com/randyrants/sharpkeys/releases)
- Load keys from [keymap file](configs/SharpKeys-keymaps.skl)
- Enable NumLock by default using AutoHotKey:
```ahk
SetNumLockState, AlwaysOn
```
___

### Install OneDrive
- Sign in

Open `Taskbar>OneDrive>More>Settings>Settings`
- [ ] Save space and download files as I use them
- [x] Let me use OneDrive to fetch any of my f‌iles on this PC
 Open `Backup` tab
- [ ] Automatically save screenshots I capture to OneDrive

Open `Explorer>Documents>Properties>Location`
- Change location to OneDrive folder
- Do the same for Desktop, Downloads, Music and Pictures
___
### Install [Telegram Desktop](https://www.microsoft.com/de-de/p/telegram-desktop/9nztwsqntd0s?activetab=pivot:overviewtab)

Open `Settings>Chat Settings`
- [x] Match the system settings

Open `Settings>Notifications`
- [x] Use Windows notifications

Open `Settings>Advanced`
- [x] Use system window frame
- Open `Manage local storage`
    - `Never` Clear files older than
___


### Install [Microsoft Office](https://account.microsoft.com/services/office/install)

- Sign in using Microsoft account
- Download [Language Accessory Pack](https://support.office.com/en-us/article/language-accessory-pack-for-office-82ee1236-0f9a-45ee-9c72-05b026ee809f?ui=en-US&rs=en-US&ad=US)

Open `File>Options>General>Personalize your copy of Microsoft Office`
- `Geometry` Off‌ice Background:
- `Black` Office Theme:
___

### Install Mail App
Open `Settings>Signature`
- [x] Apply to all accounts
- `Viele Grüße Anton Pusch` Signature
___

### Install Skype App

Open `Settings>Appearance`
- Set Color to orange
- Set Modes to Use system setting

Open `Settings>Calling>Advanced`
- [x] Answer incoming calls automatically

Open `Settings>Messaging`
- `Small` Text size
- [x] Auto-download f‌iles
___


### Install [AutoHotkey](https://www.autohotkey.com/)
- Set default editor to Visual Studio Code:
```powershell
Set-ItemProperty -Path 'Registry::HKCR\AutoHotkeyScript\Shell\Edit' -Name "Command" -Value 'code.exe %1'
```
- `C:\Program Files\Microsoft VS Code` Add to [path enviroment variable](how-to-dos.md#edit-path-enviroment-variable)






# 3) Windows Configurations

### Open `File Explorer options`
- `This PC` Open File Explorer to:
- Open View tab
- [ ] Hide extensions for known file types
- [x] Use check boxes to select item
- [x] Always show availability status
___
### Design Start
- Install [TileIconifier](https://github.com/Jonno12345/TileIconifier/releases)
- Import [scripts](configs/TileIconify-scripts.zip) into `C:\ProgramData`
- Create custom shortcuts according to PowerPoint Layout
    - `Other>Shortcut Target` Add desktop apps
    - `Windows Store`, `URI`, `Steam`
    - Name shortcuts ~1 ... ~99
___
### Local Group Policy
- [GroupPolicy:](how-to-dos.md#edit-local-group-policy) `Computer Configuration>Administrative Templates>System>Filesystem`
    - [x] Enable Win32 long paths 