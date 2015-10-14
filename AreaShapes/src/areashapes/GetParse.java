package areashapes;

import java.io.File;
import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.SAXException;

public class GetParse {

    public static void main(String[] args) {
        String filePath = args[0];
        SAXParserFactory fileParser = SAXParserFactory.newInstance();
        Handler handler = new Handler();
        try {
            SAXParser saxparser = fileParser.newSAXParser();
            saxparser.parse(new File(filePath), handler);
        } catch (ParserConfigurationException | SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
