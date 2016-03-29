/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package is301.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lvbowen
 */
public class ClientDAO {
    public static ArrayList<Client> getAllClient(){
        ArrayList<Client> clientList = new ArrayList<Client>();
        
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement preStmt = null;
        try {
            conn = ConnectionManager.getConnection();
            String sql = "select * from client";
            preStmt = conn.prepareStatement(sql);
            
            rs= preStmt.executeQuery();

            while(rs.next()){
                Client c = new Client(rs.getString("nric"),rs.getString("licencePlate"),rs.getString("name"),rs.getString("vehicleType"),rs.getInt("currentPremium"),
                        rs.getTimestamp("startDate"), rs.getTimestamp("endDate"),rs.getString("drivingTier"),
                        rs.getString("email"));
                clientList.add(c);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, preStmt, rs);
        }
        return clientList;
    }
    
    public static ArrayList<White> getWhite(){
        ArrayList<White> whiteList = new ArrayList<White>();
        
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement preStmt = null;
        try {
            conn = ConnectionManager.getConnection();
            String sql = "select * from waitinglist";
            preStmt = conn.prepareStatement(sql);
            
            rs= preStmt.executeQuery();

            while(rs.next()){
                White w = new White(rs.getString("nric"),rs.getString("licencePlate"),rs.getString("name"),rs.getString("vehicleType"),rs.getInt("newPremium"));
                whiteList.add(w);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, preStmt, rs);
        }
        return whiteList;
    }
    
    public static ArrayList<Black> getBlack(){
        ArrayList<Black> blackList = new ArrayList<Black>();
        
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement preStmt = null;
        try {
            conn = ConnectionManager.getConnection();
            String sql = "select * from blacklist";
            preStmt = conn.prepareStatement(sql);
            
            rs= preStmt.executeQuery();

            while(rs.next()){
                Black b = new Black(rs.getString("nric"),rs.getString("licencePlate"),rs.getString("name"),rs.getString("vehicleType"),rs.getString("reason"));
                blackList.add(b);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, preStmt, rs);
        }
        return blackList;
    }
}
