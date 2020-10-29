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
                <td>${productArea.hotel.hotelName}</td>
                <td>${productArea.product.productName}</td>
                <td>${productArea.product.productFee}</td>
                <td>${productArea.product.productScore}</td>
                <td><a href="userShowTour.do?productId=${productArea.product.productId}">查询产品详情</a></td>
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
<table class="table table-hover">
    <c:forEach items="${requestScope.products}" var="productArea" varStatus="i">
        <a href="#">
            <object>
                <tr>
                <td>
                    <div class="container">
                        <div style="height:300px">
                            <div style="float:left;height: 100%;width: 30%">
                                <img src="../../img/4.png" style="height: 100%;width: 100%">
                            </div>
                            <div style="width:70%;float:left;height: 40%;font-size: 20px">
                                <button style="background-color: gold">优选</button>${productArea.product.productName}
                            </div>
                            <div style="width:70%;float:left;height:40%;font-size: 20px">
                                <div style="width:60%;float:left;height:100%;font-size: 20px;">
                                    <p style="font-size: 30px;text-align: center;margin-top: 30px">供应商:驴爸爸</p>
                                </div>
                                <div style="width:20%;float:left;height:100%;font-size: 10px;">
                                    <p style="font-size: 30px;text-align: center;margin-top: 30px">评分:${productArea.product.productScore}</p>
                                </div>
                                <div style="width:20%;float:left;height:100%;">
                                    <p style="font-size: 30px;text-align: center;color:red;margin-top: 30px">${productArea.product.productFee}元</p>
                                </div>

                            </div>
                            <div style="width:70%;float:left;height: 20%;text-align: center;">
                                <form action="productOne.do" method="post">
                                    <input name="productId" type="hidden" value="${productArea.product.productId}">
                                    <input name="daId" type="hidden" value="${productArea.product.daId}">
                                    <input name="arrAreaId" type="hidden" value="${productArea.product.arrAreaId}">
                                    <input name="limLow" type="hidden" value="${productArea.product.limLow}">
                                    <input name="limUp" type="hidden" value="${productArea.product.limUp}">
                                    <input name="days" type="hidden" value="${productArea.product.days}">
                                    <input name="hotelId" type="hidden" value="${productArea.product.hotelId}">
                                    <input name="productName" type="hidden" value="${productArea.product.productName}">
                                    <input name="productFee" type="hidden" value="${productArea.product.productFee}">
                                    <input name="productScore" type="hidden" value="${productArea.product.productScore}">
                                    <input type="submit" value="查询产品详情">
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>

            </object>
        </a>
    </c:forEach>
</table>

</body>
</html>
