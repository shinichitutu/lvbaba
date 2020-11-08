<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/10/23
  Time: 13:51
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
    <title>添加交通工具</title>
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
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        $(function () {
            //ajax请求国家列表
            $.ajax({
                type: "post",
                url: "showCountry.do",
                dataType: "json",
                success: function (obj) {
                    var str = "";
                    console.log(obj)
                    $.each(obj, function (index, item) {
                        str += "<option value='" + item.country + "'>" + item.country + "</option>";
                    })
                    $("#a_country").append(str);
                    $("#d_country").append(str);
                    $("#tr_a_country").append(str);
                    $("#tr_d_country").append(str);
                }
            })

            //飞机的选择地点与火车的地点公用
            $("#d_country,#tr_d_country").change(function () {
                $("#d_city option:gt(0)").remove();
                $("#tr_d_city option:gt(0)").remove();
                var country = $(this).val();
                var str = "";
                if (country != '0') {
                    $.ajax({
                        type: "post",
                        data: {country: country},
                        url: "showCity.do",
                        dataType: "json",
                        success: function (obj) {
                            $.each(obj, function (index, item) {
                                str += "<option value='" + item.areaId + "'>" + item.city + "</option>";
                            })
                            $("#d_city").append(str);
                            $("#tr_d_city").append(str);
                        }
                    })
                }
            })

            //飞机的选择地点与火车的地点公用
            $("#a_country,#tr_a_country").change(function () {
                $("#a_city option:gt(0)").remove();
                $("#tr_a_city option:gt(0)").remove();
                var country = $(this).val();
                var str = "";
                if (country != '0') {
                    $.ajax({
                        type: "post",
                        data: {country: country},
                        url: "showCity.do",
                        dataType: "json",
                        success: function (obj) {
                            console.log(obj);
                            $.each(obj, function (index, item) {
                                console.log(item);
                                str += "<option value='" + item.areaId + "'>" + item.city + "</option>";
                                console.log(item.areaId);
                            })
                            $("#a_city").append(str);
                            $("#tr_a_city").append(str);
                        }
                    })
                }
            })

            //添加航班信息
            $(".addFlight").click(function () {
                var flightNumber = $("input[name = 'flightNumber']").val();
                var flightCompany = $("input[name = 'flightCompany']").val();
                var flightDTime = $("input[name = 'flightDTime']").val();
                var flightATime = $("input[name = 'flightATime']").val();
                var daId = $("#d_city").find("option:selected").val();
                var arrAreaId = $("#a_city").find("option:selected").val();
                var flightCapacity = $(".f_capacity").val();
                var flightPrice = $(".f_price").val();
                // console.log(flightNumber+"--"+flightCompany+"---"+flightDTime+"---"+flightATime+"--"+daId+"---"+arrAreaId+"--"+flightCapacity+"---"+f_price);
                $.ajax({
                    type: "post",
                    data: {
                        flightNumber: flightNumber,
                        flightCompany: flightCompany,
                        flightDTime: flightDTime,
                        flightATime: flightATime,
                        daId: dareaId,
                        arrAreaId: arrAreaId,
                        flightCapacity: flightCapacity,
                        flightPrice: flightPrice
                    },
                    url: "addFlight.do",
                    dataType: "text",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("添加失败,航班号相同了，请检查");
                        } else {
                            alert("添加成功");
                            location.href = "showFlightAndTrain.do";
                        }
                    }
                })
            })

            //添加火车班次信息
            $(".addTrain").click(function () {
                var trNumber = $("input[name = 'trNumber']").val();
                var trDTime = $("input[name = 'trDTime']").val();
                var trATime = $("input[name = 'trATime']").val();
                var traId = $("#tr_d_city").find("option:selected").val();
                var trAreaId = $("#tr_a_city").find("option:selected").val();
                var trCapacity = $(".tr_capacity").val();
                var trPrice = $(".tr_price").val();
                $.ajax({
                    type: "post",
                    data: {
                        trNumber: trNumber,
                        trDTime: trDTime,
                        trATime: trATime,
                        traId: traId,
                        trAreaId: trAreaId,
                        trCapacity: trCapacity,
                        trPrice: trPrice
                    },
                    url: "addTrain.do",
                    dataType: "text",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("添加失败，火车班次相同了，请检查");
                        } else {
                            alert("添加成功");
                            location.href = "showFlightAndTrain.do";
                        }
                    }
                })
            })
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
                    <li class="nav-item">
                        <div class="media align-items-center">
                            <div class="avatar avatar-sm">
                                <img src="assets/images/user/32/user-1.jpg" alt=""/>
                            </div>
                            <div class="media-body pl-2 avatar-name d-none d-md-block">
                                欢迎${sessionScope.admin.adName}登录！
                            </div>
                        </div>
                    </li>
                    <!--   <li class="nav-item"><a href="add-listing.html" class="btn btn-pill btn-danger btn-icon"><i class="ion-md-add"></i> <span>Add Listing</span></a></li> -->
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>
    <br/>

    <div class="container" style="padding-top: 50px">
        <h3><a href="showFlightAndTrain.do">交通工具管理</a></h3>
        <br>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#flightInfo">添加航班信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#trainInfo">添加火车信息</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div id="flightInfo" class="container tab-pane active"><br>
                <p>航班号：<input type="text" name="flightNumber"/></p>
                <p>所属航空公司：<input type="text" name="flightCompany"/></p>
                <p>出发时间：<input type="time" name="flightDTime"/></p>
                <p>到达时间：<input type="time" name="flightATime"/></p>
                <p>出发地：<select id="d_country">
                    <option value="0">--请选择--</option>
                </select>
                    <select id="d_city">
                        <option value="0">--请选择--</option>
                    </select>
                </p>
                <p>目的地：<select id="a_country">
                    <option value="0">--请选择--</option>
                </select>
                    <select id="a_city">
                        <option value="0">--请选择--</option>
                    </select>
                </p>
                <p>容量：<input type="number" class="f_capacity" min="1" step="1" max="1000"/></p>
                <p>价格：<input type="text" class="f_price"/></p>
                <p><input type="button" value="添加" class="addFlight"/></p>
            </div>
            <div id="trainInfo" class="container tab-pane fade"><br>
                <p>火车次号：<input type="text" name="trNumber"/></p>
                <p>出发时间：<input type="time" name="trDTime"/></p>
                <p>到达时间：<input type="time" name="trATime"/></p>
                <p>出发地：<select id="tr_d_country">
                    <option value="0">--请选择--</option>
                </select>
                    <select id="tr_d_city">
                        <option value="0">--请选择--</option>
                    </select>
                </p>
                <p>目的地：<select id="tr_a_country">
                    <option value="0">--请选择--</option>

                </select>
                    <select id="tr_a_city">
                        <option value="0">--请选择--</option>
                    </select>
                </p>
                <p>容量：<input type="number" class="tr_capacity" min="1" step="1" max="1000"/></p>
                <p>价格：<input type="text" class="tr_price"/></p>
                <p><input type="button" value="添加" class="addTrain"/></p>
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
                    </ul>
                </li>
            </ul>
        </nav>
    </aside>
</div>

<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>
<script src="assets/js/custom/admin.panel.js"></script>

</body>
</html>
