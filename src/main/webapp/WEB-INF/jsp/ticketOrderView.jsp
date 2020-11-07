<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/3
  Time: 16:54
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
    <title>机票支付</title>
    <meta charset="utf-8"/>
    <script src="js/jquery-3.1.0.js"></script>
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
    <style>
        .searchResult div{
            display: inline-block;
            text-align: center;
        }
        .searchResult{
            width: 1000px;
            height: 175px;
        }
        #addUser {
            width: 850px;
            display: block;
            text-align: right;
            padding-right: 100px;
        }
        #addUser, .modify_UserInfo {
            text-decoration: underline;
            cursor: pointer;
            color: #0099ff;
        }
        table {
            width: 800px;
            border-top: 1px solid #aaaaaa;
        }

        th,td {
            border-bottom: 1px solid #c1b0b0;
            text-align: center;
            padding: 10px 0;
        }
    </style>
    <script>
        function modifyUserInfo(uiId, person, idcard, phone) {
            var str = "<p>姓名：<input type='text' class='person' value='" + person + "'/></p>" +
                "<p>身份证号码：<input type='text' class='idcard' value='" + idcard + "'/></p>" +
                "<p>联系电话：<input type='text' class='phone' value='" + phone + "'/></p>" +
                "<p><input type='hidden' class='uiId' value='" + uiId + "'/></p>" +
                "<p><input type='button' class='modifyUserInfo' value='提交'/></p>";
            $("#updateUserInfo").html("");
            $("#updateUserInfo").html(str);
        }

        $(function () {
            $("#updateUserInfo").on("click", ".modifyUserInfo", function () {
                $("#updateUserInfo").css("display", "block");
                $(".add_UserInfo").css("display", "none");

                var uiId = $(".uiId").val();
                var person = $(".person").val();
                if (person == null || person == '') {
                    alert("旅客名字不能为空");
                    return;
                }

                var idcard = $(".idcard").val();
                if (idcard == null || idcard == '') {
                    alert("身份证不能为空");
                    return;
                }

                var phone = $(".phone").val();
                if (uiId == null || uiId == '') {
                    alert("联系电话不能为空");
                    return;
                }

                $.ajax({
                    type: "post",
                    data: {uiId: uiId, person: person, idcard: idcard, phone: phone},
                    url: "updateUserInfo.do",
                    dataType: "text",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("更新旅客信息失败");
                        } else {
                            alert("更新旅客信息成功");
                            // location.href="toTicketOrderView.do";
                            window.location.reload();
                        }
                    }
                })
            })

            $(".addUserInfo").click(function () {
                var person = $("[name='person']").val();
                if (person == null || person == '') {
                    alert("姓名不能为空");
                    return;
                }

                var idcard = $("[name='idcard']").val();
                if (idcard == null || idcard == '') {
                    alert("身份证号码不能为空");
                    return;
                }

                var phone = $("[name='phone']").val();
                if (person == null || person == '') {
                    alert("联系电话不能为空");
                    return;
                }

                $.ajax({
                    type: "post",
                    data: {person: person, idcard: idcard, phone: phone},
                    dataType: "text",
                    url: "addUserInfo.do",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("添加旅客信息失败");
                        } else {
                            alert("添加旅客信息成功");

                          /*  location.href="toTicketOrderView.do"*/
                          window.location.reload();

                        }
                    }
                })
            })

            $("#addUser").click(function () {
                $("#updateUserInfo").css("display", "none");
                $(".add_UserInfo").css("display", "block");
            })

            $(".payFlightMoney").click(function () {
                var str ="";
                $(".choiseUser:checked").each(function () {
                    str +=$(this).val()+","
                })
                var userIds = "<input type='hidden' name='userIds' value='"+str+"'/>";
                $(".payFlightMoney").prepend(userIds)
                $("#hiddenForm").submit();
            })
        })
    </script>
</head>
<body style="width: 1000px;margin: 30px auto 0 auto;background-color:#f1f1f6">

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
    <div class="container" style="padding-top: 50px">
