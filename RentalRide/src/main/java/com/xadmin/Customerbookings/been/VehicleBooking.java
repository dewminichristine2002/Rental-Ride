package com.xadmin.Customerbookings.been;

public class VehicleBooking {
    private String vehicleName;
    private String rentalDuration;
    private String customerName;

    public VehicleBooking() {
    }

    public VehicleBooking(String vehicleName, String rentalDuration, String customerName) {
        this.vehicleName = vehicleName;
        this.rentalDuration = rentalDuration;
        this.customerName = customerName;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public String getRentalDuration() {
        return rentalDuration;
    }

    public void setRentalDuration(String rentalDuration) {
        this.rentalDuration = rentalDuration;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}

