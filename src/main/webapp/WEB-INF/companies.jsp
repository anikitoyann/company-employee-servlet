<%@ page import="com.example.companyemployeeservlet.model.Company" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Companies</title>
</head>
<% List<Company> companies = (List<Company>) request.getAttribute("companies");%>

<body>
<a href="/">Back</a>
<H2>Companies</H2><a href="/createCompany">Create company</a>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>country</th>
        <th>action</th>
    </tr>
    <% if (companies != null && !companies.isEmpty()) { %>
    <%
        for (Company company : companies) { %>
<tr>
    <td><%=company.getId()%></td>
    <td><%=company.getName()%></td>
    <td><%=company.getCountry()%></td>
    <td><a href="/removeCompany?id=<%=company.getId()%>">delete</a>
        / <a href="updateCompany?id=<%=company.getId()%>"> update</a></td>
</tr>
    <%} %>
    <%} %>
</table>
</body>
</html>
