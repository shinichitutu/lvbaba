<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/26
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>用户</title>
    <meta charset="utf-8" />
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
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 80%;
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

    <section id="intro_section" class="section under-header mb-0">
        <div class="container">
            <h2 class="mb-3">旅游首页</h2>
      <%--      <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-5">
                    <li class="breadcrumb-item"><a href="index.do">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">旅游首页</li>
                </ol>
            </nav>--%>
            <form action="searchProductMain.do" method="post">
            <div class="search-wrapper search-wrapper-light mb-5">
                <div class="search-form">

                    <div class="search-input">
                        <label for="what" class="form-control-label mb-0">出发地</label>
                        <div class="input-group align-items-center dropdown">
                            <input type="text" id="what" name="deArea" class="form-control" autocomplete="off" placeholder="仅支持中国大陆城市出发" data-toggle="dropdown" />
                            <a href="javascript:void(0);" class="input-group-append" data-toggle="dropdown"><i class="ion-ios-arrow-down"></i></a>
                            <div class="dropdown-menu" data-scrollable="true" data-height="200">
                                <a href="javascript:void(0);" class="dropdown-item" style="color: red;">热门推荐</a>
                                <a href="javascript:void(0);" class="dropdown-item">上海</a>
                                <a href="javascript:void(0);" class="dropdown-item">北京</a>
                                <a href="javascript:void(0);" class="dropdown-item">广州</a>
                                <a href="javascript:void(0);" class="dropdown-item">深圳</a>
                                <a href="javascript:void(0);" class="dropdown-item">杭州</a>

                            </div>
                        </div>
                    </div>

                    <div class="search-input">
                        <label for="where" class="form-control-label mb-0">目的地</label>
                        <div class="input-group align-items-center dropdown">
                            <input type="text" id="where" name="aimArea" class="form-control" autocomplete="off" placeholder="支持全球目的地" data-toggle="dropdown" />
                            <a href="javascript:void(0);" class="input-group-append" data-toggle="dropdown"><i class="ion-ios-arrow-down"></i></a>
                            <div class="dropdown-menu" data-scrollable="true" data-height="200">
                                <a href="javascript:void(0);" class="dropdown-item" style="color: red;">热门推荐</a>
                                <a href="javascript:void(0);" class="dropdown-item">北京</a>
                                <a href="javascript:void(0);" class="dropdown-item">成都</a>
                                <a href="javascript:void(0);" class="dropdown-item">张家界</a>
                                <a href="javascript:void(0);" class="dropdown-item">东京</a>
                                <a href="javascript:void(0);" class="dropdown-item">悉尼</a>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-danger">搜索</button>

                </div>
            </div>
            </form>

        </div>
    </section>

</div>


<div class="container">
    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- 指示符 -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- 轮播图片 -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/shouye1.jpg">
            </div>
            <div class="carousel-item">
                <img src="img/shouye2.jfif">
            </div>
            <div class="carousel-item">
                <img src="img/shouye3.jfif">
            </div>
        </div>

        <!-- 左右切换按钮 -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>

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


<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>

</body>

</html>
