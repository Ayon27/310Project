package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection implements DatabaseInfo {

    static Connection conn = null;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
