<!-- Import the JSTL tag library for formatting -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Import the Java Date class -->
<%@ page import="java.util.Date" %>
<!-- Set the current date as a request attribute -->
<% request.setAttribute("today", new java.util.Date()); %>

<html>
<body>
    <!-- Format and display the current date -->
    <h2>Date: <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></h2>
</body>
</html>
