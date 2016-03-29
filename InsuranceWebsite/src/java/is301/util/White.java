/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package is301.util;

/**
 *
 * @author lvbowen
 */
public class White {
    private String nric;
    private String licencePlate;
    private String name;
    private String vehicleType;
    private int newPremium;

    public White(String nric, String licencePlate, String name, String vehicleType, int newPremium) {
        this.nric = nric;
        this.licencePlate = licencePlate;
        this.name = name;
        this.vehicleType = vehicleType;
        this.newPremium = newPremium;
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

    public int getNewPremium() {
        return newPremium;
    }
    
    
}
