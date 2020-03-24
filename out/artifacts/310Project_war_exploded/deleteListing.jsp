<%@ page import="com.update.Delete" %><%--
  Created by IntelliJ IDEA.
  User: Ayn
  Date: 3/4/2020
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

<%
    if ((session.getAttribute("name") == null) || (session.getAttribute("id") == null)) {
        response.sendRedirect("login.jsp");
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String place_id = request.getParameter("id");
    String place_name = request.getParameter("name");
    Delete del = new Delete(place_id);
    del.deleteExec();
    response.sendRedirect("mylisting.jsp");
%>

<html>
<head>
    <title>Delete Listing</title>
</head>
<body>

</body>
</html>
