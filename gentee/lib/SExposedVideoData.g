import "irrlicht_c.dll" <cdeclare>
{
	voidp SExposedVideoData_ctor1()
	voidp SExposedVideoData_ctor2(voidp)
}

type SExposedVideoData <inherit = irr_base>:

method SExposedVideoData.init()
{
	this.c_pointer = SExposedVideoData_ctor1()
	this.delete_c_pointer = true
	//~ return this
}

operator SExposedVideoData =(SExposedVideoData self, voidp window_handle)
{
	self.delete()
	self.c_pointer = SExposedVideoData_ctor2(window_handle)
	self.delete_c_pointer = true
	return self
}

operator SExposedVideoData =(SExposedVideoData self, collection params)
{
	self.delete()
	self.c_pointer = params[0]
	self.delete_c_pointer = params[1]// must be false
	return self
}
