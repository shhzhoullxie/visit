// ************************************************************************* //
//                               VolumePluginInfo.h                            //
// ************************************************************************* //

#ifndef VOLUME_PLUGIN_INFO_H
#define VOLUME_PLUGIN_INFO_H
#include <PlotPluginInfo.h>
#include <plot_plugin_exports.h>

class VolumeAttributes;

// ****************************************************************************
//  Class: VolumePluginInfo
//
//  Purpose:
//    Five classes that provide all the information about a Volume
//    plot plugin.  The information is broken up into five classes since
//    portions of it are only relevant to particular components within
//    visit.  There is the general information which all the components
//    are interested in, the gui information which the gui is interested in,
//    the viewer information which the viewer is interested in, the
//    engine information which the engine is interested in, and finally a.
//    scripting portion that enables the Python VisIt extension to use the
//    plugin.
//
//  Programmer: whitlocb -- generated by xml2info
//  Creation:   Tue Mar 18 09:01:22 PDT 2003
//
// ****************************************************************************

class VolumeGeneralPluginInfo: public virtual GeneralPlotPluginInfo


{
  public:
    virtual char *GetName() const;
    virtual char *GetVersion() const;
    virtual char *GetID() const;
};

class VolumeCommonPluginInfo : public virtual CommonPlotPluginInfo, public virtual VolumeGeneralPluginInfo
{
  public:
    virtual AttributeSubject *AllocAttributes();
    virtual void CopyAttributes(AttributeSubject *to, AttributeSubject *from);
};

class VolumeGUIPluginInfo: public virtual GUIPlotPluginInfo, public virtual VolumeCommonPluginInfo
{
  public:
    virtual const char *GetMenuName() const;
    virtual int GetVariableTypes() const;
    virtual QvisPostableWindowObserver *CreatePluginWindow(int type,
        AttributeSubject *attr, QvisNotepadArea *notepad);
    virtual const char **XPMIconData() const;
};

class VolumeViewerPluginInfo: public virtual ViewerPlotPluginInfo, public virtual VolumeCommonPluginInfo
{
  public:
    virtual AttributeSubject *GetClientAtts();
    virtual AttributeSubject *GetDefaultAtts();
    virtual void SetClientAtts(AttributeSubject *atts);
    virtual void GetClientAtts(AttributeSubject *atts);

    virtual avtPlot *AllocAvtPlot();

    virtual void InitializePlotAtts(AttributeSubject *atts,
        const char *hostName, const char *databaseName,
        const char *variableName);
    virtual const char **XPMIconData() const;
    virtual int GetVariableTypes() const;

    static void InitializeGlobalObjects();
  private:
    static VolumeAttributes *defaultAtts;
    static VolumeAttributes *clientAtts;
};

class VolumeEnginePluginInfo: public virtual EnginePlotPluginInfo, public virtual VolumeCommonPluginInfo
{
  public:
    virtual avtPlot *AllocAvtPlot();
};

class VolumeScriptingPluginInfo : public virtual ScriptingPlotPluginInfo, public virtual VolumeCommonPluginInfo
{
  public:
    virtual void InitializePlugin(AttributeSubject *subj, FILE *log);
    virtual void *GetMethodTable(int *nMethods);
    virtual bool TypesMatch(void *pyobject);
    virtual void SetLogging(bool val);
    virtual void SetDefaults(const AttributeSubject *atts);
};

#endif
