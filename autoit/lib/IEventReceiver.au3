#include-once

Func IEventReceiver_ctor1($pointer)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IEventReceiver_ctor1", "ptr", $pointer)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IEventReceiver_ctor2($on_event_function = Null)
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IEventReceiver_ctor2", "ptr", $on_event_function)[0]
	Else
		Return Null
	EndIf
EndFunc

Func IEventReceiver_ctor3($on_event_name = "");later callback pointer require free, therefore function is not done and require changes
	If $ihandle Then
		Return DllCall($ihandle, "ptr:cdecl", "IEventReceiver_ctor2", "ptr", DllCallbackGetPtr(DllCallbackRegister($on_event_name, "bool:cdecl", "ptr")))[0]
	Else
		Return Null
	EndIf
EndFunc

Func IEventReceiver_set_func_event($pointer, $on_event_function = Null)
	If $ihandle Then DllCall($ihandle, "ptr:cdecl", "IEventReceiver_set_func_event", "ptr", $pointer, "ptr", $on_event_function)
EndFunc
