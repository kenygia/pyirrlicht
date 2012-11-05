import "irrlicht_c.dll" <cdeclare>
{
	byte IAnimatedMeshSceneNode_setMD2Animation1(voidp, int)
}

type IAnimatedMeshSceneNode <inherit = ISceneNode>:

method byte IAnimatedMeshSceneNode.setMD2Animation(int anim)
{
	return IAnimatedMeshSceneNode_setMD2Animation1(this.c_pointer, anim)
}
