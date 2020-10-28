<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/26
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>产品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#d1").click(function () {
                $("#d2").css("display","block")
            })
        })
    </script>
    <base href="<%=basePath%>"/>
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
            <td>产品id</td>
            <td>出发地</td>
            <td>目的地</td>
            <td>人数下限</td>
            <td>人数上限</td>
            <td>行程天数</td>
            <td>客房</td>
            <td>产品名称</td>
            <td>基本团费</td>
            <td>评分</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.products}" var="product" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${product.daId}</td>
                <td>${product.arrAreaId}</td>
                <td>${product.limLow}</td>
                <td>${product.limUp}</td>
                <td>${product.days}</td>
                <td>${product.rId}</td>
                <td>${product.pName}</td>
                <td>${product.pFee}</td>
                <td>${product.pScore}</td>
                <td><a href="showTour.do?pId=${product.pId}">查询旅行团</a></td>
                <td><input type="button" value="删除产品" class="remove"></td>
                <td><input type="button" value="修改产品" class="update"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div style="text-align: center">
    <input type="button" value="增加产品" id="d1">
    <p style="color: green">${requestScope.success}</p>
    <p style="color: red">${requestScope.error}</p>
</div>
<div style="text-align: center;display: none;" id="d2">
    <form action="insertProduct.do" method="post">
        <select name="daId">
            <c:forEach items="${requestScope.areas}" varStatus="i" var="area">

                <option value="${area.areaId}">${area.country}</option>

            </c:forEach>
        </select>
        <select name="arrAreaId">
            <c:forEach items="${requestScope.areas}" varStatus="i" var="area">
                <option value="${area.areaId}">${area.country}</option>
            </c:forEach>
        </select>
        <input type="number" min="1" max="5" step="1" name="limLow" placeholder="请选择人数下限"><br/>
        <input type="number" min="1" max="5" step="1" name="limUp" placeholder="请选择人数下限"><br/>
        <input type="number" min="1" max="5" step="1" name="days" placeholder="请选择行程天数"><br/>
        <input type="text" name="rId" placeholder="请输入客房id"><br/>
        <input type="text" name="pName" placeholder="请输入产品名称"><br/>
        <input type="number" min="500" max="10000" step="500" name="pFee" placeholder="请选择基本团费"><br/>
        <input type="hidden" name="pScore" value="0"><br/>
        <input type="submit" value="点击添加">
    </form>
</div>
<div style="text-align: center">
    <c:if test="${requestScope.page>1}">
        <a href="showProduct.do?page=${requestScope.page-1}"><input type="button" value="上一页"></a>
    </c:if>
    <c:forEach begin="1" end="${requestScope.pages}" step="1" var="i">
        <a href="showProduct.do?page=${i}">${i}</a>
    </c:forEach>
    <c:if test="${requestScope.page < requestScope.pages}">
        <a href="showProduct.do?page=${requestScope.page+1}"><input type="button" value="下一页"></a>
    </c:if></div>
</body>
</html>
