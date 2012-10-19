#include-once

Func dimension2du_ctor1()
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "dimension2du_ctor1")[0]
	Else
		Return Null
	EndIf
EndFunc

Func dimension2du_ctor2($width, $height)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "dimension2du_ctor2", "UINT", $width, "UINT", $height)[0]
	Else
		Return Null
	EndIf
EndFunc
