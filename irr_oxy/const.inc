% TRUE  1
% FALSE 0

typedef enum
{
	EIDT_WIN32,
	EIDT_WINCE,
	EIDT_X11,
	EIDT_OSX,
	EIDT_SDL,
	EIDT_FRAMEBUFFER,
	EIDT_CONSOLE,
	EIDT_BEST
} E_DEVICE_TYPE;

typedef enum
{
	EDT_NULL = 0,
	EDT_SOFTWARE = 1,
	EDT_BURNINGSVIDEO = 2,
	EDT_DIRECT3D8 = 3,
	EDT_DIRECT3D9 = 4,
	EDT_OPENGL = 5,
	EDT_COUNT = 6
} E_DRIVER_TYPE;
% EDT_NULL = 0
% EDT_SOFTWARE = 1
% EDT_BURNINGSVIDEO = 2
% EDT_DIRECT3D8 = 3
% EDT_DIRECT3D9 = 4
% EDT_OPENGL = 5
% EDT_COUNT = 6

typedef enum
{
	ELL_INFORMATION,
	ELL_WARNING,
	ELL_ERROR,
	ELL_NONE
} ELOG_LEVEL;

typedef enum
{
	ECF_A1R5G5B5 = 0,
	ECF_R5G6B5,
	ECF_R8G8B8,
	ECF_A8R8G8B8,
	ECF_R16F,
	ECF_G16R16F,
	ECF_A16B16G16R16F,
	ECF_R32F,
	ECF_G32R32F,
	ECF_A32B32G32R32F,
	ECF_UNKNOWN
} ECOLOR_FORMAT;
% ECF_A1R5G5B5 = 0
% ECF_R5G6B5 = 1
% ECF_R8G8B8 = 2
% ECF_A8R8G8B8 = 3
% ECF_R16F = 4
% ECF_G16R16F = 5
% ECF_A16B16G16R16F = 6
% ECF_R32F = 7
% ECF_G32R32F = 8
% ECF_A32B32G32R32F = 9
% ECF_UNKNOWN = 10

typedef enum
{
	EMF_WIREFRAME = 0x1,
	EMF_POINTCLOUD = 0x2,
	EMF_GOURAUD_SHADING = 0x4,
	EMF_LIGHTING = 0x8,
	EMF_ZBUFFER = 0x10,
	EMF_ZWRITE_ENABLE = 0x20,
	EMF_BACK_FACE_CULLING = 0x40,
	EMF_FRONT_FACE_CULLING = 0x80,
	EMF_BILINEAR_FILTER = 0x100,
	EMF_TRILINEAR_FILTER = 0x200,
	EMF_ANISOTROPIC_FILTER = 0x400,
	EMF_FOG_ENABLE = 0x800,
	EMF_NORMALIZE_NORMALS = 0x1000,
	EMF_TEXTURE_WRAP = 0x2000,
	EMF_ANTI_ALIASING = 0x4000,
	EMF_COLOR_MASK = 0x8000,
	EMF_COLOR_MATERIAL = 0x10000
} E_MATERIAL_FLAG;

typedef enum
{
	EMAT_STAND,
	EMAT_RUN,
	EMAT_ATTACK,
	EMAT_PAIN_A,
	EMAT_PAIN_B,
	EMAT_PAIN_C,
	EMAT_JUMP,
	EMAT_FLIP,
	EMAT_SALUTE,
	EMAT_FALLBACK,
	EMAT_WAVE,
	EMAT_POINT,
	EMAT_CROUCH_STAND,
	EMAT_CROUCH_WALK,
	EMAT_CROUCH_ATTACK,
	EMAT_CROUCH_PAIN,
	EMAT_CROUCH_DEATH,
	EMAT_DEATH_FALLBACK,
	EMAT_DEATH_FALLFORWARD,
	EMAT_DEATH_FALLBACKSLOW,
	EMAT_BOOM,
	EMAT_COUNT
} EMD2_ANIMATION_TYPE;
