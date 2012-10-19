#include-once

#include "constants.au3"
#include "types.au3"
#include "dimension2d.au3"
#include "rect.au3"
#include "vector3d.au3"
#include "SColor.au3"
#include "SExposedVideoData.au3"
#include "IEventReceiver.au3"
#include "IAnimatedMeshSceneNode.au3"
#include "IrrlichtDevice.au3"
#include "ISceneManager.au3"
#include "ISceneNode.au3"
#include "IVideoDriver.au3"
#include "MainLoop.au3"

Global $ihandle, $fschar_t

Global $irrlicht_library_name = 'irrlicht_c.dll'

Func load_irrlicht_library($file_name = $irrlicht_library_name)
	$irrlicht_library_name = $file_name
	$ihandle = DllOpen($file_name)
	If @error > 0 Then Return False
	Return True
EndFunc

Func unload_irrlicht_library()
	If $ihandle Then DllClose($ihandle)
EndFunc

Func delete_pointer($pointer)
	If $ihandle > 0 Then DllCall($ihandle, "none:cdecl", "delete_pointer", "ptr", $pointer)
EndFunc

;======================TOOLS========================
;~ #include <WinAPI.au3>

;~ Func get_bool_from_library($variable_name = '')
;~ 	Local $hModule = _WinAPI_GetModuleHandle($irrlicht_library_name)
;~ 	If $hModule Then
;~ 		Local $result = _WinAPI_GetProcAddress($hModule, $variable_name)
;~ 		_WinAPI_FreeLibrary($hModule)
;~ 		Return $result
;~ 	EndIf
;~ 	Return False
;~ 	Local $result = DllCall("kernel32.dll", "bool", "GetProcAddress", "handle", $ihandle, 'str', $variable_name)
;~ 	If @error Then Return SetError(@error, 0, False)
;~ 	Return $result[0]
;~ 	Local $result = DllCall("kernel32.dll", "ptr", "GetProcAddress", "handle", $ihandle, 'str', $variable_name)[0]
;~ 	Return DllCallAddress("bool:cdecl", $result)[0]
;~ 	Return Execute('DllCall($ihandle, "bool:cdecl", "' & $variable_name & '")')
;~ EndFunc

;~ Func _WinAPI_GetExitCodeThread($hThread = 0, $dwExitCode = 0)
;~ 	Return DllCall("kernel32.dll", "bool", "GetExitCodeThread", "handle", $hThread, "DWORD*", $dwExitCode)[0]
;~ EndFunc

;~ Func _WinAPI_TerminateThread($hThread = 0, $dwExitCode = 0)
;~ 	Return DllCall("kernel32.dll", "bool", "TerminateThread", "handle", $hThread, "DWORD", $dwExitCode)[0]
;~ EndFunc

;~ Func _WinAPI_ExitThread($dwExitCode = 0)
;~ 	DllCall("kernel32.dll", "none", "ExitThread", "DWORD", $dwExitCode)
;~ EndFunc

;~ Func _WinAPI_LockWindowUpdate($hWnd = Null)
;~ 	Return DllCall("user32.dll", "bool", "LockWindowUpdate", "hwnd", $hWnd)[0]
;~ EndFunc
