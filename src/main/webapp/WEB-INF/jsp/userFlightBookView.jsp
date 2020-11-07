<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/3
  Time: 10:06
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
    <title>机票预订</title>
    <meta charset="utf-8"/>
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
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>
    <style>
        .searchResult div{
            display: inline-block;
            text-align: center;
        }
        .searchResult{
            width: 1000px;
            height: 120px;
        }
    </style>
    <script>
        $(function () {
            $.ajax({
                type:"post",
                url:"showCountry.do",
                dataType:"json",
                success:function (data) {
                    var str  = "";
                    $.each(data,function (k,v) {
                        str+="<option value='"+v.country+"'>"+v.country+"</option>";
                    })
                    $("[name='d_country']").append(str);
                    $("[name='a_country']").append(str);
                }
            })

            $("[name='d_country']").change(function () {
                $("[name='d_city'] option:gt(0)").remove();
                var country = $("[name='d_country'] option:selected").val();
                $.ajax({
                    type: "post",
                    data:{country:country},
                    url:"showCity.do",
                    dataType: "json",
                    success:function (data) {
                        var str  = "";
                        $.each(data,function (k,v) {
                            str+="<option value='"+v.areaId+"'>"+v.city+"</option>";
                        })
                        $("[name='d_city']").append(str);
                    }
                })
            })

            $("[name='a_country']").change(function () {
                $("[name='a_city'] option:gt(0)").remove();
                var country = $("[name='a_country'] option:selected").val();
                $.ajax({
                    type: "post",
                    data:{country:country},
                    url:"showCity.do",
                    dataType: "json",
                    success:function (data) {
                        var str  = "";
                        $.each(data,function (k,v) {
                            str+="<option value='"+v.areaId+"'>"+v.city+"</option>";
                        })
                        $("[name='a_city']").append(str);
                    }
                })
            })

            if ($(".remainVotes").text()=='已售完'){
                $("#bookingTicket").attr("disabled",true);
            }

            if (${not empty requestScope.insertTicketRecord}){
            alert("${requestScope.insertTicketRecord}");
            }
        })
    </script>
</head>
<body style="width: 1000px;margin: 30px auto 0 auto;background-color:#eef1f1">

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

    <div class="container" style="padding-top: 100px">

        <div id="demo" class="carousel slide" data-ride="carousel" style="width: 100%">

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
        <br/>
        <br/>



        <form action="searchFlightInfo.do" method="post">
        <span style="font-weight: bold;float: left;font-size: 120%">出发地：</span>
        <select name="d_country" class="form-control" style="width: 150px;float: left">
            <option value="0">--请选择国家--</option>
        </select>

        <select name="d_city" class="form-control" style="width: 150px">
            <option value="0">--请选择城市--</option>
        </select>
            <br/>

        <span style="font-weight: bold;float:left;font-size: 120%">目的地：</span><select name="a_country" class="form-control" style="width: 150px;float:left;">
            <option value="0">--请选择国家--</option>
        </select>

        <select name="a_city" class="form-control" style="width: 150px">
            <option value="0">--请选择城市--</option>
        </select>
        <br/>
        <span style="font-weight: bold;float:left;font-size: 120%">出发日期：</span><input type="date" name="date" class="form-control" style="width: 150px"/><br/>
        <input type="submit" value="查询" class="btn btn-primary"/>
         </form>

<br/>

<div class="searchResult">
    <c:if test="${empty requestScope.flightDetailInfoList}"><p>暂时没有任何信息</p></c:if>
    <c:forEach items="${requestScope.flightDetailInfoList}" var="fd" varStatus="i">
    <div style="background-color: white;margin: 5px;width: 1000px;border-radius: 5px;">
       <div style="width: 200px;height: 110px;text-align: center;">
            <p><span>${fd.flight.flightNumber}</span></p>
            <p><span>${fd.flight.flightCompany}</span></p>
       </div>
       <div style="width: 540px;height: 110px;">
          <div style="width: 120px;height: 110px;">
              <p><span>${fd.flight.flightDTime}</span></p>
              <p><span>${fd.flight.d_area.country}-${fd.flight.d_area.city}</span</p>
          </div>
           <div style="width: 200px;height: 110px;text-align: center;line-height: 110px;">
                ============》
           </div>
           <div style="width: 120px;height: 110px;">
               <p><span>${fd.flight.flightATime}</span></p>
               <p><span>${fd.flight.a_area.country}-${fd.flight.a_area.city}</span></p>
           </div>
       </div>
       <div style="width: 220px;height: 110px;">
            <div>
                <p>￥<span style="color: rgba(239,26,26,0.76);font-weight: bold;font-size: 30px;">${fd.flight.flightPrice}</span></p>
                <p>经济舱${fd.ratio}折</p>
            </div>
            <div style="margin: 0 auto;height: 110px;">
               <p class="remainVotes" style="color: red;">
                   <c:if test="${fd.fdTickets==0}">已售完</c:if>
                   <c:if test="${fd.fdTickets<=10}">仅剩${fd.fdTickets}</c:if>
               </p>
               <p>
                    <form action="toTicketOrderView.do" method="post">
                        <input type="hidden" name="flightName" value="${fd.flight.flightNumber}"/>
                        <input type="hidden" name="fdId" value="${fd.fdId}"/>
                        <input type="hidden" name="flightCanpany" value="${fd.flight.flightCompany}"/>
                        <input type="hidden" name="departureArea" value="${fd.flight.d_area.country}-${fd.flight.d_area.city}"/>
                        <input type="hidden" name="destinationArea" value="${fd.flight.a_area.country}-${fd.flight.a_area.city}"/>
                        <input type="hidden" name="departureTime" value="${fd.fdDate} ${fd.flight.flightDTime}"/>
                        <input type="hidden" name="arrivalTime" value="${fd.fdDate} ${fd.flight.flightATime}"/>
                        <input type="hidden" name="flightPrice" value="${fd.flight.flightPrice}"/>
                       <input type="submit" id="bookingTicket" value="订票" style="width: 80px;font-size: 20px;height: 40px;border-radius: 15px;background-color: orange;color: white;font-weight: bold;"/>
                    </form>
               </p>
           </div>
       </div>
    </div>
    </c:forEach>
</div>
    </div>

    <br/><br/><br/><br/>
    <footer id="footer">
        <div class="last-footer text-muted">
            &copy; 2020 Kri8thm. All rights reserved.
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
