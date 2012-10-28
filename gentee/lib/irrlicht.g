define <export namedef>
{
	//~ IRRLICHT_LIBRARY_NAME = "irrlicht_c.dll"

	voidp = uint
}

//~ global { str irrlicht_library_name = IRRLICHT_LIBRARY_NAME }

//~ import $IRRLICHT_LIBRARY_NAME <cdeclare> : delete_pointer(uint)
import "irrlicht_c.dll" <cdeclare>
{
	delete_pointer(uint)
}

include
{
	"constants.g"
	"dimension2d.g"
	"IrrlichtDevice.g"
}
