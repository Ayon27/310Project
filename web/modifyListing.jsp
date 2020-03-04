<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String place_id = request.getParameter("id");
    String place_name = request.getParameter("name");
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Modify My Listings</title>
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
<div>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean" style="margin-top: 20px">
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
                                                                  href="#">Profile</a>
                            <a class="dropdown-item"
                               role="presentation"
                               href="logout.jsp">Log
                                out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div>
    <div class="container">
        <h2 class="text-center" style="margin-top: 30px; margin-bottom: 20px">Update Information of <strong><%=place_name%></strong>
        </h2>
        <div class="row">
            <div class="col-md-4">     </div>
            <div class="col-md-4">
                <p class="text-center text-danger" name="error">${updateError}</p>

                <form method="POST" action="UpdateListing">
                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            <input type="hidden" name="id" value="<%=place_id%>">
                            Change Name:
                        </label><input required name="name" class="form-control" placeholder="" type="text"
                                       pattern="[A-Za-z\s]+">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Number of Bedrooms:
                        </label><input required name="bedroom" class="form-control" placeholder="" type="number"
                                       min="1">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Number of washrooms:
                        </label>
                        <input required name="washroom" class="form-control" placeholder="" type="number" min="1">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            How many guests can stay?
                        </label>
                        <input required name="guests" class="form-control" type="number" min="1">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Is the entire place for guests?
                        </label>
                        <select name="entirePlace" required class="form-control">
                            <option value="1">Yes</option>
                            <option value="0">No, just a part of it</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Street Address:
                        </label>
                        <input required name="address" class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Price for one night stay:
                        </label>
                        <input required name="price" class="form-control" type="number" step="0.01" min="0">
                    </div>


            </div>
        </div>
        <div class="form-group">
            <div class="btn-group" role="group"></div>
            <button class="btn btn-primary" type="submit"
                    style="margin-top: 20px; min-width: 120px;min-height: 40px; margin-left: 45%; margin-top: 30px; margin-bottom: 50px;">
                Finish
            </button>
        </div>
        </form>
    </div>

    <div class="col-md-4">
    </div>
</div>
<%@include  file="assets/footer.jsp"%>
</body>
</html>
