import "irrlicht_c.dll" <cdeclare>
{
	IGUIEnvironment_drawAll(voidp)
}

type IGUIEnvironment <inherit = IReferenceCounted>:

method IGUIEnvironment.drawAll()
{
	IGUIEnvironment_drawAll(this.c_pointer)
}
