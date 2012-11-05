import "irrlicht_c.dll" <cdeclare>
{
	int SEvent_GetEventType(voidp)

	voidp IEventReceiver_ctor2(voidp)
	IEventReceiver_set_func_event(voidp, voidp)
}

type SEvent { voidp c_pointer }
method int SEvent.GetEventType() : return SEvent_GetEventType(this.c_pointer)

type IEventReceiver <inherit = IReferenceCounted>
{
	voidp func_event
	byte delete_c_pointer
}
//~ extern
//~ {
	//~ method IEventReceiver.set_func_event(voidp func_event)
	//~ method byte IEventReceiver.OnEvent(SEvent event)
//~ }

method IEventReceiver.init()
{
	//~ this.func_event = callback(&(this.OnEvent), 1, $CB_CDECL)
	//~ this.c_pointer = IEventReceiver_ctor2(this.func_event)
	//~ this.delete_c_pointer = true
}

method IEventReceiver.delete()
{
	if(this.func_event) : freecallback(this.func_event)
	if(this.c_pointer && this.delete_c_pointer) : delete_pointer(this.c_pointer)
}

operator IEventReceiver =(IEventReceiver self, voidp ptr)
{
	self.c_pointer = ptr
	self.delete_c_pointer = false
	return self
}

method IEventReceiver.set_func_event(voidp func_event)
{
	if(this.func_event) : freecallback(this.func_event)
	this.func_event = callback(func_event, 1, $CB_CDECL)
	IEventReceiver_set_func_event(this.c_pointer, this.func_event)
}

method byte IEventReceiver.OnEvent(SEvent event)
{
	// must be replaced with user IEventReceiver object
	return false
}
