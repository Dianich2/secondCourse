<%@ page import="com.example.lab910.entities.Player" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<%--<%
  Object obj = null;
  obj.toString();
%>--%>
  <h1>Welcome ${username} role: ${role} ${welcomeMessage}          <a href="login.jsp">Log out</a></h1>
  <h2>You team</h2>
  <table border="1">
    <tr>
      <th>Name</th>
      <th>Tel</th>
      <th>Email</th>
    </tr>
    <%
      ServletContext context = request.getServletContext();
      List<Player> players = (List<Player>) context.getAttribute("pl");
      if (players != null) {
        for (Player player : players) {
    %>
    <tr>
      <td><%= player.getName() %></td>
      <td><%= player.getTel() %></td>
      <td><%= player.getEmail() %></td>
      <td><a href="homeAdmin?id=<%= player.getId() %>&action=delete">del</a></td>
    </tr>
    <%
        }
      }
    %>
  </table>

  <H2>Add new player</H2>
    <form action="homeAdmin" method="post">
      Name: <input type="text" name="name"><br>
      Tel: <input type="text" name="tel"><br>
      Email: <input type="text" name="email">
      <button type="submit" name="submitButton">Add new player</button><br>
    </form>

<p>${cookieMessage}</p>
</body>
</html>
