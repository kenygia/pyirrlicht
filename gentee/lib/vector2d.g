import "irrlicht_c.dll" <cdeclare>
{
	voidp vector2df_ctor1(float, float)
	voidp vector2df_ctor2(float)

	float vector2df_get_X(voidp)
	float vector2df_get_Y(voidp)
	vector2df_set_X(voidp, float)
	vector2df_set_Y(voidp, float)

// =================================
	voidp vector2di_ctor1(int, int)
	voidp vector2di_ctor2(int)

	int vector2di_get_X(voidp)
	int vector2di_get_Y(voidp)
	vector2di_set_X(voidp, int)
	vector2di_set_Y(voidp, int)
}

// ===============class vector2df==================
type vector2df <inherit = irr_base>:

method vector2df.init()
{
	this.c_pointer = vector2df_ctor2(0.0f)
	this.delete_c_pointer = true
	//~ return this
}

operator vector2df =(vector2df self, collection params)
{
	self.delete()
	self.c_pointer = vector2df_ctor1(float(params[0]), float(params[1]))
	self.delete_c_pointer = true
	return self
}

property float vector2df.X
{
	return vector2df_get_X(this.c_pointer)
}
property float vector2df.Y
{
	return vector2df_get_Y(this.c_pointer)
}
property vector2df.X(float value)
{
	vector2df_set_X(this.c_pointer, value)
}
property vector2df.Y(float value)
{
	vector2df_set_Y(this.c_pointer, value)
}

// ===============class vector2di==================
type vector2di <inherit = irr_base>:

method vector2di.init()
{
	this.c_pointer = vector2di_ctor2(0)
	this.delete_c_pointer = true
	//~ return this
}

operator vector2di =(vector2di self, collection params)
{
	self.delete()
	self.c_pointer = vector2di_ctor1(params[0], params[1])
	self.delete_c_pointer = true
	return self
}

property int vector2di.X
{
	return vector2di_get_X(this.c_pointer)
}
property int vector2di.Y
{
	return vector2di_get_Y(this.c_pointer)
}
property vector2di.X(int value)
{
	vector2di_set_X(this.c_pointer, value)
}
property vector2di.Y(int value)
{
	vector2di_set_Y(this.c_pointer, value)
}


// position2d classes is old and for backward compatibility
type position2df <inherit = vector2df>:
type position2di <inherit = vector2di>:
