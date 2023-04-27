<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservlet.model.Employee" %>
<%@ page import="com.example.companyemployeeservlet.model.Company" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Company</title>
</head>
<%List<Company> companies = (List<Company>) request.getAttribute("companies"); %>
<body>
<a href="/employees">Back</a>
<h2>Create Employee</h2>
<form action="/createEmployee" method="post">
    name<input type="text" name="name"><br>
    surname<input type="text" name="surname"><br>
    email<input type="text" name="email"><br>
    company_id:
    <select name="company_id">
        <% for (Company company : companies) { %>
        <option value="<%=company.getId()%>"><%=company.getName()%> <%=company.getCountry()%></option>
        <% }%>
    </select>
    <input type="submit" value="Create">
</form>
</body>
</html>
