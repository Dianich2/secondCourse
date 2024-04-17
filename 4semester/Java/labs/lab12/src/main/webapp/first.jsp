<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="MyTag" uri="MyTag.tld" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<div>
  <h2>Пользовательские теги</h2>
  <MyTag:vsubmit />
  <c:set var = "items" value = "${items}"/>
  <c:set var = "iter" value = "${items.iterator()}"/>
  <MyTag:table nameTable="Books" countItem="${fn:length(items)}">
    <c:out value="${iter.next()}"/>
  </MyTag:table>
</div>
</body>
</html>
