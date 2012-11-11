import "irrlicht_c.dll" <cdeclare>
{
	voidp IrrlichtDevice_createDevice(int, voidp, uint, byte, byte, byte, voidp)
	voidp IrrlichtDevice_createDevice2(int, voidp, uint, byte, byte, byte, byte)
	byte IrrlichtDevice_run(voidp)
	IrrlichtDevice_yield(voidp)
	IrrlichtDevice_sleep(voidp, uint, byte)
	voidp IrrlichtDevice_getVideoDriver(voidp)
	voidp IrrlichtDevice_getFileSystem(voidp)
	voidp IrrlichtDevice_getGUIEnvironment(voidp)
	voidp IrrlichtDevice_getSceneManager(voidp)
	voidp IrrlichtDevice_getCursorControl(voidp)
	IrrlichtDevice_setWindowCaption(voidp, voidp)
	IrrlichtDevice_closeDevice(voidp)
	uint IrrlichtDevice_getVersion(voidp)
	IrrlichtDevice_setResizable(voidp, byte)
	IrrlichtDevice_setEventReceiver(voidp, voidp)
	voidp IrrlichtDevice_getEventReceiver(voidp)
	byte IrrlichtDevice_isWindowActive(voidp)
}

type IrrlichtDevice <inherit = IReferenceCounted>:

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
method byte IrrlichtDevice.createDevice(int deviceType, collection wsize, uint bits, byte fullscreen, byte stencilbuffer, byte vsync, IEventReceiver receiver)
{
	dimension2du windowSize = wsize
	this.c_pointer = IrrlichtDevice_createDevice(deviceType, windowSize.c_pointer, bits, fullscreen, stencilbuffer, vsync, receiver.c_pointer)
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
method byte IrrlichtDevice.createDevice(int deviceType, dimension2du windowSize, uint bits, byte fullscreen, byte stencilbuffer, byte vsync, IEventReceiver receiver)
{
	this.c_pointer = IrrlichtDevice_createDevice(deviceType, windowSize.c_pointer, bits, fullscreen, stencilbuffer, vsync, receiver.c_pointer)
	if (this.c_pointer)
	{
		return true
	}
	else
	{
		return false
	}
}
method byte IrrlichtDevice.createDevice2(int deviceType, collection wsize, uint bits, byte fullscreen, byte stencilbuffer, byte vsync, byte create_receiver)
{
	dimension2du windowSize = wsize
	this.c_pointer = IrrlichtDevice_createDevice2(deviceType, windowSize.c_pointer, bits, fullscreen, stencilbuffer, vsync, create_receiver)
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

method IrrlichtDevice.yield()
{
	IrrlichtDevice_yield(this.c_pointer)
}

method IrrlichtDevice.sleep(uint timeMs, byte pauseTimer)
{
	IrrlichtDevice_sleep(this.c_pointer, timeMs, pauseTimer)
}

method IVideoDriver IrrlichtDevice.getVideoDriver<result>()
{
	result = IrrlichtDevice_getVideoDriver(this.c_pointer)
}

method IFileSystem IrrlichtDevice.getFileSystem<result>()
{
	result = IrrlichtDevice_getFileSystem(this.c_pointer)
}

method IGUIEnvironment IrrlichtDevice.getGUIEnvironment<result>()
{
	result = IrrlichtDevice_getGUIEnvironment(this.c_pointer)
}

method ISceneManager IrrlichtDevice.getSceneManager<result>()
{
	result = IrrlichtDevice_getSceneManager(this.c_pointer)
}

method ICursorControl IrrlichtDevice.getCursorControl<result>()
{
	result = IrrlichtDevice_getCursorControl(this.c_pointer)
}

method IrrlichtDevice.setWindowCaption(ustr caption)
{
	IrrlichtDevice_setWindowCaption(this.c_pointer, caption.ptr())
}

method IrrlichtDevice.closeDevice()
{
	IrrlichtDevice_closeDevice(this.c_pointer)
}

method str IrrlichtDevice.getVersion <result>()
{
	result.copy(IrrlichtDevice_getVersion(this.c_pointer))
}

method IrrlichtDevice.setResizable(byte resizable)
{
	IrrlichtDevice_setResizable(this.c_pointer, resizable)
}

method IrrlichtDevice.setEventReceiver(IEventReceiver receiver)
{
	IrrlichtDevice_setEventReceiver(this.c_pointer, receiver.c_pointer)
}

method IEventReceiver IrrlichtDevice.getEventReceiver<result>()
{
	result = IrrlichtDevice_getEventReceiver(this.c_pointer)
}

method byte IrrlichtDevice.isWindowActive()
{
	return IrrlichtDevice_isWindowActive(this.c_pointer)
}
