import "irrlicht_c.dll" <cdeclare>
{
	IReferenceCounted_grab(voidp)
	byte IReferenceCounted_drop(voidp)
	int IReferenceCounted_getReferenceCount(voidp)
	voidp IReferenceCounted_getDebugName(voidp)
}

type IReferenceCounted
{
	voidp c_pointer
}
//~ extern
//~ {
	//~ method IReferenceCounted.grab()
	//~ method byte IReferenceCounted.drop()
	//~ method int IReferenceCounted.getReferenceCount()
	//~ method str IReferenceCounted.getDebugName <result>()
//~ }

operator IReferenceCounted =(IReferenceCounted self, voidp ptr)
{
	self.c_pointer = ptr
	return self
}

operator IReferenceCounted =(IReferenceCounted self, IReferenceCounted new_self)
{
	self.c_pointer = new_self.c_pointer
	return self
}

method IReferenceCounted.grab()
{
	IReferenceCounted_grab(this.c_pointer)
}

method byte IReferenceCounted.drop()
{
	return IReferenceCounted_drop(this.c_pointer)
}

method int IReferenceCounted.getReferenceCount()
{
	return IReferenceCounted_getReferenceCount(this.c_pointer)
}

method str IReferenceCounted.getDebugName <result>()
{
	result.copy(IReferenceCounted_getDebugName(this.c_pointer))
}
