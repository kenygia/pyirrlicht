#exe = 1 g
#norun = 1
#res = test.res
#libdir = %EXEPATH%\lib
#libdir1 = %EXEPATH%\..\lib\vis
#include = %EXEPATH%\lib\stdlib.ge

include { "lib//irrlicht.g" }

func byte OnEvent(voidp evt)
{
	print("OnEvent SEvent_GetEventType \(SEvent_GetEventType(evt))\n")
	SEvent event = evt
	int event_type = event.GetEventType()
	print("OnEvent SEvent.GetEventType \(event_type)\n")
	switch event_type
	{
		case 0
		{print("EET_GUI_EVENT\n")}
		case 1
		{print("EET_MOUSE_INPUT_EVENT\n")}
		case 2
		{print("EET_KEY_INPUT_EVENT\n")}
		case 3
		{print("EET_JOYSTICK_INPUT_EVENT\n")}
		case 4
		{
			//~ voidp log_event = SEvent_GetSLogEvent(evt)
			//~ str log_text
			//~ log_text.copy(SLogEvent_GetText(log_event))
			//~ print("EET_LOG_TEXT_EVENT\n\(log_text)\n")
			print("EET_LOG_TEXT_EVENT\n\(event.LogEvent.GetText())\n")
			//~ print("EET_LOG_TEXT_EVENT\n\(event.GetSLogEvent().GetText())\n")
		}
		case 5
		{print("EET_USER_EVENT\n")}
	}
	return false
}

func test <main>()
{
	IrrlichtDevice device
	voidp func_event = callback(&OnEvent, 1, $CB_CDECL)
	voidp receiver = IEventReceiver_ctor2(func_event)
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
	freecallback(func_event)
}
