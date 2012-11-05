import "irrlicht_c.dll" <cdeclare>
{
	ICursorControl_setVisible(voidp, byte)
	byte ICursorControl_isVisible(voidp)
	ICursorControl_setPositionF(voidp, voidp)
	ICursorControl_setPositionF2(voidp, float, float)
	ICursorControl_setPositionI(voidp, voidp)
	ICursorControl_setPositionI2(voidp, int, int)
	voidp ICursorControl_getPosition(voidp)
	voidp ICursorControl_getRelativePosition(voidp)
	ICursorControl_setReferenceRect(voidp, voidp)
}

type ICursorControl <inherit = IReferenceCounted>:

operator ICursorControl =(ICursorControl self, voidp ptr)
{
	self.c_pointer = ptr
	return self
}

method ICursorControl.setVisible(byte visible)
{
	ICursorControl_setVisible(this.c_pointer, visible)
}

method byte ICursorControl.isVisible()
{
	return ICursorControl_isVisible(this.c_pointer)
}

method ICursorControl.setPosition(position2df pos)
{
	ICursorControl_setPositionF(this.c_pointer, pos.c_pointer)
}

method ICursorControl.setPosition(float x, float y)
{
	ICursorControl_setPositionF2(this.c_pointer, x, y)
}

method ICursorControl.setPosition(position2di pos)
{
	ICursorControl_setPositionI(this.c_pointer, pos.c_pointer)
}

method ICursorControl.setPosition(int x, int y)
{
	ICursorControl_setPositionI2(this.c_pointer, x, y)
}

method position2di ICursorControl.getPosition<result>()
{
	result = ICursorControl_getPosition(this.c_pointer)
}

method position2df ICursorControl.getRelativePosition<result>()
{
	result = ICursorControl_getRelativePosition(this.c_pointer)
}

method ICursorControl.setReferenceRect(recti rect)
{
	ICursorControl_setReferenceRect(this.c_pointer, rect.c_pointer)
}
