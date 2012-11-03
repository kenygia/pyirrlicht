// Copyright(c) Maxim Kolosov 2010-2012 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

class UserImageLoader : public irr::video::IImageLoader
{
public:
	UserImageLoader(irr::video::IImage*(IRRCALLCONV *func)(irr::io::IReadFile*) = 0, const io::path& extension = "")
	{
		set_funcs(func);
		set_extensions(extension);
	}
	~UserImageLoader()
	{
		func_isALoadableFileExtension = 0;
		func_isALoadableFileFormat = 0;
		func_loadImage = 0;
	}
	void set_extensions(const io::path& extension0 = "", const io::path& extension1 = "", const io::path& extension2 = "")
	{
		file_extension0 = extension0;
		file_extension1 = extension1;
		file_extension2 = extension2;
	}
	void set_funcs(irr::video::IImage*(IRRCALLCONV *func0)(irr::io::IReadFile*) = 0, bool(IRRCALLCONV *func1)(irr::io::IReadFile*) = 0, bool(IRRCALLCONV *func2)(const fschar_t*) = 0)
	{
		func_loadImage = func0;
		func_isALoadableFileFormat = func1;
		func_isALoadableFileExtension = func2;
	}
	bool isALoadableFileExtension(const io::path& filename) const
	{
		if (func_isALoadableFileExtension != NULL)
			return (*func_isALoadableFileExtension)(filename.c_str());
		else
			return core::hasFileExtension(filename, file_extension0, file_extension1, file_extension2);
	}
	bool isALoadableFileFormat(irr::io::IReadFile* file) const
	{
		if (func_isALoadableFileFormat != NULL)
			return (*func_isALoadableFileFormat)(file);
		else
			return false;
	}
	irr::video::IImage* loadImage(irr::io::IReadFile* file) const
	{
		if (func_loadImage != NULL)
			return (*func_loadImage)(file);
		else
			return 0;
	}
protected:
	io::path file_extension0, file_extension1, file_extension2;
	bool(IRRCALLCONV *func_isALoadableFileExtension)(const fschar_t*);
	bool(IRRCALLCONV *func_isALoadableFileFormat)(irr::io::IReadFile*);
	irr::video::IImage*(IRRCALLCONV *func_loadImage)(irr::io::IReadFile*);
};

#ifdef __cplusplus
extern "C" {
#endif

//class UserImageLoader : public irr::video::IImageLoader
IRRLICHT_C_API UserImageLoader* UserImageLoader_ctor1(irr::video::IImage*(IRRCALLCONV *func)(irr::io::IReadFile*), const fschar_t* ext)
{return new UserImageLoader(func, io::path(ext));}

IRRLICHT_C_API void UserImageLoader_set_extensions(UserImageLoader* pointer, const fschar_t* ext0, const fschar_t* ext1, const fschar_t* ext2)
{pointer->set_extensions(io::path(ext0), io::path(ext1), io::path(ext2));}

IRRLICHT_C_API void UserImageLoader_set_funcs(UserImageLoader* pointer, irr::video::IImage*(IRRCALLCONV *func0)(irr::io::IReadFile*), bool(IRRCALLCONV *func1)(irr::io::IReadFile*), bool(IRRCALLCONV *func2)(const fschar_t*))
{pointer->set_funcs(func0, func1, func2);}

//class IImageLoader : public virtual IReferenceCounted
IRRLICHT_C_API bool IImageLoader_isALoadableFileExtension(IImageLoader* pointer, const fschar_t* filename)
{return pointer->isALoadableFileExtension(io::path(filename));}

IRRLICHT_C_API bool IImageLoader_isALoadableFileFormat(IImageLoader* pointer, io::IReadFile* file)
{return pointer->isALoadableFileFormat(file);}

IRRLICHT_C_API IImage* IImageLoader_loadImage(IImageLoader* pointer, io::IReadFile* file)
{return pointer->loadImage(file);}

#ifdef __cplusplus
}
#endif
