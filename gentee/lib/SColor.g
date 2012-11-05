import "irrlicht_c.dll" <cdeclare>
{
	voidp SColor_ctor1()
	voidp SColor_ctor2(uint, uint, uint, uint)
	uint SColor_getAlpha(voidp)
	uint SColor_getRed(voidp)
	uint SColor_getGreen(voidp)
	uint SColor_getBlue(voidp)
	float SColor_getLuminance(voidp)
	uint SColor_getAverage(voidp)
	SColor_setAlpha(voidp, uint)
	SColor_setRed(voidp, uint)
	SColor_setGreen(voidp, uint)
	SColor_setBlue(voidp, uint)
}

type SColor <inherit = irr_base>:
extern
{
	method float SColor.getLuminance()
	method uint SColor.getAverage()

	// for backward compatibility with C++
	method uint SColor.getAlpha()
	method uint SColor.getRed()
	method uint SColor.getGreen()
	method uint SColor.getBlue()
	method SColor.setAlpha(uint value)
	method SColor.setRed(uint value)
	method SColor.setGreen(uint value)
	method SColor.setBlue(uint value)
}

method SColor.init()
{
	this.c_pointer = SColor_ctor1()
	this.delete_c_pointer = true
	//~ return this
}

operator SColor =(SColor self, collection params)
{
	self.delete()
	self.c_pointer = SColor_ctor2(params[0], params[1], params[2], params[3])
	self.delete_c_pointer = true
	return self
}

property uint SColor.a
{
	return SColor_getAlpha(this.c_pointer)
}
property uint SColor.r
{
	return SColor_getRed(this.c_pointer)
}
property uint SColor.g
{
	return SColor_getGreen(this.c_pointer)
}
property uint SColor.b
{
	return SColor_getBlue(this.c_pointer)
}
property SColor.a(uint value)
{
	SColor_setAlpha(this.c_pointer, value)
}
property SColor.r(uint value)
{
	SColor_setRed(this.c_pointer, value)
}
property SColor.g(uint value)
{
	SColor_setGreen(this.c_pointer, value)
}
property SColor.b(uint value)
{
	SColor_setBlue(this.c_pointer, value)
}

method float SColor.getLuminance()
{
	return SColor_getLuminance(this.c_pointer)
}
method uint SColor.getAverage()
{
	return SColor_getAverage(this.c_pointer)
}

method uint SColor.getAlpha()
{
	return SColor_getAlpha(this.c_pointer)
}
method uint SColor.getRed()
{
	return SColor_getRed(this.c_pointer)
}
method uint SColor.getGreen()
{
	return SColor_getGreen(this.c_pointer)
}
method uint SColor.getBlue()
{
	return SColor_getBlue(this.c_pointer)
}
method SColor.setAlpha(uint value)
{
	SColor_setAlpha(this.c_pointer, value)
}
method SColor.setRed(uint value)
{
	SColor_setRed(this.c_pointer, value)
}
method SColor.setGreen(uint value)
{
	SColor_setGreen(this.c_pointer, value)
}
method SColor.setBlue(uint value)
{
	SColor_setBlue(this.c_pointer, value)
}
