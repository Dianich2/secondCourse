package org.example;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import org.apache.log4j.LogManager;
import org.apache.log4j.xml.DOMConfigurator;
import org.example.Company.Company;
import org.example.Parser;
import org.example.Staff.Engineer;
import org.example.Staff.ProgType;
import org.example.Staff.Programmer;
import org.example.Staff.SysAdmin;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Logger;

public class Main {
    private static final Logger LOG = Logger.getLogger(Main.class.toString());
    public static void main(String[] args) {

        //2. Произвести проверку валидности XML-документа с привлечением XSD.
        String filename = "files/info.xml";
        String schemaName = "files/info.xsd";
        Schema schemas = null;

        String language = XMLConstants.W3C_XML_SCHEMA_NS_URI;
        SchemaFactory factory = SchemaFactory.newInstance(language);

        Company ITCompany = new Company();
        Company.Director director = ITCompany.new Director("Bill Gates");
        ITCompany.addWorker(new Engineer("Employee1", "1", 20, 5, 3));
        ITCompany.addWorker(new SysAdmin("Employee2", "2", 28, 3000, 6));
        ITCompany.addWorker(new Programmer("Employee3", "3", 27, 4000,
                7, ProgType.Middle));
        ITCompany.addWorker(new Programmer("Employee4", "4", 30, 4500,
                10, ProgType.Senior));
        ITCompany.addWorker(new Programmer("Employee5", "5", 29, 4500,
                10, ProgType.Senior));

        try {
            schemas = factory.newSchema(new File(schemaName));
            Validator validator = schemas.newValidator();
            Source source = new StreamSource(filename);
            validator.validate(source);
            LOG.info(filename + " is valid");
        }
        catch (SAXException e) {
            LOG.warning(filename + " SAX error " + e.getMessage());
        }
        catch (IOException e) {
            LOG.warning(" io error " + e.getMessage());
        }

        //4. Для разбора использовать на выбор один из: SAX (Simpl API for XML),
        try {
            XMLReader reader = XMLReaderFactory.createXMLReader();
            Parser parser = new Parser();
            reader.setContentHandler(parser);
            reader.parse("files/info.xml");
        }
        catch (SAXException e){
            LOG.warning(filename + " SAX error " + e.getMessage());
        }
        catch (IOException e){
            LOG.warning(" io error " + e.getMessage());
        }

        //5. Добавьте методы сериализация и десериализации в JSON файл
        try(FileWriter writer = new FileWriter("json/task5.json", false)) {
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String json = gson.toJson(ITCompany.getStaff());
            writer.write(json);
            writer.flush();
        }
        catch (IOException e){
            LOG.warning(" io error " + e.getMessage());
        }

        //6. Добавьте в проект работу со StreamAPI для обработки данных
        System.out.println();
        var result = ITCompany.getStaff().stream().filter(w -> w.getAge() > 28).toArray();
        for (var w: result) {
            System.out.println(w);
        }
    }
}