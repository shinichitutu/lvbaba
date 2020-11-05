<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/11/5
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>测试</title>
    <base href="<%=basePath%>"/>
    <script src="js/jquery-3.1.0.js"></script>
</head>
<body>
<form action="createComment.do" method="get">
    <input type="hidden" name="orderId" value="1">
    <input type="text" name="content" placeholder="请输入评论内容"><br/>
    <input type="number" name="score" max="5" min="1" step="1">
    <input type="submit" value="点击评论">
</form>
<form action="refund.do">
    <input type="hidden"name="orderId" value="1">
    <input type="submit" value="点击退单">
</form>
<form action="orderInquiry.do" method="get">
    <input type="hidden" name="uId" value="1">
    <input type="submit" value="点击查询订单">
</form>
<p style="color: red">${error}</p>
<p style="color: green">${success}</p>
</body>
</html>
