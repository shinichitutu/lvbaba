<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/26
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>"/>
</head>
<body>
欢迎${sessionScope.admin.adName}<br/>
<a href="showProduct.do">查询产品</a> <br/>
<a href="showTour.do">查询旅行团</a><br/>
查看订单<br/>
查询火车<br/>
</body>
</html>
