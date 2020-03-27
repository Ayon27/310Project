<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DatabaseConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.DateCalc.dateCalculator" %>
<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/27/2020
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="assets/header.jsp" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if ((session.getAttribute("name") == null) || (session.getAttribute("id") == null)) {
        response.sendRedirect("login.jsp");
        return;
    }
    Connection conn = null;
%>
<html>
<head>
    <title>Listing History</title>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Highlight-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
            integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css"/>
</head>
<body>
<h4 style="margin-top: 50px" class="text-secondary text-center">Booking history of your places</h4>
<%
    try {
        String s = (String) session.getAttribute("id");
        int currentUser = Integer.parseInt(s);
        conn = DatabaseConnection.getConnection();
        PreparedStatement listingHistory = conn.prepareStatement("SELECT booking.listing_id, booking.user_id, booking.booking_id, booking.check_in, " +
                "booking.check_out, listing.name," +
                " listing.hostName, listing.address, listing.state, listing.country, listing.price " +
                "from listing " +
                "INNER JOIN booking on booking.listing_id = listing.id " +
                "WHERE listing.host_id = ?;");
        listingHistory.setInt(1, currentUser);
        ResultSet listingResult = listingHistory.executeQuery();
        if (!listingResult.next()) {
%>
<div class="container" style="margin-top: 50px">
    <p class="text-secondary text-center">You have no place hosted right now. <a href="host.jsp"
                                                                                 style="text-decoration: none"> How
        about adding one? </a></p>
</div>
<%
    }
    listingResult.beforeFirst();
    while (listingResult.next()) {
        int guestID = listingResult.getInt("booking.user_id");
        PreparedStatement stmt1 = conn.prepareStatement("SELECT name from user WHERE id = ?");
        stmt1.setInt(1, guestID);
        ResultSet userResult = stmt1.executeQuery();
        if (userResult.next()) {
            long numberofDates = dateCalculator.diffInDays(listingResult.getString("check_in"), listingResult.getString("check_out"));
            //float rent = numberofDates *  listingResult.getFloat("price");
%>
<div class="container">
    <table class="table table-striped" style="margin-top: 50px">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Booking#</th>
            <th scope="col">Place Name</th>
            <th scope="col">Guest</th>
            <th scope="col">Check In</th>
            <th scope="col">Check Out</th>
            <th scope="col">Rent</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row"><%=listingResult.getString("booking_id")%>
            </th>
            <td><%=listingResult.getString("name")%>
            </td>
            <td><%=userResult.getString("name")%>
            </td>
            <td><%=listingResult.getString("check_in")%>
            </td>
            <td><%=listingResult.getString("check_out")%>
            </td>
            <td><%=numberofDates * listingResult.getFloat("price")%>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
