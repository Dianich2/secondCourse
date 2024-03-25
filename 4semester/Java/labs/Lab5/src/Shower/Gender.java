package Shower;

public enum Gender {
    MAN("Men"),
    WOMAN("Woman");

    private String gender;
    Gender(String gender){
        this.gender = gender;
    }

    public String getGender(){
        return gender;
    }
}
