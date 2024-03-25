package Shower;

public class Person extends Thread{
    private String personName;
    private Gender gender;
    private Shower shower;

    public Person(String name, Gender gender, Shower shower){
        this.personName = name;
        this.gender = gender;
        this.shower = shower;
    }


    public void setPersonName(String name) {
        this.personName = name;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public void setShower(Shower shower) {
        this.shower = shower;
    }

    public String getPersonName() {
        return personName;
    }

    public Gender getGender() {
        return gender;
    }

    public Shower getShower() {
        return shower;
    }

    @Override
    public void run() {
        shower.takeShower(this);
    }
}
