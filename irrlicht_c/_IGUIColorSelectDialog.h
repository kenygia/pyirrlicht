// Copyright(c) Maxim Kolosov 2010-2011 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

#ifdef __cplusplus
extern "C" {
#endif

//================= IGUIColorSelectDialog
IRRLICHT_C_API IGUIColorSelectDialog* IGUIColorSelectDialog_ctor(IGUIEnvironment* environment, IGUIElement* parent, s32 id, core::rect<s32>* rectangle)
{return (IGUIColorSelectDialog*)new IGUIElement(EGUIET_COLOR_SELECT_DIALOG, environment, parent, id, *rectangle);}

#ifdef __cplusplus
}
#endif
