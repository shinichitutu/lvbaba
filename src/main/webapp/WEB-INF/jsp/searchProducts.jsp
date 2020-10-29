<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/28
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>搜索产品页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <base href="<%=basePath%>"/>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1 id="go_top">欢迎${sessionScope.admin.adName}登录</h1>
    <p></p>
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
    <a class="navbar-brand" href="#" style="margin-left: 50px">驴爸爸旅行</a>
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
<div style="text-align: center">
    <select id="country">
        <c:forEach items="${requestScope.country}" varStatus="i" var="area">
            <option value="${area.country}">${area.country}</option>
        </c:forEach>
    </select>
</div>
<div class="container">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>产品</td>
            <td>出发地</td>
            <td>目的地</td>
            <td>人数下限</td>
            <td>人数上限</td>
            <td>行程天数</td>
            <td>酒店名称</td>
            <td>产品名称</td>
            <td>基本团费</td>
            <td>评分</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.products}" var="productArea" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${productArea.departArea}</td>
                <td>${productArea.destinationArea}</td>
                <td>${productArea.product.limLow}</td>
                <td>${productArea.product.limUp}</td>
                <td>${productArea.product.days}</td>
                <td>${productArea.hotel.hName}</td>
                <td>${productArea.product.pName}</td>
                <td>${productArea.product.pFee}</td>
                <td>${productArea.product.pScore}</td>
                <td><a href="showTour.do?pId=${productArea.product.pId}">查询旅行团</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div style="text-align: center">
    <c:if test="${requestScope.page>1}">
        <a href="searchProducts.do?page=${requestScope.page-1}&daId=${requestScope.daId}&arrAreaId=${requestScope.arrAreaId}"><input type="button" value="上一页"></a>
    </c:if>
    <c:forEach begin="1" end="${requestScope.pages}" step="1" var="i">
        <a href="searchProducts.do?page=${i}&daId=${requestScope.daId}&arrAreaId=${requestScope.arrAreaId}">${i}</a>
    </c:forEach>
    <c:if test="${requestScope.page < requestScope.pages}">
        <a href="searchProducts.do?page=${requestScope.page+1}&daId=${requestScope.daId}&arrAreaId=${requestScope.arrAreaId}"><input type="button" value="下一页"></a>
    </c:if>
</div>

</body>
</html>
