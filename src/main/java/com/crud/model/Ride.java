package com.crud.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Ride {
    private int id;
    private String email;
    private int days;
    private double amount;
    private String fileName;
    private String car;
    private Date startDate;
    private Date endDate;
    private Time pickupTime;
    private Timestamp reservationTime;
    private String status; // "UPCOMING", "COMPLETED", "CANCELLED"
    
    // Constructors
    public Ride() {}
    
    public Ride(String email, int days, double amount, String fileName, String car) {
        this.email = email;
        this.days = days;
        this.amount = amount;
        this.fileName = fileName;
        this.car = car;
        this.status = "UPCOMING"; // Default status
    }
    
    // Full constructor
    public Ride(int id, String email, int days, double amount, String fileName, 
               String car, Date startDate, Date endDate, Time pickupTime, 
               Timestamp reservationTime, String status) {
        this.id = id;
        this.email = email;
        this.days = days;
        this.amount = amount;
        this.fileName = fileName;
        this.car = car;
        this.startDate = startDate;
        this.endDate = endDate;
        this.pickupTime = pickupTime;
        this.reservationTime = reservationTime;
        this.status = status;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public int getDays() {
        return days;
    }
    public void setDays(int days) {
        this.days = days;
    }
    public double getAmount() {
        return amount;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getCar() {
        return car;
    }
    public void setCar(String car) {
        this.car = car;
    }
    public Date getStartDate() {
        return startDate;
    }
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public Time getPickupTime() {
        return pickupTime;
    }
    public void setPickupTime(Time pickupTime) {
        this.pickupTime = pickupTime;
    }
    public Timestamp getReservationTime() {
        return reservationTime;
    }
    public void setReservationTime(Timestamp reservationTime) {
        this.reservationTime = reservationTime;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
    // Business logic methods
    public boolean isCancellable() {
        if (!"UPCOMING".equals(status)) {
            return false;
        }
        
        if (reservationTime == null) {
            return false;
        }
        
        long oneHourInMillis = 3600000; // 1 hour in milliseconds
        long currentTime = System.currentTimeMillis();
        long reservationTimeMillis = reservationTime.getTime();
        
        return (reservationTimeMillis + oneHourInMillis) > currentTime;
    }
    
    public boolean isCompleted() {
        return "COMPLETED".equals(status);
    }
    
    public boolean isUpcoming() {
        return "UPCOMING".equals(status);
    }
}