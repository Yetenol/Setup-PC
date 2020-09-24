# Setup my PC

## Windows Settings
- Open *`System>Display`*
> - Open *`Night light settings`*
>> - Set *`Schedule night light`* to <span style="color:green">true</span>
> - Set *`Change the size of text, apps, and other items`* to 100%
- Open *`System>Notifications & actions`*
> - Set *`Show notifications on the lock screen`* to <span style="color:red">false</span>
> - Set *`Show me the Windows welcome experience after updates and occasionally`* to <span style="color:red">false</span>
- Open *`System>Power & sleep`*
> - Set *`On battery power, turn off after`* to 10 minutes
> - Set *`When plugged in, turn off after`* to 20 minutes
> - Set *`On battery power” PC goes to sleep after`* to 15 minutes
> - Set *`When plugged in, P“ goes to sleep after`* to Never
- Open *`System>Storage`*
> - Set *`Storage sense`* to <span style="color:green">true</span>
- Open *`System>Clipboard`*
> - Set *`Clipboard history`* to <span style="color:green">true</span>

- Open *`Devices>Touchpad`*
> - Open *`Advanced gesture configuration`*
> > - Configure your three finger gestures
> > - Set *`Taps`* to Action Center
> > - Set *`Up`* to Switch apps
> > - Set *`Down`* to Switch desktop
> > - Set *`Left`* to Forward navigation
> > - Set *`Right`* to Backward navigation
> 
> > - Configure your four finger gestures
> > - Set *`Taps`* to Play/pause
> > - Set *`Up`* to Volume up
> > - Set *`Down`* to Volume down
> > - Set *`Left`* to Next Track
> > - Set *`Right`* to Previous track

- Open *`Personalization>Colors`*
> - Set color to orange
> - Set *`Choose your default app mode`* to Dark
- Open *`Personalization>Start`*
> - Set *`Show more tiles on Start`* to <span style="color:red">false</span>
> - Set *`Show suggestions occasionally in Start`* to <span style="color:red">false</span>
- Open *`Personalization>Taskbar`*
> - Open *`Select which icons appear on the taskbar`*
> > - Set *`Always show all icons in the notification area`* to <span style="color:green">true</span>

- Open *`Accounts>Email & accounts`*
> - Add google account

## Install Onedrive 
- Open *`Notification area>OneDrive>Sign in`*
- Open *`Notification area>OneDrive>More>Settings`*
> - Open *`Settings`*
> > - Set *`Let me use OneDrive to fetch any of my files on this PC`* to <span style="color:green">true</span>
> - Open *`Auto Save`*
> > - Set *`Automatically save photos and videos to OneDrive whenever I connect a camera, phone, or other device to my PC`* to <span style="color:green">true</span>
> > - Set *`Automatically save screenshots I capture to OneDrive`* to <span style="color:green">true</span>
- Open *`Explorer>Documents>Properties>Location`*
> - Change location to OneDrive folder
> - Do the same for Desktop, Downloads, Music and Pictures

## Install KeePass
- Install from https://keepass.info/download.html
- Set automatic update check to <span style="color:green">true</span>

- Open *`Tools>Options>Security`*
> - Set *`Lock Workspace after KeePass iniactivity (seconds):`* to 300
> - Set *`Lock workspace after global user inactivaty (seconds):`* to 120
> - Set *`Lock workspace when the computer is about to be suspended`* to <span style="color:green">true</span>
> - Set *`Lock workspace when the remote control mode changes`* to <span style="color:green">true</span>
- Open *`Tools>Options>Interface`*
> - Set *`Minimizle to tray instead of taskbar`* to <span style="color:green">true</span>
> - Set *`Drop to background after copying data to the clipboard`* to <span style="color:green">true</span>
> - Set *`Minimize main window after copying data to the clipboard`* to <span style="color:green">true</span>
> - Set *`Minimize main window after performing auto-type`* to <span style="color:green">true</span>
> - Set *`Minimize main window af‌ter locking the workspace`* to <span style="color:green">true</span>
> - Set *`Close button [X] minimizes main window instead of terminating the application`* to <span style="color:green">true</span>
> - Set *`Esc keypress in main window`* to Minimiznl to tray
- Open C:\Users\anton\OneDrive\KeePass\Yetenol.kdbx
- Install Plugin WinHello from https://github.com/sirAndros/KeePassWinHello/releases
- Move *`KeePassWinHelloPlugin.plgx`* to *`C:\Program Files (x86)\KeePass Password Safe 2\Plugins`*
- Restart KeePass

## Install Lenovo Vantage
- Install from https://www.microsoft.com/de-de/p/lenovo-vantage/9wzdncrfj4mv
- Press *`Fn + F11`* to launch app
- Open *`Hardware Settings>Input`*
> - Set *`Keyboard: User-defined Key`* to application KeePass 2
> - Press *`Fn + F12`* to test special key
> - Set *`TrackPoint Settings>Middle button function`* to Middle click
- Open *`Hardware Settings>Power`*
> - Set *`Always On USB`* to Charge from
Shutdown

