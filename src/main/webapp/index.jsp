<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            if (${not empty sessionScope.user}){
                $("#loginUserInfo").html("欢迎${sessionScope.user.uName}登录");
            }

            // 判断用户名是否可以使用
            var flag_name = false;
            // 判断mm1的状态
            var flag_mm1 = false;
            // 判断mm2的状态
            var flag_mm2 = false;

            // 当我们跳转到注册界面时，我们的注册按钮是不能点击的
            $("#registerUser").attr("disabled", "disabled");

            // 当我们用户名输入完成之后，失焦事件触发，判断当前用户名是否重复可用
            $("#username2").blur(function () {
                var reg = /^[a-zA-Z].{5,17}$/;
                var username = $(this).val();
                console.log(username);
                if (null == username) {
                    $(this).css("border", "1px solid red");
                    alert("账号不能为空");
                } else if (reg.test(username) == false) {
                    $(this).css("border", "1px solid red");
                    $(".showUserNameInfo").html("密码的长度为6-18为，不能以数字开头，不能重复");
                    $(".showUserNameInfo").css("color", "red")
                } else {
                    $(this).css("border", "");
                    $.ajax({
                        type: "post",
                        data: {uUsername:username},
                        url: "testUserName.do",
                        dataType: "text",
                        success: function (obj) {
                            if ("true" == obj) {
                                $(".showUserNameInfo").html("可以使用");
                                $(".showUserNameInfo").css("color", "green")
                                flag_name = true;
                            } else {
                                $("#username_register").css("border", "1px solid red");
                                $(".showUserNameInfo").html("名字重复");
                                $(".showUserNameInfo").css("color", "red")
                            }
                        }
                    })
                }
                testSubmit(flag_name, flag_mm1, flag_mm2);
            })

            // 密码输入框失焦之后判断其输入的格式
            $("#password2").blur(function () {
                var reg = /^.{6,20}$/;
                var mm = $(this).val();
                if (null == mm) {
                    $(this).css("border", "1px solid red");
                    alert("密码不能为空");
                } else if (reg.test(mm) == false) {
                    $(this).css("border", "1px solid red");
                    $(".showPasswordInfo").html("密码的长度为6-18为，不能以数字开头，不能重复");
                    $(".showPasswordInfo").css("color", "red")
                } else {
                    $(this).css("border", "");
                    $(".showPasswordInfo").html("");
                    flag_mm1 = true;
                }
                testSubmit(flag_name, flag_mm1, flag_mm2);
            })

            // 再次确认密码输入框失焦之后判断其输入的格式以及与上一次的密码是否一样
            $("#password3").blur(function () {
                var mm = $(this).val();
                if (null == mm) {
                    $(this).css("border", "1px solid red");
                    alert("密码不能为空");
                } else if (mm != $("#password2").val()) {
                    $(this).css("border", "1px solid red");
                    $(".showAgainPasswordInfo").html("两次密码不相同");
                    $(".showAgainPasswordInfo").css("color", "red")
                } else {
                    $(this).css("border", "");
                    $(".showAgainPasswordInfo").html("");
                    flag_mm2 = true;
                }
                testSubmit(flag_name, flag_mm1, flag_mm2);
            })

            //当信息填完整之后，我们进行注册
            $("#registerUser").click(function () {
                var name = $("#nickname").val();
                var userName = $("#username2").val();
                var password = $("#password2").val();
                $.ajax({
                    type: "post",
                    data: {uName:name,uUsername: userName,uPassword:password},
                    url: "register.do",
                    dataType: "text",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("注册失败")
                        } else {
                            alert("注册成功")
                            location.href = "index.jsp";
                        }
                    }
                })
            })

            // 判断用户名是否为空
            $("#name_login").blur(function () {
                var userName = $(this).val();
                if (null==userName){
                    $(this).css({"border":"1px solid red"});
                    alert("用户名不能为空");
                }else{
                    $(this).css({"border":""});
                    flag_login_name=true;
                }
                // cancelLoginBtn(flag_login_name,flag_login_pwd);
            })

            // 判断密码是否为空
            $("#pwd_login").blur(function () {
                var pwd = $(this).val();
                if (null==pwd){
                    $(this).css({"border":"1px solid red"});
                    alert("密码不能为空");
                }else{
                    $(this).css({"border":""});
                    flag_login_pwd=true;
                }
                // cancelLoginBtn(flag_login_name,flag_login_pwd);
            })

            // 登录按钮触发事件
            $("#login_btn").click(function () {
                var name = $("#username1").val();
                var pwd = $("#password1").val();
                var check =$("#remember").val();
                $.ajax({
                    type:"post",
                    data:{uUsername:name,uPassword:pwd,check:check},
                    url:"login.do",
                    dataType:"text",
                    success:function (obj) {
                        if ("false"==obj){
                            alert("账号或密码有误，请重新登录");
                        }else{
                            location.href="index.jsp";
                        }
                    }
                })
            })
        })

        //取消注册按钮不能点击的方法
        function testSubmit(flag_name, flag_mm1, flag_mm2) {
            if (flag_name && flag_mm1 && flag_mm2) {
                $("#registerUser").removeAttr("disabled");
            }
        }
    </script>
