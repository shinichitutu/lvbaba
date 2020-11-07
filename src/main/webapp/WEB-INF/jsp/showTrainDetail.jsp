<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/10/28
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>显示列车详情</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta name="description" content="Listigo | Directory Bootstrap 4 Template"/>
    <meta name="keywords"
          content="listing dashboard, directory panel, listing, responsive directory, directory template, themeforest, listing template, css3, html5"/>
    <link href="assets/images/logos/favicon.png" rel="icon"/>
    <link rel="apple-touch-icon" href="assets/images/logos/touch-icon-iphone.png"/>
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/logos/touch-icon-ipad.png"/>
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/logos/touch-icon-iphone-retina.png"/>
    <link rel="apple-touch-icon" sizes="167x167" href="assets/images/logos/touch-icon-ipad-retina.png"/>
    <link rel="stylesheet" href="assets/css/vendors.bundle.css" type="text/css"/>
    <link rel="stylesheet" href="assets/css/styles.bundle.css" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;600;700;800;900&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&amp;display=swap"
          rel="stylesheet"/>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        table {
            border-top: 1px solid #e0c6c6;
            border-bottom: 1px solid #e0c6c6;
            text-align: center;
        }

        td, th {
            padding: 5px 10px;
            border-top: 1px solid black;
        }
    </style>

</head>
<body>

<div id="wrapper">
    <div id="loading">
        <div id="loader"></div>
    </div>
    <header id="header" class="colored-header fixed-top">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="index.do"><img src="img/mainlogo.png"
                                                             style="height: 100px;width: 100px;border-radius: 20%"
                                                             class="default light" alt="Listigo"/> <img
                        src="img/mainlogo.png" style="height: 100px;width: 100px;border-radius: 20%"
                        class="default dark" alt="Listigo"/> <img src="img/mainlogo.png"
                                                                  style="height: 100px;width: 100px;border-radius: 20%"
                                                                  class="compact light" alt="Listigo"/> <img
                        src="img/mainlogo.png" style="height: 100px;width: 100px;border-radius: 20%"
                        class="compact dark" alt="Listigo"/></a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <div class="media align-items-center">
                            <div class="avatar avatar-sm">
                                <img src="assets/images/user/32/user-1.jpg" alt=""/>
                            </div>
                            <div class="media-body pl-2 avatar-name d-none d-md-block">
                                欢迎${sessionScope.admin.adName}登录！
                            </div>
                        </div>
                    </li>
                    <!--   <li class="nav-item"><a href="add-listing.html" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-add"></i> <span>Add Listing</span></a></li> -->
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>
    <br/>

    <div class="container" style="padding-top: 50px">

        <table class="tb">
            <thead>
            <tr>
                <th>序号</th>
                <th>列车号</th>
                <th>出发地</th>
                <th>目的地</th>
                <th>出发时间</th>
                <th>到达时间</th>
                <th>容量</th>
                <th>车票价格</th>
                <th>出发日期</th>
                <th>已售票数</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty requestScope.trainDetailList}">
                <tr>
                    <td colspan="12">暂时还没有航班信息</td>
                </tr>
            </c:if>
            <c:forEach items="${requestScope.trainDetailList}" var="train">
                <c:forEach items="${train.traindetailList}" var="traindetail" varStatus="i">
                    <tr>
                        <td style='width: 30px;'>${i.count}</td>
                        <td>${train.flightNumber}</td>
                        <td>${train.flightCompany}</td>
                        <td>${train.d_area.country}-${train.d_area.city}</td>
                        <td>${train.a_area.country}-${train.a_area.city}</td>
                        <td>${train.flightDTime}</td>
                        <td>${train.flightATime}</td>
                        <td>${train.flightCapacity}</td>
                        <td>${train.flightPrice}</td>
                        <td>${traindetail.tdDate}</td>
                        <td>${traindetail.tdTickets}</td>

                        <td><input type="button" value="编辑"></td>
                        <td><input type="button" value="删除"></td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <footer id="footer">

        <div class="last-footer text-muted">
            &copy; 2020 杜炳友|陆垚|陆金易. All rights reserved.
        </div>
    </footer>

    <a href="#intro_section" class="btn btn-danger btn-only-icon target scroll-top"><i class="ion-md-arrow-up"></i></a>
    <aside id="sidebar">
        <div class="sidebar-header">
            <a href="javascript:void(0);" id="close_sidebar">&times;</a>
        </div>
        <nav id="nav">
            <ul>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">管理员操作</a>
                    <ul class="nav-sub-menu">
                        <li><a href="adminMain.do">总览</a></li>
                        <li><a href="showProduct.do">旅游产品管理</a></li>
                        <li><a href="showFlightAndTrain.do">交通管理</a></li>
                        <li><a href="showHotels.do">酒店管理</a></li>
                        <li><a href="index.do">退出登录</a></li>
                    </ul>
                </li>

            </ul>
        </nav>
    </aside>
</div>

<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>
<script src="assets/js/custom/admin.panel.js"></script>

</body>
</html>
