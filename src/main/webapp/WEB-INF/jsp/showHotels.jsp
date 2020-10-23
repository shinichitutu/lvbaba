<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/10/23
  Time: 14:23
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

<table>
    <thead>
    <tr>
        <th>酒店名称</th>
        <th>所在城市</th>
        <th>酒店等级</th>
        <th>查看详情</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.hotelList}" var="hotel" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${goods.name}</td>
            <td>${goods.price}</td>
            <td>${goods.manufacturer}</td>

            <td><a href="showGoodsDetail.do?goodsId=${goods.id}">查看详情</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
