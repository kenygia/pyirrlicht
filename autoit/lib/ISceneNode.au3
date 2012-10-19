#include-once

Func ISceneNode_setMaterialFlag($pointer, $flag = 0, $newvalue = true)
	If $ihandle > 0 Then
		DllCall($ihandle, "none:cdecl", "ISceneNode_setMaterialFlag", "ptr", $pointer, "int", $flag, "bool", $newvalue)
	EndIf
EndFunc

Func ISceneNode_setMaterialTexture($pointer, $textureLayer = 0, $texture = Null)
	If $ihandle > 0 Then
		DllCall($ihandle, "none:cdecl", "ISceneNode_setMaterialTexture", "ptr", $pointer, "uint", $textureLayer, "ptr", $texture)
	EndIf
EndFunc
