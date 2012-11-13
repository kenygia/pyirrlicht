import "irrlicht_c.dll" <cdeclare>
{
	int SEvent_GetEventType(voidp)

	voidp SEvent_GetSGUIEvent(voidp)
	voidp SGUIEvent_GetCaller(voidp)
	voidp SGUIEvent_GetElement(voidp)
	int SGUIEvent_GetEventType(voidp)

	voidp SEvent_GetSMouseInput(voidp)
	int SMouseInput_GetX(voidp)
	int SMouseInput_GetY(voidp)
	float SMouseInput_GetWheel(voidp)
	byte SMouseInput_GetShift(voidp)
	byte SMouseInput_GetControl(voidp)
	int SMouseInput_GetButtonStates(voidp)
	byte SMouseInput_isLeftPressed(voidp)
	byte SMouseInput_isRightPressed(voidp)
	byte SMouseInput_isMiddlePressed(voidp)
	int SMouseInput_GetEventType(voidp)

	voidp SEvent_GetSKeyInput(voidp)
	byte SKeyInput_GetChar(voidp)
	int SKeyInput_GetKey(voidp)
	byte SKeyInput_GetPressedDown(voidp)
	byte SKeyInput_GetShift(voidp)
	byte SKeyInput_GetControl(voidp)

	voidp SEvent_GetSJoystickEvent(voidp)
	uint SJoystickEvent_GetButtonStates(voidp)
	int SJoystickEvent_GetAxis(voidp)
	int SJoystickEvent_GetPOV(voidp)
	int SJoystickEvent_GetJoystick(voidp)
	byte SJoystickEvent_IsButtonPressed(voidp)

	voidp SEvent_GetSLogEvent(voidp)
	voidp SLogEvent_GetText(voidp)
	int SLogEvent_GetLevel(voidp)

	voidp SEvent_GetSUserEvent(voidp)
	int SUserEvent_GetUserData1(voidp)
	int SUserEvent_GetUserData2(voidp)

	voidp IEventReceiver_ctor1(voidp)
	voidp IEventReceiver_ctor2(voidp)
	IEventReceiver_set_func_event(voidp, voidp)
}

type base_event { voidp c_pointer }
operator base_event =(base_event self, voidp ptr)
{
	self.c_pointer = ptr
	return self
}

type SLogEvent <inherit = base_event> :
method int SLogEvent.GetLevel() : return SLogEvent_GetLevel(this.c_pointer)
method str SLogEvent.GetText <result>() : result.copy(SLogEvent_GetText(this.c_pointer))

type SEvent <inherit = base_event> :
method int SEvent.GetEventType() : return SEvent_GetEventType(this.c_pointer)
method SLogEvent SEvent.GetSLogEvent <result>() : result = SEvent_GetSLogEvent(this.c_pointer)
property SLogEvent SEvent.LogEvent <result> : result = SEvent_GetSLogEvent(this.c_pointer)

type IEventReceiver <inherit = IReferenceCounted>
{
	voidp func_event
	byte delete_c_pointer
}
//~ extern
//~ {
	//~ method IEventReceiver.set_func_event(voidp func_event)
	//~ //method byte IEventReceiver.OnEvent(SEvent event)
	//~ method byte IEventReceiver.OnEvent(voidp event)
//~ }

operator IEventReceiver =(IEventReceiver self, voidp ptr)
{
	//~ self.c_pointer = IEventReceiver_ctor1(ptr)
	self.c_pointer = ptr
	self.delete_c_pointer = false
	return self
}

method IEventReceiver.init()
{
	//~ this.func_event = callback(&(this.OnEvent), 2, $CB_CDECL)//The count of parameters is wrong in the function '@OnEvent'
	//~ uint idevent = getid("@OnEvent", $GETID_METHOD, %{IEventReceiver, SEvent})
	uint idevent = getid("@OnEvent", $GETID_METHOD, %{IEventReceiver, voidp})
	print("=== @OnEvent idevent = \(idevent)\n")
	if idevent
	{
		this.func_event = callback(idevent, 2, $CB_CDECL)
	}
	else
	{
		uint idevent = getid("OnEvent", $GETID_METHOD, %{IEventReceiver, voidp})
		print("=== OnEvent idevent = \(idevent)\n")
		if idevent
		{
			this.func_event = callback(idevent, 2, $CB_CDECL)
		}
	}
	if this.func_event
	{
		this.c_pointer = IEventReceiver_ctor2(this.func_event)
		this.delete_c_pointer = true
	}
}

method IEventReceiver.delete()
{
	if(this.func_event) : freecallback(this.func_event)
	if(this.c_pointer && this.delete_c_pointer) : delete_pointer(this.c_pointer)
}

method IEventReceiver.set_func_event(voidp func_event)
{
	if(this.func_event) : freecallback(this.func_event)
	this.func_event = callback(func_event, 1, $CB_CDECL)
	IEventReceiver_set_func_event(this.c_pointer, this.func_event)
}

//~ method byte IEventReceiver.OnEvent(SEvent event)
method byte IEventReceiver.OnEvent(voidp event)
{
	// must be replaced with user IEventReceiver object
	print("parent OnEvent SEvent_GetEventType \(SEvent_GetEventType(event))\n")
	//~ voidp log_event = SEvent_GetSLogEvent(event)
	//~ ustr log_text
	//~ log_text.copy(SLogEvent_GetText(log_event))
	//~ print("Log = \(log_text.str())\n")
	return false
}
