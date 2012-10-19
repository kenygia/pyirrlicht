#include-once

Func IrrlichtDevice_createDevice($deviceType = $EDT_SOFTWARE, $windowSize = Null, $bits = 16, $fullscreen = False, $stencilbuffer = False, $vsync = False, $receiver = Null)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_createDevice", "int", $deviceType, "ptr", $windowSize, "UINT", $bits, "BYTE", $fullscreen, "BYTE", $stencilbuffer, "BYTE", $vsync, "ptr", $receiver)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IrrlichtDevice_createDevice2($deviceType = $EDT_SOFTWARE, $windowSize = Null, $bits = 16, $fullscreen = False, $stencilbuffer = False, $vsync = False, $create_receiver = False)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_createDevice2", "int", $deviceType, "ptr", $windowSize, "UINT", $bits, "BYTE", $fullscreen, "BYTE", $stencilbuffer, "BYTE", $vsync, "BYTE", $create_receiver)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IrrlichtDevice_run($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "BYTE:cdecl", "IrrlichtDevice_run", "ptr", $pointer)[0]
	Else
		Return False
	EndIf
EndFunc

Func IrrlichtDevice_fast_run($pointer)
	Return DllCall($ihandle, "BYTE:cdecl", "IrrlichtDevice_run", "ptr", $pointer)[0]
EndFunc

Func IrrlichtDevice_yield($pointer)
	If $ihandle Then
		DllCall($ihandle, "none:cdecl", "IrrlichtDevice_yield", "ptr", $pointer)
	EndIf
EndFunc

Func IrrlichtDevice_sleep($pointer, $timeMs = 10, $pauseTimer = False)
	If $ihandle Then
		DllCall($ihandle, "none:cdecl", "IrrlichtDevice_yield", "ptr", $pointer, "UINT", $timeMs, "BYTE", $pauseTimer)
	EndIf
EndFunc

Func IrrlichtDevice_getVideoDriver($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_getVideoDriver", "ptr", $pointer)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IrrlichtDevice_getFileSystem($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_getFileSystem", "ptr", $pointer)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IrrlichtDevice_getGUIEnvironment($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_getGUIEnvironment", "ptr", $pointer)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IrrlichtDevice_getSceneManager($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_getSceneManager", "ptr", $pointer)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IrrlichtDevice_getCursorControl($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_getCursorControl", "ptr", $pointer)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IrrlichtDevice_setWindowCaption($pointer, $caption = "")
	If $ihandle Then
		DllCall($ihandle, "none:cdecl", "IrrlichtDevice_setWindowCaption", "ptr", $pointer, "wstr", $caption)
	EndIf
EndFunc

Func IrrlichtDevice_closeDevice($pointer)
	If $ihandle Then
		DllCall($ihandle, "none:cdecl", "IrrlichtDevice_closeDevice", "ptr", $pointer)
	EndIf
EndFunc

Func IrrlichtDevice_getVersion($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "str:cdecl", "IrrlichtDevice_getVersion", "ptr", $pointer)[0]
	Else
		Return ""
	EndIf
EndFunc

Func IrrlichtDevice_setResizable($pointer, $resizable = false)
	If $ihandle Then
		DllCall($ihandle, "none:cdecl", "IrrlichtDevice_setResizable", "ptr", $pointer, "bool", $resizable)
	EndIf
EndFunc

Func IrrlichtDevice_setEventReceiver($pointer, $receiver = Null)
	If $ihandle Then
		DllCall($ihandle, "none:cdecl", "IrrlichtDevice_setEventReceiver", "ptr", $pointer, "ptr", $receiver)
	EndIf
EndFunc

Func IrrlichtDevice_getEventReceiver($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IrrlichtDevice_getEventReceiver", "ptr", $pointer)[0]
	Else
		Return Null
	EndIf
EndFunc
