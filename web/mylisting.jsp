<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 7:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if ((session.getAttribute("name") == null) || (session.getAttribute("id") == null)) {
        response.sendRedirect("login.jsp");
    }
%>
<%@page import="com.DB.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>

<div style="margin-top: 20px">
    <nav class="navbar navbar-light navbar-expand-md navigation-clean">
        <div class="container">
            <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span
                    class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">Home</a></li>

                    <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" data-toggle="dropdown"
                                                     aria-expanded="false" href="#">Become a Host</a>
                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation"
                                                                  href="host.jsp">Host a place</a>
                            <a class="dropdown-item" role="presentation"
                               href="mylisting.jsp">My Listings</a>
                    </li>

                    <li class="nav-item" role="presentation"></li>
                    <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" data-toggle="dropdown"
                                                     aria-expanded="false"
                                                     href="#"><% out.print(session.getAttribute("name")); %></a>
                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation"
                                                                  href="profile.jsp">Profile</a>
                            <a class="dropdown-item"
                               role="presentation"
                               href="logout.jsp">Log
                                out</a>
                    </li`>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="container" style="margin-top: 50px">

    <h2 class="text-center" style="margin-top: 50px; margin-bottom: 50px"><strong>My Active Listings</strong></h2>
    <div class="card-deck">

    <%
        String s = (String) session.getAttribute("id");
        int id = Integer.parseInt(s);

        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from listing where host_id = ?");
            stmt.setInt(1, id);
            ResultSet result = stmt.executeQuery();
            while (result.next()) {
                String gym = "No Gym"; String pool = "No Pool"; String entireHouse = "Shared Place";

                if(result.getString("entire_house").equals("1")) {
                    entireHouse = "Entire Place";
                }
                if(result.getString("has_gym").equals("1")) {
                    gym = "Has a Gym";
                }
                if(result.getString("has_pool").equals("1")) {
                    pool = "Has a Pool";
                }
    %>
        <div class="card" style="min-width: 300px; max-width: 350px; margin-bottom: 30px">
            <img class="card-img-top" src="assets/download.png" alt="Card image cap" style="width: 100px; margin-left: 35%; margin-top: 20px">
            <div class="card-body">
                <h5 class="card-title text-center"><%=result.getString("name")%></h5>
                <p class="card-text text-secondary text-center "><%=entireHouse%>, <%=gym%>, <%=pool%></p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item text-center"><%=result.getString("address")%>, <%=result.getString("state")%>, <%=result.getString("country")%></li>
                <li class="list-group-item text-center">Rooms: <%=result.getString("bedrooms")%></li>
                <li class="list-group-item text-center ">Washrooms: <%=result.getString("bedrooms")%></li>
                <li class="list-group-item text-center ">For: <%=result.getString("guests")%> People</li>
                <li class="list-group-item text-center">Rent: <%=result.getString("price")%> / Night</li>
            </ul>
            <div class="card-body">
                <a href="modifyListing.jsp?id=<%=result.getString("id")%>&name=<%=result.getString("name")%>" class="card-link">
                    <Button class="btn btn-primary" style="background-color: #7abaff; min-width: 45%; border: 0px"> UPDATE</Button>
                </a>
                <a href="deleteListing.jsp?id=<%=result.getString("id")%>&name=<%=result.getString("name")%>" class="card-link">
                    <Button style="min-width: 45%; background-color: #7abaff; border: 0px" class="btn btn-primary"> DELETE</Button>
                </a>

            </div>
        </div>


    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>