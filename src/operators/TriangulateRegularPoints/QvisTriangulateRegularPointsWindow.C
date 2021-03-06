/*****************************************************************************
*
* Copyright (c) 2000 - 2019, Lawrence Livermore National Security, LLC
* Produced at the Lawrence Livermore National Laboratory
* LLNL-CODE-442911
* All rights reserved.
*
* This file is  part of VisIt. For  details, see https://visit.llnl.gov/.  The
* full copyright notice is contained in the file COPYRIGHT located at the root
* of the VisIt distribution or at http://www.llnl.gov/visit/copyright.html.
*
* Redistribution  and  use  in  source  and  binary  forms,  with  or  without
* modification, are permitted provided that the following conditions are met:
*
*  - Redistributions of  source code must  retain the above  copyright notice,
*    this list of conditions and the disclaimer below.
*  - Redistributions in binary form must reproduce the above copyright notice,
*    this  list of  conditions  and  the  disclaimer (as noted below)  in  the
*    documentation and/or other materials provided with the distribution.
*  - Neither the name of  the LLNS/LLNL nor the names of  its contributors may
*    be used to endorse or promote products derived from this software without
*    specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR  IMPLIED WARRANTIES, INCLUDING,  BUT NOT  LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND  FITNESS FOR A PARTICULAR  PURPOSE
* ARE  DISCLAIMED. IN  NO EVENT  SHALL LAWRENCE  LIVERMORE NATIONAL  SECURITY,
* LLC, THE  U.S.  DEPARTMENT OF  ENERGY  OR  CONTRIBUTORS BE  LIABLE  FOR  ANY
* DIRECT,  INDIRECT,   INCIDENTAL,   SPECIAL,   EXEMPLARY,  OR   CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT  LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR
* SERVICES; LOSS OF  USE, DATA, OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER
* CAUSED  AND  ON  ANY  THEORY  OF  LIABILITY,  WHETHER  IN  CONTRACT,  STRICT
* LIABILITY, OR TORT  (INCLUDING NEGLIGENCE OR OTHERWISE)  ARISING IN ANY  WAY
* OUT OF THE  USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
* DAMAGE.
*
*****************************************************************************/

#include "QvisTriangulateRegularPointsWindow.h"

#include <TriangulateRegularPointsAttributes.h>

#include <QCheckBox>
#include <QLabel>
#include <QLayout>
#include <QLineEdit>


// ****************************************************************************
// Method: QvisTriangulateRegularPointsWindow::QvisTriangulateRegularPointsWindow
//
// Purpose: 
//   Constructor
//
// Note:       Autogenerated by xml2window.
//
// Programmer: xml2window
// Creation:   omitted
//
// Modifications:
//   
// ****************************************************************************

QvisTriangulateRegularPointsWindow::QvisTriangulateRegularPointsWindow(const int type,
                         TriangulateRegularPointsAttributes *subj,
                         const QString &caption,
                         const QString &shortName,
                         QvisNotepadArea *notepad)
    : QvisOperatorWindow(type,subj, caption, shortName, notepad)
{
    atts = subj;
}


// ****************************************************************************
// Method: QvisTriangulateRegularPointsWindow::~QvisTriangulateRegularPointsWindow
//
// Purpose: 
//   Destructor
//
// Note:       Autogenerated by xml2window.
//
// Programmer: xml2window
// Creation:   omitted
//
// Modifications:
//   
// ****************************************************************************

QvisTriangulateRegularPointsWindow::~QvisTriangulateRegularPointsWindow()
{
}


// ****************************************************************************
// Method: QvisTriangulateRegularPointsWindow::CreateWindowContents
//
// Purpose: 
//   Creates the widgets for the window.
//
// Note:       Autogenerated by xml2window.
//
// Programmer: xml2window
// Creation:   omitted
//
// Modifications:
//   
// ****************************************************************************

void
QvisTriangulateRegularPointsWindow::CreateWindowContents()
{
    QGridLayout *mainLayout = new QGridLayout(0);
    topLayout->addLayout(mainLayout);

    useXGridSpacing = new QCheckBox(tr("Use X grid spacing"), central);
    connect(useXGridSpacing, SIGNAL(toggled(bool)),
            this, SLOT(useXGridSpacingChanged(bool)));
    mainLayout->addWidget(useXGridSpacing, 0,0);

    xGridSpacingLabel = new QLabel(tr("X grid spacing"), central);
    mainLayout->addWidget(xGridSpacingLabel,1,0);
    xGridSpacing = new QLineEdit(central);
    connect(xGridSpacing, SIGNAL(returnPressed()),
            this, SLOT(xGridSpacingProcessText()));
    mainLayout->addWidget(xGridSpacing, 1,1);

    useYGridSpacing = new QCheckBox(tr("Use Y grid spacing"), central);
    connect(useYGridSpacing, SIGNAL(toggled(bool)),
            this, SLOT(useYGridSpacingChanged(bool)));
    mainLayout->addWidget(useYGridSpacing, 2,0);

    yGridSpacingLabel = new QLabel(tr("Y grid spacing"), central);
    mainLayout->addWidget(yGridSpacingLabel,3,0);
    yGridSpacing = new QLineEdit(central);
    connect(yGridSpacing, SIGNAL(returnPressed()),
            this, SLOT(yGridSpacingProcessText()));
    mainLayout->addWidget(yGridSpacing, 3,1);

}


