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

    <script type="text/javascript" src="../../js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#btn").click(function () {
                var str1 = "<form action='addRoomDetail.do' method='post'>"+
                    "日期：<input type='date' name='date'/><br/>"+
                    "价格：<input type='number' name='price' min='1'/><br/>"+
                    "<input type='hidden' name='hId' value='${requestScope.rId}'>"+
                    "<input type='submit' value='添加'/>"+
                    "</form>";
                $("#addRoom").html(str1);
            })
        })
    </script>
</head>
<body>

<table>
    <thead>
    <tr>
        <th>序号</th>
        <th>日期</th>
        <th>价格</th>
        <th>预定数量(已定/总数)</th>
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
            <td>${rd.rdNumber}/${rd.room.rNumber}</td>
            <td></td>
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<div style="text-align: center">
    <input type="button" id="btn" value="添加客房详情" />

</div>

<div id = "addRoom" style="text-align: center">
</div>

<c:if test="${null != requestScope.error}">
    <span style="color: red">${requestScope.error}</span>
</c:if>

<c:if test="${null != requestScope.success}">
    <span style="color: red">${requestScope.success}</span>
</c:if>

</body>
</html>
