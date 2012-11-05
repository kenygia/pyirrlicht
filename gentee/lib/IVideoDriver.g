import "irrlicht_c.dll" <cdeclare>
{
	byte IVideoDriver_beginScene(voidp, byte, byte, voidp, voidp, voidp)
	byte IVideoDriver_beginSceneDefault(voidp, byte, byte, voidp)
	byte IVideoDriver_endScene(voidp)

	voidp IVideoDriver_getTexture1(voidp, voidp)

	ulong IVideoDriver_GetHandle(voidp)// get window handle
	IVideoDriver_SetIcon(voidp, int, byte)// pointer, int icon_id = 32512, bool big_icon = false
}

type IVideoDriver <inherit = IReferenceCounted>:

method byte IVideoDriver.beginScene(byte backBuffer, byte zBuffer, SColor color, SExposedVideoData videoData, recti sourceRect)
{
	return IVideoDriver_beginScene(this.c_pointer, backBuffer, zBuffer, color.c_pointer, videoData.c_pointer, sourceRect.c_pointer)
}

method byte IVideoDriver.beginSceneDefault(byte backBuffer, byte zBuffer, SColor color)
{
	return IVideoDriver_beginSceneDefault(this.c_pointer, backBuffer, zBuffer, color.c_pointer)
}

method byte IVideoDriver.endScene()
{
	return IVideoDriver_endScene(this.c_pointer)
}

method ITexture IVideoDriver.getTexture<result>(fschar texture_name)
{
	result = IVideoDriver_getTexture1(this.c_pointer, texture_name.ptr())
}

method ulong IVideoDriver.GetHandle()
{
	return IVideoDriver_GetHandle(this.c_pointer)
}

method IVideoDriver.SetIcon(int icon_id, byte big_icon)
{
	IVideoDriver_SetIcon(this.c_pointer, icon_id, big_icon)
}
