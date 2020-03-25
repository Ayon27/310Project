package com.update;

import com.reg.regCheck;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        HttpSession session = request.getSession(false);

        Update updateProfile = new Update(name, email, phone, state, address, country);
        String s = (String) session.getAttribute("id");
        int userID = (Integer.parseInt(s));
        updateProfile.setuserID((String) session.getAttribute("id"));
        if (regCheck.emailValid(email, userID)) updateProfile.insert();
        response.sendRedirect("profile.jsp");
    }
}