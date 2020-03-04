package com.update;

import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class updateListingInfo extends Update {
    int id;
    String name;
    int bedrooms;
    int washrooms;
    int guests;
    int entirePlace;
    String address;
    float price;

    public updateListingInfo(int id, String name, int bedroom, int washroom, int guest, int entirePlace, String address, float price) {
        this.id = id;
        this.name = name;
        this.bedrooms = bedroom;
        this.washrooms = washroom;
        this.entirePlace = entirePlace;
        this.guests = guest;
        this.price = price;
        this.address = address;
    }

    public void exec() {

        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("update listing SET name =?, bedrooms=?, washrooms=?, guests=?, entire_house=?, address=?, price=? WHERE id=?");
            stmt.setString(1, name);
            stmt.setInt(2, bedrooms);
            stmt.setInt(3, washrooms);
            stmt.setInt(4, guests);
            stmt.setInt(5, entirePlace);
            stmt.setString(6, address);
            stmt.setFloat(7, price);
            stmt.setInt(8, id);

            stmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
