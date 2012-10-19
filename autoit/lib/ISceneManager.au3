#include-once

#include "types.au3"

Func ISceneManager_getMesh($pointer, $filename)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "ISceneManager_getMesh", "ptr", $pointer, $fschar_t, $filename)[0]
	Else
		Return Null
	EndIf
EndFunc

;~ Func ISceneManager_addAnimatedMeshSceneNode1($pointer, $mesh, $parent = Null, $id = -1, $position = vector3df_ctor1(), $rotation = vector3df_ctor1(), $scale = vector3df_ctor2(1.0, 1.0, 1.0), $alsoAddIfMeshPointerZero = false)
Func ISceneManager_addAnimatedMeshSceneNode1($pointer, $mesh, $parent = Null, $id = -1, $position = Null, $rotation = Null, $scale = Null, $alsoAddIfMeshPointerZero = false)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "ISceneManager_addAnimatedMeshSceneNode", "ptr", $pointer, "ptr", $mesh, "ptr", $parent, "int", $id, "ptr", $position, "ptr", $rotation, "ptr", $scale, "bool", $alsoAddIfMeshPointerZero)[0]
	Else
		Return Null
	EndIf
EndFunc

Func ISceneManager_addAnimatedMeshSceneNode2($pointer, $mesh)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "ISceneManager_addAnimatedMeshSceneNode2", "ptr", $pointer, "ptr", $mesh)[0]
	Else
		Return Null
	EndIf
EndFunc

;~ Func ISceneManager_addCameraSceneNode($pointer, $parent = Null, $position = vector3df_ctor1(), $lookat = vector3df_ctor2(0,0,100), $id = -1, $makeActive = true)
Func ISceneManager_addCameraSceneNode($pointer, $parent = Null, $position = Null, $lookat = Null, $id = -1, $makeActive = true)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "ptr:cdecl", "ISceneManager_addCameraSceneNode", "ptr", $pointer, "ptr", $parent, "ptr", $position, "ptr", $lookat, "int", $id, "bool", $makeActive)[0]
	Else
		Return Null
	EndIf
EndFunc

Func ISceneManager_drawAll($pointer)
	If $ihandle > 0 Then
		DllCall($ihandle, "none:cdecl", "ISceneManager_drawAll", "ptr", $pointer)
	EndIf
EndFunc
