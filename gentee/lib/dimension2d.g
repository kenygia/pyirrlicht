import "irrlicht_c.dll" <cdeclare>
{
	voidp dimension2du_ctor1()
	voidp dimension2du_ctor2(uint, uint)
	uint dimension2du_get_Width(voidp)
	uint dimension2du_get_Height(voidp)
	dimension2du_set_Width(voidp, uint)
	dimension2du_set_Height(voidp, uint)
}

type dimension2du <inherit = irr_base>:

method dimension2du.init()
{
	this.c_pointer = dimension2du_ctor1()
	this.delete_c_pointer = true
	//~ return this
}

//~ method dimension2du.init(uint Width, uint Height)
//~ {
	//~ this.c_pointer = dimension2du_ctor2(Width, Height)
//~ }
operator dimension2du =(dimension2du self, collection params)
{
	self.delete()
	self.c_pointer = dimension2du_ctor2(params[0], params[1])
	self.delete_c_pointer = true
	return self
}
operator dimension2du =(dimension2du self, voidp ptr)
{
	self.delete()
	self.c_pointer = ptr
	self.delete_c_pointer = false
	return self
}

property uint dimension2du.x
{
	return dimension2du_get_Width(this.c_pointer)
}
property uint dimension2du.Width
{
	return dimension2du_get_Width(this.c_pointer)
}
property uint dimension2du.y
{
	return dimension2du_get_Height(this.c_pointer)
}
property uint dimension2du.Height
{
	return dimension2du_get_Height(this.c_pointer)
}
property dimension2du.x(uint value)
{
	dimension2du_set_Width(this.c_pointer, value)
}
property dimension2du.Width(uint value)
{
	dimension2du_set_Width(this.c_pointer, value)
}
property dimension2du.y(uint value)
{
	dimension2du_set_Height(this.c_pointer, value)
}
property dimension2du.Height(uint value)
{
	dimension2du_set_Height(this.c_pointer, value)
}
