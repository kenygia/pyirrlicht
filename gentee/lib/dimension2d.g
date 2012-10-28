import "irrlicht_c.dll" <cdeclare>
{
	voidp dimension2du_ctor1()
	voidp dimension2du_ctor2(uint, uint)
	uint dimension2du_get_Width(voidp)
	uint dimension2du_get_Height(voidp)
}

type dimension2du
{
	voidp c_pointer
	uint x, y, Width, Height
}
//~ extern
//~ {
	//~ method uint dimension2du.get_x()
	//~ method uint dimension2du.get_y()
//~ }

method dimension2du.delete()
{
	if(this.c_pointer) : delete_pointer(this.c_pointer)
}

method dimension2du.init()
{
	this.c_pointer = dimension2du_ctor1()
	this.x = this.Width = dimension2du_get_Width(this.c_pointer)
	this.y = this.Height = dimension2du_get_Height(this.c_pointer)
}

//~ method dimension2du.init(uint Width, uint Height)
//~ {
	//~ this.c_pointer = dimension2du_ctor2(Width, Height)
	//~ this.x = this.Width = dimension2du_get_Width(this.c_pointer)
	//~ this.y = this.Height = dimension2du_get_Height(this.c_pointer)
//~ }
operator dimension2du =(dimension2du self, collection params)
{
	self.delete()
	self.c_pointer = dimension2du_ctor2(params[0], params[1])
	self.x = self.Width = dimension2du_get_Width(self.c_pointer)
	self.y = self.Height = dimension2du_get_Height(self.c_pointer)
	return self
}

//~ func dimension2du dimension2du(uint Width, uint Height)
//~ {
	//~ dimension2du res = %{Width, Height}
	//~ return res
//~ }
