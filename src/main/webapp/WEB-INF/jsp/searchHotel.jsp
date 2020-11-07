<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/11/2
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <title>脚印网 行走天下</title>
    <base href="<%=basePath%>"/>
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
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>

    <script>
        $(function () {
            if (${not empty sessionScope.user}) {
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
                    <li class="nav-item"><a href="javascript:void(0);" data-toggle="modal" data-target="#sign_in"
                                            id="loginUserInfo"></a></li>
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>
    <br/>

    <div class="container" style="padding-top: 120px;height: 400px">

        <div style="width: 300px;float: left">

            <form action="showHotelsResult.do" method="post">
                目的地<input type="text" name="city" class="form-control" placeholder="请输入目的地城市" style="width: 280px"><br/>
                入住日期:<input type="date" name="inDate" class="form-control" style="width: 280px"><br/>
                退房日期:<input type="date" name="outDate" class="form-control" style="width: 280px"><br/>
                房间数：<input type="number" name="number" placeholder="请输入预定的房间数量" class="form-control"
                           style="width: 280px"><br/>
                <button type="submit" disabled="disabled" class="btn btn-primary btn-block" style="width: 280px">搜索酒店
                </button>
            </form>

        </div>

        <div id="demo" class="carousel slide" data-ride="carousel" style="float: left;width: 800px;margin-top:40px">

            <!-- 指示符 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- 轮播图片 -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
                </div>
                <div class="carousel-item">
                    <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
                </div>
                <div class="carousel-item">
                    <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
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

    <br/><br/><br/><br/>
    <p>开发中，敬请期待....</p>


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
                    </ul>
                </li>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">机票酒店</a>
                    <ul class="nav-sub-menu">
                        <li><a href="toUserFlightBookView.do">预订机票</a></li>
                        <li><a href="hotelView.do">预订酒店</a></li>
                    </ul>
                </li>
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item nav-has-sub"><a href="javascript:void(0);">个人中心</a>
                        <ul class="nav-sub-menu">
                            <li><a href="toUserOrderRecordView.do">旅行订单</a></li>
                            <li><a href="toBookingRecordView.do">机票订单</a></li>
                            <li><a href="userCenter.do">个人信息</a></li>
                            <li><a href="loginOut.do">退出登录</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </nav>
    </aside>
</div>
<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>

</body>
</html>