</head>
<body>
<!-- 注册登录 -->
<div class="modal fade" id="sign_in" role="dialog" aria-hidden="true">
    <div class="modal-dialog auth-modal modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-block px-4 px-sm-5 pt-5">
                <a href="javascript:void(0);" class="close d-sm-none" data-dismiss="modal">&times;</a>
                <h4 class="font-weight-bold mb-2">登录</h4>
                <p></p>
            </div>
            <ul class="nav nav-tabs line-tabs mt-4" id="sign" role="tablist">
                <li class="nav-item" role="presentation"><a class="nav-link active" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">登录</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="false">注册</a></li>
            </ul>
            <div class="modal-body px-4 px-sm-5 pt-4">
                <div class="tab-content" id="signContent">
                    <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                        <form action="toLoginView.do" class="pb-5">
                            <div class="form-group">
                                <label for="username1" class="form-control-label">用户名</label>
                                <input id="username1" type="text" name="username1" placeholder="请输入用户名" class="form-control" required="" />
                            </div>
                            <div class="form-group">
                                <label for="password1" class="form-control-label">密码</label>
                                <div class="form-control-icon form-control-icon_right">
                                    <input id="password1" type="password" name="password1" placeholder="请输入密码" class="form-control" required="" />

                                </div>
                            </div>
                            <div class="form-group d-flex align-items-center justify-content-between">
                                <div class="checkbox">
                                    <input id="remember" type="checkbox" />
                                    <label for="remember">记住密码</label>
                                </div>
                                <a href="#" class="link" data-dismiss="modal" data-toggle="modal" data-target="#forgot">管理员登录</a>
                            </div>
                            <button type="button" id="login_btn" class="btn btn-danger btn-block">登录</button>
                            <div class="auth-modal-foot mt-4">
                                <div class="mb-4 text-center">

                                </div>

                            </div>
                        </form>
                    </div>

                    <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                        <form action="#" class="pb-5">

                            <div class="form-group">
                                <label for="username2" class="form-control-label">昵称</label>
                                <input id="nickname" type="text" name="nickname" placeholder="请输入昵称" class="form-control" required="" />
                            </div>

                            <div class="form-group">
                                <label for="username2" class="form-control-label">用户名</label>
                                <input id="username2" type="text" name="username2" placeholder="请输入用户名" class="form-control" required="" />
                                <br/><span class="showUserNameInfo"></span>
                            </div>
                            <div class="form-group">
                                <label for="password2" class="form-control-label">密码</label>
                                <div class="form-control-icon form-control-icon_right">
                                    <input id="password2" type="password" name="password2" placeholder="请输入密码" class="form-control" required="" />
                                    <br/><span class="showPasswordInfo"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password2" class="form-control-label">确认密码</label>
                                <div class="form-control-icon form-control-icon_right">
                                    <input id="password3" type="password" name="password3" placeholder="请再次输入密码" class="form-control" required="" />
                                    <br/><span class="showAgainPasswordInfo"></span>
                                </div>
                            </div>
                            <button type="button" id="registerUser" class="btn btn-danger btn-block mt-4">注册</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 管理员登录 -->
