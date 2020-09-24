# How to setup my PC

# Windows Settings

Open `System>Display`
- [x] Schedule night light _🠘 (Night light settings)_
- `100%` Change the size of text, apps, and other items

Open `System>Notif‌ications & actions`
- [ ] Show notif‌ications on the lock screen
- [ ] Show me the Windows welcome experience after updates and occasionally

Open `System>Power & sleep`
- `10 minutes` On battery power, turn off after
- `20 minutes` When plugged in, turn off after
- `15 minutes` On battery power, PC goes to sleep after
- `Never` When plugged in, PC goes to sleep after

Open `System>Storage`
- [x] Storage sense

Open `System>Clipboard`
- [x] Clipboard history

Open `Devices>Touchpad>Advanced gesture conf‌iguration`
- Conf‌igure your three f‌inger gestures <br>
`Action Center` Taps <br>
`Switch apps` Up <br>
`Hide everything other than the app in focus` Down <br>
`Forward navigation` Left <br>
`Backward navigation` Right <br>

- Conf‌igure your four f‌inger gestures <br>
`Play/pause` Taps <br>
`Volume up` Up <br>
`Volume down` Down <br>
`Next Track` Left <br>
`Previous track` Right <br>

Open `Personalization>Colors`
- Set color to orange
- `Dark` Choose your default app mode

Open `Personalization>Start`
- [ ] Show more tiles on Start
- [ ] Show suggestions occasionally in Start
- [x] Use Start full screen

Open `Personalization>Taskbar>Select which icons appear on the taskbar`
- [x] Always show all icons in the notif‌ication area
- Hide Cortana search box via taskbar menu

Open `Devices>Typing>Hardware keyboard`
- [x] Show text suggestions as I type

Open `Accounts>Email & accounts`
- Add google account

# Local Group Policy Editor

```
gpedit.msc
```

Open `Computer Configuration>Administrative Templates>System>Filesystem`
- [x] Enable Win32 long paths

# Setup browsers

### Assign Cortana search to default browser

