#include-once

Func SColor_ctor1()
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "SColor_ctor1")[0]
	Else
		Return Null
	EndIf
EndFunc

Func SColor_ctor2($a = 0, $r = 0, $g = 0, $b = 0)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "SColor_ctor2", "UINT", $a, "UINT", $r, "UINT", $g, "UINT", $b)[0]
	Else
		Return Null
	EndIf
EndFunc
