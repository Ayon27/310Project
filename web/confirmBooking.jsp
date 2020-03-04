<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/5/2020
  Time: 4:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link rel="stylesheet" href="assets/css/owl.carousel.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
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
                            <a class="dropdown-item" role="presentation" href="mylisting.jsp">My Listings</a>
                    </li>

                    <li class="nav-item" role="presentation"></li>
                    <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" data-toggle="dropdown"
                                                     aria-expanded="false" href="#"><% out.print(session.getAttribute("name")); %></a>
                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation"
                                                                  href="#">Profile</a>
                            <a class="dropdown-item" role="presentation" href="logout.jsp">Log
                                out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<section class="page-section">
    <div class="container" style="margin-top: 30px">
        <div class="row">
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
                                Demo House 2
                            </h2>
                            <p>
                                Chatteswary Street
                                <h10>,</h10>
                                Mehdibag
                                <h10>,</h10>
                                Chittagong
                            </p>
                        </div>
                        <div class="col-xl-4">
                            </a>
                        </div>
                    </div>
                    <h3 class="sl-sp-title">Property Details</h3>
                    <div class="row property-details-list">
                        <div class="col-md-4 col-sm-6">
                            <p></i>
                                2000
                                <h10> sqft</h10>
                            </p>
                            <p></i>
                                4
                                <h10> Bedroom(s)</h10>
                            </p>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <p></i>
                                <h10>Balcony:</h10>
                                2
                            </p>
                            <p></i>
                                <h10>Owner:</h10>
                                Rahimm
                            </p>
                        </div>
                        <div class="col-md-4">
                            <p></i>
                                <h10>Washroom:</h10>
                                3
                            </p>
                        </div>
                    </div>
                    <h3 class="sl-sp-title bd-no"></h3>
                    <div id="accordion" class="plan-accordion">
                        <div class="panel">
                            <div class="panel-header" id="headingOne">
                                <button class="panel-link active" data-toggle="collapse" data-target="#collapse1"
                                        aria-expanded="false" aria-controls="collapse1"><i class=""></i></button>
                            </div>
                            <div id="collapse1" class="collapse show" aria-labelledby="headingOne"
                                 data-parent="#accordion">
                                <div class="panel-body">
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-header" id="headingTwo">
                            </div>
                            <div id="collapse2" class="collapse" aria-labelledby="headingTwo"
                                 data-parent="#accordion">
                                <div class="panel-body">
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-header" id="headingThree">
                            </div>
                            <div id="collapse3" class="collapse" aria-labelledby="headingThree"
                                 data-parent="#accordion">
                                <div class="panel-body">
                                </div>
                            </div>
                        </div>
                    </div>

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