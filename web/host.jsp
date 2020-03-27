<%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 12:51 AM
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
    <title>Host a Place</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
<%@include  file="assets/header.jsp"%>

<div>
    <div class="container">
        <h2 class="text-center" style="margin-top: 50px;"><strong>Host</strong> a place</h2>
        <div class="row">
            <div class="col-md-5">
                <form method="POST" action="Proceed">
                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Name of Your Place:
                        </label><input required name="name" class="form-control" placeholder="" type="text"
                                       pattern="[A-Za-z\s]+" maxlength="20">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Number of Bedrooms:
                        </label><input required name="bedroom" class="form-control" placeholder="" type="number"
                                       min="1" maxlength="3">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            Number of washrooms:
                        </label>
                        <input required name="washroom" class="form-control" type="number" min="1" max="999">
                    </div>

                    <div class="form-group">
                        <label style="margin-top: 20px;">
                            How many guests can stay?
                        </label>
                        <input required name="guests" class="form-control" type="number" min="1" max="999">
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
                            Does your place have a gym for the guests?
                        </label>
                        <select name="has_gym" required class="form-control">
                            <option value="1" selected="">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
            </div>

            <div class="col-md-2"></div>
            <div class="col-md-5">
                <div class="form-group">
                    <label style="margin-top: 75px;">
                        Does your place have a pool for the guests?
                    </label>
                    <select name="has_pool" required class="form-control">
                        <option value="1" selected="">Yes</option>
                        <option value="0">No</option>
                    </select>
                </div>
                <div class="form-group">
                    <label style="margin-top: 20px;">
                        Country:
                    </label><input required name="country" class="form-control" placeholder="" type="text"
                                   pattern="[A-Za-z\s]+" maxlength="15">
                </div>

                <div class="form-group">
                    <label style="margin-top: 20px;">
                        State:
                    </label>
                    <input required name="state" class="form-control" placeholder="" type="text"
                           pattern="[A-Za-z\s]+" maxlength="15"></div>

                <div class="form-group">
                    <label style="margin-top: 20px;">
                        Street Address:
                    </label>
                    <input required name="address" class="form-control" type="text" maxlength="95">
                </div>

                <div class="form-group">
                    <label style="margin-top: 20px;">
                        Price for one night stay:
                    </label>
                    <input required name="price" class="form-control" type="number" step="0.01" min="0" max="999.">
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
</div>

<%@include file="assets/footer.jsp" %>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
