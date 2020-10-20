#SingleInstance, force
Menu, Tray, Icon, % A_WinDir "\System32\SHELL32.dll", 3 ; Shows a window icon in the system tray

Pause::
SetTitleMatchMode, 3
if WinActive("ahk_exe firefox.exe") 
|| WinActive("ahk_exe msedge.exe") 
|| WinActive("ahk_exe brave.exe") 
|| WinActive("ahk_exe code.exe")
|| (WinActive("ahk_exe AcroRd32.exe") && !WinActive("Adobe Acrobat Reader DC"))
    Send, ^w
else
    Send, !{F4}
return

CtrlBreak::
if WinActive("ahk_exe firefox.exe") 
|| WinActive("ahk_exe msedge.exe") 
|| WinActive("ahk_exe brave.exe") 
    Send, ^t
else
    Send, #a
return

#NumpadSub::
Run, nircmd win settopmost foreground 1
return

#+NumpadSub::
Run, nircmd win settopmost foreground 0
return

#+F5::
Run, powershell -Command "Stop-Process -ProcessName Explorer"
Sleep, 2000
Send, {LWin}
return

#F5::
Run, powershell -Command "Stop-Process -ProcessName StartMenuExperienceHost"
Sleep, 1000
Send, {LWin}
return

; Transparency 
#Numpad0::
Run, nircmd win trans foreground 255
return

#Numpad1::
Run, nircmd win trans foreground 227
return

#Numpad2::
Run, nircmd win trans foreground 198
return

#Numpad3::
Run, nircmd win trans foreground 170
return

#Numpad4::
Run, nircmd win trans foreground 142
return

#Numpad5::
Run, nircmd win trans foreground 113
return

#Numpad6::
Run, nircmd win trans foreground 85
return

#Numpad7::
Run, nircmd win trans foreground 57
return

#Numpad8::
Run, nircmd win trans foreground 28
return

#Numpad9::
Run, nircmd win trans foreground 0
return

#Y::
If (IfInString, %clipboard%, "https://www.youtube.com/") 
{
    MsgBox, "Success"
}
return