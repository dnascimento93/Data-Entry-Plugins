^Numpad0:: Send,{F12}  ; KFI form select
^F3:: Send, #{F3} 	   ; Zoom in
^Numpad2:: Send, {F2}  ; LC/FE switcher
^Numpad6:: Send, {F6}  ; skip
!Numpad6:: Send, ^{F6} ; skip all entries
^Numpad7:: Send, {F7}  ; reject in ocr
^Numpad8:: Send, {F8}  ; reject claim
^Numpad5::
	if (WinActive("ahk_group KEKFI"))
		Send, {F5} ; Red form outline
	else
		Send, +{F5} ; Show full form in ocr
return

; Ctrl-Num+ to add a new line at the bottom of a procedure line field
^NumpadAdd:: Send, ^{End}{NumpadAdd}

; Ctrl+A fix
^a:: Send, ^{Home}^+{End}

; Ctrl+↑ duplicate line above
^Up::
	Send, {Up}{End}+{Home}^{c}{Down}^{v}
return

; Ctrl+↓ duplicate line below
^Down::
	Send, {Down}{End}+{Home}^{c}{Up}^{v}
return

; Ctrl+Alt+Num0 / Num1 Prepend a 0 or a 1
^!Numpad0:: Send, {Home}0{Down}{Home}
^!Numpad1:: Send, {Home}1{Down}{Home}

!s:: send, sof{Enter}
!b:: send, bpx111111111{Enter}
!x:: send, 2222222222{Enter}
!p:: send, po box{Space}