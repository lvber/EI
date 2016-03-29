/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package is301.util;

import java.sql.Timestamp;

/**
 *
 * @author lvbowen
 */
public class Client {
    private String nric;
    private String licencePlate;
    private String name;
    private String vehicleType;
    private int currentPremium;
    private Timestamp startDate;
    private Timestamp endDate;
    private String drivingTier;
    private String email;

    public Client(String nric, String licencePlate, String name, String vehicleType, int currentPremium, Timestamp startDate, Timestamp endDate, String drivingTier, String email) {
        this.nric = nric;
        this.licencePlate = licencePlate;
        this.name = name;
        this.vehicleType = vehicleType;
        this.currentPremium = currentPremium;
        this.startDate = startDate;
        this.endDate = endDate;
        this.drivingTier = drivingTier;
        this.email = email;
    }

    public String getNric() {
        return nric;
    }

    public String getLicencePlate() {
        return licencePlate;
    }

    public String getName() {
        return name;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public int getCurrentPremium() {
        return currentPremium;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public String getDrivingTier() {
        return drivingTier;
    }

    public String getEmail() {
        return email;
    }
    
    
}
