<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<html>
<head>
  <title>Formatting</title>
</head>
<body>
<h1>FORMAT TAGS</h1>

<h3>Date/time formatting</h3>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:setLocale value="en-EN"/>
Date in English format<br/>
Today: <fmt:formatDate value="${now}" /><br/>
<fmt:setLocale value="ru-RU"/>
<fmt:timeZone value="GMT+3:00">
  Date in Russian format<br/>
  Today: <fmt:formatDate value="${now}"  type="both"
                           dateStyle="full" timeStyle="full"/> <br/>
</fmt:timeZone>
<c:set var="currentDate" value="12-05-2006" />
<fmt:parseDate value="${currentDate}" var="parsedCurrentDate" pattern="dd-MM-yyyy" />
Parsing of the string date: <c:out value="${parsedCurrentDate}" />
<br/>
Time style:
<br/>
(short): <fmt:formatDate value="${now}"
                         type="time" timeStyle="short" /><br/>
(medium):<fmt:formatDate value="${now}"
                         type="time" timeStyle="medium" /><br/>
(long): <fmt:formatDate value="${now}"
                        type="time" timeStyle="long" /><br/><br/>




<h3>Numbers formatting</h3>
<c:set var="currentNumber" value="322"/>
<c:out value="number : ${currentNumber}"/> <br/>
Format (default) :
<fmt:formatNumber value="${currentNumber}" /><br/>
Percent format :
<fmt:formatNumber value="${currentNumber}"
                  type="percent"/><br/>
<fmt:setLocale value="be-BY"/>
Byn :
<fmt:formatNumber value="${currentNumber}"
                  type="currency"/><br/>
Frans concurrency :
<fmt:setLocale value="fr-FR"/>
<fmt:formatNumber value= "${currentNumber}" type="currency"/><br/>



</body>
</html>