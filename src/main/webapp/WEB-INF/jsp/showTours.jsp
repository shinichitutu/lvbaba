<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/26
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>旅行团</title>
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

            $("#d1").click(function () {
                $("#d4").css("display","none");
                $("#d3").css("display","block");
            });

            $("#d2").click(function () {
                $("#d3").css("display","none");
                $("#d4").css("display","block");
            });

            $(".remove").click(function () {
                var tourId=$(this).next().val();
                console.log(tourId);
                $.ajax({
                    type:"post",
                    data:{tourId:tourId},
                    dataType:"text",
                    url:"removeTour.do",
                    success:function (obj) {
                        console.log(obj);
                        window.location.href="showTour.do";
                    }
                })
            });

            $(".update").click(function () {
                var tourId=$(this).next().val();
                console.log(tourId);
                $.ajax({
                    type:"post",
                    data:{tourId:tourId},
                    dataType:"json",
                    url:"updateTour.do",
                    success:function (obj) {
                        console.log(obj);
                        window.location.href="showTour.do";
                    }
                })
            });


            $("#deDateF").blur(function () {
                var deDate = $(this).val();
                var daId = ${requestScope.product.daId};
                var arrAreaId =${requestScope.product.arrAreaId};
                if(deDate!=''){
                    var date = timeStampString(new Date(new Date(deDate).setDate(new Date(deDate).getDate()+${requestScope.product.days-1})));
                }
                $("#reDateF").val(date);

                $.ajax({
                    type:"post",
                    url:"searchFlight.do",
                    data:{date:date,daId:arrAreaId,arrAreaId:daId},
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.fdId+"'>"+item.flight.flightNumber+"</option>";
                        });
                        $("#flightId2").append(str);

                    }
                });

            });

            $("#deDateT").blur(function () {
                var deDate = $(this).val();
                var daId = ${requestScope.product.daId};
                var arrAreaId =${requestScope.product.arrAreaId};
                if(deDate!=''){
                    var date = timeStampString(new Date(new Date(deDate).setDate(new Date(deDate).getDate()+${requestScope.product.days-1})));
                }
                $("#reDateT").val(date);


                $.ajax({
                    type:"post",
                    url:"searchTrain.do",
                    data:{date:date,daId:arrAreaId,arrAreaId:daId},
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.tdId+"'>"+item.train.trNumber+"</option>";
                        });
                        $("#trainId2").append(str);
                    }
                })

            });


            function timeStampString(time){
                var datetime = new Date();
                datetime.setTime(time);
                var year = datetime.getFullYear();
                var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                return year + "-" + month + "-" + date;
            }


            $("#deDateF").change(function () {
                $("#flightId option:gt(0)").remove();
                $("#flightId2 option:gt(0)").remove();
                var date = $(this).val();
                var daId = ${requestScope.product.daId};
                var arrAreaId =${requestScope.product.arrAreaId};
                console.log("去程"+date);

                $.ajax({
                    type:"post",
                    url:"searchFlight.do",
                    data:{date:date,daId:daId,arrAreaId:arrAreaId},
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.fdId+"'>"+item.flight.flightNumber+"</option>";
                        });
                        $("#flightId").append(str);
                    }
                });
            });

            $("#deDateT").change(function () {
                $("#trainId option:gt(0)").remove();
                $("#trainId2 option:gt(0)").remove();
                var date = $(this).val();
                var daId = ${requestScope.product.daId};
                var arrAreaId =${requestScope.product.arrAreaId};

                $.ajax({
                    type:"post",
                    url:"searchTrain.do",
                    data:{date:date,daId:daId,arrAreaId:arrAreaId},
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.tdId+"'>"+item.train.trNumber+"</option>";
                        });
                        $("#trainId").append(str);
                    }
                })

            });
        })

    </script>

    <base href="<%=basePath%>"/>
</head>
<body>

