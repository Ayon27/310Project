package com.Search;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Search")
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        String checkIn = request.getParameter("cinDate");
        String checkOut = request.getParameter("coutDate");
        int guestCount = Integer.parseInt(request.getParameter("guestCount"));

        //response.getWriter().println(key+" "+checkIn+" "+checkOut+" "+guestCount);


    }
}
