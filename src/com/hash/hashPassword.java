package com.hash;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class hashPassword {
    private String password;

    public hashPassword(String password) {
        this.password = password;
    }

    public String hash() {
        String hashedPass = null;

        try {
            MessageDigest newMD = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = newMD.digest(password.getBytes(StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) sb.append(String.format("%03x", b));
            hashedPass = sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hashedPass;
    }
}
