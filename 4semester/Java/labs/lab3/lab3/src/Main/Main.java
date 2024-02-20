package Main;


import company.Company;
import emploee.Employee;
import emploee.Positions;
import exception.MyException;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {
    public static void main(String[] args)
    {
        final Logger logger = Logger.getLogger(Main.class.toString());
        logger.setLevel(Level.INFO);

        try {
            logger.info("Program beginning");


            Employee em1 = new Employee("employee1",900, true, Positions.MIDDLE);
            Employee em2 = new Employee("employee2", 2500, false, Positions.SENIOR);
            Employee em3 = new Employee("employee3", 200, true, Positions.TRAINEE);
            Employee em4 = new Employee("employee4", 500, false, Positions.JUNIOR);
            Employee em5 = new Employee("employee5", 4400, true, Positions.SENIOR);

            Company myCompany = new Company("Some company");
            Company.Director DirectorOfCompany = myCompany.new Director("Director");
            myCompany.HireAnEmployee(em1);
            myCompany.HireAnEmployee(em2);
            myCompany.HireAnEmployee(em3);
            myCompany.HireAnEmployee(em4);
            myCompany.HireAnEmployee(em5);

            System.out.println(myCompany.toString());
            System.out.println("Amount of company's employees: "); DirectorOfCompany.CountEmployees();
            System.out.println("Employees who has high degree: \n");
            DirectorOfCompany.GetEmployeeWithEducation(true);
            DirectorOfCompany.sortEmployeesBySalary();

            logger.info("Program ending");
        }
        catch (MyException ex)
        {
            System.out.println("Error: " + ex.getMessage());
        }
    }

}