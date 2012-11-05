import "irrlicht_c.dll" <cdeclare>
{
	voidp ISceneManager_getMesh(voidp, voidp)
	voidp ISceneManager_addAnimatedMeshSceneNode1(voidp, voidp, voidp, int, voidp, voidp, voidp, byte)
	voidp ISceneManager_addCameraSceneNode(voidp, voidp, voidp, voidp, int, byte)
	voidp ISceneManager_addCameraSceneNodeFPS(voidp, voidp, float, float, int, voidp, int, byte, float, byte)
	voidp ISceneManager_addCameraSceneNodeFPS2(voidp)
	ISceneManager_drawAll(voidp)
}

type ISceneManager <inherit = IReferenceCounted>:

method IAnimatedMesh ISceneManager.getMesh <result>(fschar mesh_path)
{
	result = ISceneManager_getMesh(this.c_pointer, mesh_path.ptr())
}

method IAnimatedMeshSceneNode ISceneManager.addAnimatedMeshSceneNode <result>(IAnimatedMesh mesh)
{
	result = ISceneManager_addAnimatedMeshSceneNode1(this.c_pointer, mesh.c_pointer, 0, -1, vector3df_ctor2(0f,0f,0f), vector3df_ctor2(0f,0f,0f), vector3df_ctor2(1.0f, 1.0f, 1.0f), false)
}

method IAnimatedMeshSceneNode ISceneManager.addAnimatedMeshSceneNode <result>(IAnimatedMesh mesh, ISceneNode parent, int id, vector3df position, vector3df rotation, vector3df scale, byte alsoAddIfMeshPointerZero)
{
	result = ISceneManager_addAnimatedMeshSceneNode1(this.c_pointer, mesh.c_pointer, parent.c_pointer, id, position.c_pointer, rotation.c_pointer, scale.c_pointer, alsoAddIfMeshPointerZero)
}

method ICameraSceneNode ISceneManager.addCameraSceneNode <result>(ISceneNode parent, vector3df position, vector3df lookat, int id, byte makeActive)
{
	result = ISceneManager_addCameraSceneNode(this.c_pointer, parent.c_pointer, position.c_pointer, lookat.c_pointer, id, makeActive)
}

method ICameraSceneNode ISceneManager.addCameraSceneNodeFPS <result>()
{
	result = ISceneManager_addCameraSceneNodeFPS2(this.c_pointer)
}

//ISceneManager_addCameraSceneNodeFPS(ISceneNode* parent = 0, f32 rotateSpeed = 100.0f, f32 moveSpeed = 0.5f, s32 id=-1, SKeyMap* keyMapArray=0, s32 keyMapSize=0, bool noVerticalMovement=false, f32 jumpSpeed = 0.f, bool invertMouse=false)
method ICameraSceneNode ISceneManager.addCameraSceneNodeFPS <result>(ISceneNode parent, float rotateSpeed, float moveSpeed, int id, voidp keyMapArray, int keyMapSize, byte noVerticalMovement, float jumpSpeed, byte invertMouse)
{
	result = ISceneManager_addCameraSceneNodeFPS(this.c_pointer, parent.c_pointer, rotateSpeed, moveSpeed, id, keyMapArray, keyMapSize, noVerticalMovement, jumpSpeed, invertMouse)
}

method ISceneManager.drawAll()
{
	ISceneManager_drawAll(this.c_pointer)
}
