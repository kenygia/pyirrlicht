import "irrlicht_c.dll" <cdeclare>
{
	voidp IFileSystem_createAndOpenFile(voidp, voidp)
}

type IFileSystem <inherit = IReferenceCounted>:
