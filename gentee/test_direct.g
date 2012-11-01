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

ECOLOR_FORMAT = 0
ECF_A1R5G5B5 = ECOLOR_FORMAT
ECF_R5G6B5 = 1
ECF_R8G8B8 = 2
ECF_A8R8G8B8 = 3
ECF_R16F = 4
ECF_G16R16F = 5
ECF_A16B16G16R16F = 6
ECF_R32F = 7
ECF_G32R32F = 8
ECF_A32B32G32R32F = 9
ECF_UNKNOWN = 10

E_DRIVER_TYPE = 0
EDT_NULL = 0
EDT_SOFTWARE = 1
EDT_BURNINGSVIDEO = 2
EDT_DIRECT3D8 = 3
EDT_DIRECT3D9 = 4
EDT_OPENGL = 5
EDT_COUNT = 6

//~ IRRLICHT_LIBRARY_NAME = "irrlicht_c.dll"

voidp = uint
}

//import $IRRLICHT_LIBRARY_NAME <cdeclare>
//import "irrlicht_c_173.dll" <cdeclare>
import "irrlicht_c.dll" <cdeclare>
{
delete_pointer(voidp)

voidp dimension2du_ctor1()
voidp dimension2du_ctor2(uint, uint)
uint dimension2du_get_Width(voidp)
uint dimension2du_get_Height(voidp)

voidp vector2di_ctor1(int, int)
voidp vector2di_ctor2(int)
voidp vector2di_ctor4(voidp)
//~ voidp position2di_ctor1(int, int)

voidp SColor_ctor2(uint, uint, uint, uint)

voidp recti_ctor2(int, int, int, int)

byte IVideoDriver_beginSceneDefault(voidp, byte, byte, voidp)
byte IVideoDriver_endScene(voidp)
IVideoDriver_SetIcon(voidp, int, byte)
voidp IVideoDriver_getScreenSize(voidp)
IVideoDriver_draw2DImage1(voidp, voidp, voidp)//vd_pointer, texture, position2di
IVideoDriver_draw2DImage2(voidp, voidp, voidp, voidp, voidp, voidp, byte)//vd_pointer, texture, position2di, sourceRect, clipRect = 0, color, useAlphaChannelOfTexture = false
IVideoDriver_draw2DRectangle1(voidp, voidp, voidp, voidp)//vd_pointer, color, pos, clip = 0
IVideoDriver_draw2DRectangle2(voidp, voidp, voidp, voidp, voidp, voidp, voidp)//vd_pointer, pos, colorLeftUp, colorRightUp, colorLeftDown, colorRightDown, clip = 0
IVideoDriver_draw2DRectangleOutline(voidp, voidp, voidp)//vd_pointer, pos, color
IVideoDriver_draw2DLine(voidp, voidp, voidp, voidp)//vd_pointer, start, end, color
IVideoDriver_draw2DPolygon(voidp, voidp, float, voidp, int)//vd_pointer, center, radius, color, vertexCount

voidp ICursorControl_getPosition(voidp)

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

voidp svg_agg_image_ctor1(voidp, voidp, voidp, byte, uint, int, int)// video_driver, file_system, file_name, content_unicode = true, alpha_value = 128, color_format = ECF_A8R8G8B8, stride = 4
svg_agg_image_parse(voidp, voidp, voidp, byte, uint, int, int)// svg_pointer, file_system, file_name, content_unicode = true, alpha_value = 128, color_format = ECF_A8R8G8B8, stride = 4
svg_agg_image_scale(voidp, double, double)// svg_pointer, x, y
svg_agg_image_scale_rateably(voidp, double)// svg_pointer, scale_value
voidp svg_agg_image_get_texture_pointer(voidp)
voidp svg_agg_image_get_texture(voidp, byte, byte)// svg_pointer, rendering = false, adding = false
}

func voidp create_center_position(voidp screen_size)
{
	uint x = dimension2du_get_Width(screen_size)
	uint y = dimension2du_get_Height(screen_size)
	//~ return position2di_ctor1(x/2, y/2)
	return vector2di_ctor1(x/2, y/2)
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
		voidp color_line = SColor_ctor2(255, 0, 0, 255)
		voidp color_rectangle_outline = SColor_ctor2(255, 100, 200, 100)
		voidp color_circle = SColor_ctor2(255, 200, 100, 100)
		voidp color_background = SColor_ctor2(255, 100, 100, 155)
		voidp center_position// = create_center_position(IVideoDriver_getScreenSize(video_driver))
		voidp rect_position = recti_ctor2(10, 10, 200, 200)
		voidp start_line_position = vector2di_ctor2(0)
		voidp end_line_position
		voidp svg = svg_agg_image_ctor1(video_driver, IrrlichtDevice_getFileSystem(device), "cat.svg".ustr().ptr(), true, 0, ECF_A8R8G8B8, 4)
		svg_agg_image_scale_rateably(svg, 0.5)
		voidp texture = svg_agg_image_get_texture(svg, false, false)
		IVideoDriver_SetIcon(video_driver, 101, false)//icon identifier=101 from res (resource) file
		voidp cursor = IrrlichtDevice_getCursorControl(device)
		while(IrrlichtDevice_run(device))
		{
			if(IVideoDriver_beginSceneDefault(video_driver, true, true, color_background))
			{
				center_position = create_center_position(IVideoDriver_getScreenSize(video_driver))
				end_line_position = vector2di_ctor4(IVideoDriver_getScreenSize(video_driver))
				IVideoDriver_draw2DLine(video_driver, start_line_position, end_line_position, color_line)
				IVideoDriver_draw2DRectangleOutline(video_driver, rect_position, color_rectangle_outline)
				IVideoDriver_draw2DPolygon(video_driver, center_position, 100.0f, color_circle, 100)
				delete_pointer(end_line_position)
				delete_pointer(center_position)
				//~ if(texture) : IVideoDriver_draw2DImage1(video_driver, texture, ICursorControl_getPosition(cursor))
				if(texture) : IVideoDriver_draw2DImage2(video_driver, texture, ICursorControl_getPosition(cursor), 0, 0, color_background, true)
				else : print("SVG texture error.\n")
				IVideoDriver_endScene(video_driver)
			}
			IrrlichtDevice_sleep(device, 100, false)
		}
		delete_pointer(start_line_position)
		delete_pointer(end_line_position)
		delete_pointer(rect_position)
		delete_pointer(color_line)
		delete_pointer(color_rectangle_outline)
		delete_pointer(color_circle)
		delete_pointer(color_background)
		IrrlichtDevice_closeDevice(device)
	}
	else
	{
		print("Irrlicht createDevice return error.\n")
		getch()
	}
}
