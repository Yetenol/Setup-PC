; A tool to handle youtube-dl interactions
; Author:		Anton Pusch
; Last edit:	2021-01-04
; Pressing Win + Y downloads the currently open youtube tab
; Pressing Win + Shift + Y the currently open playlist

#SingleInstance, force
Menu, Tray, Icon, % "C:\Icon\YouTube.ico" ; Shows a world icon in the system tray

ModernBrowsers := "ApplicationFrameWindow,Chrome_WidgetWin_0,Chrome_WidgetWin_1,Maxthon3Cls_MainFrm,MozillaWindowClass,Slimjet_WidgetWin_1"
LegacyBrowsers := "IEFrame,OperaWindowClass"

; ===== SCRIPT =======================================

; ===== Global shortcuts: =====
; Modifier keys:    # Win    ^ Ctrl    + Shift    ! Alt
; Notifications flags:
; - Syntax: ;TrayTip, Title, Text, , Flags
; - Default icon: Keyboard icon
; - e.g.: 0x1 + 0x10 = 0x11 Silent info
;   0x1 Info icon
;   0x2 Warning icon
;   0x3 Error icon
;   0x10 Silent
;   0x20 Large icon

StrQuotes = "
DownloadPath := "X:/OneDrive/Videos-E/Youtube/"
LogStdOutFile := "D:\Dev\Setup-PC\taskbar-tools\out.log"
LogStdErrFile := "D:\Dev\Setup-PC\taskbar-tools\err.log"

; Download currently open video tab (Win + Y)
#+Y::
; Download currently open playlist tab (Win + Shift +Y)
#Y::
entirePlaylist := GetKeyState("Shift")
Url := GetActiveBrowserURL()
Core := "youtube-dl.exe " . Url
Core := (entirePlaylist) 
	? Core . " --no-playlist  --output " StrQuotes DownloadPath "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s %(id)s %(upload_date)s.%(ext)s" StrQuotes " "
	: Core . " --yes-playlist --output " StrQuotes DownloadPath "%(uploader)s/%(title)s %(id)s %(upload_date)s.%(ext)s" StrQuotes " "
Simulate := Core . " --simulate --no-warnings "
Download := Core . " --mark-watched --console-title --merge-output-format mp4 "

if not (Url) {
	;TrayTip, No browser tab found, Try refreshing the page, , 0x3
} else if not IsURL(Url) {
	;TrayTip, Invalid url, %url%, , 0x3
} else {
	;TrayTip, Fetching information..., %Url%, , 0x10
	if not (YoutubeDl("Simulate", "--dump-json")) {
		;TrayTip, No video found on tab, Try refreshing the page, , 0x3
	} else {
		Title := YoutubeDl("Simulate", "--get-title")
		Duration := YoutubeDl("Simulate", "--get-duration", true)
		Filename := YoutubeDl("Simulate", "--get-filename", true)

		TrayTip, % (entirePlaylist) 
			? "Downloading pl... [" Duration "]" 
			: "Downloading vd... [" Duration "]", % Title, , 0x10
		
		YoutubeDl("Download","")

		TrayTip, % "Downlaod finished", % " "
	}
}
entirePlaylist := false
return

YoutubeDl(isSimulation, options, singleLine = false) {
	global Simulate
	global Download
	global LogStdOutFile
	global LogStdErrFile
	
	isSimulation := not ((isSimulation = "D") || (isSimulation = "Download"))
	options := (isSimulation) ? Simulate options : Download options

	Shell := ComObjCreate("WScript.Shell") ; Create a new shell environment
	Script := Shell.Exec(options) ; Launch the script, proceed immidiately
	WinWait, ahk_exe youtube-dl.exe ; Hide the script as soon as visible
	if (isSimulation) {
		WinHide, ahk_exe youtube-dl.exe
	}

	FileDelete, % LogStdOutFile
	FileDelete, % LogStdErrFile
	StdOutAll := ""

	loop { ; Script is running
		Sleep, 100

		StdOut := Script.StdOut.ReadLine()
		if (StdOut) {
			FileAppend, % StdOut "`n", % LogStdOutFile
			StdOutAll := StdOutAll StdOut
			if (singleLine) {
				Script.StdOut.ReadAll()
				Script.StdErr.ReadAll()
				return StdOut
			}
		}

		if not (Script.StdErr.AtEndOfStream) {
			StdErr := Script.StdErr.ReadLine()
			if (StdErr) {
				FileAppend, % StdErr "`n", % LogStdErrFile
				ShowErrorMessage(StdErr)
			}
		}

		if not (Script.Status = 0) { ; Script finished
			break
		}
	}

	if (Script.Status = 2) { ; Script failed
		ShowErrorMessage("[Failure] Youtube-dl finished with an unknown error!")
	}
	FileAppend, % Script.StdOut.ReadAll(), % LogStdOutFile
	FileAppend, % Script.StdErr.ReadAll(), % LogStdErrFile
	return StdOutAll
}

