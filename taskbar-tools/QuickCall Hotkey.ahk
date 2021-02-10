; Extract and call the phone number from a text selection
; - copies text
; - extracts first phone number
; - formats number (+ => 00, no spaces)
; - launches external programs
; - starts the call

; Author: Anton Pusch
; Last update: 2021-02-10

#SingleInstance, force ; Override existing instance when lauched again
SetWorkingDir, % A_ScriptDir ; Ensures a consistent starting directory
Menu, Tray, Icon, % A_WinDir . "\system32\mmres.dll", 8 ; Setup a keyboard as taskbar icon:

; Extract and call phone number (Shift +) Win + C
#c::
#+c::
    OldClipboard := ClipboardAll ; Remember the old Clipboard content

    Send, ^c ; Copy text selection
    Sleep, 100 ; Let clipboard update

    ; Extract the first phone number like (+)12 34 567 890
    MinPhoneNumberLength := (GetKeyState("Shift", "P")) ? 1 : 5
    RegExPattern := "[^\d+]*(?<number>\+?\d[\d ]{" . MinPhoneNumberLength . ",}\d)\D*"
    if RegExMatch(Clipboard, RegExPattern, Group) 
    { ; Found a valid phone number in selection

        ; Extraced phone number with plus and spaces
        ; e.g: +12 34 567 890
        ; - used to display number
        phone_number := GroupNumber

        ; Check which external calling program should be used?
        EnvGet, ProgramFilesx86, ProgramFiles(x86) ; Parentheses in variable names confuse ahk
        if (FileExist(ProgramFiles . "\WindowsApps\Microsoft.YourPhone_1.21011.127.0_x64__8wekyb3d8bbwe")) 
        { ; I personally use "Your Phone" App

            ; DISPLAY PHONE NUMBER
            TrayTip, % "Calling...", % phone_number, , 0x10

            ; FORMAT PHONE NUMBER
            phone_number := StrReplace(phone_number, " ", "") ; remove spaces

            ; CALL PHONE NUMBER
            Run, % "tel:" . phone_number
            Sleep, 100 ; Let program open
            Send, {Enter}
            Send, {Enter}

        } else if (FileExist(ProgramFilesx86 . "\Avaya\Avaya one-X Communicator\onexcui.exe")) 
        { ; My Work (TÜV) uses Avaya one-X Communicator

            ; Is Avaya running?
            Process, Exist, onexcui.exe
            if (!ErrorLevel) 
            { ; Avaya isn't running and needs to be launched 
                MsgBox, 0x10, % "Avaya isn't running", % "Starting Avaya one-X Communicator", 10
                Run, % "C:\Program Files (x86)\Avaya\Avaya one-X Communicator\onexcui.exe"
            } 
            else 
            { ; Avaya is running
                TrayIconFile := "Avaya tray icon.png"

                if (!FileExist(TrayIconFile)) 
                {
                    MsgBox, 0x10, % "File missing", % "Can't find comparison picture for Avaya's tray icon! Insert it here:`n" . A_ScriptDir . "\Avaya tray icon.png", 10
                } else {

                    ; DISPLAY PHONE NUMBER
                    ; - Avaya one-X Communicator only listens to clipboard changes once you press Ctrl+C
                    ; - Ctrl+C would copy the unextracted text again
                    ; - To prevent that, unfocus the current window
                    ; - To unfocus the window, create an new gui
                    Gui, Add, Text,, % "Calling...`n" . phone_number
                    Gui, Show, Center, % "Calling..."
                    Sleep, 100

                    ; FORMAT PHONE NUMBER
                    phone_number := StrReplace(phone_number, " ", "") ; remove spaces
                    phone_number := StrReplace(phone_number, "+", "00") ; don't use plus sign
                    if (StrLen(phone_number) > 4) 
                    { ; Call leaves office => Add a zero at the front
                        phone_number := "0" . phone_number
                    }

                    ; Push phone number to Avaya's clipboard
                    Clipboard := phone_number ; Insert to clipboard
                    Send, ^c ; Force update Avaya's cache

                    ; Remember the old mouse position
                    CoordMode, mouse, screen
                    MouseGetPos, OldMouseX, OldMouseY

                    ; Find the Avaya icon in the taskbar tray icons
                    CoordMode, pixel, screen
                    WinGetPos, trayX, trayY, trayWidth, trayHeight, ahk_class Shell_TrayWnd
                    ImageSearch, imageX, imageY, trayX, trayY, % trayX + trayWidth, % trayY + trayHeight, % TrayIconFile
                    if (!imageX || !imageY)
                    { ; Avaya icon couldn't be found (Wrong resolution? => Update Avaya.png)
                        MsgBox, 0x30, % "No taskbar tray icon found", % "Couldn't find Avaya's tray icon. Try again!", 5
                    } else 
                    { ; Found Avaya's tray icon

                        ; Open Avaya's tray menu
                        MouseMove, % imageX, % imageY, 0
                        MouseClick, Right, % imageX, % imageY

                        ; CALL PHONE NUMBER
                        Sleep, 500 ; Await Avaya's tray menu
                        Send, {Down}
                        Send, {Enter} ; Click "Call the clipboard number"

                        MouseMove, % OldMouseX,% OldMouseY, 0 ; Restore previous mouse position
                        Sleep, 100 ; Don't confuse Avaya's clipboard number
                    }
                    Gui, Destroy ; Restore focus by closing the gui
                }
            }
        } else {
            TrayTip, % "No phone app", % "Couldn't find any phone app", , 0x13
        }
    } else {
        TrayTip, % "Invalid phone number:", % Clipboard,, 0x13
    }
    Clipboard := OldClipboard ; Restore clipboard content
return