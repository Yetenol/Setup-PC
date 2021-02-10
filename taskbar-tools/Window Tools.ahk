; Main control program to 
; - managed keyboard shortcuts
; - launches external programs

; Author: Anton Pusch
; Last update: 2021-02-10

#SingleInstance, force ; Override existing instance when lauched again
Menu, Tray, Icon, % A_WinDir "\system32\imageres.dll", 174 ; Setup a keyboard as taskbar icon:
Menu, Tray, Add ; Creates a separator line.
Menu, Tray, Add, Send Pause, SendPause
Menu, Tray, Add, Send Ctrl+Pause, SendCtrlBreak

; Always use digits on NumPad
SetNumLockState, AlwaysOn
return

; ===== Global shortcuts: =====
; Modifier keys:    # Win    ^ Ctrl    + Shift    ! Alt
; Notifications flags:
; - Syntax: TrayTip, Title, Text, , Flags
; - Default icon: Keyboard icon
; - e.g.: 0x1 + 0x10 = 0x11 Silent info
;   0x1 Info icon
;   0x2 Warning icon
;   0x3 Error icon
;   0x10 Silent
;   0x20 Large icon



; -=-=-=-=-=- Windows Media API -=-=-=-=-=-
; Enables remote media control for Netflix, PrimeVideo

; Is active window a media player?
MediaPlayerActive() {
    return (WinActive("Netflix ahk_class ApplicationFrameWindow") ;  Netflix
    || WinActive("Amazon Prime Video for Windows ahk_class ApplicationFrameWindow")) ; PrimeVideo
}

; Play/Pause media (Netflix, PrimeVideo)
Media_Play_Pause::
media_is_winding := false ; stop media winding
if (MediaPlayerActive())
{
    Send, {Space}
}
return

#MaxThreadsPerHotkey 2; allow 2 threads so that these hotkeys can "turn themselves off"
; Fast Forwards media until key pressed again or paused (Netflix, PrimeVideo)
Media_Next::
MediaWind("fast_forward")
return

; Rewind media until key pressed again or paused (Netflix, PrimeVideo)
Media_Prev::
MediaWind("rewind")
return
#MaxThreadsPerHotkey 1 ; default

MediaWind(direction) {
    global media_is_winding
    if (MediaPlayerActive())
    {
        media_is_winding := !media_is_winding ; start/stop winding (stop kills over thread)
        while (media_is_winding && MediaPlayerActive())
        {
            Send, % (direction="fast_forward") ? "{Right}" : "{Left}" ; forward media / rewind media
            Sleep, % WinActive("Netflix") ? WinActive("Amazon Prime Video for Windows") ? 1500 : 1000 : 1000
        }
    }
    return
}


; Bring the Rainmeter widgets to the foreground (Win + Shift + R)
; - can be used as screensaver
#+r::
Run, restartRainmeter.ps1.bat
return


; Convert screen region to text (Optical character recognition)
; - Uses external program Capture2Text.exe

; Reuse last region (Shift + Alt + PrintScreen)
!+PrintScreen::
PressingShiftKey := true

; Select new region (Alt + PrintScreen)
!PrintScreen::
Process, Exist, Capture2Text.exe ; Check whether AutoHotkey.exe is running
If (ErrorLevel = 0) ; AutoHotkey.exe is not running
{
    Run, % ProgramFiles "\Capture2Text\Capture2Text.exe"
    TrayTip, Keyboard Shortcuts, Capture2Text was not running, , 0x30
    Sleep, 1000 ; Let program start
    Send % (PressingShiftKey) ? "!+{PrintScreen}" : "!{PrintScreen}"
    PressingShiftKey := false
}
return

; Close active window/tab
; Activated by touchpad (internal shortcut)
Pause::
SetTitleMatchMode, 3 ; Window Title must match exactly (used for Adobe's last tab)
if WinActive("ahk_exe firefox.exe") ; If active window is a browser
|| WinActive("ahk_exe msedge.exe") 
|| WinActive("ahk_exe brave.exe") 
|| WinActive("ahk_exe code.exe")
|| (WinActive("ahk_exe AcroRd32.exe") && !WinActive("Adobe Acrobat Reader DC")) ; Adobe has no tab open
    Send, ^w ; Close active tab
else
    Send, !{F4} ; Close active program
return


; Open new tab / Open action center
; Activated by touchpad (internal shortcut)
CtrlBreak::
if WinActive("ahk_exe firefox.exe") ; If active window is a browser
|| WinActive("ahk_exe msedge.exe") 
|| WinActive("ahk_exe brave.exe") 
    Send, ^t ; Open new tab
else
    Send, #a ; Open action center
return


; Pin active window always on top (Win + Numpad-)
#NumpadSub::
Run, nircmd win settopmost foreground 1
return


; Unpin active window always on top (Win + Shift + Numpad-)
#+NumpadSub::
Run, nircmd win settopmost foreground 0
return

; Restart StartMenu process (Win + F5)
#F5::
Run, powershell -Command "Stop-Process -ProcessName StartMenuExperienceHost"
Sleep, 1000
Send, {LWin}
return


; Restart Explorer process (Win + Shift + F5)
#+F5::
Run, powershell -Command "Stop-Process -ProcessName Explorer"
Sleep, 2000
Send, {LWin}
return

; Make active window transparent
; - Uses external program nircmd in path location

; Clear active window's transparency (Win + Numpad0)
#Numpad0::
Run, nircmd win trans foreground 255
return
; Set active window's transparency to 90% (Win + Numpad1)
#Numpad1::
Run, nircmd win trans foreground 227
return
; Set active window's transparency to 78% (Win + Numpad2)
#Numpad2::
Run, nircmd win trans foreground 198
return
; Set active window's transparency to 67% (Win + Numpad3)
#Numpad3::
Run, nircmd win trans foreground 170
return
; Set active window's transparency to 56% (Win + Numpad4)
#Numpad4::
Run, nircmd win trans foreground 142
return
; Set active window's transparency to 44% (Win + Numpad5)
#Numpad5::
Run, nircmd win trans foreground 113
return
; Set active window's transparency to 33% (Win + Numpad6)
#Numpad6::
Run, nircmd win trans foreground 85
return
; Set active window's transparency to 22% (Win + Numpad7)
#Numpad7::
Run, nircmd win trans foreground 57
return
; Set active window's transparency to 11% (Win + Numpad8)
#Numpad8::
Run, nircmd win trans foreground 28
return
; Make active window's transparency invisible (Win + Numpad9)
#Numpad9::
Run, nircmd win trans foreground 0
return

; Send PAUSE
SendPause:
TrayTip, % "Send PAUSE", % "Sending PAUSE in 2s",, 0x10
Sleep, 2000
Send, % "{Pause}"
return

; Send CTRL + PAUSE
SendCtrlBreak:
TrayTip, % "Send PAUSE", % "Sending CTRL + PAUSE in 2s",, 0x10
Sleep, 2000
Send, % "{CtrlBreak}"
return