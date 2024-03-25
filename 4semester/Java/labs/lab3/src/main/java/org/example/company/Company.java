package org.example.company;

import org.example.director.abstrDirector;
import org.example.emploee.Employee;
import org.example.exception.MyException;

import org.example.emploee.Employee;
import org.example.exception.MyException;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.logging.Logger;

public class Company {
    final Logger logger = Logger.getLogger(Company.class.toString());

    public String CompanyName;
    public ArrayList<Employee> employees = new ArrayList<Employee>();


    public Company(String CompanyName) {
        this.CompanyName = CompanyName;
        logger.info("Company " + CompanyName + " has been created!");
    }

    @Override
    public String toString() {
        String text = "\n--Company--\n" + "Name: " + CompanyName + "\nEmployees: \n";
        int i = 0;
        for (var a: employees
        ) {
            text += a.toString();
        }

        return text;
    }

    public void fireEmployee(Employee employeeToFire) throws MyException
    {
        if (employees.contains(employeeToFire)){
            employees.remove(employeeToFire);
            logger.info("Employee " + employeeToFire.getName() +  " has benn fired!");
            return;
        }
        throw new MyException("There is no such an employee");

    }

    public void HireAnEmployee(Employee employeeToHire)
    {
        if (employeeToHire != null)
        {
            employees.add(employeeToHire);
        }
        logger.info("Employee has been hired!");
    }

    public class Director extends abstrDirector
    {

        public String directorName;

        public Director(String directorName) {
            this.directorName = directorName;
            logger.info("Director " + directorName + " has been created!");
        }

        public int CountEmployees()
        {
            return employees.size();
        }

        public void sortEmployeesBySalary() throws MyException
        {
            if (employees.size() == 0)
            {
                throw new MyException("There is no any employees!");
            }
            employees.sort(Comparator.comparingInt(Employee::getSalary));
            System.out.println("Employees sorted in increasing order: \n");
            for (var employee : employees
            ) {
                System.out.println(employee.toString());
            }
            logger.info("Employees had been sorted!");
        }

        public void GetEmployeeWithEducation(boolean education)
        {
            for (var employee: employees){
                if(employee.HasHighDegree() == education)
                    System.out.println(employee.toString());
            }
        }
    }


}