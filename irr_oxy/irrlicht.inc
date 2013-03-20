#include once "const.inc"

typedef void* LPVOID

extern cdecl library "irrlicht_c.dll"

    void delete_pointer(void* object_pointer);

	void* dimension2du_ctor1();
	void* dimension2du_ctor2(uint w, uint h);
	void* dimension2du_ctor3(void* other);
	void* dimension2du_ctor4(void* other);
	uint dimension2du_get_Width(void* pointer);
	uint dimension2du_get_Height(void* pointer);

    void* vector2di_ctor1(int x, int y);
    void* vector2di_ctor2(int value);
    void* vector2di_ctor3(void* other);
    void* vector2di_ctor4(void* other);

    void* SColor_ctor1();
    void* SColor_ctor2(uint a, uint r, uint g, uint b);
    void* SColor_ctor3(uint clr);

    void* recti_ctor2(int x1, int y1, int x2, int y2);

    void* vector3df_ctor2(float x, float y, float z);

    void IReferenceCounted_grab(void* ref_pointer);
    bool IReferenceCounted_drop(void* ref_pointer);
    int IReferenceCounted_getReferenceCount(void* ref_pointer);
    zstring IReferenceCounted_getDebugName(void* ref_pointer);
    bool IReferenceCounted_is_null(void* ref_pointer);

    void ISceneNode_setMaterialFlag(void* pointer, E_MATERIAL_FLAG flag, bool newvalue);
    void ISceneNode_setMaterialTexture(void* pointer, u32 textureLayer, void* texture);

    bool IAnimatedMeshSceneNode_setMD2Animation1(void* pointer, EMD2_ANIMATION_TYPE anim);

    void* ISceneManager_getMesh(void* pointer, const wchar* path);
    void* ISceneManager_addAnimatedMeshSceneNode(void* pointer, void* mesh, void* parent, int id, const void* position, const void* rotation, const void* scale, bool alsoAddIfMeshPointerZero);
    void* ISceneManager_addCameraSceneNode(void* pointer, void* parent, const void* position, const void* lookat, int id);
    void ISceneManager_drawAll(void* pointer);

    void IGUIEnvironment_drawAll(void* pointer);

	bool IVideoDriver_beginSceneDefault(void* pointer, bool backBuffer, bool zBuffer, void* color);
	void IVideoDriver_endScene(void* pointer);
    void IVideoDriver_draw2DImage2(void* pointer, void* texture, void* position2di_pointer, void* sourceRect, void* clipRect = 0, void* color = 0, byte useAlphaChannelOfTexture = false);
    void IVideoDriver_SetIcon(void* pointer, int icon_id = 32512, bool big_icon = false);

    void* ICursorControl_getPosition(void* pointer);

    void* svg_agg_image_ctor1(void* video_driver, void* file_system, wchar* file_name, bool content_unicode = true, unsigned int alpha_value = 128, int color_format = ECF_A8R8G8B8, int stride = 4);
    void svg_agg_image_parse(void* pointer, void* file_system, void* file_name, byte content_unicode = true, uint alpha_value = 128, int color_format = ECF_A8R8G8B8, int stride = 4);
    void svg_agg_image_scale(void* pointer, double x, double y);
    void svg_agg_image_scale_rateably(void* pointer, double scale_value);
    void* svg_agg_image_get_texture_pointer(void* pointer);
    void* svg_agg_image_get_texture(void* pointer, byte rendering = false, byte adding = false);

	void* IrrlichtDevice_createDevice(E_DRIVER_TYPE deviceType, void* windowSize, uint bits = 16, bool fullscreen = false, bool stencilbuffer = false, bool vsync = false, void* receiver = NULL);
    bool IrrlichtDevice_run(void* device_pointer);
	void IrrlichtDevice_yield(void* device_pointer);
	void IrrlichtDevice_sleep(void* device_pointer, uint timeMs, bool pauseTimer);
    void* IrrlichtDevice_getVideoDriver(void* device_pointer);
    void* IrrlichtDevice_getFileSystem(void* pointer);
    void* IrrlichtDevice_getGUIEnvironment(void* pointer);
    void* IrrlichtDevice_getSceneManager(void* pointer);
    void* IrrlichtDevice_getCursorControl(void* pointer);
    void* IrrlichtDevice_getLogger(void* pointer);
    void* IrrlichtDevice_getVideoModeList(void* pointer);
    void* IrrlichtDevice_getOSOperator(void* pointer);
    void* IrrlichtDevice_getTimer(void* pointer);
    void* IrrlichtDevice_getRandomizer();
    void IrrlichtDevice_setRandomizer(void* pointer);
    void* IrrlichtDevice_createDefaultRandomizer();
    void IrrlichtDevice_setWindowCaption(void* pointer, const wchar* text);
    bool IrrlichtDevice_isWindowActive(void* device_pointer);
    bool IrrlichtDevice_isWindowFocused(void* pointer);
    bool IrrlichtDevice_isWindowMinimized(void* pointer);
    bool IrrlichtDevice_isFullscreen(void* pointer);
    ECOLOR_FORMAT IrrlichtDevice_getColorFormat(void* pointer);
    void IrrlichtDevice_closeDevice(void* device_pointer);
    char* IrrlichtDevice_getVersion(void* pointer);
    void IrrlichtDevice_setEventReceiver(void* pointer, void* receiver);
    void* IrrlichtDevice_getEventReceiver(void* pointer);
    void IrrlichtDevice_setInputReceivingSceneManager(void* pointer, void* sceneManager);
    void IrrlichtDevice_setResizable(void* pointer, bool resize);
    void IrrlichtDevice_minimizeWindow(void* pointer);
    void IrrlichtDevice_maximizeWindow(void* pointer);
    void IrrlichtDevice_restoreWindow(void* pointer);
    bool IrrlichtDevice_setGammaRamp(void* pointer, float red, float green, float blue, float relativebrightness, float relativecontrast);
    bool IrrlichtDevice_getGammaRamp(void* pointer, float *red, float *green, float *blue, float *brightness, float *contrast);
    void IrrlichtDevice_clearSystemMessages(void* pointer);
    E_DEVICE_TYPE IrrlichtDevice_getType(void* pointer);
    bool IrrlichtDevice_isDriverSupported(void* pointer, E_DRIVER_TYPE driver);

