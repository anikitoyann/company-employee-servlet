<%@ page import="com.example.companyemployeeservlet.model.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 27.04.2023
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<%User user = (User) session.getAttribute("user");%>
Welcome<%=user.getName()%> <%=user.getSurname()%> <a href="/logout">LogOut</a> <br>
<a href="/employees"> Employees</a> |
<a href="/companies"> Companies</a>
</body>
</html>
