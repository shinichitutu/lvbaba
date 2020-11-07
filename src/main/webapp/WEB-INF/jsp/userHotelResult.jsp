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
    <title>Title</title>
    <base href="<%=basePath%>"/>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="Listigo | Directory Bootstrap 4 Template" />
    <meta name="keywords" content="listing dashboard, directory panel, listing, responsive directory, directory template, themeforest, listing template, css3, html5" />
    <title>Listigo | Directory Bootstrap 4 Template</title>
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
    <script src="../../js/jquery-3.1.0.js"></script>

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
                    <li class="nav-item">
                        <div class="media align-items-center">
                            <div class="avatar avatar-sm">
                                <img src="assets/images/user/32/user-1.jpg" alt="" />
                            </div>
                            <div class="media-body pl-2 avatar-name d-none d-md-block">
                            </div>
                        </div></li>
                    <!--   <li class="nav-item"><a href="add-listing.html" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-add"></i> <span>Add Listing</span></a></li> -->
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>

    <section id="intro_section" class="section under-header mb-0">
        <div class="container">
            <form action="showHotelsResult.do" method="post">
                <div style="float: left;margin-right: 50px;font-weight: bold">
                    目的地<input type="text" name="city" class="form-control" placeholder="请输入目的地城市" style="width: 280px"><br/>
                    入住日期:<input type="date" name="inDate" class="form-control" style="width: 280px">
                </div>

                <div style="margin-right:50px;font-weight: bold">
                    房间数：<input type="number" name="number" placeholder="请输入预定的房间数量" class="form-control" style="width: 280px"><br/>
                    退房日期:<input type="date" name="outDate" class="form-control" style="width: 280px">

                </div>
                <br/>

                <button type="submit" class="btn btn-primary" style="width: 280px">搜索酒店</button>
            </form>



            <div class="listing-header">
                <span class="result-text">共查到50条旅游路线</span>
                <ul class="listing-options">
                    <!-- <li class="listing-options-item"><a href="list-full-width.html" class="active"><i class="ion-md-list"></i></a></li>
                    <li class="listing-options-item"><a href="grid-full-width.html"><i class="ion-md-grid"></i></a></li> -->
                    <%--<li class="listing-options-item"><select name="filter" id="filter" class="custom-select"><option value="0">Popularity</option><option value="1">High Rated</option><option value="2">Most Reviewed</option><option value="3">Newest Listing</option><option value="4">Oldest Listing</option></select></li>--%>
                </ul>
            </div>

            <div class="row list-bunch">

                <c:forEach items="${requestScope.hotelList}" var="hotel" varStatus="status">

                    <div class="col-lg-6 list-bunch-item">
                        <div class="listing-card list-view">

                            <div class="listing-image">
                                <div class="listing-image-head">

                                </div>
                                <a href="#"><img src="assets/images/listing/cafe.jpg" alt="" /></a>
                            </div>

                            <div class="listing-content">
                                <div class="listing-content-body">

                                    <div class="listing-content-head mb-3">

                                        <!-- 评分 -->
                                        <div class="listing-rating">
                                            <span class="listing-rating-number">${hotel.hotelLevel}</span>
                                            <i class="ion-md-star"></i>
                                        </div>

                                        <div class="listing-desc">
                                            <a href="#" class="listing-title text-truncate"></a>
                                            <p></p>
                                        </div>

                                    </div>

                                    <p style="font-size: 26px">${hotel.hotelName}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>



        </div>
    </section>



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


