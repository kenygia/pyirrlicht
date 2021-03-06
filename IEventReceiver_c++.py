import pyirrlicht

#~ driverType = pyirrlicht.EDT_NULL
driverType = pyirrlicht.EDT_SOFTWARE
#~ driverType = pyirrlicht.EDT_BURNINGSVIDEO
#~ driverType = pyirrlicht.EDT_DIRECT3D8
#~ driverType = pyirrlicht.EDT_DIRECT3D9
#~ driverType = pyirrlicht.EDT_OPENGL

class UserIEventReceiver(pyirrlicht.IEventReceiver):
	def OnEvent(self, evt):
		event = pyirrlicht.SEvent(evt)
		if event.EventType is pyirrlicht.EET_GUI_EVENT:
			print('GUI EVENT', event.EventType)
		elif event.EventType is pyirrlicht.EET_MOUSE_INPUT_EVENT:
			print('MOUSE INPUT EVENT', event.EventType)
			print('X', event.MouseInput.X, 'Y', event.MouseInput.Y, 'EventType', event.MouseInput.EventType, 'left', bool(event.MouseInput.isLeftPressed()), 'right', bool(event.MouseInput.isRightPressed()), 'middle', bool(event.MouseInput.isMiddlePressed()))
		elif event.EventType is pyirrlicht.EET_KEY_INPUT_EVENT:
			print('KEY INPUT EVENT', event.EventType)
			print('Key', event.KeyInput.Key, 'Char', event.KeyInput.Char)
		elif event.EventType is pyirrlicht.EET_JOYSTICK_INPUT_EVENT:
			print('JOYSTICK INPUT EVENT', event.EventType)
		elif event.EventType is pyirrlicht.EET_LOG_TEXT_EVENT:
			print('LOG TEXT EVENT', event.EventType)
			print(event.LogEvent.Level, event.LogEvent.Text)
		elif event.EventType is pyirrlicht.EET_USER_EVENT:
			print('USER EVENT', event.EventType)
		else:
			print('Unknown EventType', event.EventType)
		return False

windowSize = pyirrlicht.dimension2du(640, 480)

i_event_receiver = UserIEventReceiver()
device = pyirrlicht.createDevice(driverType, windowSize, 16, False, False, False, i_event_receiver)

if device:
	device.setWindowCaption('Hello World! - Irrlicht Engine Demo')
	device.setResizable(True)
	driver = device.getVideoDriver()
	scene_manager = device.getSceneManager()
	guienv = device.getGUIEnvironment()
	guienv.addStaticText('Hello World! This is the Irrlicht Software renderer!', pyirrlicht.recti(10,10,260,22), True)
	i_animated_mesh = scene_manager.getMesh('media//sydney.md2')
	if i_animated_mesh:
		node = scene_manager.addAnimatedMeshSceneNode2(i_animated_mesh)
		if node:
			node.setMaterialFlag(pyirrlicht.EMF_LIGHTING, False)
			node.setMD2Animation(pyirrlicht.EMAT_STAND)
			node.setMaterialTexture(0, driver.getTexture('media//sydney.bmp'))
		position = pyirrlicht.vector3df(0.0, 30.0, -40.0)
		lookat = pyirrlicht.vector3df(0.0, 5.0, 0.0)
		scene_manager.addCameraSceneNode(node, position, lookat)
		scolor = pyirrlicht.SColor(255,100,101,140)
		while device.run():
			if device.isWindowActive():
				if driver.beginScene(True, True, scolor):
					scene_manager.drawAll()
					guienv.drawAll()
					driver.endScene()
				#~ device.sleep(10)
			else:
				device.yield_self()
	else:
		print('ERROR getMesh')
	device.drop()
else:
	print('ERROR createDevice')
