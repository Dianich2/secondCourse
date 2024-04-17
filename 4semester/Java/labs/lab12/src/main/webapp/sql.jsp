<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sql</title>
</head>
<body>
<sql:setDataSource var="contacts" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/lab9"
                   user="root" password="dWSKm4q3xnLNoh0liVIa"/>

<sql:query dataSource="${contacts}" var="myself" >
  SELECT * FROM users where username = ?
  <sql:param value="Valentine" />
</sql:query>

<sql:query dataSource="${contacts}" var="contacts">
  SELECT * FROM users
</sql:query>

<h1>SQL TAGS</h1>

<table style="border: 1px solid black; width: 40%">
  <tr>
    <th>Name</th>
    <th>Password</th>
    <th>Role</th>
  </tr>

  <c:forEach var = "row" items = "${contacts.rows}">
    <tr>
      <td> <c:out value = "${row.username}"/></td>
      <td> <c:out value = "${row.password}"/></td>
      <td> <c:out value = "${row.role}"/></td>
    </tr>
  </c:forEach>
</table>



<br/><br/><br/>
<table style="border: 1px solid black; width: 25%">
  <tr>
    <th>Name</th>
    <th>Password</th>
    <th>Role</th>
  </tr>

  <c:forEach var = "row" items = "${myself.rows}">
    <tr>
      <td> <c:out value = "${row.username}"/></td>
      <td> <c:out value = "${row.password}"/></td>
      <td> <c:out value = "${row.role}"/></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>