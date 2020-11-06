<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/4
  Time: 18:40
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
    <title>购票记录</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="Listigo | Directory Bootstrap 4 Template" />
    <meta name="keywords" content="listing dashboard, directory panel, listing, responsive directory, directory template, themeforest, listing template, css3, html5" />
    <link href="assets/images/logos/favicon.png" rel="icon" />
    <link rel="apple-touch-icon" href="assets/images/logos/touch-icon-iphone.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/logos/touch-icon-ipad.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/logos/touch-icon-iphone-retina.png" />
    <link rel="apple-touch-icon" sizes="167x167" href="assets/images/logos/touch-icon-ipad-retina.png" />
    <link rel="stylesheet" href="assets/css/vendors.bundle.css" type="text/css" />
    <link rel="stylesheet" href="assets/css/styles.bundle.css" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;600;700;800;900&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&amp;display=swap" rel="stylesheet" />
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>
    <style>
        table {
            width: 1500px;
            border-top: 1px solid #aaaaaa;
        }

        th,td {
            border-bottom: 1px solid #c1b0b0;
            text-align: center;
            padding: 10px 0;
        }
    </style>
    <script>
        $(function () {
            if (${not empty requestScope.returnTicketInfo}){
                alert("${requestScope.returnTicketInfo}");
            }
        })
        function returnTicket(obj,fdrId) {
            var res = confirm("退票需付手续费，详情参照上面，确认退款吗？")
            if (res){
                location.href="returnTicket.do?fdrId="+fdrId;
            }else{
                return;
            }
        }
    </script>
</head>
<body style="width: 1500px;margin: 30px auto 0 auto;background-color:#eef1f1">
<div id="wrapper">
    <div id="loading">
        <div id="loader"></div>
    </div>

    <header id="header" class="colored-header fixed-top">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="index.html"><img src="assets/images/logos/logo_light.svg" class="default light" alt="Listigo" /> <img src="assets/images/logos/logo_dark.svg" class="default dark" alt="Listigo" /> <img src="assets/images/logos/compact_logo_light.svg" class="compact light" alt="Listigo" /> <img src="assets/images/logos/compact_logo_dark.svg" class="compact dark" alt="Listigo" /></a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <div class="media align-items-center">
                            <div class="avatar avatar-sm">
                                <img src="assets/images/user/32/user-1.jpg" class="retina" alt="" />
                            </div>
                            <div class="media-body pl-2 avatar-name d-none d-md-block">
                                欢迎登录！
                            </div>
                        </div></li>
                    <!--   <li class="nav-item"><a href="add-listing.html" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-add"></i> <span>Add Listing</span></a></li> -->
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>
    <br/>


    <a href="#intro_section" class="btn btn-danger btn-only-icon target scroll-top"><i class="ion-md-arrow-up"></i></a>
    <aside id="sidebar">
        <div class="sidebar-header">
            <a href="javascript:void(0);" id="close_sidebar">&times;</a>

        </div>
        <nav id="nav">
            <ul>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">旅游</a>
                    <ul class="nav-sub-menu">
                        <li><a href="userMain.do">旅游首页</a></li>
                        <li><a href="userMain.do">推荐路线</a></li>
                    </ul></li>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">机票酒店</a>
                    <ul class="nav-sub-menu">
                        <li><a href="toUserFlightBookView.do">预订机票</a></li>
                        <li><a href="hotelView.do">预订酒店</a></li>
                    </ul></li>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">个人中心</a>
                    <ul class="nav-sub-menu">
                        <li><a href="toUserOrderRecordView.do">旅行订单</a></li>
                        <li><a href="toBookingRecordView.do">机票订单</a></li>
                        <li><a href="#">个人信息</a></li>
                        <li><a href="userRecharge.do">充值</a></li>
                        <li><a href="loginOut.do">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </aside>
</div>

<h3>购票记录</h3>
<br/>
<br/>
<br/>
<h4 style="color: red"> ! 退票需付手续费，出发当天不能退票，出发前3天内50%手续费，前4-10天内30%的手续费，前11-30天20%的手续费，提前一个月退票10%的手续费</h4>
<div>
    <table>
        <thead>
        <tr>
            <th>序号</th>
            <th>航班号</th>
            <th>航空公司</th>
            <th>出发地</th>
            <th>目的地</th>
            <th>出发日期</th>
            <th>到达日期</th>
            <th>购买人姓名</th>
            <th>证件类型</th>
            <th>证件号码</th>
            <th>联系电话</th>
            <th>价格</th>
            <th>状态</th>
            <th>退票</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty requestScope.ticketrecords}">
            <tr>
                <td colspan="13">暂时没有任何订单信息</td>
            </tr>
        </c:if>
        <c:forEach items="${requestScope.ticketrecords}" var="tkrecord" varStatus="i">
            <tr>
                <td>${i.count}</td>
                <td>${tkrecord.flightName}</td>
                <td>${tkrecord.flightCanpany}</td>
                <td>${tkrecord.departureArea}</td>
                <td>${tkrecord.destinationArea}</td>
                <td>${tkrecord.departureTime}</td>
                <td>${tkrecord.arrivalTime}</td>
                <td>${tkrecord.userName}</td>
                <td>身份证</td>
                <td>${tkrecord.userIdcard}</td>
                <td>${tkrecord.userPhone}</td>
                <td style="color: red;font-weight: bold;font-size: 20px;">${tkrecord.flightPrice}</td>
                <td>${tkrecord.recordStatus}</td>
                <td>
                    <c:if test="${'已支付'.equals(tkrecord.recordStatus)}">
                    <a style="cursor: pointer" onclick="returnTicket(this,'${tkrecord.fdrId}')">退票</a></c:if>
                    <c:if test="${'已退票'.equals(tkrecord.recordStatus)}"><a>...</a></c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<footer id="footer">
    <div class="last-footer text-muted">
        &copy; 2020 Kri8thm. All rights reserved.
    </div>

</footer>
<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>

</body>
</html>
