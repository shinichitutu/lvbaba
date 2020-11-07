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
                                欢迎${sessionScope.admin.adName}登录！
                            </div>
                        </div></li>
                    <!--   <li class="nav-item"><a href="add-listing.html" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-add"></i> <span>Add Listing</span></a></li> -->
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>

    <div id="intro_section" class="section under-header mb-0">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="dashboard--content">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-5">
                                <li class="breadcrumb-item"><a href="index.html">管理员</a></li>
                                <li class="breadcrumb-item active" aria-current="page">总览</li>
                            </ol>
                        </nav>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card overflow-hidden dashboard--card bg-danger text-white border-0">
                                    <div class="dashboard--card__icon">
                                        <i class="ion-md-list"></i>
                                    </div>
                                    <div class="card-body">
                                        <h2 class="mb-0 text-white">1023</h2>
                                        <p>Total Listing</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card overflow-hidden dashboard--card bg-warning border-0">
                                    <div class="dashboard--card__icon">
                                        <i class="ion-md-star"></i>
                                    </div>
                                    <div class="card-body">
                                        <h2 class="mb-0">2405</h2>
                                        <p>Total Reviews</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card overflow-hidden dashboard--card">
                                    <div class="dashboard--card__icon">
                                        <i class="ion-md-bookmark"></i>
                                    </div>
                                    <div class="card-body">
                                        <h2 class="mb-0">568</h2>
                                        <p>Total Bookmarked</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="card dashboard--card">
                                    <div class="card-body">
                                        <h5 class="mb-0">Listing Statistics</h5>
                                        <p class="font-md">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                        <div style="height: 200px;">
                                            <canvas id="statistics"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="card dashboard--card">
                                    <div class="card-body">
                                        <h5>Ads Campaigns</h5>
                                        <div style="height: 230px;">
                                            <canvas id="campaigns"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="card dashboard--card">
                                    <div class="card-body">
                                        <h5>Recent Activities</h5>
                                        <ul class="list-unstyled mb-0">
                                            <li class="media mb-3">
                                                <div class="avatar-icon avatar-sm">
                                                    <i class="ion-md-list"></i>
                                                </div>
                                                <div class="media-body pl-3">
                                                    <p class="font-md text-muted mb-1">Your listing <a href="#" class="font-weight-bold">A1 Mall</a> has been approved.</p>
                                                    <span class="d-block font-sm text-muted">10 hours ago</span>
                                                </div></li>
                                            <li class="media mb-3">
                                                <div class="avatar-icon avatar-sm">
                                                    <i class="ion-md-bookmark"></i>
                                                </div>
                                                <div class="media-body pl-3">
                                                    <p class="font-md text-muted mb-1">Someone bookmark your <a href="#" class="font-weight-bold">First dating cafe</a> listing.</p>
                                                    <span class="d-block font-sm text-muted">12 hours ago</span>
                                                </div></li>
                                            <li class="media mb-3">
                                                <div class="avatar avatar-sm">
                                                    <img src="assets/images/user/32/user-1.jpg" class="retina" alt="" />
                                                </div>
                                                <div class="media-body pl-3">
                                                    <p class="font-md text-muted mb-1"><a href="#" class="font-weight-bold">Herris</a> gives 5 star rating on <a href="#" class="font-weight-bold">Good Restaurant</a></p>
                                                    <span class="d-block font-sm text-muted">1 day ago</span>
                                                </div></li>
                                            <li class="media mb-3">
                                                <div class="avatar avatar-sm">
                                                    <img src="assets/images/user/32/user-2.jpg" class="retina" alt="" />
                                                </div>
                                                <div class="media-body pl-3">
                                                    <p class="font-md text-muted mb-1"><a href="#" class="font-weight-bold">Paige Turner</a> bookmark your <a href="#" class="font-weight-bold">Alpha Muscle Center</a> listing</p>
                                                    <span class="d-block font-sm text-muted">1 day ago</span>
                                                </div></li>
                                            <li class="media">
                                                <div class="avatar-icon avatar-sm">
                                                    <i class="ion-md-star"></i>
                                                </div>
                                                <div class="media-body pl-3">
                                                    <p class="font-md text-muted mb-1">Someone gives 5 star rating on <a href="#" class="font-weight-bold">Continental Hotel</a></p>
                                                    <span class="d-block font-sm text-muted">2 days ago</span>
                                                </div></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="card dashboard--card">
                                    <div class="card-body">
                                        <h5>Invoices</h5>
                                        <ul class="list-unstyled data--list">
                                            <li class="data--list__item">
                                                <div class="data--list__item-content">
                                                    <p class="mb-1"><a href="invoice.html" class="font-weight-bold text-truncate">Mario Speedwagon</a></p>
                                                    <ul class="list-unstyled data--list__item-content__info">
                                                        <li class="text-danger">#000IN1</li>
                                                        <li>Sep 11, 2020</li>
                                                        <li><span class="badge badge-success">Paid</span></li>
                                                    </ul>
                                                </div>
                                                <div class="dropdown">
                                                    <a class="icon-sm" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ion-md-more"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">View</a>
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                    </div>
                                                </div></li>
                                            <li class="data--list__item">
                                                <div class="data--list__item-content">
                                                    <p class="mb-1"><a href="invoice.html" class="font-weight-bold text-truncate">Petey Cruiser</a></p>
                                                    <ul class="list-unstyled data--list__item-content__info">
                                                        <li class="text-danger">#000IN2</li>
                                                        <li>Sep 08, 2020</li>
                                                        <li><span class="badge badge-light">Cancel</span></li>
                                                    </ul>
                                                </div>
                                                <div class="dropdown">
                                                    <a class="icon-sm" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ion-md-more"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">View</a>
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                    </div>
                                                </div></li>
                                            <li class="data--list__item">
                                                <div class="data--list__item-content">
                                                    <p class="mb-1"><a href="invoice.html" class="font-weight-bold text-truncate">Anna Sthesia</a></p>
                                                    <ul class="list-unstyled data--list__item-content__info">
                                                        <li class="text-danger">#000IN3</li>
                                                        <li>Sep 05, 2020</li>
                                                        <li><span class="badge badge-success">Paid</span></li>
                                                    </ul>
                                                </div>
                                                <div class="dropdown">
                                                    <a class="icon-sm" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ion-md-more"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">View</a>
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                    </div>
                                                </div></li>
                                            <li class="data--list__item">
                                                <div class="data--list__item-content">
                                                    <p class="mb-1"><a href="invoice.html" class="font-weight-bold text-truncate">Paul Molive</a></p>
                                                    <ul class="list-unstyled data--list__item-content__info">
                                                        <li class="text-danger">#000IN4</li>
                                                        <li>Sep 01, 2020</li>
                                                        <li><span class="badge badge-warning">Unpaid</span></li>
                                                    </ul>
                                                </div>
                                                <div class="dropdown">
                                                    <a class="icon-sm" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ion-md-more"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">View</a>
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                    </div>
                                                </div></li>
                                            <li class="data--list__item">
                                                <div class="data--list__item-content">
                                                    <p class="mb-1"><a href="invoice.html" class="font-weight-bold text-truncate">Anna Mull</a></p>
                                                    <ul class="list-unstyled data--list__item-content__info">
                                                        <li class="text-danger">#000IN5</li>
                                                        <li>Sep 01, 2020</li>
                                                        <li><span class="badge badge-warning">Unpaid</span></li>
                                                    </ul>
                                                </div>
                                                <div class="dropdown">
                                                    <a class="icon-sm" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ion-md-more"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">View</a>
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                    </div>
                                                </div></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                    <li><a href="#">订单管理</a></li>
                </ul></li>

        </ul>
    </nav>
</aside>
</div>
<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>
<script src="assets/js/custom/admin.panel.js"></script>
</body>
</html>