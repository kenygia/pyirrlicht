// Copyright(c) Maxim Kolosov 2010-2011 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

#ifdef __cplusplus
extern "C" {
#endif

//================= ITimer
//IRRLICHT_C_API void ITimer_Destructor(ITimer* pointer){delete pointer;}
IRRLICHT_C_API u32 ITimer_getRealTime(ITimer* pointer)
{return pointer->getRealTime();}
#if (IRRLICHT_VERSION_MAJOR == 1 && IRRLICHT_VERSION_MINOR > 7)
IRRLICHT_C_API ITimer::RealTimeDate* ITimer_getRealTimeAndDate(ITimer* pointer)
{return &pointer->getRealTimeAndDate();}
#endif
IRRLICHT_C_API u32 ITimer_getTime(ITimer* pointer)
{return pointer->getTime();}
IRRLICHT_C_API void ITimer_setTime(ITimer* pointer, u32 time)
{pointer->setTime(time);}
IRRLICHT_C_API void ITimer_stop(ITimer* pointer)
{pointer->stop();}
IRRLICHT_C_API void ITimer_start(ITimer* pointer)
{pointer->start();}
IRRLICHT_C_API void ITimer_setSpeed(ITimer* pointer, f32 speed = 1.0f)
{pointer->setSpeed(speed);}
IRRLICHT_C_API f32 ITimer_getSpeed(ITimer* pointer)
{return pointer->getSpeed();}
IRRLICHT_C_API bool ITimer_isStopped(ITimer* pointer)
{return pointer->isStopped();}
IRRLICHT_C_API void ITimer_tick(ITimer* pointer)
{pointer->tick();}

#ifdef __cplusplus
}
#endif
