package com.xadmin.CVehicleManagement.been;

public class Vehicle {
    
    private int id;
    private String name;
    private String availability;
    private String duration;
    
    public Vehicle() {
    }
    
    public Vehicle(int id, String name, String availability, String duration) {
        this.id = id;
        this.name = name;
        this.availability = availability;
        this.duration = duration;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

}

