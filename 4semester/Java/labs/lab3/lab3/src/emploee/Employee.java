package emploee;

import exception.MyException;

import java.util.logging.Logger;

public class Employee implements IEmployee{
    final Logger logger = Logger.getLogger(Employee.class.toString());

    public String name;
    public int salary;
    Boolean highDegree;
    public Positions positions;


    public Employee(String name,Integer salary, Boolean highDegree, Positions position) throws MyException {
        this.name = name;
        this.salary = salary;
        this.highDegree = highDegree;
        this.positions = position;

        logger.info("Employee " + this.name + " has been created!");
    }

    @Override
    public void Work() {
        System.out.println(this.name + " is working!");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) throws MyException{
        if (name != null && name.isEmpty())
        {
            throw new MyException("Name cannot be empty!");
        }
        this.name = name;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) throws MyException {
        if (salary < 0)
        {
            throw new MyException("Salary cannot be negative");
        }
        this.salary = salary;
    }

    public void setHighDegree(boolean h){
        this.highDegree = h;
    }

    public boolean HasHighDegree()
    {
        return highDegree;
    }

    public void setPosition(Positions positions) {
        this.positions = positions;
    }

    public Positions getPosition(){
        return positions;
    }

    @Override
    public String toString()
    {
        return "\nname: " + this.name +
                "\nHigh Degree: " + this.highDegree +
                "\nPosition: "+ positions +
                "\nSalary:" + this.salary + '\n';
    }
}