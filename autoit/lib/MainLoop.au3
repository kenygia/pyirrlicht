#include-once

Func MainLoop_ctor1($device)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "MainLoop_ctor1", "ptr", $device)[0]
	Else
		Return Null
	EndIf
EndFunc

Func MainLoop_ctor2($device, $driver = Null, $smgr = Null, $guienv = Null)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "MainLoop_ctor2", "ptr", $device, "ptr", $driver, "ptr", $smgr, "ptr", $guienv)[0]
	Else
		Return Null
	EndIf
EndFunc

Func MainLoop_ctor3($device, $driver = Null, $smgr = Null, $guienv = Null, $backBuffer = true, $zBuffer = true, $color = Null, $videoData = Null, $sourceRect = Null, $time_ms = 0, $pause_timer = false)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "MainLoop_ctor3", "ptr", $device, "ptr", $driver, "ptr", $smgr, "ptr", $guienv, "bool", $backBuffer, "bool", $zBuffer, "ptr", $color, "ptr", $videoData, "ptr", $sourceRect, "UINT", $time_ms, "bool", $pause_timer)[0]
	Else
		Return Null
	EndIf
EndFunc

Func MainLoop_start($pointer)
	If $ihandle Then DllCall($ihandle, "none:cdecl", "MainLoop_start", "ptr", $pointer)
EndFunc

Func MainLoop_start_sm($pointer)
	If $ihandle Then DllCall($ihandle, "none:cdecl", "MainLoop_start_sm", "ptr", $pointer)
EndFunc

Func MainLoop_start_ge($pointer)
	If $ihandle Then DllCall($ihandle, "none:cdecl", "MainLoop_start_ge", "ptr", $pointer)
EndFunc

Func MainLoop_start_sm_ge($pointer)
	If $ihandle Then DllCall($ihandle, "none:cdecl", "MainLoop_start_sm_ge", "ptr", $pointer)
EndFunc

Func MainLoop_stop($pointer)
	If $ihandle Then DllCall($ihandle, "none:cdecl", "MainLoop_stop", "ptr", $pointer)
EndFunc

Func MainLoop_is_running($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "bool:cdecl", "MainLoop_is_running", "ptr", $pointer)[0]
	Else
		Return False
	EndIf
EndFunc
