<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/11/4
  Time: 14:43
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta name="description" content="Listigo | Directory Bootstrap 4 Template"/>
    <meta name="keywords"
          content="listing dashboard, directory panel, listing, responsive directory, directory template, themeforest, listing template, css3, html5"/>
    <title>Listigo | Directory Bootstrap 4 Template</title>
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
                <a class="navbar-brand" href="index.do"><img src="assets/images/logos/logo_light.svg"
                                                             class="default light" alt="Listigo"/> <img
                        src="assets/images/logos/logo_dark.svg" class="default dark" alt="Listigo"/> <img
                        src="assets/images/logos/compact_logo_light.svg" class="compact light" alt="Listigo"/> <img
                        src="assets/images/logos/compact_logo_dark.svg" class="compact dark" alt="Listigo"/></a>
                <ul class="navbar-nav ml-auto">
                    <!-- <li class="nav-item"><a href="javascript:void(0);" data-toggle="modal" data-target="#sign_in">Login</a></li>
                    <li class="nav-item"><a href="add-listing.html" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-add"></i> <span>Add Listing</span></a></li> -->
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>

    </header>

    <section id="intro_section">
        <div id="images_list" class="owl-carousel owl-theme">
            <div class="item">
            </div>
        </div>
        <div class="images-list-container">
        </div>
    </section>

    <div class="section pt-0">
        <div class="container">
            <div class="row">
                <div class="col-xl-2 d-none d-xl-block">
                    <div id="listing_link_sidebar">
                        <ul id="listing_link" class="listing-quick-link">
                            <li><a class="listing-link active" href="#overview">产品介绍</a></li>
                            <li><a class="listing-link" href="#pricing">价格介绍</a></li>
                            <li><a class="listing-link" href="#reviews">用户评价</a></li>
                        </ul>

                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <div id="listing_content">
                        <div class="listing-video">
                            <img src="assets/images/listing/details/video-hero.jpg" alt=""/>
                            <div class="d-inline-block">
                                <!-- <a href="javascript:void(0);" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-play"></i> <span>Play video</span></a> -->
                            </div>
                        </div>
                        <div id="overview" class="mt-5">
                            <h3>产品介绍</h3>
                            <h5 class="mb-4">北京秋日赏枫五日游</h5>
                            <p>一次出游畅游皇城精华景点，帝都风貌一览到底不留遗憾！精选高端商务型酒店，品地道京味餐菜，升级一顿全聚德，便宜坊烤鸭。服务至上，精选优秀导游带团！</p>
                            <h5 class="mb-4">产品特点</h5>
                            <ul class="amenities">
                                <li>航变无忧</li>
                                <li>7*24客服</li>
                                <li>出行保障</li>
                                <li>攻略完备</li>
                                <li>酒店优惠</li>
                                <li>接机服务</li>
                                <li>接站服务</li>
                                <li>金牌导游</li>
                            </ul>
                        </div>
                        <div id="pricing" class="mt-5">
                            <h3>价格介绍</h3>
                            <div class="price-list">
                                <div class="media price-list-item">
                                    <div class="avatar avatar-lg">
                                        <img src="assets/images/listing/details/hot-dog.jpg" alt=""/>
                                    </div>
                                    <div class="media-body pl-4">
                                        <div class="d-sm-flex align-items-center price-title">
                                            <span class="d-block">基本团费</span>
                                            <span class="d-block">￥500.0元</span>
                                        </div>
                                        <p class="font-md text-muted">基本团费为除去机票（或高铁）、酒店外的服务费，主要包含导游、门票、当地大巴服务等。</p>
                                    </div>
                                </div>
                                <div class="media price-list-item">
                                    <div class="avatar avatar-lg">
                                        <img src="assets/images/listing/details/hot-dog.jpg" alt=""/>
                                    </div>
                                    <div class="media-body pl-4">
                                        <div class="d-sm-flex align-items-center price-title">
                                            <span class="d-block">机票</span>
                                            <span class="d-block">专享特价机票</span>
                                        </div>
                                        <p class="font-md text-muted">根据实时航班计价，为你智能选择最优航班搭配</p>
                                    </div>
                                </div>
                                <div class="media price-list-item">
                                    <div class="avatar avatar-lg">
                                        <img src="assets/images/listing/details/hot-dog.jpg" alt=""/>
                                    </div>

                                    <div class="media-body pl-4">
                                        <div class="d-sm-flex align-items-center price-title">
                                            <span class="d-block">酒店</span>
                                            <span class="d-block">专享特价酒店</span>
                                        </div>
                                        <p class="font-md text-muted">根据实时酒店计价，为你智能选择最优酒店搭配</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="reviews" class="mt-5">
                            <h3>产品评价 <span class="font-weight-light">(40)</span></h3>
                            <div class="comments mt-0">

                                <div class="comment media">
                                    <div class="avatar avatar-sm">
                                        <!--             <img src="assets/images/user/32/user-2.jpg" alt="" /> -->
                                    </div>
                                    <div class="media-body">
                                        <div class="commenter-name d-sm-flex align-items-center">
                                            用户名
                                            <span class="text-muted pl-1">钻石会员</span>
                                            <div class="stars ml-auto">
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star-half"></i>
                                            </div>
                                        </div>
                                        <p>
                                            四川的风景是没得说的，就是要最好车程漫长辛苦和爬山，长距离徒步的心理准备。但是我觉得携程对于五星的标准越来越低了，无论是住宿，交通，还是导游都很一般，满满套路。推荐的演出和推销的商品请大家把持住，需要就买，不需要就不为所动。我觉得这些套路不应该出现在这个档次的跟团游中。国内旅游资源丰富，好山好水，但是软件一塌糊涂，从业人员不够真诚，浪费了大好资源。上传的图美丽的景色和差劲的用车对比给大家看。</p>

                                    </div>
                                </div>

                                <div class="comment media">
                                    <div class="avatar avatar-sm">
                                        <img src="assets/images/user/32/user-4.jpg" class="retina" alt=""/>
                                    </div>
                                    <div class="media-body">
                                        <div class="commenter-name d-sm-flex align-items-center">
                                            用户名
                                            <span class="text-muted pl-1">钻石会员</span>
                                            <div class="stars ml-auto">
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star"></i>
                                                <i class="ion-md-star-half"></i>
                                            </div>
                                        </div>
                                        <p>
                                            四川的风景是没得说的，就是要最好车程漫长辛苦和爬山，长距离徒步的心理准备。但是我觉得携程对于五星的标准越来越低了，无论是住宿，交通，还是导游都很一般，满满套路。推荐的演出和推销的商品请大家把持住，需要就买，不需要就不为所动。我觉得这些套路不应该出现在这个档次的跟团游中。国内旅游资源丰富，好山好水，但是软件一塌糊涂，从业人员不够真诚，浪费了大好资源。上传的图美丽的景色和差劲的用车对比给大家看。</p>

                                    </div>
                                </div>
                            </div>

                            <!--          <nav class="mt-5">
                                      <ul class="pagination justify-content-center pb-3">
                                       <li class="page-item disabled"><a class="page-link" href="#"><i class="ion-ios-arrow-back"></i> <span>Previous</span></a></li>
                                       <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                       <li class="page-item"><a class="page-link" href="#">2</a></li>
                                       <li class="page-item"><a class="page-link" href="#">3</a></li>
                                       <li class="page-item"><a class="page-link" href="#"><span>Next</span> <i class="ion-ios-arrow-forward"></i></a></li>
                                      </ul>
                                     </nav>
                             -->
                            <div class="border-top my-5"></div>

                        </div>

                    </div>
                </div>

                <div class="col-xl-4 col-lg-5">
                    <div class="listing-sidebar">
                        <div class="mb-5">
                            <div class="listing-content-head mb-4">
                                <div class="listing-rating">
                                    <span class="listing-rating-number">4.5</span>
                                    <i class="ion-md-star"></i>
                                </div>
                                <div class="listing-desc">
                                    <span class="listing-title mb-1">钻石产品</span>
                                    <p>品质之选</p>
                                </div>
                            </div>
                            <!--          <button type="button" class="btn btn-block btn-info btn-icon"><i class="ion-md-bookmark"></i> <span>Book mark</span></button> -->
                        </div>
                        <div class="mb-5">
                            <!--          <span class="d-block mb-2">Opening time</span>
                                     <p class="font-md">Mon-Sat: 9:00AM to 5:00PM</p> -->
                        </div>
                        <div class="mb-5">
                            <div class="listing-sidebar-card p-4">
                                <h5>Booking form</h5>
                                <form action="#">
                                    <div class="form-group">
                                        <input type="text" placeholder="Full name"
                                               class="form-control ion-ios-calendar"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" placeholder="Date time"
                                               class="form-control date-time-picker"/>
                                    </div>
                                    <div class="form-group">
                                        <select name="guest" id="guest" class="custom-select">
                                            <option value="0" selected="selected" disabled="disabled" hidden="">Guests
                                            </option>
                                            <option value="1">1-10</option>
                                            <option value="2">10-15</option>
                                            <option value="3">15-20</option>
                                            <option value="3">20-25</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <textarea name="comments" id="comments" cols="30" rows="3" class="form-control"
                                                  placeholder="Comments"></textarea>
                                    </div>
                                    <button type="button" class="btn btn-danger btn-block">Book now</button>
                                </form>
                            </div>
                        </div>
                        <div class="mb-5">
                            <div id="map"></div>
                        </div>


                    </div>
                </div>
            </div>
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
                        <li><a href="#">推荐路线</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">机票酒店</a>
                    <ul class="nav-sub-menu">
                        <li><a href="toUserFlightBookView.do">预订机票</a></li>
                        <li><a href="hotelView.do">预订酒店</a></li>
                    </ul>
                </li>
                <li class="nav-item nav-has-sub"><a href="javascript:void(0);">个人中心</a>
                    <ul class="nav-sub-menu">
                        <li><a href="#">旅行订单</a></li>
                        <li><a href="toUserFlightBookView.do">机票订单</a></li>
                        <li><a href="#">酒店订单</a></li>
                        <li><a href="#">个人信息</a></li>

                    </ul>
                </li>

            </ul>
        </nav>
    </aside>

</div>
<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>
<script>// Define google class to access properties
var Google = new GoogleMap();
// Initialize google map
function initGoogleMap() {
    Google.initGoogleMap({lat: -25.344, lng: 131.036});
}

// Add google map script
var script = document.createElement("script");
script.src = "https://ditu.google.cn/maps/api/js?key=" + Google.GOOGLE_API_KEY + "&callback=initGoogleMap";
$body.append(script);</script>


</body>
</html>
