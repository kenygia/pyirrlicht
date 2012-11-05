#exe = 1 g
#norun = 1
#res = test.res
#libdir = %EXEPATH%\lib
#libdir1 = %EXEPATH%\..\lib\vis
#include = %EXEPATH%\lib\stdlib.ge

include { "lib//irrlicht.g" }

func HelloWorld <main>()
{
	IrrlichtDevice device
	if(device.createDevice(EDT_DIRECT3D9, %{320, 240}, 16, false, false, false, 0))
	{
		device.setWindowCaption(ustr("Demo HelloWorld Irrlicht \(device.getVersion())"))
		device.setResizable(true)
		SColor color_background = %{255, 100, 100, 155}
		IVideoDriver video_driver = device.getVideoDriver()
		video_driver.SetIcon(101, false)
		ISceneManager scene_manager = device.getSceneManager()
		fschar mesh_path = "media/sydney.md2"
		IAnimatedMesh mesh = scene_manager.getMesh(mesh_path)
		if(mesh.c_pointer)
		{
			IAnimatedMeshSceneNode node = scene_manager.addAnimatedMeshSceneNode(mesh)
			if(node.c_pointer)
			{
				node.setMaterialFlag(EMF_LIGHTING, false)
				node.setMD2Animation(EMAT_STAND)
				fschar tn = "media/sydney.bmp"
				ITexture texture = video_driver.getTexture(tn)
				node.setMaterialTexture(0, texture)
				vector3df position_camera = %{0.0f, 30.0f, -40.0f}
				vector3df lookat = %{0.0f, 5.0f, 0.0f}
				//~ vector3df position_camera(0.0f, 30.0f, -40.0f)
				//~ vector3df lookat(0.0f, 5.0f, 0.0f)
				ICameraSceneNode camera = scene_manager.addCameraSceneNode(node, position_camera, lookat, -1, true)
				//~ ICameraSceneNode camera = scene_manager.addCameraSceneNodeFPS()
			}
		}
		while(device.run())
		{
			if(device.isWindowActive())
			{
				if(video_driver.beginSceneDefault(true, true, color_background))
				{
					scene_manager.drawAll()
					video_driver.endScene()
				}
				device.sleep(10, false)
			}
			else : device.yield()
		}
		device.closeDevice()
	}
	else : print("Irrlicht createDevice return error\n")
}
