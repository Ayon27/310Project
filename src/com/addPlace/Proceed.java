package com.addPlace;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.reg.regCheck;

@WebServlet("/Proceed")
public class Proceed extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        int numberofBedrooms = Integer.parseInt(request.getParameter("bedroom"));
        int numberofWashrooms = Integer.parseInt(request.getParameter("washroom"));
        int numberOfGuests = Integer.parseInt(request.getParameter("guests"));
        int entirePlace = Integer.parseInt(request.getParameter("entirePlace"));
        int gym = Integer.parseInt(request.getParameter("has_gym"));
        int pool = Integer.parseInt(request.getParameter("has_pool"));
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String address = request.getParameter("address");
        float price = Float.parseFloat(request.getParameter("price"));
        String userName;

        regCheck check = new regCheck();
        boolean countryValid = check.nameValid(country);
        boolean stateValid = check.nameValid(state);

        if (!countryValid || !stateValid) {
            request.setAttribute("hostError", "Invalid country/state. Only alphabets are accepted");
            RequestDispatcher rd = request.getRequestDispatcher("host.jsp");
            rd.include(request, response);
        } else {
            HttpSession session = request.getSession(false);
            String currentUserID = (String) session.getAttribute("id");
            userName = (String) session.getAttribute("name");

            BetterPlace bp = new BetterPlace(numberofBedrooms, numberofWashrooms, numberOfGuests, entirePlace, gym, pool, country, state, address, price);
            bp.setCurrentUser(currentUserID);
            bp.setUserName(userName);
            bp.setName(name);
            bp.insertIntoDB();

            response.sendRedirect("listingAdded.jsp");

        }
    }
}

