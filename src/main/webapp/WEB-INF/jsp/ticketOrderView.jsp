<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/3
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>机票支付</title>
    <meta charset="utf-8"/>
    <script src="js/jquery-3.1.0.js"></script>
</head>
<body>

</body>
</html>