// ****************************************************************************
// Method: QvisTriangulateRegularPointsWindow::UpdateWindow
//
// Purpose: 
//   Updates the widgets in the window when the subject changes.
//
// Note:       Autogenerated by xml2window.
//
// Programmer: xml2window
// Creation:   omitted
//
// Modifications:
//   
// ****************************************************************************

void
QvisTriangulateRegularPointsWindow::UpdateWindow(bool doAll)
{

    for(int i = 0; i < atts->NumAttributes(); ++i)
    {
        if(!doAll)
        {
            if(!atts->IsSelected(i))
            {
                continue;
            }
        }

        switch(i)
        {
          case TriangulateRegularPointsAttributes::ID_useXGridSpacing:
            if (atts->GetUseXGridSpacing() == true)
            {
                xGridSpacing->setEnabled(true);
                if(xGridSpacingLabel)
                    xGridSpacingLabel->setEnabled(true);
            }
            else
            {
                xGridSpacing->setEnabled(false);
                if(xGridSpacingLabel)
                    xGridSpacingLabel->setEnabled(false);
            }
            useXGridSpacing->blockSignals(true);
            useXGridSpacing->setChecked(atts->GetUseXGridSpacing());
            useXGridSpacing->blockSignals(false);
            break;
          case TriangulateRegularPointsAttributes::ID_xGridSpacing:
            xGridSpacing->setText(DoubleToQString(atts->GetXGridSpacing()));
            break;
          case TriangulateRegularPointsAttributes::ID_useYGridSpacing:
            if (atts->GetUseYGridSpacing() == true)
            {
                yGridSpacing->setEnabled(true);
                if(yGridSpacingLabel)
                    yGridSpacingLabel->setEnabled(true);
            }
            else
            {
                yGridSpacing->setEnabled(false);
                if(yGridSpacingLabel)
                    yGridSpacingLabel->setEnabled(false);
            }
            useYGridSpacing->blockSignals(true);
            useYGridSpacing->setChecked(atts->GetUseYGridSpacing());
            useYGridSpacing->blockSignals(false);
            break;
          case TriangulateRegularPointsAttributes::ID_yGridSpacing:
            yGridSpacing->setText(DoubleToQString(atts->GetYGridSpacing()));
            break;
        }
    }
}


// ****************************************************************************
// Method: QvisTriangulateRegularPointsWindow::GetCurrentValues
//
// Purpose: 
//   Gets values from certain widgets and stores them in the subject.
//
// Note:       Autogenerated by xml2window.
//
// Programmer: xml2window
// Creation:   omitted
//
// Modifications:
//   
// ****************************************************************************

void
QvisTriangulateRegularPointsWindow::GetCurrentValues(int which_widget)
{
    bool doAll = (which_widget == -1);

    // Do xGridSpacing
    if(which_widget == TriangulateRegularPointsAttributes::ID_xGridSpacing || doAll)
    {
        double val;
        if(LineEditGetDouble(xGridSpacing, val))
            atts->SetXGridSpacing(val);
        else
        {
            ResettingError(tr("X grid spacing"),
                DoubleToQString(atts->GetXGridSpacing()));
            atts->SetXGridSpacing(atts->GetXGridSpacing());
        }
    }

    // Do yGridSpacing
    if(which_widget == TriangulateRegularPointsAttributes::ID_yGridSpacing || doAll)
    {
        double val;
        if(LineEditGetDouble(yGridSpacing, val))
            atts->SetYGridSpacing(val);
        else
        {
            ResettingError(tr("Y grid spacing"),
                DoubleToQString(atts->GetYGridSpacing()));
            atts->SetYGridSpacing(atts->GetYGridSpacing());
        }
    }

}


//
// Qt Slot functions
//


void
QvisTriangulateRegularPointsWindow::useXGridSpacingChanged(bool val)
{
    atts->SetUseXGridSpacing(val);
    Apply();
}


void
QvisTriangulateRegularPointsWindow::xGridSpacingProcessText()
{
    GetCurrentValues(TriangulateRegularPointsAttributes::ID_xGridSpacing);
    Apply();
}


void
QvisTriangulateRegularPointsWindow::useYGridSpacingChanged(bool val)
{
    atts->SetUseYGridSpacing(val);
    Apply();
}


void
QvisTriangulateRegularPointsWindow::yGridSpacingProcessText()
{
    GetCurrentValues(TriangulateRegularPointsAttributes::ID_yGridSpacing);
    Apply();
}


