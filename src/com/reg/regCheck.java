package com.reg;

import com.DB.DatabaseConnection;
import com.hash.hashPassword;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class regCheck extends Thread {
    private String name;
    private String address;
    private String phone;
    private String email;
    private String password;
    private String country;
    private String state;

    public regCheck(String n, String a, String p, String m, String pass, String country, String state) {
        name = n;
        address = a;
        phone = p;
        email = m;
        password = new hashPassword(pass).hash();
        this.country = country;
        this.state = state;
    }
    public regCheck(){}

    public boolean emailValid() {
        boolean valid = false;
        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("select * from user where email =?");
            stmt.setString(1, email);
            ResultSet result = stmt.executeQuery();
            if(!result.next()) {
                valid = true;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return valid;
    }

    public boolean nameValid(String str) {
        boolean valid = true;

        String test = str.trim();
        if(test.length() == 0) {
            valid = false;
        }

        char[] nameArr = str.replaceAll(" ", "").toCharArray();
        for (char c : nameArr) {
            if (!Character.isLetter(c)) {
                valid = false;
                break;
            }
        }
        return valid;
    }

    public boolean numberValid() {

        boolean valid = true;
        String test = phone.trim();
        if(test.length() == 0) {
            valid = false;
        }

        char[] numberArr = phone.toCharArray();
        for (char c : numberArr) {
            if (!Character.isDigit(c)) {
                valid = false;
                break;
            }
        }
        return valid;
    }

    public void run() {
        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("insert into user (email, pass, name, country, state, address, phone) values (?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, country);
            stmt.setString(5, state);
            stmt.setString(6, address);
            stmt.setString(7, phone);

            stmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
