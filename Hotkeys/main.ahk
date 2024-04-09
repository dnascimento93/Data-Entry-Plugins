; Made by Daniel Nascimento
; v3.0 Last edit: 03/21/2023
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force
#Persistent
if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2
SetKeyDelay 25
DetectHiddenWindows On
GroupAdd, KEKFI, KE
GroupAdd, KEKFI, KFI
GroupAdd, allQs, OCR
GroupAdd, allQs, KE
GroupAdd, allQs, KFI
GroupAdd, selectionList, Change Form ID
GroupAdd, selectionList, selectionlist_
GroupAdd, selectionList, Reject Document
GroupAdd, reloadScript, %A_ScriptName%
Menu, Tray, Icon, %A_ScriptDir%\images\d2hk.ico
Menu, Tray, Tip, Delta 2 HotKeys
Menu, Tray, Add, Run On Startup, onStartup
Menu, Tray, Add ; separator
Menu, tipsSubMenu, Add, Hotstrings/Hotkeys										hk/, hotkeyHelp
Menu, tipsSubMenu, Add, QuickQ													qq/, quickqHelp
Menu, tipsSubMenu, Add, License Matching Tips									lm/, lmTips
Menu, tipsSubMenu, Add, FormWorks Tips											fw/, fwTips
Menu, tipsSubMenu, Add, COB Keywords											cob/, cobKeywords
Menu, tipsSubMenu, Add, Corro Reference											corro/, corroHelp
Menu, Tray, Add, Tips/Instructions, :tipsSubMenu
Menu, customHotstringsSubmenu, Add, Edit Custom Hotstrings, editHotstrings
Menu, customHotstringsSubmenu, Add, Run Custom Hotstrings, runHotstrings
Menu, Tray, Add, Custom Hotstrings, :customHotstringsSubmenu
Menu, Tray, Add ; separator
Menu, Tray, NoStandard
Menu, Tray, Standard
#Include %A_ScriptDir%\Functions.ahk

SplitPath, A_ScriptName,,,, scriptNameNoExt
startupPath := A_Startup . "\" . scriptNameNoExt . ".lnk"
FileCreateShortcut, %A_ScriptFullPath%, %A_Desktop%\%scriptNameNoExt%.lnk
if(FileExist(startupPath))
	Menu, Tray, ToggleCheck, Run On Startup

#IfWinExist, ahk_group reloadScript
^!+r::
	TrayTip, Reloading script, %A_ScriptName%
	SetTimer, RemoveTrayTip, 1500
	Sleep, 500
	Reload
return
#IfWinExist


#IfWinExist, Launchpad - DDCE
^q::
	if WinActive("ahk_exe winstc.exe") or WinActive("Launchpad - DDCE") or WinActive("WhatsApp") {
		queue := getQ()
		if (ErrorLevel = 0)
			listPos := getListPos(queue)
		else
			exit
		if (listPos = "")
			MsgBox, 4096,, Invalid Queue.
		else
			openQ(listPos)
	}
	else
		Send, ^q
return
#IfWinExist


#If WinActive("ahk_group allQs") and WinActive("- \\Remote") and !WinActive("ahk_group selectionList")
#Include %A_ScriptDir%\CSZ_Hotstrings.ahk
#Include %A_ScriptDir%\Hotkeys.ahk
#Include %A_ScriptDir%\Hotstrings.ahk
#If

#Include %A_ScriptDir%\Labels.ahk
