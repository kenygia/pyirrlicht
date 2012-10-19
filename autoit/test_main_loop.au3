#NoTrayIcon

#include "lib\Irrlicht.au3"

simple_test()

;==========================

Func simple_test()
	If load_irrlicht_library() Then
		Local $window_size = dimension2du_ctor2(320, 240)
		If $window_size > 0 Then
			Local $device = IrrlichtDevice_createDevice($EDT_DIRECT3D9, $window_size)
			If $device Then
				Local $color = SColor_ctor2(255, 100, 100, 150)
				Local $ml_pointer = MainLoop_ctor3($device, Null, Null, Null, true, true, $color)
				MainLoop_start($ml_pointer)
				IrrlichtDevice_closeDevice($device)
			EndIf
		EndIf
		unload_irrlicht_library()
	EndIf
EndFunc
