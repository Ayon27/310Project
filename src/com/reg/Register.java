package com.reg;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.DB.DatabaseConnection;

import com.hash.hashPassword;


@WebServlet("/Register")
public class Register extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        ArrayList<String> errorList = new ArrayList<String>();

        regCheck check = new regCheck(name, address, phone, email, password, country, state);

        boolean nm = true;
        boolean phn = true;
        boolean ctry = true;
        boolean st = true;
        boolean emailValid = true;

        if (!check.nameValid(name)) {
            nm = false;
            errorList.add("Invalid Name");
        }

        if (!check.nameValid(country)) {
            ctry = false;
            errorList.add("Invalid Country");
        }

        if (!check.nameValid(country)) {
            st = false;
            errorList.add("Invalid State");
        }

        if (!check.numberValid()) {
            phn = false;
            errorList.add("Invalid Phone Number");
        }

        if (!check.emailValid()) {
            emailValid = false;
            errorList.add("Email already registered");
        }

        if (nm && phn && ctry && st && emailValid) {
            check.start();
            response.sendRedirect("Successful.html");
        } else {
            StringBuilder sb = new StringBuilder();

            for (String s : errorList) {
                sb.append("#");
                sb.append(s);
                sb.append(" ");
            }
            String errMsg = sb.toString();
            request.setAttribute("error", errMsg);
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.include(request, response);
        }
    }
}