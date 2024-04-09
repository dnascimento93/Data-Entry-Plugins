RemoveTrayTip:
	SetTimer, RemoveTrayTip, Off
return

onStartup:
	if(!FileExist(startupPath)) {
		Menu, Tray, ToggleCheck, Run On Startup
		FileCreateShortcut, %A_ScriptFullPath%, %startupPath%
	}
	else {
		Menu, Tray, ToggleCheck, Run On Startup
		FileDelete, %startupPath%
	}
return


lmTips:
	Run %A_ScriptDir%\images\lm_tips.png
return

fwTips:
	Run %A_ScriptDir%\images\fwhelper.png
return

hotkeyHelp:
	Run %A_ScriptDir%\images\hotkeys_hotstrings.png
return

quickqHelp:
	Run %A_ScriptDir%\images\quickqhelper.png
return

corroHelp:
	Run %A_ScriptDir%\images\corrohelper.png
return

cobKeywords:
	Run %A_ScriptDir%\images\cobkeywords.png
return

editHotstrings:
	Run, notepad.exe "%A_ScriptDir%\CustomHotstrings.ahk"
return

runHotstrings:
	if (A_AhkPath = "") {
		MsgBox, 4100, AHK Required, Running your custom hotstrings requires AutoHotKey to be installed. Would you like to install AutoHotKey now?
		IfMsgBox Yes
		{
			Run %A_ScriptDir%\ahk install\howtoinstall.png
			Run %A_ScriptDir%\ahk install\AutoHotkey_1.1.36.02_setup.exe
		}
		else
			Exit
	}
	else
		Run %A_ScriptDir%\CustomHotstrings.ahk
return

