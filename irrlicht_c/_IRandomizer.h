// Copyright(c) Maxim Kolosov 2012 maxkolosov@inbox.ru
// http://pir.sf.net
// BSD license

#ifdef __cplusplus
extern "C" {
#endif

// class IRandomizer : public virtual IReferenceCounted
IRRLICHT_C_API void IRandomizer_reset(IRandomizer* pointer, s32 value=0x0f0f0f0f){pointer->reset(value);}
IRRLICHT_C_API s32 IRandomizer_rand(IRandomizer* pointer){return pointer->rand();}
IRRLICHT_C_API f32 IRandomizer_frand(IRandomizer* pointer){return pointer->frand();}
IRRLICHT_C_API s32 IRandomizer_randMax(IRandomizer* pointer){return pointer->randMax();}

#ifdef __cplusplus
}
#endif