<div class="modal fade" id="forgot" role="dialog" aria-hidden="true">
    <div class="modal-dialog auth-modal modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-block px-4 px-sm-5 pt-5">
                <a href="javascript:void(0);" class="close d-sm-none" data-dismiss="modal">&times;</a>
                <h4 class="font-weight-bold mb-2">管理员登录</h4>

            </div>
            <div class="modal-body px-4 px-sm-5 pt-4">
                <form action="adminLogin.do" class="pb-5" method="post">
                    <div class="form-group">
                        <label for="username3" class="form-control-label">用户名</label>
                        <input id="username3" type="text" name="adName" placeholder="请输入用户名" class="form-control" required="" /><br/>
                        <label for="username3" class="form-control-label">密码</label>
                        <input id="password4" type="text" name="adPassword" placeholder="请输入密码" class="form-control" required="" />
                    </div>
                    <button type="submit" class="btn btn-danger btn-block mt-4">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 样式 -->
<div id="wrapper">
    <div id="loading">
        <div id="loader"></div>
    </div>
    <header id="header" class="plain-header fixed-top">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="index.do">
                    <img src="img/驴.jpg" style="height: 100px;width: 100px;border-radius: 20%" class="default light" alt="Listigo" />
<%--
                    <img src="assets/images/logos/logo_light.svg" class="default light" alt="Listigo" />
