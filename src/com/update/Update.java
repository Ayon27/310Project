package com.update;

import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Update {
    private String name;
    private String email;
    private String phone;
    private String address;
    private String state;
    private String country;

    private int userid = 0;

    public Update() {
    }

    public void setuserID(String s) {
        userid = Integer.parseInt(s);
    }

    public Update(String nm, String email, String phn, String add, String st, String cntry) {
        name = nm;
        this.email = email;
        phone = phn;
        address = add;
        state = st;
        country = cntry;
    }

    public void insert() {
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("update user set name = ?, email = ?,  phone = ?, address = ?, state = ?, country = ? where id = ?");
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, state);
            stmt.setString(6, country);
            stmt.setInt(7, userid);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
