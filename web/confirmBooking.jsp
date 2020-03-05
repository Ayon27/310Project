<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.DB.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/5/2020
  Time: 4:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% int placeID = Integer.parseInt(request.getParameter("placeID"));
    String checkIn = request.getParameter("checkIN");
    String checkOut = request.getParameter("checkOut");
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/animate.css"/>
    <link rel="stylesheet" href="assets/css/owl.carousel.css"/>
    <link rel="stylesheet" href="assets/css/style.css"/>
    <title>Confirm Booking</title>
</head>

<body>
<div style="margin-top: 20px">
    <nav class="navbar navbar-light navbar-expand-md navigation-clean">
        <div class="container">
            <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span
                    class="sr-only"></span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">Home</a></li>

                    <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" data-toggle="dropdown"
                                                     aria-expanded="false" href="#">Become a Host</a>
                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation"
                                                                  href="host.jsp">Host a place</a>
                            <a class="dropdown-item" role="presentation" href="mylisting.jsp">My Listings</a>
                    </li>

                    <li class="nav-item" role="presentation"></li>
                    <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" data-toggle="dropdown"
                                                     aria-expanded="false"
                                                     href="#"><% out.print(session.getAttribute("name")); %></a>
                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation"
                                                                  href="profile.jsp">Profile</a>
                            <a class="dropdown-item" role="presentation" href="logout.jsp">Log
                                out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<%
    String s = (String) session.getAttribute("id");

    try {
        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT * from listing where id =?");
        stmt.setInt(1, placeID);
        ResultSet result = stmt.executeQuery();
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
<section class="page-section">
    <div class="container" style="margin-top: 30px">
        <div class="row">

            <form class="form-control" method="post" action="confirmed" style="border: 0">
                <div class="col-lg-10">
                    <div class="single-list-slider owl-carousel" id="sl-slider">
                        <div class="sl-item set-bg">
                            <img class="img-responsive" src="assets/background.jpg" alt="">
                        </div>
                    </div>
                    <div class>
                    </div>

                    <div class="single-list-content">

                        <div class="row">
                            <div class="col-xl-8 sl-title">
                                <h2>
                                    <%=result.getString("name")%>
                                </h2>
                                <p>
                                    <%=result.getString("address")%>
                                    <h10>,</h10>
                                    <%=result.getString("state")%>
                                    <h10>,</h10>
                                    <%=result.getString("country")%>
                                </p>
                            </div>
                            <div class="col-xl-4">
                            </div>
                        </div>

                        <h3 class="sl-sp-title">Details</h3>
                        <div class="row property-details-list">
                            <div class="col-md-4 col-sm-6">
                                <p>
                                    <%=entireHouse%>
                                </p>
                                <p>Rooms:
                                    <%=result.getString("bedrooms")%>
                                </p>
                                <p>Rent:
                                    <%=result.getString("price")%> / Night
                                </p>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <p>
                                    <%=gym%>
                                </p>
                                <p>
                                    Washrooms:
                                    <%=result.getString("washrooms")%>
                                </p>
                            </div>
                            <div class="col-md-4">
                                <p>
                                    <%=pool%>
                                </p>
                                <p>
                                    Host:
                                    <%=result.getString("hostName")%>
                                </p>
                            </div>
                        </div>
                        <h3 class="sl-sp-title bd-no"></h3>
                        <div id="accordion" class="plan-accordion">
                            <div class="panel">
                                <div class="panel-header" id="headingOne">
                                    <button style="background-color: #7abaff" class="panel-link active"
                                            data-toggle="collapse" data-target="#confirmMsg" role="button"
                                            aria-expanded="false" aria-controls="confirm"><b
                                            style="margin-left: 45%; font-size: 24px">Book</b></button>
                                </div>

                                <div class="collapse" id="confirmMsg">
                                    <div class="card card-body">
                                        <p class="text-center" style="font-size: 24px"> Are you sure?
                                            <input type="hidden" name="placeID" value="<%=placeID%>">
                                            <input type="hidden" name="checkIn" value="<%=checkIn%>">
                                            <input type="hidden" name="checkOut" value="<%=checkOut%>">
                                            <button class="btn btn-success"
                                                    style="margin-left: 10px; background-color: #7abaff;" type="submit">
                                                Yes, Book now
                                            </button>
                                            <button type="button" class="btn btn-success" data-toggle="collapse"
                                                    data-target="#confirmMsg"
                                                    style="margin-left: 10px; background-color: #7abaff; min-width: 60px">
                                                No
                                            </button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
            </form>
        </div>
    </div>

</section>

<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/masonry.pkgd.min.js"></script>
<script src="assets/js/magnific-popup.min.js"></script>
<script src="assets/js/main.js"></script>
</body>

</html>