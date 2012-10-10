// Copyright(c) Maxim Kolosov 2011 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

#ifdef __cplusplus
extern "C" {
#endif

//class IParticleBoxEmitter : public IParticleEmitter
IRRLICHT_C_API void IParticleBoxEmitter_setBox(IParticleBoxEmitter* pointer, const core::aabbox3df* box)
{pointer->setBox(*box);}
IRRLICHT_C_API const core::aabbox3df* IParticleBoxEmitter_getBox(IParticleBoxEmitter* pointer)
{return &pointer->getBox();}
IRRLICHT_C_API E_PARTICLE_EMITTER_TYPE IParticleBoxEmitter_getType(IParticleBoxEmitter* pointer)
{return pointer->getType();}

#ifdef __cplusplus
}
#endif
