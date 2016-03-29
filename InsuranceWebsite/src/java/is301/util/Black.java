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
public class Black {
    private String nric;
    private String licencePlate;
    private String name;
    private String vehicleType;
    private String reason;

    public Black(String nric, String licencePlate, String name, String vehicleType, String reason) {
        this.nric = nric;
        this.licencePlate = licencePlate;
        this.name = name;
        this.vehicleType = vehicleType;
        this.reason = reason;
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

    public String getReason() {
        return reason;
    }
    
    
}
