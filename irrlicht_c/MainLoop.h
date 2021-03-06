// Copyright(c) Maxim Kolosov 2011 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

// main loop helper example
class MainLoop
{
public:
	MainLoop(IrrlichtDevice* device, video::IVideoDriver* driver = 0, scene::ISceneManager* smgr = 0, IGUIEnvironment* guienv = 0, bool backBuffer = true, bool zBuffer = true, SColor color = SColor(255,0,0,0), SExposedVideoData* videoData = 0, core::rect<s32>* sourceRect = 0, u32 time_ms = 0, bool pause_timer = false)
	{
		irrlicht_device = device;
		if (driver)
			video_driver = driver;
		else
		{
			if (irrlicht_device)
				video_driver = irrlicht_device->getVideoDriver();
		}
		scene_manager = smgr;
		gui_environment = guienv;
		back_buffer = backBuffer;
		z_buffer = zBuffer;
		scene_color = color;
		if(videoData)
		{
			exposed_video_data = videoData;
			delete_exposed_video_data = false;
		}
		else
		{
			exposed_video_data = new SExposedVideoData();
			delete_exposed_video_data = true;
		}
		source_rect = sourceRect;
		sleep_time_ms = time_ms;
		sleep_pause_timer = pause_timer;
		run_loop = false;
	}
	void start()
	{
		if (irrlicht_device && video_driver)
		{
			int fps = -1;
			int lastFPS = -1;
			run_loop = true;
			while(irrlicht_device->run() && run_loop)
			{
				if(irrlicht_device->isWindowActive())
				{
					if(video_driver->beginScene(back_buffer, z_buffer, scene_color, *exposed_video_data, source_rect))
					{
						if(scene_manager)
							scene_manager->drawAll();
						if(gui_environment)
							gui_environment->drawAll();
						video_driver->endScene();
					}
					if(sleep_time_ms)
						irrlicht_device->sleep(sleep_time_ms, sleep_pause_timer);

					fps = video_driver->getFPS();

					if (lastFPS != fps)
					{
						core::stringw str = L"Irrlicht Engine [";
						str += video_driver->getName();
						str += "] FPS:";
						str += fps;

						irrlicht_device->setWindowCaption(str.c_str());
						lastFPS = fps;
					}
				}
				else
					irrlicht_device->yield();
			}
		}
		if(run_loop)
			run_loop = false;
	}
	void start_sm()
	{
		if (irrlicht_device && video_driver)
		{
			run_loop = true;
			if(sleep_time_ms)
			{
				while(irrlicht_device->run() && run_loop)
				{
					if(irrlicht_device->isWindowActive())
					{
						if(video_driver->beginScene(back_buffer, z_buffer, scene_color, *exposed_video_data, source_rect))
						{
							scene_manager->drawAll();
							video_driver->endScene();
						}
						irrlicht_device->sleep(sleep_time_ms, sleep_pause_timer);
					}
					else
						irrlicht_device->yield();
				}
			}
			else
			{
				while(irrlicht_device->run() && run_loop)
				{
					if(irrlicht_device->isWindowActive())
					{
						if(video_driver->beginScene(back_buffer, z_buffer, scene_color, *exposed_video_data, source_rect))
						{
							scene_manager->drawAll();
							video_driver->endScene();
						}
					}
					else
						irrlicht_device->yield();
				}
			}
		}
		if(run_loop)
			run_loop = false;
	}
	void start_ge()
	{
		if (irrlicht_device && video_driver)
		{
			run_loop = true;
			if(sleep_time_ms)
			{
				while(irrlicht_device->run() && run_loop)
				{
					if(irrlicht_device->isWindowActive())
					{
						if(video_driver->beginScene(back_buffer, z_buffer, scene_color, *exposed_video_data, source_rect))
						{
							gui_environment->drawAll();
							video_driver->endScene();
						}
						irrlicht_device->sleep(sleep_time_ms, sleep_pause_timer);
					}
					else
						irrlicht_device->yield();
				}
			}
			else
			{
				while(irrlicht_device->run() && run_loop)
				{
					if(irrlicht_device->isWindowActive())
					{
						if(video_driver->beginScene(back_buffer, z_buffer, scene_color, *exposed_video_data, source_rect))
						{
							gui_environment->drawAll();
							video_driver->endScene();
						}
					}
					else
						irrlicht_device->yield();
				}
			}
		}
		if(run_loop)
			run_loop = false;
	}
	void start_sm_ge()
	{
		if (irrlicht_device && video_driver)
		{
			run_loop = true;
			if(sleep_time_ms)
			{
				while(irrlicht_device->run() && run_loop)
				{
					if(irrlicht_device->isWindowActive())
					{
						if(video_driver->beginScene(back_buffer, z_buffer, scene_color, *exposed_video_data, source_rect))
						{
							scene_manager->drawAll();
							gui_environment->drawAll();
							video_driver->endScene();
						}
						irrlicht_device->sleep(sleep_time_ms, sleep_pause_timer);
					}
					else
						irrlicht_device->yield();
				}
			}
			else
			{
				while(irrlicht_device->run() && run_loop)
				{
					if(irrlicht_device->isWindowActive())
					{
						if(video_driver->beginScene(back_buffer, z_buffer, scene_color, *exposed_video_data, source_rect))
						{
							scene_manager->drawAll();
							gui_environment->drawAll();
							video_driver->endScene();
						}
					}
					else
						irrlicht_device->yield();
				}
			}
		}
		if(run_loop)
			run_loop = false;
	}
	void stop()
	{
		run_loop = false;
	}
	bool is_running()
	{
		return run_loop;
	}
	~MainLoop()
	{
		//irrlicht_device->closeDevice();
		//irrlicht_device->drop();
		if(delete_exposed_video_data)
			delete[] exposed_video_data;
	}
private:
	IrrlichtDevice* irrlicht_device;
	video::IVideoDriver* video_driver;
	scene::ISceneManager* scene_manager;
	IGUIEnvironment* gui_environment;
	bool back_buffer;
	bool z_buffer;
	SColor scene_color;
	irr::video::SExposedVideoData* exposed_video_data;
	bool delete_exposed_video_data;
	core::rect<s32>* source_rect;
	u32 sleep_time_ms;
	bool sleep_pause_timer;
	bool run_loop;
};

