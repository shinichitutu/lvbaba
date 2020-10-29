<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/29
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>$Title$</title>
    <base href="<%=basePath%>"/>
</head>
<body>
$END$
</body>
</html>
