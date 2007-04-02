package llnl.visit.plots;

import llnl.visit.AttributeSubject;
import llnl.visit.CommunicationBuffer;
import llnl.visit.Plugin;
import llnl.visit.ColorAttribute;
import llnl.visit.ColorAttributeList;
import java.util.Vector;

// ****************************************************************************
// Class: SubsetAttributes
//
// Purpose:
//    This class contains the plot attributes for the subset boundary plot.
//
// Notes:      Autogenerated by xml2java.
//
// Programmer: xml2java
// Creation:   Thu Aug 25 10:16:30 PDT 2005
//
// Modifications:
//   
// ****************************************************************************

public class SubsetAttributes extends AttributeSubject implements Plugin
{
    // Enum values
    public final static int SUBSET_TYPE_DOMAIN = 0;
    public final static int SUBSET_TYPE_GROUP = 1;
    public final static int SUBSET_TYPE_MATERIAL = 2;
    public final static int SUBSET_TYPE_UNKNOWN = 3;

    public final static int COLORINGMETHOD_COLORBYSINGLECOLOR = 0;
    public final static int COLORINGMETHOD_COLORBYMULTIPLECOLORS = 1;
    public final static int COLORINGMETHOD_COLORBYCOLORTABLE = 2;

    public final static int POINTTYPE_BOX = 0;
    public final static int POINTTYPE_AXIS = 1;
    public final static int POINTTYPE_ICOSAHEDRON = 2;
    public final static int POINTTYPE_POINT = 3;
    public final static int POINTTYPE_SPHERE = 4;


    public SubsetAttributes()
    {
        super(19);

        colorType = COLORINGMETHOD_COLORBYMULTIPLECOLORS;
        colorTableName = new String("Default");
        filledFlag = true;
        legendFlag = true;
        lineStyle = 0;
        lineWidth = 0;
        singleColor = new ColorAttribute();
        multiColor = new ColorAttributeList();
        subsetNames = new Vector();
        subsetType = SUBSET_TYPE_UNKNOWN;
        opacity = 1;
        wireframe = false;
        drawInternal = false;
        smoothingLevel = 0;
        pointSize = 0.05;
        pointType = POINTTYPE_POINT;
        pointSizeVarEnabled = false;
        pointSizeVar = new String("default");
        pointSizePixels = 2;
    }

    public SubsetAttributes(SubsetAttributes obj)
    {
        super(19);

        int i;

        colorType = obj.colorType;
        colorTableName = new String(obj.colorTableName);
        filledFlag = obj.filledFlag;
        legendFlag = obj.legendFlag;
        lineStyle = obj.lineStyle;
        lineWidth = obj.lineWidth;
        singleColor = new ColorAttribute(obj.singleColor);
        multiColor = new ColorAttributeList(obj.multiColor);
        subsetNames = new Vector(obj.subsetNames.size());
        for(i = 0; i < obj.subsetNames.size(); ++i)
            subsetNames.addElement(new String((String)obj.subsetNames.elementAt(i)));

        subsetType = obj.subsetType;
        opacity = obj.opacity;
        wireframe = obj.wireframe;
        drawInternal = obj.drawInternal;
        smoothingLevel = obj.smoothingLevel;
        pointSize = obj.pointSize;
        pointType = obj.pointType;
        pointSizeVarEnabled = obj.pointSizeVarEnabled;
        pointSizeVar = new String(obj.pointSizeVar);
        pointSizePixels = obj.pointSizePixels;

        SelectAll();
    }

    public boolean equals(SubsetAttributes obj)
    {
        int i;

        // Create the return value
        return ((colorType == obj.colorType) &&
                (colorTableName == obj.colorTableName) &&
                (filledFlag == obj.filledFlag) &&
                (legendFlag == obj.legendFlag) &&
                (lineStyle == obj.lineStyle) &&
                (lineWidth == obj.lineWidth) &&
                (singleColor == obj.singleColor) &&
                (multiColor == obj.multiColor) &&
                (subsetNames == obj.subsetNames) &&
                (subsetType == obj.subsetType) &&
                (opacity == obj.opacity) &&
                (wireframe == obj.wireframe) &&
                (drawInternal == obj.drawInternal) &&
                (smoothingLevel == obj.smoothingLevel) &&
                (pointSize == obj.pointSize) &&
                (pointType == obj.pointType) &&
                (pointSizeVarEnabled == obj.pointSizeVarEnabled) &&
                (pointSizeVar == obj.pointSizeVar) &&
                (pointSizePixels == obj.pointSizePixels));
    }

