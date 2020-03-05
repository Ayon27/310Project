package com.book;

import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class redir {

    public String getPropertyName(int id) {
        String propertyName = null;
        //   System.out.println(id);

        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("select * from listing where id = ?");
            stmt.setInt(1, id);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                propertyName = result.getString("name");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return propertyName;
    }

}
