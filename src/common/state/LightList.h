#ifndef LIGHTLIST_H
#define LIGHTLIST_H
#include <state_exports.h>
#include <AttributeSubject.h>
#include <LightAttributes.h>

// ****************************************************************************
// Class: LightList
//
// Purpose:
//    This class contains a list of LightAttributes.
//
// Notes:      Autogenerated by xml2atts.
//
// Programmer: xml2atts
// Creation:   Tue May 20 13:39:56 PST 2003
//
// Modifications:
//   
// ****************************************************************************

class STATE_API LightList : public AttributeSubject
{
public:
    LightList();
    LightList(const LightList &obj);
    virtual ~LightList();

    virtual void operator = (const LightList &obj);
    virtual bool operator == (const LightList &obj) const;
    virtual bool operator != (const LightList &obj) const;

    virtual const std::string TypeName() const;
    virtual bool CopyAttributes(const AttributeGroup *);
    virtual AttributeSubject *CreateCompatible(const std::string &) const;

    // Property selection methods
    virtual void SelectAll();
    void SelectLight0();
    void SelectLight1();
    void SelectLight2();
    void SelectLight3();
    void SelectLight4();
    void SelectLight5();
    void SelectLight6();
    void SelectLight7();

    // Property setting methods
    void SetLight0(const LightAttributes &light0_);
    void SetLight1(const LightAttributes &light1_);
    void SetLight2(const LightAttributes &light2_);
    void SetLight3(const LightAttributes &light3_);
    void SetLight4(const LightAttributes &light4_);
    void SetLight5(const LightAttributes &light5_);
    void SetLight6(const LightAttributes &light6_);
    void SetLight7(const LightAttributes &light7_);

    // Property getting methods
    const LightAttributes &GetLight0() const;
          LightAttributes &GetLight0();
    const LightAttributes &GetLight1() const;
          LightAttributes &GetLight1();
    const LightAttributes &GetLight2() const;
          LightAttributes &GetLight2();
    const LightAttributes &GetLight3() const;
          LightAttributes &GetLight3();
    const LightAttributes &GetLight4() const;
          LightAttributes &GetLight4();
    const LightAttributes &GetLight5() const;
          LightAttributes &GetLight5();
    const LightAttributes &GetLight6() const;
          LightAttributes &GetLight6();
    const LightAttributes &GetLight7() const;
          LightAttributes &GetLight7();

    // Persistence methods
    virtual bool CreateNode(DataNode *node, bool forceAdd);
    virtual void SetFromNode(DataNode *node);


    // Keyframing methods
    virtual std::string               GetFieldName(int index) const;
    virtual AttributeGroup::FieldType GetFieldType(int index) const;
    virtual std::string               GetFieldTypeName(int index) const;
    virtual bool                      FieldsEqual(int index, const AttributeGroup *rhs) const;

    // User-defined methods
    const LightAttributes &GetLight(int i) const;
    LightAttributes &GetLight(int i);
    int NumLights() const;
    void SelectLight(int i);
    void SetLight(int i, const LightAttributes &l);
    void SetDefaultEnabledStates();
private:
    LightAttributes light0;
    LightAttributes light1;
    LightAttributes light2;
    LightAttributes light3;
    LightAttributes light4;
    LightAttributes light5;
    LightAttributes light6;
    LightAttributes light7;
};

#endif
