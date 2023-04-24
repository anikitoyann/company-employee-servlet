<%@ page import="com.example.companyemployeeservlet.model.Company" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Company</title>
</head>
<% List<String> countries= (List<String>) request.getAttribute("CountryList");%>
<body>
<% Company company= (Company) request.getAttribute("company");%>
<a href="/companies">Back</a>
<h2>Update Company</h2>
<form action="/updateCompany" method="post" >
    <input name="id" type="hidden"value="<%=company.getId()%>">
    name<input type="text" name="name"value="<%=company.getName()%>"><br>
    country:
    <select name="country">
        <% for (String country : countries) { %>
        <option value="<%=country%>"><%=country%></option>
        <% }%>
    </select>
    <input type="submit" value="Update">
</form>

</body>
</html>
