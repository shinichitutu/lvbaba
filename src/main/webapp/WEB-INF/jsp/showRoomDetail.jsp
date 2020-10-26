<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/10/26
  Time: 9:41
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
        <th>序号</th>
        <th>日期</th>
        <th>价格</th>
        <th>预定数量</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>

    </thead>
    <tbody>
    <c:forEach items="${requestScope.roomDetail}" var="rd" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${rd.rDate}</td>
            <td>${rd.rdPrice}</td>
            <td><a href="#"?rid =${rd.rid}>查看详情</a></td>
            <td></td>
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
