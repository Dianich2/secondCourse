<%--
  Created by IntelliJ IDEA.
  User: Valentine Korneliuk
  Date: 20.03.2024
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<form action="RegisterServlet" method="post">
    Username: <input type="text" name="username"><br>
    Password: <input type="text" name="password"><br>
    <button type="submit" name="submitButton">Register</button><br>
    <p>${message}</p>
</form>
</body>
</html>
