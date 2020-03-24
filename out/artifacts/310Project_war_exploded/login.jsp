<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/1/2020
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
<div>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
        <div class="container">
            <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span
                    class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav mr-auto"></ul>
                <span class="navbar-text actions">
                <a class="login"
                   href="#">Log In</a>
                    <a class="btn btn-light action-button" role="button" href="signup.jsp">Sign Up</a></span>
            </div>
        </div>
    </nav>
</div>
<div></div>
<div class="login-clean"></div>
<div class="login-clean">
    <form method="post" action="login">
        <h2 class="text-center">Log In</h2>
        <div class="illustration"></div>
        <div class="form-group">
            <p class="text-center text-danger" name="error"> ${loginErr} </p>
            <input class="form-control" type="email" name="email" placeholder="Email" required maxlength="40"></div>
        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"
                                       required maxlength="15">
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Log In</button>
        </div>
        <a
    </form>
</div>
<div></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>

</html>
