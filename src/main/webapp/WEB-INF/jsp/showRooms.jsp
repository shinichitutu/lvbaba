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
    <title>房间</title>
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

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1 id="go_top">欢迎${sessionScope.admin.adName}登录</h1>
    <p></p>
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
    <a class="navbar-brand" href="adminMain.do" style="margin-left: 50px">驴爸爸旅行</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div   class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav" >
            <li class="nav-item" style="margin-left: 50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="查询产品" style="background-color: orange">
                    <a href="showProduct.do">查询产品</a>
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="查询旅行团" style="background-color: orange">
                    <a href="showTour.do">查询旅行团</a><br/>
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="国内 港澳台  海外酒店" style="background-color: orange">
                    <a href="showHotels.do">酒店</a>
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="查看订单" style="background-color: orange">
                    <a href="showFlightAndTrain.do">添加交通工具</a>
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <!--<a class="nav-link" href="#">度假</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="跟团游  自助游" style="background-color: orange">
                    查询火车
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!--<a class="nav-link" href="#">门票</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="门票查询" style="background-color: orange">
                    门票
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!-- <a class="nav-link" href="#">火车票</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="火车票查询" style="background-color: orange">
                    火车票
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!--<a class="nav-link" href="#">邮轮</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="游轮查询" style="background-color: orange">
                    游轮
                </button>
            </li>
        </ul>
    </div>
</nav>

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
                <td><input type="button" value="编辑" class="update"></td>
                <td><input type="button" value="删除" class="remove"></td>
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

<div style="text-align: center">
    <a href="showHotels.do">返回上级</a>
</div>
</body>
</html>