--%>
                    <img src="assets/images/logos/logo_dark.svg" class="default dark" alt="Listigo" />
                    <img src="assets/images/logos/compact_logo_light.svg" class="compact light" alt="Listigo" />
                    <img src="assets/images/logos/compact_logo_dark.svg" class="compact dark" alt="Listigo" /></a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="javascript:void(0);" data-toggle="modal" data-target="#sign_in" id="loginUserInfo">登录</a></li>
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>
    <section id="intro_section" class="banner banner-overlay hero-banner hero-1">
        <div class="banner-content">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 col-lg-11 mx-auto">
                        <h1 class="intro-section-title wow fade-in-down">寻找你想踏足的远方</h1>
                        <form action="searchProductMain.do" method="post">
                        <div class="search-wrapper wow fade-in-up">
                            <div class="search-form">
                                <div class="search-input">
                                    <label for="what" class="form-control-label mb-0">出发地</label>
                                    <div class="input-group align-items-center dropdown">
                                        <input type="text" id="what" class="form-control" name="deArea" autocomplete="off" placeholder="仅支持中国大陆城市出发" data-toggle="dropdown" />
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
                                        <input type="text" id="where" class="form-control" name="aimArea" autocomplete="off" placeholder="支持全球目的地" data-toggle="dropdown" />
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
                </div>
            </div>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 mx-auto">
                    <div class="row list-bunch">
                        <div class="col-lg-4 text-center list-bunch-item wow fade-in-up">
                            <img src="assets/images/works/find.svg" alt="" />
                            <h4 class="mt-3 mb-2">选择度假产品</h4>
                            <p>提供数百条度假产品线路，每个度假产品拥有不同组合选择。客人可选择由北京、上海、广州、深圳、杭州等地出发，目的地覆盖全球超过100个城市。</p>
                        </div>
                        <div class="col-lg-4 text-center list-bunch-item wow fade-in-up" data-wow-delay=".3s">
                            <img src="assets/images/works/contact.svg" alt="" />
                            <h4 class="mt-3 mb-2">订购低价机票</h4>
                            <p>提供在线飞机票订购服务：飞机票查询、航班时刻表查询、飞机票余票查询、航班查询等一站式服务，是国内领先的飞机票旅行服务专业平台。</p>
                        </div>
                        <div class="col-lg-4 text-center list-bunch-item wow fade-in-up" data-wow-delay=".6s">
                            <img src="assets/images/works/mark.svg" alt="" />
                            <h4 class="mt-3 mb-2">预订全球酒店</h4>
                            <p>我们有数十万家合作酒店遍布全球多个国家和地区，还提供无与伦比的价格保证。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-8 col-md-11 mx-auto">
                    <h2 class="section-title wow"><span>精品度假产品推荐，来自客户的真实好评</span></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-8 col-lg-10 mx-auto wow fade-in-up">
                    <div id="testimonials" class="owl-carousel owl-theme owl-nav">
                        <div class="item">
                            <div class="test-content">
                                <div class="test-stars">
                                    <div class="stars">
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star-half"></i>
                                    </div>
                                    <span class="test-name">北京香山赏枫钻石游</span>
                                    <p class="tech-designation"><span>上海出发</span>, 航班直飞</p>
                                </div>
                                <p> 一次出游畅游皇城精华景点，帝都风貌一览到底不留遗憾！精选高端商务型酒店，品地道京味餐菜，升级一顿全聚德，便宜坊烤鸭。服务至上，精选优秀导游带团！</p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="test-content">
                                <div class="test-stars">
                                    <div class="stars">
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star-half"></i>
                                    </div>
                                    <span class="test-name">日本北海道7日6晚私家团</span>
                                    <p class="tech-designation"><span>上海出发</span>, 航班直飞</p>
                                </div>
                                <p>入住星野度假村，充足亲子时间；浪漫小樽+白色恋人工厂，北海道热销！登别&洞爷湖双百选拉面体验，体验露天私汤；札幌市内自由行，私属时光！</p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="test-content">
                                <div class="test-stars">
                                    <div class="stars">
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star"></i>
                                        <i class="ion-md-star-half"></i>
                                    </div>
                                    <span class="test-name">九寨沟黄龙风景名胜区精品团</span>
                                    <p class="tech-designation"><span>北京出发</span>, 航班直飞</p>
                                </div>
                                <p>专业导游暖心服务，安全保障放心游。蜀中奇景九寨归来，限流入园，赏景洗肺好去处。行程安排一目了然，享特色美食，住精选舒适酒店。</p>
                            </div>
                        </div>


                    </div>
                    <div id="testimonial_thumb" class="owl-carousel owl-theme mt-4">
       <%--                 <div class="item">
                            <div &lt;%&ndash;class="testimonial-user avatar avatar-sm"&ndash;%&gt;>
                                <img src="assets/images/user/32/homeshow1.jfif" &lt;%&ndash;class="retina"&ndash;%&gt; alt="" />
                            </div>
                        </div>
                        <div class="item">
                            <div &lt;%&ndash;class="testimonial-user avatar avatar-sm"&ndash;%&gt;>
                                <img src="assets/images/user/32/homeshow2.jfif" &lt;%&ndash;class="retina"&ndash;%&gt; alt="" />
                            </div>
                        </div>
                        <div class="item">
                            <div &lt;%&ndash;class="testimonial-user avatar avatar-sm"&ndash;%&gt;>
                                <img src="assets/images/user/32/homeshow3.jfif" &lt;%&ndash;class="retina"&ndash;%&gt; alt="" />
                            </div>
                        </div>--%>


                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer">
        <div class="last-footer text-muted">
            &copy; 2020 Kri8thm. All rights reserved.
        </div>
        <%--原主页入口--%>
        <div>
            <a href="home.do" style="font-size: 100px">旧版主页</a>
        </div>

</footer>

<a href="#intro_section" class="btn btn-danger btn-only-icon target scroll-top"><i class="ion-md-arrow-up"></i></a>
<!-- 侧边导航栏 -->
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

                    <li><a href="hotelView.do">预订机票</a></li>
                    <li><a href="#">预订酒店</a></li>
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
