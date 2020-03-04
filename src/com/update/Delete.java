package com.update;

import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Delete {
    private int id;

    public Delete(String id) {
        this.id = Integer.parseInt(id);
    }

    public void deleteExec() {

        Connection conn = DatabaseConnection.getConnection();
        try {
            PreparedStatement stmt = conn.prepareStatement("DELETE from listing where id=?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
