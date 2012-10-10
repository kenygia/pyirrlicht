// Copyright(c) Maxim Kolosov 2010-2011 maxkolosov@inbox.ru
// http://pir.sourceforge.net
// BSD license

#ifdef __cplusplus
extern "C" {
#endif

//================= IGUICheckBox
IRRLICHT_C_API IGUICheckBox* IGUICheckBox_ctor(IGUIEnvironment* environment, IGUIElement* parent, s32 id, core::rect<s32>* rectangle)
{return (IGUICheckBox*)new IGUIElement(EGUIET_CHECK_BOX, environment, parent, id, *rectangle);}
IRRLICHT_C_API void IGUICheckBox_setChecked(IGUICheckBox* pointer, bool checked)
{pointer->setChecked(checked);}
IRRLICHT_C_API bool IGUICheckBox_isChecked(IGUICheckBox* pointer)
{return pointer->isChecked();}

#ifdef __cplusplus
}
#endif
