// this lines must be included with your main function file
//#libdir = %EXEPATH%\lib
//#libdir1 = %EXEPATH%\..\lib\vis
//#include = %EXEPATH%\lib\stdlib.ge

define <export namedef>
{
	false = 0
	true = 1

	//~ IRRLICHT_LIBRARY_NAME = "irrlicht_c.dll"

	//~ IRR_WCHAR_FILESYSTEM = 1 // this is not worked
	//~ ifdef IRR_WCHAR_FILESYSTEM
	//~ {
		//~ fschar = ustr
	//~ }
	//~ else
	//~ {
		//~ fschar = str
	//~ }
	fschar = ustr

	voidp = uint
}

//~ global { str irrlicht_library_name = IRRLICHT_LIBRARY_NAME }

//~ import $IRRLICHT_LIBRARY_NAME <cdeclare> : delete_pointer(uint)
import "irrlicht_c.dll" <cdeclare>
{
	//~ ubyte _IRRLICHT_VERSION_MAJOR -> IRRLICHT_VERSION_MAJOR
	//~ ubyte _IRRLICHT_VERSION_MINOR -> IRRLICHT_VERSION_MINOR
	//~ ubyte _IRRLICHT_VERSION_REVISION -> IRRLICHT_VERSION_REVISION
	//~ ubyte _IRRLICHT_VERSION -> IRRLICHT_VERSION
	//~ byte BUILD_WITH_3D_TEXT
	//~ byte BUILD_WITH_GRID_SCENE_NODE
	//~ byte BUILD_WITH_GUI_FILE_SELECTOR
	//~ byte BUILD_WITH_AGG
	//~ byte BUILD_WITH_IRR_SVG_AGG
	//~ byte BUILD_WITH_IRR_SVG_CAIRO
	//~ byte BUILD_WITH_CHAR_CONVERSION_FUNCTIONS
	//~ byte BUILD_WITH_STREAM_FUNCTIONS
	//~ byte IRR_WCHAR_FILESYSTEM
	delete_pointer(voidp)
}

// ====== base type for types like vector2d, rect, matrix
type irr_base
{
	voidp c_pointer
	byte delete_c_pointer
}
method irr_base.delete()
{
	if(this.c_pointer && this.delete_c_pointer) : delete_pointer(this.c_pointer)
}
operator irr_base =(irr_base self, voidp ptr)
{
	self.delete()
	self.c_pointer = ptr
	self.delete_c_pointer = false
	return self
}
operator irr_base =(irr_base self, irr_base new_self)
{
	self.c_pointer = new_self.c_pointer
	self.delete_c_pointer = new_self.delete_c_pointer
	return self
}

// ============= INCLUDES
include
{
	"constants.g"
	"SExposedVideoData.g"
	"dimension2d.g"
	"rect.g"
	"SColor.g"
	"vector2d.g"
	"vector3d.g"
	"IReferenceCounted.g"
	"IEventReceiver.g"
	"ICursorControl.g"
	"ITexture.g"
	"IMesh.g"
	"ISceneNode.g"
	"IAnimatedMesh.g"
	"IAnimatedMeshSceneNode.g"
	"ICameraSceneNode.g"
	"IFileSystem.g"
	"IGUIEnvironment.g"
	"ISceneManager.g"
	"IVideoDriver.g"
	"IrrlichtDevice.g"
}
