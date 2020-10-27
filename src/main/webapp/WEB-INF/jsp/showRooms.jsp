<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/10/26
  Time: 9:27
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("#btn").click(function () {
                var str1 = "<form action='addRoom.do' method='post'>"+
                    "客房数量：<input type='number' name='number' min=1/><br/>"+
                    "人数限制：<input type='number' name='limit' min='1' max='10'/><br/>"+
                        "<input type='hidden' name='hId' value='${requestScope.hId}'>"+
                    "<input type='submit' value='添加'/>"+
                    "</form>";
                $("#addRoom").html(str1);
            })
        })
    </script>

</head>
<body>
<div class="container">
    <table class="table table-hover">

    <thead>
    <tr>
        <th>序号</th>
        <th>人数限制</th>
        <th>客房数量</th>
        <th>查看详情</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>

    </thead>
    <tbody>
    <c:forEach items="${requestScope.roomList}" var="room" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${room.pLimit}</td>
            <td>${room.rNumber}</td>
            <td><a href="showRoomDetail.do?rId=${room.rId}">查看详情</a></td>
            <td></td>
            <td></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</div>
<div style="text-align: center">
    <input type="button" id="btn" value="添加客房" />
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