- Install [EdgeDeflector](https://github.com/da2x/EdgeDeflector/releases)
- Search anything and select EdgeDeflector as default program
___

### Install [Edge Chromium](https://www.microsoft.com/de-de/edge) and [Brave](https://brave.com/)

- Sign in to sync

Open `Settings>Profiles>Addresses and more`
- [ ] Save and fill addresses

Open `Privacy and services>Address bar`
- `Google` Search engine used in the address bar
- Open `Privacy and services>Address bar>Manage search engines`
- Delete all but Google

Open `Settings>Appearance`
- `System default` Default theme

Open `Settings>On Startup`
- `Open a new tab` On startup

Open `Settings>Site permissions>Notifications`
- [ ] Ask before sending 

Install plugins 
> 1. Install [Dark Reader](https://microsoftedge.microsoft.com/addons/detail/dark-reader/ifoakfbpdcdoeenechcleahebpibofpc?h) <br>
`Dev tools>Preview new design` <br>
Import [Settings-File](Dark-Reader-Settings.json) (`Settings>Manage settings>Import Settings`)
> 1. Install [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) [#](https://microsoftedge.microsoft.com/addons/detail/ublock-origin/odfafepnkmbhccpbejgmiehpchacaeak) <br>
> Import [Settings-File](my-ublock-backup.txt) (`Settings>Restore from file`)
> 1. Install [Chrometana - Redirect Bing Somewhere Better](https://chrome.google.com/webstore/detail/chrometana-redirect-bing/kaicbfmipfpfpjmlbpejaoaflfdnabnc)
> 1. Install [Tabliss - A Beautiful New Tab](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp)
> 1. Install [User-Agent Switcher](https://chrome.google.com/webstore/detail/user-agent-switcher/clddifkhlkcojbojppdojfeeikdkgiae)
> 1. Install [Picture-in-Picture Extension (by Google)](https://chrome.google.com/webstore/detail/picture-in-picture-extens/hkgfoiooedgoejojocmhlaklaeopbecg)
> 1. Install [I don't care about cookies](https://chrome.google.com/webstore/detail/i-dont-care-about-cookies/fihnjjcciajhdojfnbdddfaoknhalnja) [#](https://microsoftedge.microsoft.com/addons/detail/i-dont-care-about-cookie/oholpbloipjbbhlhohaebmieiiieioal)
> 1. Install [Imagus](https://chrome.google.com/webstore/detail/imagus/immpkjjlgappgfkkfieppnmlhakdmaab)
> 1. Install [Office](https://chrome.google.com/webstore/detail/office/ndjpnladcallmjemlbaebfadecfhkepb) [#](https://microsoftedge.microsoft.com/addons/detail/office/gggmmkjegpiggikcnhidnjjhmicpibll) <br>
`On click` Site access
> 1. Install [Download All Images](https://chrome.google.com/webstore/detail/download-all-images/nnffbdeachhbpfapjklmpnmjcgamcdmm) [#](https://microsoftedge.microsoft.com/addons/detail/download-all-images/focinmnfmbmhknhdaamhppgdhahnbgif) <br>
`On click` Site access
> 1. Install [Honey](https://chrome.google.com/webstore/detail/honey/bmnlcjabgnpnenekpadlanbbkooimhnj) [#](https://microsoftedge.microsoft.com/addons/detail/honey/amnbcmdbanbkjhnfoeceemmmdiepnbpp) <br>
`On click` Site access
> 1. Install [Open in VLC™ media player](https://chrome.google.com/webstore/detail/open-in-vlc-media-player/ihpiinojhnfhpdmmacgmpoonphhimkaj) [#](https://microsoftedge.microsoft.com/addons/detail/open-in-vlc%E2%84%A2-media-player/hjfcjapkfahlmlefedkkpbbkeddpnnlc) <br>
`On click` Site access


Setup keyboard shortcuts
> `Alt + D` _Dark Reader :_ Activate the extension <br>
> `Alt + Shift + D` _Dark Reader :_ Toggle current site <br>
> `Alt + I` _Download All Images :_ Activate the extension <br>
> `Alt + O` _Office :_ Activate the extension <br>
> `Alt + U` _uBlock Origin :_ Activate the extention <br>
> `Alt + P` _Picture-in-Picture :_ Activate the extension <br>
> `Alt + A` _User-Agent Switcher :_ Activate the extension
___



# Install essential apps



### Open `File Explorer options`
- `This PC` Open File Explorer to:
- Open View tab
- [ ] Hide extensions for known file types
- [x] Use check boxes to select item
- [x] Always show availability status
___


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
- [x] Minimize to tray instead of taskbar
- [x] Drop to background after copying data to the clipboard
- [x] Close button [X] minimizes main windows instead of terminating the application
- [x] Focus entry list after a successful quick search
- [x] Focus quick search box when restoring from taskbar
- [x] Focus quick search box when restoring from tray
___

### Install Visual Studio Code
- Install **System Installer** from https://code.visualstudio.com/#alt-downloads
- During setup progress tick _Open with_ options for context menu

Open `Preferences>Settings`
- ``onFocusChange`` Files: Auto Save
___

### Install OneDrive
- Sign in

Open `Taskbar>OneDrive>More>Settings>Settings`
- [ ] Save space and download files as I use them
- [x] Let me use OneDrive to fetch any of my f‌iles on this PC
 Open `Backup` tab
- [x] Automatically save screenshots I capture to OneDrive

Open `Explorer>Documents>Properties>Location`
>- Change location to OneDrive folder
>- Do the same for Desktop, Downloads, Music and Pictures
___

### Custom special key
- Open Keyboard Manager via `Fn + F11`
- Set `User defined key` to your kdbx database
- Test `Fn + F12`
___

### Install [Capture2Text](https://sourceforge.net/projects/capture2text/files/Capture2Text/)

- Add start menu shortcut manually

Open `Taskbar>Capture2Text>Settings>Hotkeys`
- `Ctrl + Print Screen` Start OCR Capture
- `Ctrl + Shift + Print Screen` Re Capture Last
- `Alt + Print Screen` Text Line Capture:
- Set everything else to `<Unmapped>`
___

### Install [Gitkraken](https://www.gitkraken.com/download/windows64)
- Sign in using Github
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
>- `Geometry` Off‌ice Background:
>- `Black` Office Theme:
___

### Install Mail App
Open `Settings>Signature`
- [x] Apply to all accounts
- `Viele Grüße Anton Pusch` Signature
___

### Install Skype App

Open `Settings>Appearance`
>- Set Color to orange
>- Set Modes to Use system setting
Open `Settings>Calling>Advanced`
- [x] Answer incoming calls automatically
Open `Settings>Messaging`
>- `Small` Text size
- [x] Auto-download f‌iles
___

### Setup Start

- Install [TileIconifier](https://github.com/Jonno12345/TileIconifier/releases)
- Create custom shortcuts according to PowerPoint Layout
    - `Other>Shortcut Target` Add desktop apps
    - `Windows Store`, `URI`, `Steam`
    - Name shortcuts ~1 ... ~99




# Install other apps

1. Install [Lenovo Vantage](https://www.microsoft.com/de-de/p/lenovo-vantage/9wzdncrfj4mv?activetab=pivot:overviewtab)

1. Install [WhatsApp Desktop](https://www.microsoft.com/de-de/p/whatsapp-desktop/9nksqgp7f2nh?activetab=pivot:overviewtab) <br>
Swtich to `Dark` Theme

1. Install [Recuva](https://www.ccleaner.com/recuva/download)

1. Install [7-Zip](https://www.7-zip.org/)

1. Install [Adobe Reader](https://get.adobe.com/reader/)

1. Install [QuickLook](https://www.microsoft.com/de-de/p/quicklook/9nv4bs3l1h4s?activetab=pivot:overviewtab)

1. Install [AutoHotkey](https://www.autohotkey.com/)

1. Install [Adobe Photoshop Express](https://www.microsoft.com/de-de/p/adobe-photoshop-express-image-editor-adjustments-filters-effects-borders/9wzdncrfj27n?activetab=pivot:overviewtab) <br>
Set as default app for .jpg files

1. Install [TreeSize](https://www.microsoft.com/de-de/p/treesize-free/9nblggh40881?activetab=pivot:overviewtab)

1. Install [Resource Hacker](http://www.angusj.com/resourcehacker/#download)

1. Install [Discord](https://discord.com/new) <br>
Disable startup shortcut

1. Install [Windscribe](https://windscribe.com/download)

1. Install [Samsung Flow](https://www.microsoft.com/de-de/p/samsung-flow/9nblggh5gb0m?rtc=1&wa=wsignin1.0&activetab=pivot:overviewtab)

1. Install [Minecraft Java Edition](https://www.minecraft.net/en-us/download/)

1. Install [Minecraft Bedrock Edition](https://www.microsoft.com/de-de/p/minecraft-for-windows-10/9nblggh2jhxj)

1. Install [Factorio](https://factorio.com/download)

1. Install [AusweisApp](https://www.ausweisapp.bund.de/download/windows-und-mac/)

1. Install [ShareX](https://github.com/ShareX/ShareX/releases/)

1. Install [EarTrumpet](https://www.microsoft.com/de-de/p/eartrumpet/9nblggh516xp?activetab=pivot:overviewtab)

1. Install [Rainmeter](https://www.rainmeter.net/) <br>
Install [Windows 10 Layout](Yetenol-Win10.rmskin) <br>
Open `Taskbar>Rainmeter>Settings`
- [x] Disable dragging <br>
If above fails, install [bundled pack](https://github.com/tjmarkham/win10widgets/releases/)