<%@ page import="com.example.companyemployeeservlet.model.Company" %>
<%@ page import="com.example.companyemployeeservlet.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
<% Employee employee = (Employee) request.getAttribute("employee");%>
<%List<Integer> companies = (List<Integer>) request.getAttribute("companyIds"); %>
<a href="/employees">Back</a>
<h2>Update Employee</h2>
<form action="/updateEmployee" method="post" >
    <input name="id" type="hidden"value="<%=employee.getId()%>">
    name<input type="text" name="name"value="<%=employee.getName()%>"><br>
    surname<input type="text" name="surname"value="<%=employee.getSurname()%>"><br>
    email<input type="text" name="email" value="<%=employee.getEmail()%>"><br>
    company_id:
    <select name="company_id">
        <% for (Integer company : companies) { %>
        <option value="<%=company%>"><%=company%></option>
        <% }%>
    </select>
    <input type="submit" value="Update">
</form>

</body>
</html>
