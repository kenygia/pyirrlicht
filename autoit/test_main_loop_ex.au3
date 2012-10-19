#NoTrayIcon

#include "lib\Irrlicht.au3"

;now this is not worked, help required
HotKeySet("{ESC}", "stop_main_loop")

simple_test()

;==========================
Global $device, $video_driver, $main_loop

;HotKey function
Func stop_main_loop()
	Global $main_loop;this is not valid, but now this is must be, function is not worked
	If $main_loop Then
		If MainLoop_is_running($main_loop) Then
			MainLoop_stop($main_loop)
		EndIf
	EndIf
EndFunc

;callback function
Func function_event(ByRef $event)
	Global $main_loop;this is not valid, but now this is must be, function is not worked
	ConsoleWrite($event & @CRLF)
	If $main_loop Then
		If MainLoop_is_running($main_loop) Then
			IrrlichtDevice_setWindowCaption($device, 'Demo AutoIt + Irrlicht (' & IrrlichtDevice_getVersion($device) & ') fps ' & IVideoDriver_getFPS($video_driver))
		EndIf
	EndIf
	Return false
EndFunc

Func simple_test()
	If load_irrlicht_library() Then
		Local $window_size = dimension2du_ctor2(320, 240)
		If $window_size > 0 Then
 			$device = IrrlichtDevice_createDevice($EDT_DIRECT3D9, $window_size)
			delete_pointer($window_size)
			If $device Then
				IrrlichtDevice_setResizable($device, true)
				IrrlichtDevice_setWindowCaption($device, 'Demo AutoIt + Irrlicht (' & IrrlichtDevice_getVersion($device) & ')')
				$video_driver = IrrlichtDevice_getVideoDriver($device)
				Local $scene_manager = IrrlichtDevice_getSceneManager($device)
				Local $i_animated_mesh = ISceneManager_getMesh($scene_manager, "media\sydney.md2")
				If $i_animated_mesh Then
					Local $position = vector3df_ctor2(0.0, 0.0, 0.0)
					Local $rotation = vector3df_ctor2(0.0, 0.0, 0.0)
					Local $scale = vector3df_ctor2(1.0, 1.0, 1.0)
					Local $node = ISceneManager_addAnimatedMeshSceneNode1($scene_manager, $i_animated_mesh, Null, -1, $position, $rotation, $scale)
					delete_pointer($position)
					delete_pointer($rotation)
					delete_pointer($scale)
					If $node Then
						ISceneNode_setMaterialFlag($node, EMF_LIGHTING, false)
						IAnimatedMeshSceneNode_setMD2Animation1($node, EMAT_STAND)
						Local $texture = IVideoDriver_getTexture1($video_driver, "media\sydney.bmp")
						ISceneNode_setMaterialTexture($node, 0, $texture)
						Local $position_camera = vector3df_ctor2(0.0, 30.0, -40.0)
						Local $lookat = vector3df_ctor2(0.0, 5.0, 0.0)
						Local $camera = ISceneManager_addCameraSceneNode($scene_manager, $node, $position_camera, $lookat)
						delete_pointer($position_camera)
						delete_pointer($lookat)
					EndIf
				EndIf
				Local $color = SColor_ctor2(255, 100, 100, 150)
				$main_loop = MainLoop_ctor3($device, Null, $scene_manager, Null, true, true, $color, Null, Null, 10)
				Local $on_event = DllCallbackRegister("function_event", "bool:cdecl", "ptr")
				Local $event_receiver = IEventReceiver_ctor2(DllCallbackGetPtr($on_event))
				IrrlichtDevice_setEventReceiver($device, $event_receiver)
				MainLoop_start_sm($main_loop)
				delete_pointer($main_loop)
				DllCallbackFree($on_event)
				IrrlichtDevice_closeDevice($device)
			EndIf
		EndIf
		unload_irrlicht_library()
	EndIf
EndFunc
