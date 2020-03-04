package com.login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //response.getWriter().println(email +" "+ password);

        loginCheck <String> lc = new loginCheck<>();

        lc.setEmail(email);

        if (lc.check(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("name", lc.getName());
            session.setAttribute("id", lc.getUserID());
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("loginErr", "Invalid email/password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.include(request, response);
        }
    }
}
