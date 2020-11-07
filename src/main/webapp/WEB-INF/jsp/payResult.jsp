<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/11/5
  Time: 15:58
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
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="Listigo | Directory Bootstrap 4 Template" />
    <meta name="keywords" content="listing dashboard, directory panel, listing, responsive directory, directory template, themeforest, listing template, css3, html5" />
    <title>驴爸爸旅行</title>
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

    <script>
        $(function () {
            if (${not empty sessionScope.user}){
                $("#loginUserInfo").html("欢迎${sessionScope.user.uName}登录");
            }
        })
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
                <a class="navbar-brand" href="index.do"><img src="img/mainlogo.png" style="height: 100px;width: 100px;border-radius: 20%" class="default light" alt="Listigo" /> <img src="img/mainlogo.png" style="height: 100px;width: 100px;border-radius: 20%" class="default dark" alt="Listigo" /> <img src="img/mainlogo.png" style="height: 100px;width: 100px;border-radius: 20%" class="compact light" alt="Listigo" /> <img src="img/mainlogo.png" style="height: 100px;width: 100px;border-radius: 20%" class="compact dark" alt="Listigo" /></a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="javascript:void(0);" data-toggle="modal" data-target="#sign_in" id="loginUserInfo"></a></li>
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>
    <br/>
<div class="container" style="margin-top: 50px">

    <div class="alert alert-success">
        <strong>${requestScope.success}
            ${requestScope.error}</strong>
        <a href="index.do" class="alert-link">点击返回主页</a>
    </div>
</div>
<footer id="footer">
    <div class="last-footer text-muted">
        &copy; 2020 杜炳友/陆垚/陆金易. All rights reserved.
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