<div class="searchResult">
    <div style="background-color: white;margin: 5px 0;width: 1000px;border-radius: 5px;">
        <div style="width: 200px;height: 110px;text-align: center;">
            <p><span>${sessionScope.ticketrecord.flightName}</span></p>
            <p><span>${sessionScope.ticketrecord.flightCanpany}</span></p>
        </div>
        <div style="width: 540px;height: 110px;">
            <div style="width: 120px;height: 110px;">
                <p><span>${sessionScope.ticketrecord.departureTime}</span></p>
                <p><span>${sessionScope.ticketrecord.departureArea}</span</p>
            </div>
            <div style="width: 200px;height: 110px;text-align: center;line-height: 110px;">
                ============》
            </div>
            <div style="width: 120px;height: 110px;">
                <p><span>${sessionScope.ticketrecord.arrivalTime}</span></p>
                <p><span>${sessionScope.ticketrecord.destinationArea}</span></p>
            </div>
        </div>
        <div style="width: 200px;height: 110px;">
            <div style="text-align: center">
                <p>￥<span style="color: firebrick;font-weight: bold;font-size: 30px;">${sessionScope.ticketrecord.flightPrice}</span></p>
            </div>
        </div>
    </div>
</div>
<div class="userDetails" style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p>
    <h2 style="display: inline-block;">旅客信息</h2><span id="addUser"><span style="color: black;font-size: 20px;"></span> <button type="button" class="btn btn-primary">新增旅客信息</button></span></p>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>选择</th>
            <th>序号</th>
            <th>姓名</th>
            <th>证件类型</th>
            <th>证件号码</th>
            <th>联系电话</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty requestScope.userinfos}">
            <tr>
                <td colspan="8">暂时没有任何旅客信息</td>
            </tr>
        </c:if>
        <c:forEach items="${requestScope.userinfos}" var="userInfo" varStatus="i">
            <tr>
                <td><input type="checkbox" class="choiseUser" value="${userInfo.uiId}"></td>
                <td>${i.count}</td>
                <td>${userInfo.person}</td>
                <td>身份证</td>
                <td>${userInfo.idcard}</td>
                <td>${userInfo.phone}</td>
                <td><span class="modify_UserInfo"
                          onclick="modifyUserInfo('${userInfo.uiId}','${userInfo.person}','${userInfo.idcard}','${userInfo.phone}')">编辑</span>
                </td>
                <td><a href="#">删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/>
    <div id="updateUserInfo"></div>
    <div class="add_UserInfo" style="display: none;">
        <p>旅客姓名：<input type="text" name="person"/></p>
        <p>身份证号码：<input type="text" name="idcard"/></p>
        <p>联系电话：<input type="text" name="phone"/></p>
        <p><input type="button" class="addUserInfo" value="新增"/></p>
    </div>
</div>
<div>
    <form id="hiddenForm" action="payFlightTicket.do" method="post">
        <input type="hidden" name="flightName" value="${sessionScope.ticketrecord.flightName}"/>
        <input type="hidden" name="flightCanpany" value="${sessionScope.ticketrecord.flightCanpany}"/>
        <input type="hidden" name="departureArea" value="${sessionScope.ticketrecord.departureArea}"/>
        <input type="hidden" name="destinationArea" value="${sessionScope.ticketrecord.destinationArea}"/>
        <input type="hidden" name="departureTime" value="${sessionScope.ticketrecord.departureTime}"/>
        <input type="hidden" name="arrivalTime" value="${sessionScope.ticketrecord.arrivalTime}"/>
        <input type="hidden" name="flightPrice" value="${sessionScope.ticketrecord.flightPrice}"/>
        <input type="hidden" name="fdId" value="${sessionScope.ticketrecord.fdId}"/>
        <input type="button" class="payFlightMoney" value="支付" style="width: 120px;height: 60px;"/>
    </form>
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
</div>

<script src="assets/js/vendors.bundle.js"></script>
<script src="assets/js/scripts.bundle.js"></script>

</body>
</html>
