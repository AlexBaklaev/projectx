package areashapes;

import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;
import java.util.ArrayList;

public class Handler extends DefaultHandler {

    ArrayList<String> values = new ArrayList<String>();
    Long counter = 1L;
    String currentElement;
    String endElement;
    String trimValue;

    @Override
    public void characters(char[] ch, int start, int end) {
        trimValue = new String(ch, start, end).trim();
    }

    @Override
    public void endElement(String namespace, String localName, String tagName) {
        if (tagName.equals("color") || tagName.equals("side") || tagName.equals("diameter")) {
            values.add(trimValue);
        }
        if (tagName.equals("triangle") || tagName.equals("circle") || tagName.equals("square") || tagName.equals("rectangle")) {
            getArea(tagName, values);
        }
    }
    
    public void getArea(String shapeName, ArrayList<String> shapeValues) {
        switch (shapeName) {
            case "triangle":
                Double sideTriangleA = Double.valueOf(shapeValues.get(1));
                Double sideTriangleB = Double.valueOf(shapeValues.get(2));
                Double sideTriangleC = Double.valueOf(shapeValues.get(3));
                Double p = (sideTriangleA + sideTriangleB + sideTriangleC) / 2;
                Double areaTriangle = Math.sqrt(p * (p - sideTriangleA) * (p - sideTriangleB) * (p - sideTriangleC));
                System.out.println(counter++ + ": " + shapeValues.get(0) + " - " + Math.rint(100.0 * areaTriangle) / 100.0);
                values.clear();
                break;

            case "circle":
                Double diameterCircle = Double.valueOf(shapeValues.get(1));
                Double radiusCircle = diameterCircle / 2;
                Double areaCircle = 3.14 * (radiusCircle * radiusCircle);
                System.out.println(counter++ + ": " + shapeValues.get(0) + " - " + Math.rint(100.0 * areaCircle) / 100.0);
                values.clear();
                break;

            case "square":
                Double sideSquare = Double.valueOf(shapeValues.get(1));
                Double areaSquare = sideSquare * sideSquare;
                System.out.println(counter++ + ": " + shapeValues.get(0) + " - " + Math.rint(100.0 * areaSquare) / 100.0);
                values.clear();
                break;

            case "rectangle":
                Double sideRectangleA = Double.valueOf(shapeValues.get(1));
                Double sideRectangleB = Double.valueOf(shapeValues.get(2));
                Double areaRectangle = sideRectangleA * sideRectangleB;
                System.out.println(counter++ + ": " + shapeValues.get(0) + " - " + Math.rint(100.0 * areaRectangle) / 100.0);
                values.clear();
                break;
        }
    }
}
