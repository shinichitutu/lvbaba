<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/5
  Time: 10:14
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
    <title>用户旅行订单</title>
    <meta charset="utf-8"/>
    <script src="../../js/jquery-3.1.0.js"></script>
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
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        table {
            width: 1500px;
            border-top: 1px solid #aaaaaa;
        }

        th, td {
            border-bottom: 1px solid #c1b0b0;
            text-align: center;
            padding: 10px 0;
        }
    </style>
    <script>
        $(function () {
            if (${not empty requestScope.returnUserOrderInfo}) {
                alert("${requestScope.returnUserOrderInfo}");
            }
        })

        function returnMoney(obj, orderId) {
            var res = confirm("退票需付手续费，详情参照上面，确认退款吗？")
            console.log(orderId);
            if (res) {
                location.href = "returnUserOrder.do?orderId=" + orderId;
            } else {
                return;
            }
        }

        function addComment(obj, orderId) {
            var str = "<form action='createComment.do' method='get'>" +
                "<input type='hidden' name='orderId' value='" + orderId + "'/>" +
                "评分：<input type='number' name='score' max='5' min='1' step='1' class='form-control' style='width: 10%'/><br/>" +
                "<span style='display: inline-block;'>评论内容：</span>" +
                "<input type='text' name='content' placeholder='请输入评论内容' class='form-control' style='width: 50%'/><br/><br/>"+
                "<input type='submit' class='btn btn-primary' value='确认评论' '/>"+
                "</form>";
            $(".addCommentInfo").html("");
            $(".addCommentInfo").html(str);
        }
    </script>
</head>

<body>

<div id="wrapper">
    <div id="loading">
        <div id="loader"></div>
    </div>

    <header id="header" class="colored-header fixed-top">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="index.do"><img src="assets/images/logos/logo_light.svg" class="default light" alt="Listigo" /> <img src="assets/images/logos/logo_dark.svg" class="default dark" alt="Listigo" /> <img src="assets/images/logos/compact_logo_light.svg" class="compact light" alt="Listigo" /> <img src="assets/images/logos/compact_logo_dark.svg" class="compact dark" alt="Listigo" /></a>
                <ul class="navbar-nav ml-auto">
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>
    <div class="container" style="padding-top: 100px">
<h3>旅行订单</h3>
<h5 style="color: red"> ! 退票需付手续费，已发团不能退团，出发前3天内退团需付50%手续费，前4-10天内退团需付30%的手续费，前11-30天退团需付20%的手续费，提前一个月退团需付10%的手续费</h5>
<div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>序号</th>
            <th>产品名称</th>
            <th>出发地</th>
            <th>目的地</th>
            <th>出发日期</th>
            <th>返程日期</th>
            <th>交通类型</th>
            <th>去程交通</th>
            <th>返程交通</th>
            <th>入住酒店</th>
            <th>支付价格</th>
            <th>出行人数</th>
            <th>下单时间</th>
            <th>订单状态</th>
            <th>评论</th>
            <th>退款</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty requestScope.userorderList}">
            <tr>
                <td colspan="15">1</td>
                <td colspan="14">暂时没有任何出行信息</td>
            </tr>
        </c:if>
        <c:forEach items="${requestScope.userorderList}" var="orderList" varStatus="i">
            <tr>
                <td>${i.count}</td>
                <td>${orderList.product.productName}</td>
                <td>${orderList.product.d_area.country}·${orderList.product.d_area.city}</td>
                <td>${orderList.product.a_area.country}·${orderList.product.a_area.city}</td>
                <td>${orderList.tour.dDate}</td>
                <td>${orderList.tour.roomDate}</td>
                <td>
                    <c:if test="${'1'.equals(orderList.tour.transType)}">飞机</c:if>
                    <c:if test="${'2'.equals(orderList.tour.transType)}">火车</c:if>
                </td>
                <td>${orderList.tour.go_flight.flightNumber}${orderList.tour.go_train.trNumber}</td>
                <td>${orderList.tour.re_flight.flightNumber}${orderList.tour.re_train.trNumber}</td>
                <td>${orderList.product.hotel.hotelName}</td>
                <td>${orderList.orderPrice}</td>
                <td>${orderList.roomNum}</td>
                <td>${orderList.orderTime}</td>
                <td>${orderList.orderStatus}</td>
                <td>
                    <c:if test="${'已确认发团'.equals(orderList.orderStatus)}">
                        <input type="button" onclick="addComment(this,'${orderList.orderId}')" value="评论"/>
                    </c:if>
                </td>
                <td>
                    <c:if test="${!'已成团'.equals(orderList.orderStatus) && !'待成团'.equals(orderList.orderStatus) || '5'.equals(orderList.tour.tourStatus) || '6'.equals(orderList.tour.tourStatus)}">...</c:if>
                    <c:if test="${('待成团'.equals(orderList.orderStatus) || '已成团'.equals(orderList.orderStatus)) && !'5'.equals(orderList.tour.tourStatus) && !'6'.equals(orderList.tour.tourStatus)}">
                        <input type="button" onclick="returnMoney(this,'${orderList.orderId}')" value="退款"/>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<br/>

<div class="addCommentInfo">
</div>
    </div>
    <footer id="footer">
        <div class="last-footer text-muted">
            &copy; 2020 Kri8thm. All rights reserved.
        </div>
    </footer>

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
                        <li><a href="userCenter.do">个人信息</a></li>
                        <li><a href="loginOut.do">退出登录</a></li>
                    </ul>
                </li>

            </ul>
        </nav>
    </aside>
</div>

<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>

</body>
</html>
