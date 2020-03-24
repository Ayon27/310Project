<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/2/2020
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
<div></div>
<div></div>
<div>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
        <div class="container">
            <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span
                    class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav mr-auto"></ul>
                <span class="navbar-text actions"> <a class="login"
                                                      href="login.jsp">Log In</a><a class="btn btn-light action-button"
                                                                                    role="button"
                                                                                    href="#">Sign Up</a></span>
            </div>
        </div>
    </nav>
</div>

<div class="register-photo">
    <div class="form-container">
        <form method="post" action="Register" onsubmit="return checkPass()">
            <h2 class="text-center"><strong>Create</strong> an account.</h2>
            <p class="text-center text-danger" name="error"> ${error} </p>
            <div class="form-group"><input required class="form-control" type="text" name="name"
                                           placeholder="Full name" pattern="[A-Za-z\s]+" maxlength="40"></div>
            <div class="form-group"><input class="form-control" type="text" placeholder="Country" name="country"
                                           pattern="[A-Za-z\s]+"
                                           required maxlength="15"></div>
            <div class="form-group"><input class="form-control" type="text" name="state" placeholder="State"
                                           pattern="[A-Za-z\s]+"
                                           required maxlength="15"></div>
            <div class="form-group"><input required class="form-control" type="text" name="address"
                                           placeholder="Street Address" maxlength="95"></div>
            <div class="form-group"><input required class="form-control" type="text" name="phone"
                                           placeholder="Phone number (without + or any special characters)"
                                           pattern="\d+" maxlength="20"></div>
            <div class="form-group"><input required class="form-control" type="email" name="email" placeholder="Email"
                                           maxlength="80">
            </div>
            <div class="form-group"><input required class="form-control" type="password" name="password"
                                           placeholder="Password (At least one number and one uppercase and lowercase letter, and of length 8 or more)"
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" id="pass" maxlength="15">
            </div>
            <div class="form-group"><input required class="form-control" type="password" name="password-repeat"
                                           placeholder="Password (repeat)"
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" id="passRpt" maxlength="15">
            </div>
            <div class="form-group">
                <p class="text-center text-danger" id="passError"></p>

            </div>
            <div class="form-group">
                <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<script type="text/javascript">
    function checkPass() {
        var p1 = document.getElementById("pass").value;
        var p2 = document.getElementById("passRpt").value;

        if (p1 === p2) {
            return true;
        } else {
            document.getElementById("passRpt").style.color = "red";
            document.getElementById("passError").innerHTML = "Passwords do not match!";
            return false;
        }
    }
</script>