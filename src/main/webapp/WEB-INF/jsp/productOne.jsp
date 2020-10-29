<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/29
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>用户查看产品详情</title>
    <base href="<%=basePath%>"/>
</head>
<body>
<p style="font-size: 100px">看这里
    ${requestScope.product.productId}</p>
</body>
</html>
