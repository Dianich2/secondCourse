<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
<h1>An error occurred</h1>
<p>Error details:</p>
<p>Message: <%= request.getAttribute("javax.servlet.error.message") %></p>
<p>Status Code: <%= response.getStatus() %></p>
</body>
</html>
