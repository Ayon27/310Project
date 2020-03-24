package com.addPlace;

import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BetterPlace extends Place {
    private int entirePlace;
    private int has_gym;
    private int has_pool;
    private float price;
    private int userID;
    private String name;

    private int bedrooms;
    private int washrooms;
    private int guests;
    private String country;
    private String state;
    private String address;
    private String userName;

    public BetterPlace(int bdrm, int wshrm, int gst, int entire, int gym, int pool, String cntry, String state, String address, float price) {
        entirePlace = entire;
        has_gym = gym;
        has_pool = pool;
        this.price = price;

        Place p = new Place();
        p.setBedrooms(bdrm);
        p.setWashrooms(wshrm);
        p.setGuests(gst);
        p.setCountry(cntry);
        p.setState(state);
        p.setAddress(address);
        this.bedrooms = p.getBedrooms();
        this.washrooms = p.getWashrooms();
        this.guests = p.getGuests();
        this.country = p.getCountry();
        this.state = p.getState();
        this.address = p.getAddress();

    }

    public void setUserName(String s) {
        userName = s;
    }

    public void insertIntoDB() {
        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("insert into listing " +
                    "(host_id, name, bedrooms, washrooms, guests, entire_house, has_pool, has_gym," +
                    " country, state, address, price, hostName) " +
                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setInt(1, userID);
            stmt.setString(2, name);
            stmt.setInt(3, bedrooms);
            stmt.setInt(4, washrooms);
            stmt.setInt(5, guests);
            stmt.setInt(6, entirePlace);
            stmt.setInt(7, has_pool);
            stmt.setInt(8, has_gym);
            stmt.setString(9, country);
            stmt.setString(10, state);
            stmt.setString(11, address);
            stmt.setFloat(12, price);
            stmt.setString(13, userName);
            stmt.executeUpdate();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public void setCurrentUser(String s) {
        userID = Integer.parseInt(s);
    }
    public void setName(String s) {
        name = s;
    }
}
