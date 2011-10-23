from irrlicht import *

def test():
	print ('IRRLICHT_SWIG_PYTHON_VERSION =', IRRLICHT_SWIG_PYTHON_VERSION)
	print ('=' * 20)
	device = createDevice(EDT_SOFTWARE, dimension2du(320, 240))
	if device:
		try:
			print ('Irrlicht Version', device.getVersion())
		except Exception as e:
			print (e)
		try:
			device.setWindowCaption('Irrlicht Engine Window')
		except Exception as e:
			print (e)
		print ('=' * 20)
		try:
			video_driver = device.getVideoDriver()
		except Exception as e:
			print (e)
		else:
			print ('video_driver', video_driver)
			print ('name video_driver', video_driver.getName())
			#~ print ('VendorInfo video_driver', video_driver.getVendorInfo())
		print ('=' * 20)
		try:
			scene_manager = device.getSceneManager()
		except Exception as e:
			print (e)
		else:
			print ('scene_manager', scene_manager)
		print ('=' * 20)
		try:
			gui_environment = device.getGUIEnvironment()
		except Exception as e:
			print (e)
		else:
			print ('gui_environment', gui_environment)
		device.setResizable(True)
		print ('=' * 20)
		color = SColor(255,100,101,140)
		print ('color argb', color.getAlpha(), color.getRed(), color.getGreen(), color.getBlue())
		print ('=' * 20)
		while device.run():
			if device.isWindowActive():
				video_driver.beginScene(True, True, color)
				scene_manager.drawAll()
				gui_environment.drawAll()
				video_driver.endScene()
			else:
				device._yield()
	else:
		print ('ERROR createDevice')

if __name__ == "__main__":
	test()