ShowErrorMessage(StdErr) {
	if (StdErr) {
		RegExMatch(StdErr, "^\[(?<Title>.*)\] (?<Text>.*)$", Group)
		Title := (GroupTitle) ? GroupTitle : "Error"
		Text := (GroupText) ? GroupText : StdErr

		if (StrLen(Text) <= 130) {
			TrayTip, % Title, % Text, , 0x3
		} else {
			MsgBox, 0x10, % Title, % Text
		}
	}
}

;	Command = cmd /c title nircmd-hide-me & nircmd win hide stitle nircmd-hide-me & youtube-dl.exe --simulate --dump-json --no-warnings --newline %EscapedUrl%

;RunWait, youtube-dl.exe -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --mark-watched --output "X:/OneDrive/Videos-E/Youtube/" %Url%

;LButton::
;MouseGetPos,,, MouseWin
;SetTitleMatchMode, 2
;WinGet, UniqueID,, New notification ahk_id %MouseWin% ahk_exe ShellExperienceHost.exe
;if (UniqueID) {
;    MsgBox, , , Success, 1
;}
;return


; ===== IMPORTED CODE / LIBRARIES ====================

; AutoHotkey Version: AutoHotkey 1.1
; Language:           English
; Platform:           Win7 SP1 / Win8.1 / Win10
; Author:             Antonio Bueno <user atnbueno of Google's popular e-mail service>
; Short description:  Gets the URL of the current (active) browser tab for most modern browsers
; Last Mod:           2016-05-19



