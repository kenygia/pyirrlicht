import "irrlicht_c.dll" <cdeclare>
{
	voidp ITexture_lock(voidp, byte, uint)
	ITexture_unlock(voidp)
	voidp ITexture_getOriginalSize(voidp)
	voidp ITexture_getSize(voidp)
}

type ITexture <inherit = IReferenceCounted>:

method voidp ITexture.lock(byte readOnly, uint mipmapLevel)
{
	return ITexture_lock(this.c_pointer, readOnly, mipmapLevel)
}

method ITexture.unlock()
{
	ITexture_unlock(this.c_pointer)
}

method dimension2du ITexture.getOriginalSize <result>()
{
	result = ITexture_getOriginalSize(this.c_pointer)
}

method dimension2du ITexture.getSize <result>()
{
	result = ITexture_getSize(this.c_pointer)
}
