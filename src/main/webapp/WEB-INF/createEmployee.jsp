<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservlet.model.Employee" %>
<%@ page import="com.example.companyemployeeservlet.model.Company" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Company</title>
</head>
<%List<Employee> employees = (List<Employee>) request.getAttribute("CountryList"); %>
<%List<Integer> companies = (List<Integer>) request.getAttribute("companyIds"); %>
<body>
<a href="/employees">Back</a>
<h2>Create Employee</h2>
<form action="/createEmployee" method="post">
    name<input type="text" name="name"><br>
    surname<input type="text" name="surname"><br>
    email<input type="text" name="email"><br>
    company_id:
    <select name="company_id">
        <% for (Integer company : companies) { %>
        <option value="<%=company%>"><%=company%></option>
        <% }%>
    </select>
    <input type="submit" value="Create">
</form>
</body>
</html>
