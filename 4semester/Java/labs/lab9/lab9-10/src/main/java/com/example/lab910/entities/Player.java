package com.example.lab910.entities;


public class Player {

    private int id;

    private int coachId;

    private String name;

    private String tel;

    private String email;

    public Player(){

    }

    public Player(int coachId, String name, String tel, String email){
        this.coachId = coachId;
        this.name = name;
        this.tel = tel;
        this.email = email;
    }

    public Player(int id, int coachId, String name, String tel, String email){
        this.id = id;
        this.coachId = coachId;
        this.name = name;
        this.tel = tel;
        this.email = email;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCoachId(int coachId){
        this.coachId = coachId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public int getCoachId() {return coachId;}

    public String getName() {
        return name;
    }

    public String getTel() {
        return tel;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "Player: id: " + id + ", coachId: " + coachId +
                ", name: " + name + ", tel: " + tel + "email: " + email;
    }
}
