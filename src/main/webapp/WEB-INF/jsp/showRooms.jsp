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

    <script>
        $(function () {
            $("#btn").click(function () {
                var str1 = "<form action='addRoom.do' method='post'>"+
                    "酒店名称：<input type='text' name='hName'/><br/>"+
                    "酒店地址：<select id='country'><option value='0'>--请选择国家--</option></select><select id='city' name='areaId'><option value='0'>--请选择城市--</option></select><br/>"+
                    "酒店等级：<input type='number' name='hLevel' min='1' max='5'/><br/>"+
                    "<input type='submit' value='添加'/>"+
                    "</form>";
                $("#addHotel").html(str1);
            })

        })
    </script>
</head>
<body>

<table>
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

</body>
</html>
