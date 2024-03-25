package com.example.lab910.entities;


public class User {
    private int id;

    private String username;
    
    private ROLES role;

    private String password;

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public ROLES getRole() {return role;}

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setRole(ROLES role){this.role = role;}

    public void setPassword(String password) {
        this.password = password;
    }
}
