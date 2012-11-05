import "irrlicht_c.dll" <cdeclare>
{
	voidp recti_ctor1()
	voidp recti_ctor2(int, int, int, int)
	int recti_getWidth(voidp)
	int recti_getHeight(voidp)
}

type recti <inherit = irr_base>:

method recti.init()
{
	this.c_pointer = recti_ctor1()
	this.delete_c_pointer = true
	//~ return this
}

operator recti =(recti self, collection params)
{
	self.delete()
	self.c_pointer = recti_ctor2(params[0], params[1], params[2], params[3])
	self.delete_c_pointer = true
	return self
}

method int recti.getWidth()
{
	return recti_getWidth(this.c_pointer)
}

method int recti.getHeight()
{
	return recti_getHeight(this.c_pointer)
}
