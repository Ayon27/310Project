<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/5/2020
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="team-boxed">
    <div class="container">
        <div class="row people">
            <div class="col-md-6 col-lg-4 item">
                <div class="box"><img class="rounded-circle" src="assets/cnh.png">
                    <h3 class="name">Ben Johnson</h3>
                    <p class="title">Musician</p>
                    <p class="description">Aenean tortor est, vulputate quis leo in, vehicula rhoncus lacus.
                        Praesent aliquam in tellus eu gravida. Aliquam varius finibus est, et interdum justo
                        suscipit id. Etiam dictum feugiat tellus, a semper massa. </p>
                    <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i
                            class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 item"></div>
            <div class="col-md-6 col-lg-4 item">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Title</h4>
                        <h6 class="text-muted card-subtitle mb-2">Subtitle</h6>
                        <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio,
                            dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget
                            metus.</p><a class="card-link" href="#">Link</a><a class="card-link" href="#">Link</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
>
</div>
</body>
</html>
