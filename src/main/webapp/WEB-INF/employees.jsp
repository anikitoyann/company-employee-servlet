<%@ page import="com.example.companyemployeeservlet.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservlet.model.User" %>
<%@ page import="com.example.companyemployeeservlet.model.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employees</title>
</head>
<% List<Employee> employees = (List<Employee>) request.getAttribute("employees");
    User user = (User) session.getAttribute("user");
%>

<body style="background-color: snow">
<a href="/">Back</a>
<H2>Employees</H2><a href="/createEmployee">Create company</a>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>company name</th>
        <%if (user.getUserType()== UserType.ADMIN){%>
        <th>action</th>
        <%}%>
    </tr>
    <% if (employees != null && !employees.isEmpty()) { %>
    <%
        for (Employee employee : employees) { %>
    <tr>
        <td><%=employee.getId()%></td>
        <td><%=employee.getName()%></td>
        <td><%=employee.getSurname()%></td>
        <td><%=employee.getEmail()%></td>
        <td><%=employee.getCompany().getName()%></td>
        <%if (user.getUserType()== UserType.ADMIN){%>

        <td><a href="/removeEmployee?id=<%=employee.getId()%>">delete</a>
            / <a href="updateEmployee?id=<%=employee.getId()%>"> update</a></td>
        <%}%>
    </tr>
    <%} %>
    <%} %>
</table>
</body>
</html>
