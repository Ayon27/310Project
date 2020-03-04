package com.login;

import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hash.hashPassword;

public class loginCheck<T> implements loginCheckInterface {
    private T email;
    public String userID;

    public void setEmail(T email) {
        this.email = email;
    }

    @Override
    public boolean check(String email, String password) {
        boolean found = false;
        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("select * from user where email = ? and pass = ?");
            String hashedPass = new hashPassword(password).hash();
            stmt.setString(1, email);
            stmt.setString(2, hashedPass);
            ResultSet result = stmt.executeQuery();
            found = result.next();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return found;
    }

    public String getName() {
        String name = null;
        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("select * from user where email = ?");
            String emailStr = email.toString();
            stmt.setString(1, emailStr);
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                name = result.getString("name");
                userID = result.getString("id");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public String getUserID() {
        return userID;
    }
}
