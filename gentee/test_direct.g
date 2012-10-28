#exe = 1 g
#norun = 1
#res = test.res
#libdir = %EXEPATH%\lib
#libdir1 = %EXEPATH%\..\lib\vis
#include = %EXEPATH%\lib\stdlib.ge
//#!gentee.exe -c -x -i test.ico -r test.res test_direct.g

define <export namedef>
{
false = 0
true = 1

E_DRIVER_TYPE = 0
EDT_NULL = 0
EDT_SOFTWARE = 1
EDT_BURNINGSVIDEO = 2
EDT_DIRECT3D8 = 3
EDT_DIRECT3D9 = 4
EDT_OPENGL = 5
EDT_COUNT = 6

IRRLICHT_LIBRARY_NAME = "irrlicht_c.dll"

voidp = uint
}

//import $IRRLICHT_LIBRARY_NAME <cdeclare>
import "irrlicht_c.dll" <cdeclare>
{
delete_pointer(voidp)

voidp dimension2du_ctor1()
voidp dimension2du_ctor2(uint, uint)
uint dimension2du_get_Width(voidp)
uint dimension2du_get_Height(voidp)

voidp vector2di_ctor2(int, int)
voidp position2di_ctor2(int, int)

voidp SColor_ctor2(uint, uint, uint, uint)

byte IVideoDriver_beginSceneDefault(voidp, byte, byte, voidp)
byte IVideoDriver_endScene(voidp)
IVideoDriver_SetIcon(voidp, int, byte)
voidp IVideoDriver_getScreenSize(voidp)
IVideoDriver_draw2DPolygon(voidp, voidp, float, voidp, int)//center, radius, color, vertexCount

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
IrrlichtDevice_setWindowCaption(voidp, uint)
IrrlichtDevice_closeDevice(voidp)
uint IrrlichtDevice_getVersion(voidp)
IrrlichtDevice_setResizable(voidp, byte)
IrrlichtDevice_setEventReceiver(voidp, uint)
voidp IrrlichtDevice_getEventReceiver(voidp)
}

func voidp create_center_position(voidp screen_size)
{
	uint x = dimension2du_get_Width(screen_size)
	uint y = dimension2du_get_Height(screen_size)
	//~ return position2di_ctor2(x/2, y/2)
	return vector2di_ctor2(x/2, y/2)
}

func test <main>()
{
	str ver
	ustr caption = "Irrlicht Engine SDK version "
	//~ voidp wsize = dimension2du_ctor2(320, 240)
	voidp device = IrrlichtDevice_createDevice(EDT_SOFTWARE, dimension2du_ctor2(320, 240), 16, false, false, false, 0)
	//~ delete_pointer(wsize)
	if(device)
	{
		IrrlichtDevice_setResizable(device, true)
		ver.copy(IrrlichtDevice_getVersion(device))
		//~ print("Irrlicht version \(ver)\n")
		caption += ustr(ver)
		IrrlichtDevice_setWindowCaption(device, caption.ptr())
		voidp video_driver = IrrlichtDevice_getVideoDriver(device)
		voidp color = SColor_ctor2(255, 155, 100, 100)
		voidp color_background = SColor_ctor2(255, 100, 100, 155)
		voidp center_position// = create_center_position(IVideoDriver_getScreenSize(video_driver))
		IVideoDriver_SetIcon(video_driver, 101, false)//icon identifier=101 from res (resource) file
		while(IrrlichtDevice_run(device))
		{
			if(IVideoDriver_beginSceneDefault(video_driver, true, true, color_background))
			{
				center_position = create_center_position(IVideoDriver_getScreenSize(video_driver))
				IVideoDriver_draw2DPolygon(video_driver, center_position, 100.0f, color, 100)
				delete_pointer(center_position)
				IVideoDriver_endScene(video_driver)
			}
			//~ IrrlichtDevice_sleep(device, 10, false)
		}
		delete_pointer(color)
		delete_pointer(color_background)
		IrrlichtDevice_closeDevice(device)
	}
	else
	{
		print("Irrlicht createDevice return error\l")
		getch()
	}
}
