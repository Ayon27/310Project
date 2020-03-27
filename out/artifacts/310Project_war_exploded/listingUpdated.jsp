<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 4:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if ((session.getAttribute("name") == null) || (session.getAttribute("id") == null)) {
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
<%@include  file="assets/header.jsp"%>
<div class="highlight-clean">
    <div class="container" style="margin-top: 100px">
        <div class="intro">
            <h2 class="text-center">Congratulations!</h2>
            <p class="text-center">Your listing has been successfully updated!</p>
        </div>
        <div class="buttons"><a class="btn btn-primary" role="button" href="mylisting.jsp">Back to My Listings</a></div>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>