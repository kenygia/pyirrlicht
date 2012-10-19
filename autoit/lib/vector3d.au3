#include-once

Func vector3df_ctor1()
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "vector3df_ctor1")[0]
	Else
		Return Null
	EndIf
EndFunc

Func vector3df_ctor2($x = 0.0, $y = 0.0, $z = 0.0)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "vector3df_ctor2", "float", $x, "float", $y, "float", $z)[0]
	Else
		Return Null
	EndIf
EndFunc
