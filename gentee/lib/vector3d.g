import "irrlicht_c.dll" <cdeclare>
{
	voidp vector3df_ctor1()
	voidp vector3df_ctor2(float, float, float)
}

type vector3df <inherit = irr_base>:

//~ method vector3df.init()
//~ {
	//~ print("vector3df.init empty\n")
	//~ this.c_pointer = vector3df_ctor1()
	//~ this.delete_c_pointer = true
//~ }

//~ method vector3df.init(float x, float y, float z)
//~ {
	//~ print("x=\(x) y=\(y) z=\(z)\n")
	//~ this.c_pointer = vector3df_ctor2(x, y, z)
	//~ this.delete_c_pointer = true
//~ }

operator vector3df =(vector3df self, collection params)
{
	self.delete()
	self.c_pointer = vector3df_ctor2((&params[0])->float, (&params[1])->float, (&params[2])->float)
	self.delete_c_pointer = true
	return self
}
