package com.book;

import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class finalizeBooking<T> {
    private T placeID;
    public String checkIn;
    public String checkOut;
    public int userID;

    public void setPlaceID(T i) {
        placeID = i;
    }

    public void setUserID(String s) {
        userID = Integer.parseInt(s);
    }

    public finalizeBooking(String cin, String cout, int i) {
        checkIn = cin;
        checkOut = cout;

    }

    public int book() {
        int bookingID = 0;
        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("insert into booking (check_in, check_out, user_id, listing_id) values (?, ?, ?, ?)");
            stmt.setString(1, checkIn);
            stmt.setString(2, checkOut);
            stmt.setInt(3, userID);
            stmt.setInt(4, (Integer) placeID);

            stmt.executeUpdate();

            PreparedStatement stmtForHistory = conn.prepareStatement("insert into bookinghistory (check_in, check_out, user_id, listing_id) values (?, ?, ?, ?)");
            stmtForHistory.setString(1, checkIn);
            stmtForHistory.setString(2, checkOut);
            stmtForHistory.setInt(3, userID);
            stmtForHistory.setInt(4, (Integer) placeID);

            stmtForHistory.executeUpdate();

            PreparedStatement stmt1 = conn.prepareStatement("select max(booking_id) as maxid from booking");
            ResultSet resultSet = stmt1.executeQuery();
            if (resultSet.next()) {
                bookingID = resultSet.getInt("maxid");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingID;
    }
}
