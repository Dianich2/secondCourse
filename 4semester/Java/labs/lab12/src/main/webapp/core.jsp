<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Core</title>
</head>
<body>
<h1>CORE TAGS</h1>


<p>-------------------------- out -----------------------------------</p>
<c:out value = "1337 * 228 / 420 = "/><c:out value="${1337 * 228 / 420}"/>
<br/><br/>


<p>----------------------- Condition if, remove -----------------------</p>
<c:set var="java" value="love" scope="page"/>
<c:if test="${ not empty java and java eq 'love' }">
  If not empty works
</c:if>
<c:remove var="java"/>
<c:if test="${empty java}">
  empty works as well
</c:if>
<br/><br/>


<p>--------------- Condition choose/when/otherwise ---------------</p>
<c:set var="number" value="45"/>
<c:choose>
  <c:when test="${ number > 60 }" >
    <c:out value="number ${ number } bigger 60"/>
  </c:when>
  <c:when test="${ number > 40 }" >
    <c:out value="number ${ number } bigger 40"/>
  </c:when>
  <c:when test="${ number > 10 }" >
    <c:out value="number ${ number } bigger 10"/>
  </c:when>
  <c:otherwise>
    <c:out value="number ${ number } bigger 10"/>
  </c:otherwise>
</c:choose>
<br/><br/>


<p>----------------------- Exception catch -----------------------</p>
<c:catch var="ArithmeticException">
  <% int num = 0 / 0; %>
</c:catch>
Caught exception: ${ArithmeticException}
<br/><br/>


<p>-------------------- Dividers forTokens --------------------</p>
<c:set var="str" value="a,.. b ;:- c :() d .., e ))" />
<c:forTokens var="token" items="${ str }" delims=".,-:);(">
  <c:out value="${ token }" />
</c:forTokens>
<br/><br/>

</body>
</html>