    public String GetName() { return "Subset"; }
    public String GetVersion() { return "1.0"; }

    // Property setting methods
    public void SetColorType(int colorType_)
    {
        colorType = colorType_;
        Select(0);
    }

    public void SetColorTableName(String colorTableName_)
    {
        colorTableName = colorTableName_;
        Select(1);
    }

    public void SetFilledFlag(boolean filledFlag_)
    {
        filledFlag = filledFlag_;
        Select(2);
    }

    public void SetLegendFlag(boolean legendFlag_)
    {
        legendFlag = legendFlag_;
        Select(3);
    }

    public void SetLineStyle(int lineStyle_)
    {
        lineStyle = lineStyle_;
        Select(4);
    }

    public void SetLineWidth(int lineWidth_)
    {
        lineWidth = lineWidth_;
        Select(5);
    }

    public void SetSingleColor(ColorAttribute singleColor_)
    {
        singleColor = singleColor_;
        Select(6);
    }

    public void SetMultiColor(ColorAttributeList multiColor_)
    {
        multiColor = multiColor_;
        Select(7);
    }

    public void SetSubsetNames(Vector subsetNames_)
    {
        subsetNames = subsetNames_;
        Select(8);
    }

    public void SetSubsetType(int subsetType_)
    {
        subsetType = subsetType_;
        Select(9);
    }

    public void SetOpacity(double opacity_)
    {
        opacity = opacity_;
        Select(10);
    }

    public void SetWireframe(boolean wireframe_)
    {
        wireframe = wireframe_;
        Select(11);
    }

    public void SetDrawInternal(boolean drawInternal_)
    {
        drawInternal = drawInternal_;
        Select(12);
    }

    public void SetSmoothingLevel(int smoothingLevel_)
    {
        smoothingLevel = smoothingLevel_;
        Select(13);
    }

    public void SetPointSize(double pointSize_)
    {
        pointSize = pointSize_;
        Select(14);
    }

    public void SetPointType(int pointType_)
    {
        pointType = pointType_;
        Select(15);
    }

    public void SetPointSizeVarEnabled(boolean pointSizeVarEnabled_)
    {
        pointSizeVarEnabled = pointSizeVarEnabled_;
        Select(16);
    }

    public void SetPointSizeVar(String pointSizeVar_)
    {
        pointSizeVar = pointSizeVar_;
        Select(17);
    }

    public void SetPointSizePixels(int pointSizePixels_)
    {
        pointSizePixels = pointSizePixels_;
        Select(18);
    }

    // Property getting methods
    public int                GetColorType() { return colorType; }
    public String             GetColorTableName() { return colorTableName; }
    public boolean            GetFilledFlag() { return filledFlag; }
    public boolean            GetLegendFlag() { return legendFlag; }
    public int                GetLineStyle() { return lineStyle; }
    public int                GetLineWidth() { return lineWidth; }
    public ColorAttribute     GetSingleColor() { return singleColor; }
    public ColorAttributeList GetMultiColor() { return multiColor; }
    public Vector             GetSubsetNames() { return subsetNames; }
    public int                GetSubsetType() { return subsetType; }
    public double             GetOpacity() { return opacity; }
    public boolean            GetWireframe() { return wireframe; }
    public boolean            GetDrawInternal() { return drawInternal; }
    public int                GetSmoothingLevel() { return smoothingLevel; }
    public double             GetPointSize() { return pointSize; }
    public int                GetPointType() { return pointType; }
    public boolean            GetPointSizeVarEnabled() { return pointSizeVarEnabled; }
    public String             GetPointSizeVar() { return pointSizeVar; }
    public int                GetPointSizePixels() { return pointSizePixels; }

