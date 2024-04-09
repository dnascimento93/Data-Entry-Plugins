global QUEUE_LIST := ["OCREPCRITCAMX","OCREPNUMCAMX","OCREPAIRCAMX","KFICAMX","KECAMX","KECOBCAMX","OCREPCRITMX","OCREPNUMMX","OCREPAIRMX","KFIMX","KEMX","KECOBMX","KEMRMX","OCREPCRITDCMX","OCREPNUMDCMX","OCREPAIRDCMX","KFIDCMX","KEDCMX","KECOBDCMX","OCREPCRITVIP","OCREPNUMVIP","OCREPAIRVIP","KFIVIP","KEVIP","KECOBVIP","OCREPCRITDT","OCREPNUMDT","OCREPAIRDT","KFIDT","KEDT","CORROKEDT","ARCHIVEONLYKEDT","KFISMARTSOURCE","CORROKE","CORROKEPEGA","ARCHIVEONLYKE","KEMR","OCREPCRIT","OCREPNUM","OCREPAIR","KFI","KE","KECOB","OCREPCRITDC","OCREPNUMDC","OCREPAIRDC","KFIDC","KEDC","KECOBDC","CORROKEDC","ARCHIVEONLYKEDC","OCREPCRITGA","OCREPNUMGA","OCREPAIRGA","KFIGA","KEGA","CORROKEGA","ARCHIVEONLYKEGA","OCREPCRITMED","OCREPNUMMED","OCREPAIRMED","KFIMED","KEMED","KECOBMED","OCREPCRITPR","OCREPNUMPR","OCREPAIRPR","KFIPR","KEPR","KECOBPR","KEMRPR","CORROKEPR","ARCHIVEONLYKEPR","OCREPCRITPRM","OCREPNUMPRM","OCREPAIRPRM","KFIPRM","KEPRM","KECOBPRM","KEMRPRM","OCREPCRITPSM","OCREPNUMPSM","OCREPAIRPSM","KEPSM","KFIPSM","KECOBPSM","KEMRPSM"]

;============================== QuickQ ==============================

getQ() {
	if WinActive("ahk_exe winstc.exe") {
		clipSaved := ClipboardAll
		Clipboard :=
		MouseClick, Right
		Sleep 100
		SendEvent, {Down 1}{Enter}
		Sleep 100
		q := Clipboard
		Sleep 100
		Clipboard := clipSaved
	}
	else if WinActive("Launchpad - DDCE")
		InputBox, q, QuickQueue, `      Type In Your Queue:, , 200, 125, , , , 25
	else if WinActive("WhatsApp") {
		clipSaved := ClipboardAll
		Clipboard :=
		Send, ^c
		Sleep 100
		q := Clipboard
		Sleep 100
		Clipboard := clipSaved
	}
	return q
}

getListPos(q) {
	downArrowKey:=
	q := Format("{:U}", RegExReplace(q, "[^a-zA-Z]"))
	for index, element in QUEUE_LIST
		if (q = element)
			downArrowKey := index - 1
		else if (q = "KFISS") {
			downArrowKey := 32
			Break
		}
	return downArrowKey
}

openQ(listPosition) {
	WinActivate, Launchpad - DDCE
	WinWaitActive, Launchpad - DDCE,, 1
	WinGetPos,,, fwSizeX, fwSizeY, Launchpad - DDCE
	rClickX := Round(fwSizeX - (fwSizeX * 0.03))
	rClickY := Round(fwSizeY - (fwSizeY * 0.78))
	CoordMode, Mouse, Window
	BlockInput, On
	MouseClick, Right, rClickX, rClickY
	Sleep, 100
	SendEvent, t
	Sleep, 100
	MouseMove,-30,0,,R
	Sleep, 100
	MouseMove, 30,0,,R
	SendEvent, {Down %listPosition%}{Enter}
	BlockInput, Off
}

;====================================================================

