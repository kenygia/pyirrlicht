#include-once

Global Const $IRR_WCHAR_FILESYSTEM = true
; TODO
;~ Global Const $IRR_WCHAR_FILESYSTEM = get_bool_from_library('IRR_WCHAR_FILESYSTEM')
;~ Global Const $IRR_WCHAR_FILESYSTEM = DllCall($ihandle, 'bool:cdecl', 'IRR_WCHAR_FILESYSTEM')[0]

If $IRR_WCHAR_FILESYSTEM Then
	$fschar_t = "wstr"
Else
	$fschar_t = "str"
EndIf
