package llnl.visit;

import java.util.Vector;

// ****************************************************************************
// Class: PlotList
//
// Purpose:
//    This class contains a list of plots.
//
// Notes:      Autogenerated by xml2java.
//
// Programmer: xml2java
// Creation:   Thu Dec 12 14:02:48 PST 2002
//
// Modifications:
//   
// ****************************************************************************

public class PlotList extends AttributeSubject
{
    public PlotList()
    {
        super(1);

        plots = new Vector();
    }

    public PlotList(PlotList obj)
    {
        super(1);

        int i;

        // *** Copy the plots field ***
        plots = new Vector(obj.plots.size());
        for(i = 0; i < obj.plots.size(); ++i)
        {
            Plot newObj = (Plot)plots.elementAt(i);
            plots.addElement(new Plot(newObj));
        }


        SelectAll();
    }

    public boolean equals(PlotList obj)
    {
        int i;

        boolean plots_equal = (obj.plots.size() == plots.size());
        for(i = 0; (i < plots.size()) && plots_equal; ++i)
        {
            // Make references to Plot from Object.
            Plot plots1 = (Plot)plots.elementAt(i);
            Plot plots2 = (Plot)obj.plots.elementAt(i);
            plots_equal = plots1.equals(plots2);
        }

        // Create the return value
        return (plots_equal);
    }

    // Property setting methods
    // Property getting methods
    public Vector GetPlots() { return plots; }

    // Write and read methods.
    public void WriteAtts(CommunicationBuffer buf)
    {
        if(WriteSelect(0, buf))
        {
            buf.WriteInt(plots.size());
            for(int i = 0; i < plots.size(); ++i)
            {
                Plot tmp = (Plot)plots.elementAt(i);
                tmp.Write(buf);
            }
        }
    }

    public void ReadAtts(int n, CommunicationBuffer buf)
    {
        buf.ReadByte();
        {
            int len = buf.ReadInt();
            plots.clear();
            for(int j = 0; j < len; ++j)
            {
                Plot tmp = new Plot();
                tmp.Read(buf);
                plots.addElement(tmp);
            }
        }
        Select(0);
    }

    // Attributegroup convenience methods
    public void AddPlot(Plot obj)
    {
        plots.addElement(new Plot(obj));
        Select(0);
    }

    public void ClearPlots()
    {
        plots.clear();
        Select(0);
    }

    public void RemovePlot(int index)
    {
        if(index >= 0 && index < plots.size())
        {
            plots.remove(index);
            Select(0);
        }
    }

    public int GetNumPlots()
    {
        return plots.size();
    }

    public Plot GetPlot(int i)
    {
        Plot tmp = (Plot)plots.elementAt(i);
        return tmp;
    }


    // Attributes
    private Vector plots; // vector of Plot objects
}

