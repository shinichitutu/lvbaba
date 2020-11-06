<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/10/29
  Time: 16:37
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
    <title>确认订单</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        table {
            width: 800px;
            border-top: 1px solid #aaaaaa;
            border-bottom: 1px solid #aaaaaa;
        }

        tr, th {
            border-bottom: 1px solid #aaaaaa;
            text-align: center;
            padding: 10px 0;
        }

        #addUser {
            width: 850px;
            display: block;
            text-align: right;
            padding-right: 100px;
        }

        #addUser, .modify_UserInfo {
            text-decoration: underline;
            cursor: pointer;
            color: #0099ff;
        }

        .costDetail {
            float: right;
            width: 400px;
            background-color: white;
            padding: 10px;
            border-radius: 10px;
        }

        body {
            background-color: #f1f1f6;
        }

        .payOrder {
            font-weight: bold;
            color: white;
            margin-right: 50px;
            width: 250px;
            padding: 10px;
            background-color: rgba(255, 138, 38, 0.83);
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
                <a class="navbar-brand" href="index.do"><img src="assets/images/logos/logo_light.svg" class="default light" alt="Listigo" /> <img src="assets/images/logos/logo_dark.svg" class="default dark" alt="Listigo" /> <img src="assets/images/logos/compact_logo_light.svg" class="compact light" alt="Listigo" /> <img src="assets/images/logos/compact_logo_dark.svg" class="compact dark" alt="Listigo" /></a>
                <ul class="navbar-nav ml-auto">
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>

    <div class="container" style="padding-top: 50px;height: 400px">
<div style="width: 1300px;margin: 30px auto 0 auto;">
    <div style="width: 1300px;background-color: #eedde4;padding: 10px;border-radius: 10px;">
        旅游提醒：可接待体温正常、持有健康码绿码、未途经或来自国内疫情中、高风险地区的境内人员。 若您持有非绿码、来自或途经国内疫情中、高风险地区、或是港澳台/外籍人员，请务必详细了解当地疫情相关规定，合理安排出行。
    </div>

    <br/>

    <div class="costDetail">
        <h5 class="text-info">费用明细</h5>

        <p>基本团费：￥${requestScope.product.productFee}</p>
        <p>酒店：￥${requestScope.hotelFee}</p>
        <p>往返交通：￥${requestScope.transFee}x${requestScope.numberOfTrips}人</p>
        <p class="text-primary">总价：￥${requestScope.total}</p>
    </div>

    <div style="width: 880px;">
        <div class="tourInfo" style="background-color: white;padding: 10px;border-radius: 10px;">
            <%--<h3>${requestScope.departureArea.city}+${requestScope.destinationArea.city}${product.days}日游</h3>--%>
            <h3>产品名称：${requestScope.product.productName}</h3>
                <p>产品编号：202000${requestScope.product.productId}</p>
        </div>
        <div class="orderDetail" style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
            <p>
            <h3 style="display: inline" class="text-info">订单明细</h3><br/>
            <span class="text-warning">以下为您所选择的全部资源明细，下单前请仔细查看核实。</span></p>

            <ul class="list-group">
                <li class="list-group-item">出发地：${requestScope.departureArea.city}</li>
                <li class="list-group-item">目的地：${requestScope.destinationArea.city}</li>


            <c:if test="${requestScope.type eq '1'}">
                <li class="list-group-item">去程航班号：${requestScope.flightGo.flightCompany}-${requestScope.flightGo.flightNumber}</li>
                <li class="list-group-item">预计起飞时间：${requestScope.flightdetailGo.fdDate}&nbsp;${requestScope.flightGo.flightDTime}</li>
                <li class="list-group-item">预计达到时间：${requestScope.flightdetailGo.fdDate}&nbsp;${requestScope.flightGo.flightATime}</li>
                <li class="list-group-item">回程航班号：${requestScope.flightRe.flightCompany}-${requestScope.flightRe.flightNumber}</li>
                <li class="list-group-item">预计起飞时间：${requestScope.flightdetailRe.fdDate}&nbsp;${requestScope.flightRe.flightDTime}</li>
                <li class="list-group-item">预计达到时间：${requestScope.flightdetailRe.fdDate}&nbsp;${requestScope.flightRe.flightATime}</li>
            </c:if>

            <c:if test="${requestScope.type eq '2'}">
                <li class="list-group-item">去程火车车次：${requestScope.trainGo.trNumber}</li>
                <li class="list-group-item">预计出发时间：${requestScope.traindetailGo.tdDate}&nbsp;${requestScope.trainGo.trDTime}</li>
                <li class="list-group-item">预计到达时间：${requestScope.traindetailGo.tdDate}&nbsp;${requestScope.trainGo.trATime}</li>
                <li class="list-group-item">回程火车车次：${requestScope.trainRe.trNumber}</li>
                <li class="list-group-item">预计出发时间：${requestScope.traindetailRe.tdDate}&nbsp;${requestScope.trainRe.trDTime}</li>
                <li class="list-group-item">预计到达时间：${requestScope.traindetailRe.tdDate}&nbsp;${requestScope.trainRe.trATime}</li>
            </c:if>

                <li class="list-group-item">酒店名称：${requestScope.destinationArea.city}&nbsp${requestScope.hotel.hotelName}</li>
                <li class="list-group-item">房间数：${requestScope.sRoom}间
                    <c:if test="${requestScope.roomType eq 1}">
                    标间
                </c:if>
                    <c:if test="${requestScope.roomType eq 2}">
                        大床房
                    </c:if>
                    <c:if test="${requestScope.roomType eq 3}">
                        豪华套房
                    </c:if>
                </li>

            </ul>
        </div>


    </div>

    <br/>
    <form action="comfirmUserInfo.do" method="post">
        <input type="hidden" name="tourId" value="${requestScope.tour.tourId}">
        <input type="hidden" name="total" value="${requestScope.total}">
        <input type="hidden" name="person" value="${requestScope.numberOfTrips}">
        <input type="hidden" name="roomNum" value="${requestScope.sRoom}">
        <input type="hidden" name="roomId" value="${requestScope.roomId}">
        <button type="submit" class="btn btn-primary">下一步</button>
    </form>
    </div>



</div>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
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
                        <li><a href="#">推荐路线</a></li>
                    </ul></li>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">机票酒店</a>
                    <ul class="nav-sub-menu">

                        <li><a href="#">预订机票</a></li>
                        <li><a href="hotelView.do">预订酒店</a></li>
                    </ul></li>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">个人中心</a>
                    <ul class="nav-sub-menu">
                        <li><a href="#">旅行订单</a></li>
                        <li><a href="#">机票订单</a></li>
                        <li><a href="#">酒店订单</a></li>
                        <li><a href="#">个人信息</a></li>

                    </ul></li>
            </ul>
        </nav>
    </aside>
</div>

<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>



</body>
</html>