end extern


' classes

class dimension2du
    protected long p
    method constructor(uint w, uint h){this.p = dimension2du_ctor2(w, h)}
    method destructor(){delete_pointer(this.p)}
    method get_pointer() as long {return this.p}
    method get_Width() as uint {return dimension2du_get_Width(this.p)}
    method get_Height() as uint {return dimension2du_get_Height(this.p)}
end class

class SColor
    protected long p
    method constructor(){this.p = SColor_ctor1()}
    method constructor(uint a, uint r, uint g, uint b){this.p = SColor_ctor2(a, r, g, b)}
    method destructor(){delete_pointer(this.p)}
    method get_pointer() as long {return this.p}
end class

class IReferenceCounted
    protected long p
    method grab(){IReferenceCounted_grab(this.p)}
    method drop() as bool {return IReferenceCounted_drop(this.p)}
    method getReferenceCount() as int {return IReferenceCounted_getReferenceCount(this.p)}
    method getDebugName() as zstring {return IReferenceCounted_getDebugName(this.p)}
    method is_null() as bool {return IReferenceCounted_is_null(this.p)}
end class

class IReferenceCountedEx
    of IReferenceCounted
    method constructor(long object_pointer){this.p = object_pointer}
    method new(long object_pointer){this.p = object_pointer}
end class

class IVideoDriver
    of IReferenceCountedEx
    method set_pointer(long object_pointer){this.p = object_pointer}
    method beginSceneDefault(bool backBuffer, bool zBuffer, SColor color) as bool
        return IVideoDriver_beginSceneDefault(this.p, backBuffer, zBuffer, color.get_pointer())
    end method
    method endScene()
        IVideoDriver_endScene(this.p)
    end method
end class

class IrrlichtDevice
    of IReferenceCounted
    ' protected long p
    ' method constructor(optional E_DRIVER_TYPE deviceType = EDT_NULL, long windowSize = 0, uint bits = 16, bool fullscreen = 0, bool stencilbuffer = 0, bool vsync = 0, LPVOID receiver = 0)
        ' this.p = IrrlichtDevice_createDevice(deviceType, windowSize, bits, fullscreen, stencilbuffer, vsync, receiver)
    ' end method
    method constructor(E_DRIVER_TYPE deviceType, dimension2du windowSize, optional uint bits = 32, bool fullscreen = false, bool stencilbuffer = false, bool vsync = false, uint receiver = NULL)
        this.p = IrrlichtDevice_createDevice(deviceType, windowSize.get_pointer(), bits, fullscreen, stencilbuffer, vsync, receiver)
    end method
    method destructor(){delete_pointer(this.p)}
    method get_pointer() as long {return this.p}
    method run() as bool {return IrrlichtDevice_run(this.p)}
    method yield(){IrrlichtDevice_yield(this.p)}
    method sleep(uint timeMs, bool pauseTimer){IrrlichtDevice_sleep(this.p, timeMs, pauseTimer)}
    method getVideoDriver() as long {return IrrlichtDevice_getVideoDriver(this.p)}
    method setWindowCaption(wchar* text){IrrlichtDevice_setWindowCaption(this.p, text)}
    method isWindowActive() as bool {return IrrlichtDevice_isWindowActive(this.p)}
    method closeDevice(){IrrlichtDevice_closeDevice(this.p)}
    method getVersion() as String {return IrrlichtDevice_getVersion(this.p)}
    method setResizable(bool resize = true){IrrlichtDevice_setResizable(this.p, resize)}
end class
