#include-once

Func IVideoDriver_beginScene($pointer, $backBuffer = True, $zBuffer = True, $color = Null, $videoData = Null, $sourceRect = Null)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "BYTE:cdecl", "IVideoDriver_beginScene", "ptr", $pointer, "BYTE", $backBuffer, "BYTE", $zBuffer, "ptr", $color, "ptr", $videoData, "ptr", $sourceRect)[0]
	Else
		Return False
	EndIf
EndFunc

Func IVideoDriver_beginSceneDefault($pointer, $backBuffer = True, $zBuffer = True, $color = Null)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "BYTE:cdecl", "IVideoDriver_beginSceneDefault", "ptr", $pointer, "BYTE", $backBuffer, "BYTE", $zBuffer, "ptr", $color)[0]
	Else
		Return False
	EndIf
EndFunc

Func IVideoDriver_endScene($pointer)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "BYTE:cdecl", "IVideoDriver_beginSceneDefault", "ptr", $pointer)[0]
	Else
		Return False
	EndIf
EndFunc

Func IVideoDriver_getTexture1($pointer, $filename = '')
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "IVideoDriver_getTexture1", "ptr", $pointer, $fschar_t, $filename)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IVideoDriver_getFPS($pointer)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "int:cdecl", "IVideoDriver_getFPS", "ptr", $pointer)[0]
	Else
		Return 0
	EndIf
EndFunc

Func IVideoDriver_GetHandle($pointer)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "HWND:cdecl", "IVideoDriver_beginSceneDefault", "ptr", $pointer)[0]
	Else
		Return 0
	EndIf
EndFunc

Func IVideoDriver_SetIcon($pointer, $icon_id = 32512, $big_icon = false)
	If $ihandle > 0 Then
		DllCall($ihandle, "none:cdecl", "IVideoDriver_SetIcon", "ptr", $pointer, "int", $icon_id, "bool", $big_icon)
	EndIf
EndFunc