    // Write and read methods.
    public void WriteAtts(CommunicationBuffer buf)
    {
        if(WriteSelect(0, buf))
            buf.WriteInt(colorType);
        if(WriteSelect(1, buf))
            buf.WriteString(colorTableName);
        if(WriteSelect(2, buf))
            buf.WriteBool(filledFlag);
        if(WriteSelect(3, buf))
            buf.WriteBool(legendFlag);
        if(WriteSelect(4, buf))
            buf.WriteInt(lineStyle);
        if(WriteSelect(5, buf))
            buf.WriteInt(lineWidth);
        if(WriteSelect(6, buf))
            singleColor.Write(buf);
        if(WriteSelect(7, buf))
            multiColor.Write(buf);
        if(WriteSelect(8, buf))
            buf.WriteStringVector(subsetNames);
        if(WriteSelect(9, buf))
            buf.WriteInt(subsetType);
        if(WriteSelect(10, buf))
            buf.WriteDouble(opacity);
        if(WriteSelect(11, buf))
            buf.WriteBool(wireframe);
        if(WriteSelect(12, buf))
            buf.WriteBool(drawInternal);
        if(WriteSelect(13, buf))
            buf.WriteInt(smoothingLevel);
        if(WriteSelect(14, buf))
            buf.WriteDouble(pointSize);
        if(WriteSelect(15, buf))
            buf.WriteInt(pointType);
        if(WriteSelect(16, buf))
            buf.WriteBool(pointSizeVarEnabled);
        if(WriteSelect(17, buf))
            buf.WriteString(pointSizeVar);
        if(WriteSelect(18, buf))
            buf.WriteInt(pointSizePixels);
    }

    public void ReadAtts(int n, CommunicationBuffer buf)
    {
        for(int i = 0; i < n; ++i)
        {
            int index = (int)buf.ReadByte();
            switch(index)
            {
            case 0:
                SetColorType(buf.ReadInt());
                break;
            case 1:
                SetColorTableName(buf.ReadString());
                break;
            case 2:
                SetFilledFlag(buf.ReadBool());
                break;
            case 3:
                SetLegendFlag(buf.ReadBool());
                break;
            case 4:
                SetLineStyle(buf.ReadInt());
                break;
            case 5:
                SetLineWidth(buf.ReadInt());
                break;
            case 6:
                singleColor.Read(buf);
                Select(6);
                break;
            case 7:
                multiColor.Read(buf);
                Select(7);
                break;
            case 8:
                SetSubsetNames(buf.ReadStringVector());
                break;
            case 9:
                SetSubsetType(buf.ReadInt());
                break;
            case 10:
                SetOpacity(buf.ReadDouble());
                break;
            case 11:
                SetWireframe(buf.ReadBool());
                break;
            case 12:
                SetDrawInternal(buf.ReadBool());
                break;
            case 13:
                SetSmoothingLevel(buf.ReadInt());
                break;
            case 14:
                SetPointSize(buf.ReadDouble());
                break;
            case 15:
                SetPointType(buf.ReadInt());
                break;
            case 16:
                SetPointSizeVarEnabled(buf.ReadBool());
                break;
            case 17:
                SetPointSizeVar(buf.ReadString());
                break;
            case 18:
                SetPointSizePixels(buf.ReadInt());
                break;
            }
        }
    }


    // Attributes
    private int                colorType;
    private String             colorTableName;
    private boolean            filledFlag;
    private boolean            legendFlag;
    private int                lineStyle;
    private int                lineWidth;
    private ColorAttribute     singleColor;
    private ColorAttributeList multiColor;
    private Vector             subsetNames; // vector of String objects
    private int                subsetType;
    private double             opacity;
    private boolean            wireframe;
    private boolean            drawInternal;
    private int                smoothingLevel;
    private double             pointSize;
    private int                pointType;
    private boolean            pointSizeVarEnabled;
    private String             pointSizeVar;
    private int                pointSizePixels;
}

