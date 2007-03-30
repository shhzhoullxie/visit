#ifndef PLOT_AND_OPERATOR_ACTIONS_H
#define PLOT_AND_OPERATOR_ACTIONS_H
#include <ViewerAction.h>
#include <ViewerMultipleAction.h>
#include <VariableMenuPopulator.h>
#include <vectortypes.h>

// ****************************************************************************
// Class: AddOperatorAction
//
// Purpose:
//   This action adds an operator to the plots in a window's plot list.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Mon Mar 17 09:24:01 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class AddOperatorAction : public ViewerMultipleAction
{
public:
    AddOperatorAction(ViewerWindow *win);
    virtual ~AddOperatorAction();

    virtual void Setup();

    virtual void Execute(int);
    virtual bool Enabled() const;
    virtual bool ChoiceEnabled(int i) const;

    virtual void ConstructToolbar(QToolBar *toolbar);
private:
    intVector graphicalPlugins;
};

// ****************************************************************************
// Class: PromoteOperatorAction
//
// Purpose:
//   This action promotes an operator in the window's selected plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Thu Apr 10 09:38:34 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class PromoteOperatorAction : public ViewerAction
{
public:
    PromoteOperatorAction(ViewerWindow *);
    virtual ~PromoteOperatorAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: DemoteOperatorAction
//
// Purpose:
//   This action demotes an operator in the window's selected plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Thu Apr 10 09:38:34 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class DemoteOperatorAction : public ViewerAction
{
public:
    DemoteOperatorAction(ViewerWindow *);
    virtual ~DemoteOperatorAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: RemoveOperatorAction
//
// Purpose:
//   This action removes an operator from the window's selected plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Thu Apr 10 09:38:34 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class RemoveOperatorAction : public ViewerAction
{
public:
    RemoveOperatorAction(ViewerWindow *);
    virtual ~RemoveOperatorAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: RemoveLastOperatorAction
//
// Purpose:
//   This action removes the last operator from the window's selected plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Mon Mar 17 09:51:18 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class RemoveLastOperatorAction : public ViewerAction
{
public:
    RemoveLastOperatorAction(ViewerWindow *);
    virtual ~RemoveLastOperatorAction();
    virtual void Execute();
    virtual bool Enabled() const;
};

// ****************************************************************************
// Class: RemoveAllOperatorsAction
//
// Purpose:
//   This action removes all operators from the window's selected plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Mon Mar 17 09:51:41 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class RemoveAllOperatorsAction : public ViewerAction
{
public:
    RemoveAllOperatorsAction(ViewerWindow *);
    virtual ~RemoveAllOperatorsAction();
    virtual void Execute();
    virtual bool Enabled() const;
};

// ****************************************************************************
// Class: SetOperatorOptionsAction
//
// Purpose:
//   This action sets the operator attributes for an operator.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:48:55 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class SetOperatorOptionsAction : public ViewerAction
{
public:
    SetOperatorOptionsAction(ViewerWindow *);
    virtual ~SetOperatorOptionsAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: AddPlotAction
//
// Purpose:
//   This action adds a plot to the window's plot list.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Mon Mar 17 09:24:19 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class QMenuBar;

class AddPlotAction : public ViewerMultipleAction
{
    Q_OBJECT

    typedef struct
    {
        int                    index;
        QvisVariablePopupMenu *varMenu;
        int                    varTypes;
    } PluginEntry;

    typedef std::vector<PluginEntry> PluginEntryVector;
public:
    AddPlotAction(ViewerWindow *win);
    virtual ~AddPlotAction();

    virtual void Update();
    virtual void Execute(int);
    virtual bool Enabled() const;
    virtual bool ChoiceEnabled(int i) const;

    virtual void ConstructMenu(QPopupMenu *);
    virtual void RemoveFromMenu(QPopupMenu *);
    virtual void ConstructToolbar(QToolBar *toolbar);
private slots:
    void addPlot(int, const QString &);
    void orientationChanged(Orientation);
private:
    QMenuBar              *menu;
    int                   maxPixmapWidth, maxPixmapHeight;
    std::string           database;
    PluginEntryVector     pluginEntries;
    VariableMenuPopulator menuPopulator;
};

// ****************************************************************************
// Class: DrawPlotsAction
//
// Purpose:
//   This action draws the window's plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Mon Mar 17 09:51:41 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class DrawPlotsAction : public ViewerAction
{
public:
    DrawPlotsAction(ViewerWindow *);
    virtual ~DrawPlotsAction();
    virtual void Execute();
    virtual bool Enabled() const;
};

// ****************************************************************************
// Class: HideActivePlotsAction
//
// Purpose:
//   This action hides the window's active plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Mon Mar 17 09:51:41 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class HideActivePlotsAction : public ViewerAction
{
public:
    HideActivePlotsAction(ViewerWindow *);
    virtual ~HideActivePlotsAction();
    virtual void Execute();
    virtual bool Enabled() const;
};

// ****************************************************************************
// Class: DeleteActivePlotsAction
//
// Purpose:
//   This action deletes the window's active plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Mon Mar 17 09:51:41 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class DeleteActivePlotsAction : public ViewerAction
{
public:
    DeleteActivePlotsAction(ViewerWindow *);
    virtual ~DeleteActivePlotsAction();
    virtual void Execute();
    virtual bool Enabled() const;
};

// ****************************************************************************
// Class: SetActivePlotsAction
//
// Purpose:
//   This action sets the window's active plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:30:16 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class SetActivePlotsAction : public ViewerAction
{
public:
    SetActivePlotsAction(ViewerWindow *);
    virtual ~SetActivePlotsAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: ChangeActivePlotsVarAction
//
// Purpose:
//   This action sets the plotted variable for the selected plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:30:16 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class ChangeActivePlotsVarAction : public ViewerAction
{
public:
    ChangeActivePlotsVarAction(ViewerWindow *);
    virtual ~ChangeActivePlotsVarAction();
    virtual void Execute();
};


// ****************************************************************************
// Class: SetPlotSILRestrictionAction
//
// Purpose:
//   This action sets the SIL restriction for a plot.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:47:41 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class SetPlotSILRestrictionAction : public ViewerAction
{
public:
    SetPlotSILRestrictionAction(ViewerWindow *);
    virtual ~SetPlotSILRestrictionAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: SetPlotOptionsAction
//
// Purpose:
//   This action sets the plot attributes for the selected plots.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:48:57 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class SetPlotOptionsAction : public ViewerAction
{
public:
    SetPlotOptionsAction(ViewerWindow *);
    virtual ~SetPlotOptionsAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: SetPlotFrameRangeAction
//
// Purpose:
//   This action setes the frames over which a plot exists.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:48:58 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class SetPlotFrameRangeAction : public ViewerAction
{
public:
    SetPlotFrameRangeAction(ViewerWindow *);
    virtual ~SetPlotFrameRangeAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: DeletePlotKeyframeAction
//
// Purpose:
//   Deletes a plot keyframe.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:48:58 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class DeletePlotKeyframeAction : public ViewerAction
{
public:
    DeletePlotKeyframeAction(ViewerWindow *);
    virtual ~DeletePlotKeyframeAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: MovePlotKeyframeAction
//
// Purpose:
//   Moves a plot keyframe.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:48:59 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class MovePlotKeyframeAction : public ViewerAction
{
public:
    MovePlotKeyframeAction(ViewerWindow *);
    virtual ~MovePlotKeyframeAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: SetPlotDatabaseStateAction
//
// Purpose:
//   Sets a database keyframe for a plot.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:49:00 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class SetPlotDatabaseStateAction : public ViewerAction
{
public:
    SetPlotDatabaseStateAction(ViewerWindow *);
    virtual ~SetPlotDatabaseStateAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: DeletePlotDatabaseKeyframeAction
//
// Purpose:
//   Deletes a database keyframe.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:49:02 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class DeletePlotDatabaseKeyframeAction : public ViewerAction
{
public:
    DeletePlotDatabaseKeyframeAction(ViewerWindow *);
    virtual ~DeletePlotDatabaseKeyframeAction();
    virtual void Execute();
};

// ****************************************************************************
// Class: MovePlotDatabaseKeyframeAction
//
// Purpose:
//   Moves a database keyframe.
//
// Notes:      
//
// Programmer: Brad Whitlock
// Creation:   Fri Apr 11 07:49:03 PDT 2003
//
// Modifications:
//   
// ****************************************************************************

class MovePlotDatabaseKeyframeAction : public ViewerAction
{
public:
    MovePlotDatabaseKeyframeAction(ViewerWindow *);
    virtual ~MovePlotDatabaseKeyframeAction();
    virtual void Execute();
};


#endif


