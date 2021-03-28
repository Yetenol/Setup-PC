[Home](README.md)
# 4) Setup Browsers
1. [App setup](#Install-Edge-Chromium)
1. [Experimental features](#Experimental%20features)
1. [Settigs](#Settings)
1. [Extensions](#Extensions)

## Install [Edge Chromium](https://www.microsoft.com/de-de/edge)
- Sign in to sync

- If prefering other browser?
>### Set Start Search to use default browser
>- Install [EdgeDeflector](https://github.com/da2x/EdgeDeflector/releases)
>- Search anything and select EdgeDeflector as default program

___
## Experimental features

 Enables Two-page continuous scrolling view for PDF documents
- Enabled `about:flags/#edge-pdf-two-page-view`

 Disable two-finger navigation gestures
- Disabled `about:flags/#edge-experimental-scrolling`

Enable Global Media Controls UI
> Enable Media Control button in the toolbar
>- `about:flags/#global-media-controls`

> Show Cast sessions
>- `about:flags/#global-media-controls-for-cast`

> Show Picture-in-Picture button
>- `about:flags/#global-media-controls-picture-in-picture`

Enable new Prograssive Web App (PWA) features  
> Enable Windows app action for PWA's
>- Enabled `about:flags/#enable-desktop-pwas-app-icon-shortcuts-menu`

>Enable tab style for PWA's
>- Enabled `about:flags/#enable-desktop-pwas-tab-strip`

> Always open supported links (like youtube links) in PWA's
>- Enabled `about:flags/#enable-desktop-pwas-tab-strip-link-capturing`


___
## Settings
> `edge://settings/profiles/sync`
- Sign in to turn on sync
- [x] Favorites
- [x] Settings
- [ ] Personal info
- [ ] History
- [ ] Open tabs
- [x] Extensions
- [x] Collections

> `edge://settings/addresses`
- [ ] Save and fill addresses
- Add personal info
> `edge://settings/search?search=Search%20engine%20used%20in%20the%20address%20bar`
- `Google` Search engine used in the address bar
> `edge://settings/searchEngines?search=Google`
- Delete all but Google

Install Google's [Just Black](https://chrome.google.com/webstore/detail/just-black/aghfnjkcakhmadgdomlmlhhaocbkloab) amoled black theme  
> Otherwise  
>> `edge://settings/appearance?search=Default%20theme`
>- `System default` Default theme

Customize toolbar
> `edge://settings/appearance?search=Customize%20toolbar`
- [ ] Show home button `[Alt+Home]`
- `Only on new tabs` Show favorites bar
- [ ] Show favorites buttons `[Ctrl+Shift+O]`
- [ ] Show history button `[Ctrl+H]`
- [ ] Show Collections button `[Ctrl+Shift+Y]`
- [ ] Show web capture button `[Ctrl+Shift+S]`
- [x] Show share button
- [ ] Show feedback button

> `edge://settings/onStartup?search=Open%20a%20new%20tab`
- `Open a new tab` On startup

> `edge://settings/content/notifications?search=Ask%20before%20sending`
- [ ] Ask before sending 

___
## Extensions
 
1. Install [Dark Reader](https://microsoftedge.microsoft.com/addons/detail/dark-reader/ifoakfbpdcdoeenechcleahebpibofpc?h)
    > `Preview new design` and `Apply`
    >- `Dark Reader > Dev tools > Preview new design`  
    >
    > Import site list and settings from [config file](configs\Dark-Reader.json)   
    >- `Dark Reader > Settings > Manage settings > Import Settings`
1. Install [uBlock Origin](https://microsoftedge.microsoft.com/addons/detail/ublock-origin/odfafepnkmbhccpbejgmiehpchacaeak) 
   | [*(Chrome Webstore)*](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
    > Import [config file](configs\uBlock-Origin-config.ini) 
    >- `uBlock Origin > Settings > Restore from file`
1. Install [Chrometana - Redirect Bing Somewhere Better](https://chrome.google.com/webstore/detail/chrometana-redirect-bing/kaicbfmipfpfpjmlbpejaoaflfdnabnc)
1. Install [Tabliss - A Beautiful New Tab](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp)
1. Install [Picture-in-Picture Extension (by Google)](https://chrome.google.com/webstore/detail/picture-in-picture-extens/hkgfoiooedgoejojocmhlaklaeopbecg)
1. Install [I don't care about cookies](https://microsoftedge.microsoft.com/addons/detail/i-dont-care-about-cookie/oholpbloipjbbhlhohaebmieiiieioal)
  | [*(Chrome Webstore)*](https://chrome.google.com/webstore/detail/i-dont-care-about-cookies/fihnjjcciajhdojfnbdddfaoknhalnja)
1. Install [Imagus](https://chrome.google.com/webstore/detail/imagus/immpkjjlgappgfkkfieppnmlhakdmaab)
1. Install [Office](https://microsoftedge.microsoft.com/addons/detail/office/gggmmkjegpiggikcnhidnjjhmicpibll) 
  | [*(Chrome Webstore)*](https://chrome.google.com/webstore/detail/office/ndjpnladcallmjemlbaebfadecfhkepb)
    > `On click` Site access
1. Install [Download All Images](https://microsoftedge.microsoft.com/addons/detail/download-all-images/focinmnfmbmhknhdaamhppgdhahnbgif) 
  | [*(Chrome Webstore)*](https://chrome.google.com/webstore/detail/download-all-images/nnffbdeachhbpfapjklmpnmjcgamcdmm)
    > `On click` Site access
1. Install [Honey](https://microsoftedge.microsoft.com/addons/detail/honey/amnbcmdbanbkjhnfoeceemmmdiepnbpp) 
  | [*(Chrome Webstore)*](https://chrome.google.com/webstore/detail/honey/bmnlcjabgnpnenekpadlanbbkooimhnj)
    > `On click` Site access
1. Install [Open in VLC™ media player](https://microsoftedge.microsoft.com/addons/detail/open-in-vlc%E2%84%A2-media-player/hjfcjapkfahlmlefedkkpbbkeddpnnlc)
  | [*(Chrome Webstore)*](https://chrome.google.com/webstore/detail/open-in-vlc-media-player/ihpiinojhnfhpdmmacgmpoonphhimkaj)
    > `On click` Site access


Setup keyboard shortcuts
> `Alt + D` _Dark Reader :_ Activate the extension  
> `Alt + Shift + D` _Dark Reader :_ Toggle current site  
> `Alt + I` _Download All Images :_ Activate the extension  
> `Alt + O` _Office :_ Activate the extension  
> `Alt + U` _uBlock Origin :_ Activate the extention  
> `Alt + P` _Picture-in-Picture :_ Activate the extension  
