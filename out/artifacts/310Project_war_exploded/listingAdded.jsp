<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 4:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Successful</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Highlight-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
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
                                                                  href="#">Profile</a><a class="dropdown-item"
                                                                                            role="presentation"
                                                                                            href="logout.jsp">Log
                            out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="highlight-clean">
    <div class="container" style="margin-top: 100px">
        <div class="intro">
            <h2 class="text-center">Congratulations!</h2>
            <p class="text-center">Your place Has Been Successfully Added!</p>
        </div>
        <div class="buttons"><a class="btn btn-primary" role="button" href="mylisting.jsp">Back to My Listings</a></div>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>