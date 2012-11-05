import "irrlicht_c.dll" <cdeclare>
{
	ISceneNode_setMaterialFlag(voidp, int, byte)
	ISceneNode_setMaterialTexture(voidp, uint, voidp)
}

type ISceneNode <inherit = IReferenceCounted>:

method ISceneNode.setMaterialFlag(int flag, byte newvalue)
{
	ISceneNode_setMaterialFlag(this.c_pointer, flag, newvalue)
}

method ISceneNode.setMaterialTexture(uint textureLayer, ITexture texture)
{
	ISceneNode_setMaterialTexture(this.c_pointer, textureLayer, texture.c_pointer)
}
