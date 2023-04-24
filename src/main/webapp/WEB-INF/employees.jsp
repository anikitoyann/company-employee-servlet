<%@ page import="com.example.companyemployeeservlet.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employees</title>
</head>
<% List<Employee> employees = (List<Employee>) request.getAttribute("employees");%>

<body style="background-color: snow">
<a href="/">Back</a>
<H2>Employees</H2><a href="/createEmployee">Create company</a>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>company_id</th>
        <th>action</th>
    </tr>
    <% if (employees != null && !employees.isEmpty()) { %>
    <%
        for (Employee employee : employees) { %>
    <tr>
        <td><%=employee.getId()%></td>
        <td><%=employee.getName()%></td>
        <td><%=employee.getSurname()%></td>
        <td><%=employee.getEmail()%></td>
        <td><%=employee.getCompany().getId()%></td>
        <td><a href="/removeEmployee?id=<%=employee.getId()%>">delete</a>
            / <a href="updateEmployee?id=<%=employee.getId()%>"> update</a></td>
    </tr>
    <%} %>
    <%} %>
</table>
</body>
</html>
