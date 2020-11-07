<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/11/6
  Time: 10:12
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                            window.location.reload();
                        }
                    }
                })
            });

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
                            window.location.reload();
                        }
                    }
                })
            })

            $("#addUser").click(function () {
                $("#updateUserInfo").css("display", "none");
                $(".add_UserInfo").css("display", "block");
            })

        })
    </script>

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

    <div class="container" style="margin-top: 150px">
        <h2>个人中心</h2>
        <ul class="list-group">
            <li class="list-group-item"><span style="font-weight:bold"> 用户名:</span>${requestScope.user.uUsername}</li>
            <li class="list-group-item"><span style="font-weight:bold"> 昵称:</span>${requestScope.user.uName}</li>
            <li class="list-group-item"><span style="font-weight:bold"> 会员等级:</span>钻石会员</li>
            <li class="list-group-item"><span style="font-weight:bold"> 账户余额：</span>${requestScope.user.balance}元&nbsp<a
                    href="userRecharge.do">
                <button type="button" class="btn btn-success">去充值</button>
            </a></li>
        </ul>
        <br/><br/>

        <span id="addUser" class="float-right"><button type="button" class="btn btn-primary">新增旅客信息</button></span></p>
        <br/><br/>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>证件类型</th>
                <th>证件号码</th>
                <th>联系电话</th>
                <th>编辑</th>
            </tr>
            </thead>
            <tbody>

            <c:if test="${empty requestScope.userinfoList}">
                <tr>
                    <td colspan="8">暂时没有任何旅客信息</td>
                </tr>
            </c:if>

            <c:forEach items="${requestScope.userinfoList}" var="userInfo" varStatus="i">
                <tr>
                    <td>${i.count}</td>
                    <td>${userInfo.person}</td>
                    <td>身份证</td>
                    <td>${userInfo.idcard}</td>
                    <td>${userInfo.phone}</td>
                    <td><span class="modify_UserInfo"
                              onclick="modifyUserInfo('${userInfo.uiId}','${userInfo.person}','${userInfo.idcard}','${userInfo.phone}')">编辑</span>
                    </td>

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
