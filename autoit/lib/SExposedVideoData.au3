#include-once

Func SExposedVideoData_ctor1()
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "SExposedVideoData_ctor1")[0]
	Else
		Return Null
	EndIf
EndFunc

Func SExposedVideoData_ctor2($hwnd = 0)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "SExposedVideoData_ctor2", "HWND", $hwnd)[0]
	Else
		Return Null
	EndIf
EndFunc
