package com.crud.model;

import java.sql.Timestamp;

public class User {
    private int id;
    private String fname;
    private String lname;
    private String phone;
    private String email;
    private String password;
    private String userRole;
    private String filename;  // New field for profile picture filename
    private int loginAttempts;
    private Timestamp lastFailedLogin;

    // Constructors
    public User() {}

    public User(String fname, String lname, String phone, String email, 
               String password, String userRole, String filename) {
        this.fname = fname;
        this.lname = lname;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.userRole = userRole;
        this.filename = filename;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getFname() { return fname; }
    public void setFname(String fname) { this.fname = fname; }
    
    public String getLname() { return lname; }
    public void setLname(String lname) { this.lname = lname; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getUserRole() { return userRole; }
    public void setUserRole(String userRole) { this.userRole = userRole; }
    
    public String getFilename() { return filename; }
    public void setFilename(String filename) { this.filename = filename; }
    
    public int getLoginAttempts() { return loginAttempts; }
    public void setLoginAttempts(int loginAttempts) { this.loginAttempts = loginAttempts; }
    
    public Timestamp getLastFailedLogin() { return lastFailedLogin; }
    public void setLastFailedLogin(Timestamp lastFailedLogin) { this.lastFailedLogin = lastFailedLogin; }

    // Optional: Helper method to get full name
    public String getFullName() {
        return fname + " " + lname;
    }
}