import "irrlicht_c.dll" <cdeclare>
{
	uint IAnimatedMesh_getFrameCount(voidp)
	voidp IAnimatedMesh_getMesh(voidp, int, int, int, int)
	int IAnimatedMesh_getMeshType(voidp)
}

type IAnimatedMesh <inherit = IReferenceCounted>:

method byte IAnimatedMesh.bool()
{
	return ?(this.c_pointer, true, false)
}

method uint IAnimatedMesh.getFrameCount()
{
	return IAnimatedMesh_getFrameCount(this.c_pointer)
}

method IMesh IAnimatedMesh.getMesh<result>(int frame, int detailLevel, int startFrameLoop, int endFrameLoop)
{
	result = IAnimatedMesh_getMesh(this.c_pointer, frame, detailLevel, startFrameLoop, endFrameLoop)
}

method int IAnimatedMesh.getMeshType()
{
	return IAnimatedMesh_getMeshType(this.c_pointer)
}
