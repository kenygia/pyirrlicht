// Copyright(c) Maxim Kolosov 2010-2011 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

#ifdef __cplusplus
extern "C" {
#endif

//================= IAttributeExchangingObject
IRRLICHT_C_API void IAttributeExchangingObject_serializeAttributes(IAttributeExchangingObject* pointer, io::IAttributes* out, io::SAttributeReadWriteOptions* options=0)
{pointer->serializeAttributes(out, options);}
IRRLICHT_C_API void IAttributeExchangingObject_deserializeAttributes(IAttributeExchangingObject* pointer, io::IAttributes* in, io::SAttributeReadWriteOptions* options=0)
{pointer->deserializeAttributes(in, options);}

#ifdef __cplusplus
}
#endif
