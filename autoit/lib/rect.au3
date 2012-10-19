#include-once

Func recti_ctor1()
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "recti_ctor1")[0]
	Else
		Return Null
	EndIf
EndFunc

Func recti_ctor2($x = 0, $y = 0, $x2 = 0, $y2 = 0)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "recti_ctor2", "int", $x, "int", $y, "int", $x2, "int", $y2)[0]
	Else
		Return Null
	EndIf
EndFunc
