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
                    <!-- <li class="nav-item"><a href="javascript:void(0);" data-toggle="modal" data-target="#sign_in">Login</a></li>
                    <li class="nav-item"><a href="add-listing.html" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-add"></i> <span>Add Listing</span></a></li> -->
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>

    <section id="intro_section" class="section under-header mb-0">
        <div class="container">
            <h2 class="mb-3">旅游首页</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-5">
                    <li class="breadcrumb-item"><a href="index.do">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">旅游首页</li>
                </ol>
            </nav>
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

            <div class="listing-header">
                <span class="result-text">热门推荐</span>
                <ul class="listing-options">
                    <!-- <li class="listing-options-item"><a href="list-full-width.html" class="active"><i class="ion-md-list"></i></a></li>
                    <li class="listing-options-item"><a href="grid-full-width.html"><i class="ion-md-grid"></i></a></li> -->
                    <%--<li class="listing-options-item"><select name="filter" id="filter" class="custom-select"><option value="0">Popularity</option><option value="1">High Rated</option><option value="2">Most Reviewed</option><option value="3">Newest Listing</option><option value="4">Oldest Listing</option></select></li>--%>
                </ul>
            </div>
            <div class="row list-bunch">
                <div class="col-lg-6 list-bunch-item">
                    <div class="listing-card list-view">

                        <div class="listing-image">
                            <div class="listing-image-head">
                                <!-- <span class="listing-tag">Close now</span>
                                <button type="button" class="ml-auto btn btn-danger btn-only-icon btn-pill"><i class="ion-md-heart-empty"></i></button> -->

                            </div>
                            <a href="list-details.html"><img src="assets/images/listing/cafe.jpg" alt="" /></a>
                        </div>

                        <div class="listing-content">
                            <div class="listing-content-body">

                                <div class="listing-content-head mb-3">

                                    <!-- 评分 -->
                                    <div class="listing-rating">
                                        <span class="listing-rating-number">4.5</span>
                                        <i class="ion-md-star"></i>
                                    </div>

                                    <div class="listing-desc">
                                        <a href="list-details.html" class="listing-title text-truncate">北京秋日赏枫五日游</a>
                                        <p>五星级酒店<br />航班直飞</p>
                                    </div>

                                </div>

                                <p style="font-size: 26px">￥1550.0元起</p>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

<%--            <nav class="mt-5">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#"><i class="ion-ios-arrow-back"></i> <span>Previous</span></a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#"><span>Next</span> <i class="ion-ios-arrow-forward"></i></a></li>
                </ul>
            </nav>--%>


        </div>
    </section>
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
            <li class="nav-item nav-has-sub"><a href="javascript:void(0);">机票</a>
                <ul class="nav-sub-menu">
                    <li><a href="#">机票首页</a></li>
                    <li><a href="#">航班推荐</a></li>

                </ul></li>
            <li class="nav-item nav-has-sub"><a href="javascript:void(0);">酒店</a>
                <ul class="nav-sub-menu">
                    <li><a href="#">酒店首页</a></li>
                    <li><a href="#">酒店推荐</a></li>

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
