package com.book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/confirmed")

public class confirmed extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String placeID = request.getParameter("placeID");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        HttpSession session = request.getSession(false);
        if ((session.getAttribute("name") == null) || (session.getAttribute("id") == null)) {
            response.sendRedirect("login.jsp");
        } else {
            String s = (String) session.getAttribute("id");

            if ((checkIn.matches("\\d{4}-\\d{2}-\\d{2}")) && (checkIn.matches("\\d{4}-\\d{2}-\\d{2}"))) {
                finalizeBooking<Integer> fb = new finalizeBooking<>(checkIn, checkOut, 33);
                fb.setPlaceID(Integer.parseInt(placeID));
                fb.setUserID(s);
                int bookingID = fb.book();

                session.setAttribute("bookingID", "");
                String url = "Booked.jsp?bookingID=" + bookingID;
                response.sendRedirect(url);
            } else {
                request.setAttribute("noDateMsg", "Please Enter Dates to check availability");
                redir r = new redir();

                request.setAttribute("noDateMsg", "Enter date to check availability");
                request.setAttribute("defName", r.getPropertyName(Integer.parseInt(placeID)));
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
        }
    }
}
