package com.update;

import com.reg.regCheck;
import com.DB.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.hash.hashPassword;

public class Update {
    private String state;
    private String address;
    private String phone;
    private String hashedPass;

    public Update() {}

    public Update(String st, String add, String nmbr, String password) {
        state = st;
        address = add;
        phone = nmbr;
        hashedPass = new hashPassword(password).hash();
    }

    public void execute() {

    }
}
