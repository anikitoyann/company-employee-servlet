<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Company</title>
</head>
<body>
<a href="/employees">Back</a>
<h2>Create Employee</h2>
<form action="/createEmployee" method="post">
  name<input type="text" name="name"><br>
  surname<input type="text"name="surname"><br>
  email<input type="text"name="email"><br>
  Company_id<input type="text"name="company_id"><br>
  <input type="submit" value="Create">
</form>
</body>
</html>