^+!u::
	nTime := A_TickCount
	sURL := GetActiveBrowserURL()
	WinGetClass, sClass, A
	If (sURL != "")
		MsgBox, % "The URL is """ sURL """`nEllapsed time: " (A_TickCount - nTime) " ms (" sClass ")"
	Else If sClass In % ModernBrowsers "," LegacyBrowsers
		MsgBox, % "The URL couldn't be determined (" sClass ")"
	Else
		MsgBox, % "Not a browser or browser not supported (" sClass ")"
Return

GetActiveBrowserURL() {
	global ModernBrowsers, LegacyBrowsers
	WinGetClass, sClass, A
	If sClass In % ModernBrowsers
		Return GetBrowserURL_ACC(sClass)
	Else If sClass In % LegacyBrowsers
		Return GetBrowserURL_DDE(sClass) ; empty string if DDE not supported (or not a browser)
	Else
		Return ""
}

; "GetBrowserURL_DDE" adapted from DDE code by Sean, (AHK_L version by maraskan_user)
; Found at http://autohotkey.com/board/topic/17633-/?p=434518

GetBrowserURL_DDE(sClass) {
	WinGet, sServer, ProcessName, % "ahk_class " sClass
	StringTrimRight, sServer, sServer, 4
	iCodePage := A_IsUnicode ? 0x04B0 : 0x03EC ; 0x04B0 = CP_WINUNICODE, 0x03EC = CP_WINANSI
	DllCall("DdeInitialize", "UPtrP", idInst, "Uint", 0, "Uint", 0, "Uint", 0)
	hServer := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", sServer, "int", iCodePage)
	hTopic := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", "WWW_GetWindowInfo", "int", iCodePage)
	hItem := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", "0xFFFFFFFF", "int", iCodePage)
	hConv := DllCall("DdeConnect", "UPtr", idInst, "UPtr", hServer, "UPtr", hTopic, "Uint", 0)
	hData := DllCall("DdeClientTransaction", "Uint", 0, "Uint", 0, "UPtr", hConv, "UPtr", hItem, "UInt", 1, "Uint", 0x20B0, "Uint", 10000, "UPtrP", nResult) ; 0x20B0 = XTYP_REQUEST, 10000 = 10s timeout
	sData := DllCall("DdeAccessData", "Uint", hData, "Uint", 0, "Str")
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hServer)
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hTopic)
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hItem)
	DllCall("DdeUnaccessData", "UPtr", hData)
	DllCall("DdeFreeDataHandle", "UPtr", hData)
	DllCall("DdeDisconnect", "UPtr", hConv)
	DllCall("DdeUninitialize", "UPtr", idInst)
	csvWindowInfo := StrGet(&sData, "CP0")
	StringSplit, sWindowInfo, csvWindowInfo, `" ;"; comment to avoid a syntax highlighting issue in autohotkey.com/boards
	Return sWindowInfo2
}

GetBrowserURL_ACC(sClass) {
	global nWindow, accAddressBar
	If (nWindow != WinExist("ahk_class " sClass)) ; reuses accAddressBar if it's the same window
	{
		nWindow := WinExist("ahk_class " sClass)
		accAddressBar := GetAddressBar(Acc_ObjectFromWindow(nWindow))
	}
	Try sURL := accAddressBar.accValue(0)
	If (sURL == "") {
		WinGet, nWindows, List, % "ahk_class " sClass ; In case of a nested browser window as in the old CoolNovo (TO DO: check if still needed)
		If (nWindows > 1) {
			accAddressBar := GetAddressBar(Acc_ObjectFromWindow(nWindows2))
			Try sURL := accAddressBar.accValue(0)
		}
	}
	If ((sURL != "") and (SubStr(sURL, 1, 4) != "http")) ; Modern browsers omit "http://"
		sURL := "http://" sURL
	If (sURL == "")
		nWindow := -1 ; Don't remember the window if there is no URL
	Return sURL
}

; "GetAddressBar" based in code by uname
; Found at http://autohotkey.com/board/topic/103178-/?p=637687

GetAddressBar(accObj) {
	Try If ((accObj.accRole(0) == 42) and IsURL(accObj.accValue(0)))
		Return accObj
	Try If ((accObj.accRole(0) == 42) and IsURL("http://" accObj.accValue(0))) ; Modern browsers omit "http://"
		Return accObj
	For nChild, accChild in Acc_Children(accObj)
		If IsObject(accAddressBar := GetAddressBar(accChild))
			Return accAddressBar
}

IsURL(sURL) {
	Return RegExMatch(sURL, "^(?<Protocol>https?|ftp)://(?<Domain>(?:[\w-]+\.)+\w\w+)(?::(?<Port>\d+))?/?(?<Path>(?:[^:/?# ]*/?)+)(?:\?(?<Query>[^#]+)?)?(?:\#(?<Hash>.+)?)?$")
}

; The code below is part of the Acc.ahk Standard Library by Sean (updated by jethrow)
; Found at http://autohotkey.com/board/topic/77303-/?p=491516

Acc_Init()
{
	static h
	If Not h
		h:=DllCall("LoadLibrary","Str","oleacc","Ptr")
}
Acc_ObjectFromWindow(hWnd, idObject = 0)
{
	Acc_Init()
	If DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)=0
	Return ComObjEnwrap(9,pacc,1)
}
Acc_Query(Acc) {
	Try Return ComObj(9, ComObjQuery(Acc,"{618736e0-3c3d-11cf-810c-00aa00389b71}"), 1)
}
Acc_Children(Acc) {
	If ComObjType(Acc,"Name") != "IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	Else {
		Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
		If DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
			Loop %cChildren%
				i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i), Children.Insert(NumGet(varChildren,i-8)=9?Acc_Query(child):child), NumGet(varChildren,i-8)=9?ObjRelease(child):
			Return Children.MaxIndex()?Children:
		} Else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
}