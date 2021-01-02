; Main control program to 
; - managed keyboard shortcuts
; - launches external programs

; Author: Anton Pusch
; Last update: 01-01-2021

; Stop existing instance when lauched again
#SingleInstance, force 

; Setup a keyboard as taskbar icon:
Menu, Tray, Icon, % A_WinDir "\system32\imageres.dll", 174 


SetNumLockState, AlwaysOn
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