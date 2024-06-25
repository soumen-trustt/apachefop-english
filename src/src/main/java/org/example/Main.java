package org.example;
import org.apache.fop.apps.*;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            // Step 1: Construct a FopFactory
            FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());

            // Step 2: Set up output stream.
            OutputStream out = new BufferedOutputStream(new FileOutputStream(new File("output.pdf")));

            try {
                // Step 3: Construct fop with desired output format
                Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);

                // Step 4: Setup JAXP using XSLT transformer
                TransformerFactory factory = TransformerFactory.newInstance();
                Source xslt = new StreamSource(new File("/home/soumenmanna/Desktop/apachefop/src/src/main/resources/stylesheet.xsl"));
                Transformer transformer = factory.newTransformer(xslt);

                // Step 5: Setup input and output for XSLT transformation
                Source src = new StreamSource(new File("/home/soumenmanna/Desktop/apachefop/src/src/main/resources/input.xml"));

                // Resulting SAX events (the generated FO) must be piped through to FOP
                Result res = new SAXResult(fop.getDefaultHandler());

                // Step 6: Start XSLT transformation and FOP processing
                transformer.transform(src, res);
            } finally {
                //Clean-up
                out.close();
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
            System.exit(-1);
        }
    }
}