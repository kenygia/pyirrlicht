// Copyright(c) Maxim Kolosov 2010-2011 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

//class IImageWriter : public IReferenceCounted

#ifdef __cplusplus
extern "C" {
#endif

//IRRLICHT_C_API IImageWriter* IImageWriter_ctor(){return new IImageWriter();}
IRRLICHT_C_API bool IImageWriter_isAWriteableFileExtension(IImageWriter* pointer, const fschar_t* filename)
{return pointer->isAWriteableFileExtension(io::path(filename));}

IRRLICHT_C_API bool IImageWriter_writeImage(IImageWriter* pointer, io::IWriteFile *file, IImage *image, u32 param = 0)
{return pointer->writeImage(file, image, param);}

#ifdef __cplusplus
}
#endif