## Install Firefox
- Install from https://www.mozilla.org/en-US/firefox/new/
- Sign in
- Search for *`Choose a default web browser`*
- Select Firefox
- Install SearchWithMyBrowser from https://www.microsoft.com/de-de/p/searchwithmybrowser/9ppknr9rk26r
- Search for any web text and select Firefox
- Open Firefox again
- Open *`Menu>Customize...`*
> - Set 1. section to Back, Forward, Reload, Show Sidebars, Home, Open File, Synced Tabs
> - Set 2. section to Address
> - Set 3. section to Downloads, Library, Print, Save Page, History
> - Set 4. section to Search
> - Set 5. section to Forget, AutoFill Forms, Google Keep, uBlock Origin, Dark Reader
> - Set Overflow Menu to Add-ons, Iridium for YouTube, I don't care about cookies
> - Set theme to Dark
- Right-click Autofill Form and open *`Manage extension`*
- Update default profile
- Left-click Google Keep
- Sign in
- Right-click uBlock Origin and open *`Manage extension`*
- Open Options
> - Open My filters
> - Paste:
> ```
> ! 4/9/2019 https://www.amazon.de
> www.amazon.de## .nav-ewc-lazy-align
> 
> ! 4/11/2019 https://de-de.facebook.com
> de-de.facebook.com##u_0_1g
> de-de.facebook.com##.> loggedout_menubar_container
> 
> ! 4/11/2019 https://> www.ebay-kleinanzeigen.de
> www.ebay-kleinanzeigen.de##.logo
> www.ebay-kleinanzeigen.de##user-logout
> www.ebay-kleinanzeigen.de##user-email
> ```
- Left-click Dark Reader
> - Open Site list
> - Set list to Not invert listed
> - Paste:
> ```
> wiki.geogebra.org
> s141.goserver.host
> www.komoot.de
> ```
- Left-click Iridium for YouTube
> - Open General
> > - Set *`Improve the YouTube logo`* to <span style="color:red">false</span>
> > - Set *`Play videos by hovering the thumbnails`* to <span style="color:green">true</span>
> > - Set *`Shift key toggles audio in video thumbnail playback`* to <span style="color:green">true</span>
> > - Set *`Enable blacklist`* to <span style="color:red">false</span>
> - Open Video
> > - Set *`Comment section:`* to Show
> > - Set *`Play videos automatically`* to <span style="color:green">true</span>
> > - Set *`Play channel trailers automatically`* to <span style="color:green">true</span>
> - Open Settings
> > - Set *`Use dark theme?`* to <span style="color:green">true</span>

## Install Capture2Text
- Install from https://sourceforge.net/projects/capture2text/files/Capture2Text/
- Open *`Taskbar>Capture2Text>Settings>Hotkeys`*
> - Set *`Start OCR Capture:`to *`Ctrl + Print Screen`*
> - Set *`Text Line Capture:`* to *`Alt + Print Screen`*
> - Set *`Forward Text Line Capture:`* to *`Ctrl + Alt + Print Screen`*
> - Set other to *`<Unmapped>`*
- Open *`Settings>Output`*
> - Set *`Show popup window to`* to <span style="color:green">true</span>
- Create shortcut in startup

## Install Visual Studio Code
- Install from https://code.visualstudio.com/
- Open *`Preferences>Settings`*
- Set *`Auto Save`* to onFocusChange

## Install GitKraken
- Install from https://www.gitkraken.com/download/windows64
- Sign in using Github

## Install Telegram Desktop App
- Install from https://www.microsoft.com/de-de/p/telegram-desktop/9nztwsqntd0s
- Set *`Night Mode`* to <span style="color:green">true</span>
- Open *`Settings>Chat Settings`*
> - Set *`Themes`* to Matrix

## Install Explorer
- Pin Ribbon (Menubar)
- Open *`View>Options>General`*
> - Set *`Open File Explorer to:`* to *`This PC`* 
- Open *`View>Options>View`*
> - Set *`Hidden files and folders`* to *`Show hidden files. folders, or drives`*

## Install Microsoft Office
- Download 64-bit version from https://account.microsoft.com/services/office/install
- Sign in using Microsoft account
- Download Language Accessory Pack for Office from https://support.office.com/en-us/article/language-accessory-pack-for-office-82ee1236-0f9a-45ee-9c72-05b026ee809f?ui=en-US&rs=en-US&ad=US
- Open *`File>Options>General>Personalize your copy of Microsoft Office`*
> - Set *`Office Background:`* to Geometry
> - Set *`Office Theme:`* to Black

## Install 7-Zip
## Adobe Reader
- Set it as default pdf viewer (necessary for outlook pdf preview)

## Install Awesome Tube - App for YouTube
- Sign in with Google account

## Install WhatsApp Desktop

## Install Git
- Download from https://git-scm.com/download/win

## Install Arduino

## Install Mail App
- Open *`Settings>Signature`*
> - Set *`Apply to all accounts`* to <span style="color:green">true</span>
> - Set signature to 
> *```*
> Viele Grüße
> Anton Pusch
> *```*

## Install Skype App
- Open *`Settings>General`*
> - Set *`Show Skype in the Windows notification area
(system tray)`* to <span style="color:red">false</span>
- Open *`Settings>Appearance`*
> - Set Color to orange
> - Set Modes to Use system setting
- Open *`Settings>Calling>Advanced`*
> - Set *`Answer incoming calls automatically`* to <span style="color:green">true</span>
- Open *`Settings>Messaging`*
> - Set *`Text size`* to Small
> - Set *`Auto-download files`* to <span style="color:green">true</span>