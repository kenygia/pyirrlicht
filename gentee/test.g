#exe = 1 g
#norun = 1
#res = test.res
//~ #libdir = %EXEPATH%\lib
//~ #libdir1 = %EXEPATH%\..\lib\vis
//~ #include = %EXEPATH%\lib\stdlib.ge

//~ define <export namedef> { IRRLICHT_LIBRARY_NAME = "irrlicht_c.dll" }
//global { str irrlicht_library_name = IRRLICHT_LIBRARY_NAME }
include { "lib//irrlicht.g" }

func test <main>()
{
	IrrlichtDevice device
	dimension2du window_size = %{320, 240}
	if(device.createDevice(EDT_NULL, window_size, 16, false, false, false, 0))
	//~ if(device.createDevice(EDT_NULL, %{320, 240}, 16, false, false, false, 0))
	{
		print("Irrlicht version \(device.getVersion())\n")
	}
	else : print("Irrlicht createDevice return error\n")
}
