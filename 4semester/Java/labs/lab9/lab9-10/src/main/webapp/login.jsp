<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="LoginServlet" method="post">
    Username: <input type="text" name="username"><br>
    Password: <input type="text" name="password"><br>
    <button type="submit" name="submitButton">Login</button>
    <a href="register.jsp">Register</a><br>
    <p>${message}</p>
</form>
</body>
</html>