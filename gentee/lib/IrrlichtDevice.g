import "irrlicht_c.dll" <cdeclare>
{
	voidp IrrlichtDevice_createDevice(int, voidp, uint, byte, byte, byte, voidp)
	voidp IrrlichtDevice_createDevice2(int, voidp, uint, byte, byte, byte, byte)
	byte IrrlichtDevice_run(voidp)
	IrrlichtDevice_yield(voidp)
	IrrlichtDevice_yield(voidp, uint, byte)
	voidp IrrlichtDevice_getVideoDriver(voidp)
	voidp IrrlichtDevice_getFileSystem(voidp)
	voidp IrrlichtDevice_getGUIEnvironment(voidp)
	voidp IrrlichtDevice_getSceneManager(voidp)
	voidp IrrlichtDevice_getCursorControl(voidp)
	IrrlichtDevice_setWindowCaption(voidp, uint)
	IrrlichtDevice_closeDevice(voidp)
	uint IrrlichtDevice_getVersion(voidp)
	IrrlichtDevice_setResizable(voidp, byte)
	IrrlichtDevice_setEventReceiver(voidp, voidp)
	voidp IrrlichtDevice_getEventReceiver(voidp)
}

type IrrlichtDevice
{
	voidp c_pointer
}
extern 
{
	//~ method byte IrrlichtDevice.createDevice(int deviceType = EDT_NULL, voidp windowSize = 0, uint bits = 16, byte fullscreen = false, byte stencilbuffer = false, byte vsync = false, voidp receiver = 0)
	method byte IrrlichtDevice.createDevice(int deviceType, collection wsize, uint bits, byte fullscreen, byte stencilbuffer, byte vsync, voidp receiver)
	method byte IrrlichtDevice.createDevice(int deviceType, dimension2du windowSize, uint bits, byte fullscreen, byte stencilbuffer, byte vsync, voidp receiver)
	method byte IrrlichtDevice.run()
	method str IrrlichtDevice.getVersion <result>()
}

//~ method byte IrrlichtDevice.createDevice(int deviceType = EDT_NULL, dimension2du windowSize = (320, 240), uint bits = 16, byte fullscreen = false, byte stencilbuffer = false, byte vsync = false, voidp receiver = 0)
method byte IrrlichtDevice.createDevice(int deviceType, collection wsize, uint bits, byte fullscreen, byte stencilbuffer, byte vsync, voidp receiver)
{
	dimension2du windowSize = wsize
	this.c_pointer = IrrlichtDevice_createDevice(deviceType, windowSize.c_pointer, bits, fullscreen, stencilbuffer, vsync, receiver)
	if (this.c_pointer)
	{
		return true
	}
	else
	{
		return false
	}
}
method byte IrrlichtDevice.createDevice(int deviceType, dimension2du windowSize, uint bits, byte fullscreen, byte stencilbuffer, byte vsync, voidp receiver)
{
	this.c_pointer = IrrlichtDevice_createDevice(deviceType, windowSize.c_pointer, bits, fullscreen, stencilbuffer, vsync, receiver)
	if (this.c_pointer)
	{
		return true
	}
	else
	{
		return false
	}
}

method byte IrrlichtDevice.run()
{
	return IrrlichtDevice_run(this.c_pointer)
}

method str IrrlichtDevice.getVersion <result>()
{
	//~ str version
	//~ version.copy(IrrlichtDevice_getVersion(this.c_pointer))
	result.copy(IrrlichtDevice_getVersion(this.c_pointer))
}
