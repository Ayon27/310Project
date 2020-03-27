<%@ page import="com.DB.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if ((session.getAttribute("name") == null) || (session.getAttribute("id") == null)) {
        response.sendRedirect("login.jsp");
    }
    if (request.getParameter("key") == null || request.getParameter("cinDate") == null || request.getParameter("coutDate") == null
            || request.getParameter("guestCount") == null) {
        response.sendRedirect("index.jsp");
    } else {
        String key = request.getParameter("key");
        key = key.trim();
        String checkIn = request.getParameter("cinDate");
        String checkOut = request.getParameter("coutDate");
        int guestCount = Integer.parseInt(request.getParameter("guestCount"));
        // out.print(key + " " + checkIn + " " + checkOut + " " + guestCount);
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Search</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>
<%@include  file="assets/header.jsp"%>

<div class="container">
    <%
        String s = (String) session.getAttribute("id");
        int id = Integer.parseInt(s);

        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement
                    ("SELECT * from listing WHERE id NOT IN (SELECT listing_id from booking WHERE check_in <= ? AND check_out >= ?)" +
                            " AND (country LIKE ? OR state LIKE ? OR address LIKE ? OR name LIKE ?) AND (guests >= ?) AND (host_id !=?)");
            stmt.setString(1, checkOut);
            stmt.setString(2, checkIn);
            stmt.setString(3, "%" + key + "%");
            stmt.setString(4, "%" + key + "%");
            stmt.setString(5, "%" + key + "%");
            stmt.setString(6, "%" + key + "%");
            stmt.setInt(7, guestCount);
            stmt.setInt(8, id);


            ResultSet result = stmt.executeQuery();

    %>
    <form class="form-inline d-flex justify-content-center md-form form-sm active-purple active-purple-2 mt-2">
        <i class="fas fa-search" aria-hidden="true"></i>
        <input readonly style="border:none;  border-bottom: 1px solid #ce93d8;
              box-shadow: 0 1px 0 0 #ce93d8;" class="form-control form-control-sm ml-3 w-75" type="text"
               placeholder=""
               value="<%=key%>">
    </form>
    <%

        if (!result.next()) {
    %>
    <div class="row" style="margin: 50px auto auto auto;">
        <i class='far fa-dizzy' style='font-size:256px; color:grey;'></i>
        <p class="text text-secondary" style="font-size: 32px; margin-top: 100px; margin-left: 50px">
            Nothing found for you that matches your criteria!
        </p>
    </div>


    <%
    } else {
        result.beforeFirst();
        while (result.next()) {
            String gym = "No Gym";
            String pool = "No Pool";
            String entireHouse = "Shared Place";

            if (result.getString("entire_house").equals("1")) {
                entireHouse = "Entire Place";
            }
            if (result.getString("has_gym").equals("1")) {
                gym = "Has a Gym";
            }
            if (result.getString("has_pool").equals("1")) {
                pool = "Has a Pool";
            }
    %>
    <a style="text-decoration: none; color: black"
       href="confirmBooking.jsp?placeID=<%=result.getString("id")%>&checkIN=<%=checkIn%>&checkOut=<%=checkOut%>">
        <div class="card" style="margin-top: 30px; margin-bottom: 100px">
            <div class="card-body">
                <img class="card-img-top" src="assets/download.png" alt="Card image cap"
                     style="width: 200px; margin-top: 68px; margin-left: 20px" align="left">

                <div class='pt-4'></div>

                <h4 class="card-title text-center"><%=result.getString("name")%>
                </h4>
                <h6 class="card-title text-center"><%=result.getString("address") + ", " + result.getString("state") + ", " + result.getString("country")%>
                </h6>

                <p class="card-text text-center"><%=entireHouse + ", " + gym + ", " + pool%>
                </p>
                <p class="card-text text-center">Bedrooms: <%=result.getString("bedrooms")%> ,
                    Washrooms: <%=result.getString("washrooms")%>
                </p>
                <p class="card-text text-center">Host: <%=result.getString("hostName")%>
                </p>
                <p class="card-text text-center"><strong> For: <%=result.getString("guests")%> People </strong>
                </p>
                <p class="card-text text-center"><strong><%=result.getString("price")%> / Night </strong></p>
                <input type="hidden" name="listID" value="<%=result.getString("id")%>">
            </div>
        </div>
    </a>
    <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>