#include-once

Func IAnimatedMeshSceneNode_setMD2Animation1($pointer, $anim = 0)
	If $ihandle > 0 Then
		Return DllCall($ihandle, "bool:cdecl", "IAnimatedMeshSceneNode_setMD2Animation1", "ptr", $pointer, "int", $anim)[0]
	Else
		Return False
	EndIf
EndFunc
