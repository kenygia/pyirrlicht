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
	uint SLogEvent_GetText(voidp)
	int SLogEvent_GetLevel(voidp)

	voidp SEvent_GetSUserEvent(voidp)
	int SUserEvent_GetUserData1(voidp)
	int SUserEvent_GetUserData2(voidp)

	voidp IEventReceiver_ctor1(voidp)
	voidp IEventReceiver_ctor2(voidp)
	IEventReceiver_set_func_event(voidp, voidp)
}

type SEvent { voidp c_pointer }
operator SEvent =(SEvent self, voidp ptr)
{
	self.c_pointer = ptr
	return self
}
method int SEvent.GetEventType() : return SEvent_GetEventType(this.c_pointer)

type IEventReceiver <inherit = IReferenceCounted>
{
	voidp func_event
	byte delete_c_pointer
}
extern
{
	method IEventReceiver.set_func_event(voidp func_event)
	//~ method byte IEventReceiver.OnEvent(SEvent event)
	method byte IEventReceiver.OnEvent(voidp event)
}

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
	//~ this.c_pointer = IEventReceiver_ctor2(this.func_event)
	//~ this.delete_c_pointer = true
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
	return false
}
