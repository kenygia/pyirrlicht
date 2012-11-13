#exe = 1 g
#norun = 1
#res = test.res
#libdir = %EXEPATH%\lib
#libdir1 = %EXEPATH%\..\lib\vis
#include = %EXEPATH%\lib\stdlib.ge

include { "lib//irrlicht.g" }

type user_event_receiver <inherit = IEventReceiver>
{
}
//~ extern
//~ {
	//~ method byte user_event_receiver.OnEvent(voidp event)
//~ }
//~ method byte user_event_receiver.OnEvent(SEvent event)
method byte user_event_receiver.OnEvent(voidp event)
{
	//~ print("OnEvent SEvent.GetEventType \(event.GetEventType())\n")
	print("child OnEvent SEvent_GetEventType \(SEvent_GetEventType(event))\n")
	return false
}

func test <main>()
{
	IrrlichtDevice device
	user_event_receiver receiver
	if(device.createDevice(EDT_SOFTWARE, %{320, 240}, 16, false, false, false, receiver))
	{
		print("Irrlicht version \(device.getVersion())\n")
		device.setResizable(true)
		IVideoDriver video_driver = device.getVideoDriver()
		SColor color_background = %{255, 100, 100, 155}
		while(device.run())
		{
			if(device.isWindowActive())
			{
				if(video_driver.beginSceneDefault(true, true, color_background))
				{
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