<div id="wrapper">
    <div id="loading">
        <div id="loader"></div>
    </div>
    <header id="header" class="colored-header fixed-top">
        <nav class="navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="index.html"><img src="assets/images/logos/logo_light.svg" class="default light" alt="Listigo" /> <img src="assets/images/logos/logo_dark.svg" class="default dark" alt="Listigo" /> <img src="assets/images/logos/compact_logo_light.svg" class="compact light" alt="Listigo" /> <img src="assets/images/logos/compact_logo_dark.svg" class="compact dark" alt="Listigo" /></a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <div class="media align-items-center">
                            <div class="avatar avatar-sm">
                                <img src="assets/images/user/32/user-1.jpg" class="retina" alt="" />
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
    <br/>

    <div class="container" style="padding-top: 50px">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>旅行团id</td>
            <td>产品id</td>
            <td>出发日期</td>
            <td>返回日期</td>
            <td>交通类型</td>
            <td>去程交通id</td>
            <td>返回交通id</td>
            <td>已预订人数</td>
            <td>状态</td>
            <td colspan="5">操作</td>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.tours}" var="tour" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${tour.productId}</td>
                <td>${tour.dDate}</td>
                <td>${tour.roomDate}</td>
                <td>${tour.transType}</td>
                <td>${tour.goId}</td>
                <td>${tour.returnId}</td>
                <td>${tour.bookNum}</td>
                <td>
                    <c:if test="${tour.tourStatus eq 1}">
                        待成团，预定开放
                    </c:if>
                    <c:if test="${tour.tourStatus eq 2}">
                        待成团，预定关闭
                    </c:if>
                    <c:if test="${tour.tourStatus eq 3}">
                        已成团，预定开放
                    </c:if>
                    <c:if test="${tour.tourStatus eq 4}">
                        已成团，预定开放
                    </c:if>
                    <c:if test="${tour.tourStatus eq 5}">
                        已发团
                    </c:if>
                    <c:if test="${tour.tourStatus eq 6}">
                        已取消
                    </c:if>
                </td>

                <td><a href="openBooking.do?tourId=${tour.tourId}">开放预定</a></td>
                <td><a href="closeBooking.do?tourId=${tour.tourId}">关闭预定</a></td>
                <td><a href="startTour.do?tourId=${tour.tourId}">发团</a></td>
                <td><a href="cancelTour.do?tourId=${tour.tourId}">取消</a></td>
                <td><a href=deleteTour.do?tourId=${tour.tourId}">删除</a></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div style="display: none" id="d3">
        <form action="insertTour.do" method="post">
            <input type="hidden" name="productId" value="${requestScope.product.productId}">
            <input type="hidden" name="transType" value="1">
            出发日期<input type="date" name="dDate" id="deDateF"><br/>
            返回日期<input type="date" name="roomDate" id="reDateF"><br/>
            航班选择：<br/>
            选择去程航班<select name='goId' id="flightId"><option value='0'>--请选择去程航班--</option></select>
            选择返程航班<select name='returnId' id="flightId2"><option value='0'>--请选择返程航班--</option></select>
            <input type="submit" value="点击添加">
        </form>
    </div>

    <div style="display: none" id="d4">
        <form action="insertTour.do" method="post">
            <input type="hidden" name="productId" value="${requestScope.product.productId}">
            <input type="hidden" name="transType" value="2">
            出发日期<input type="date" name="dDate" id="deDateT"><br/>
            返回日期<input type="date" name="roomDate" id="reDateT"><br/>
            航班选择：<br/>
            选择去程航班<select name='goId' id="trainId"><option value='0'>--请选择去程火车--</option></select>
            选择返程航班<select name='returnId' id="trainId2"><option value='0'>--请选择返程高铁--</option></select>
            <input type="submit" value="点击添加">
        </form>
    </div>

    <div style="text-align: center">
        <%--增加产品--%>
        <input type="button" value="添加新旅行团（飞机）" id="d1"><br/><br/>
            <input type="button" value="添加新旅行团（火车）" id="d2"><br/>

        <c:if test="${requestScope.page>1}">
            <a href="showTour.do?page=${requestScope.page-1}"><input type="button" value="上一页"></a>
        </c:if>
        <c:forEach begin="1" end="${requestScope.pages}" step="1" var="i">
            <a href="showTour.do?page=${i}">${i}</a>
        </c:forEach>
        <c:if test="${requestScope.page < requestScope.pages}">
            <a href="showTour.do?page=${requestScope.page+1}"><input type="button" value="下一页"></a>
        </c:if>
    </div>

    <div id="update">
    </div>


    <p style="color: green">${requestScope.success}</p>
    <p style="color: red">${requestScope.error}</p>
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