#ifdef __cplusplus
extern "C" {
#endif

IRRLICHT_C_API MainLoop* MainLoop_ctor1(IrrlichtDevice* device){return new MainLoop(device);}
IRRLICHT_C_API MainLoop* MainLoop_ctor2(IrrlichtDevice* device, video::IVideoDriver* driver = 0, scene::ISceneManager* smgr = 0, IGUIEnvironment* guienv = 0)
{return new MainLoop(device, driver, smgr, guienv);}
IRRLICHT_C_API MainLoop* MainLoop_ctor3(IrrlichtDevice* device, video::IVideoDriver* driver = 0, scene::ISceneManager* smgr = 0, IGUIEnvironment* guienv = 0, bool backBuffer = true, bool zBuffer = true, SColor* color = 0, SExposedVideoData* videoData = 0, core::rect<s32>* sourceRect = 0, u32 time_ms = 0, bool pause_timer = false)
{return new MainLoop(device, driver, smgr, guienv, backBuffer, zBuffer, *color, videoData, sourceRect, time_ms, pause_timer);}
IRRLICHT_C_API void MainLoop_start(MainLoop* pointer){pointer->start();}
IRRLICHT_C_API void MainLoop_start_sm(MainLoop* pointer){pointer->start_sm();}
IRRLICHT_C_API void MainLoop_start_ge(MainLoop* pointer){pointer->start_ge();}
IRRLICHT_C_API void MainLoop_start_sm_ge(MainLoop* pointer){pointer->start_sm_ge();}
IRRLICHT_C_API void MainLoop_stop(MainLoop* pointer){pointer->stop();}
IRRLICHT_C_API bool MainLoop_is_running(MainLoop* pointer){return pointer->is_running();}

#ifdef __cplusplus
}
#endif
