package com.update;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.reg.regCheck;

@WebServlet("/UpdateListing")
public class UpdateListing extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int bedrooms = Integer.parseInt(request.getParameter("bedroom"));
        int washrooms = Integer.parseInt(request.getParameter("washroom"));
        int guests = Integer.parseInt(request.getParameter("guests"));
        int entirePlace = Integer.parseInt(request.getParameter("entirePlace"));
        String address = request.getParameter("address");
        float price = Float.parseFloat(request.getParameter("price"));


        regCheck rc = new regCheck();
       if (!rc.nameValid(name)) {
           request.setAttribute("updateError", "Invalid property name");
           RequestDispatcher rd = request.getRequestDispatcher("modifyListing.jsp");
           rd.include(request, response);
       } else {
           updateListingInfo updt = new updateListingInfo(id, name, bedrooms, washrooms, guests, entirePlace, address, price);
           updt.exec();
           response.sendRedirect("listingUpdated.jsp");
       }
    }

}
