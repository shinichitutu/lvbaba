<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/11/5
  Time: 14:03
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
        table {
            width: 800px;
            border-top: 1px solid #aaaaaa;
            border-bottom: 1px solid #aaaaaa;
        }

        tr, th {
            border-bottom: 1px solid #aaaaaa;
            text-align: center;
            padding: 10px 0;
        }

/*        #addUser {
            width: 850px;
            display: block;
            text-align: right;
            padding-right: 100px;
        }*/

       /* #addUser, */.modify_UserInfo {
            text-decoration: underline;
            cursor: pointer;
            color: #0099ff;
        }
        .costDetail{
            float: right;
            width: 400px;
            background-color: white;
            padding: 10px;
            border-radius: 10px;
        }
        body{
            background-color: #f1f1f6;
        }
        .payOrder{
            font-weight: bold;
            color:white;
            margin-right: 50px;
            width: 250px;
            padding: 10px;
            background-color: rgba(255, 138, 38, 0.83);
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

            $("#payMoney").click(function () {
                var str ="";
                var count =0;
                $(".choiseUser:checked").each(function () {
                    str +=$(this).val()+","
                    count+=1;
                });

                if(count!=${requestScope.person}){
                    alert("必须选择与出行人数量相符的信息，以便于进行实名制购票及客房预订")
                }
                else {
                    var userIds = "<input type='hidden' name='userIds' value='"+str+"'/>";
                    $("#payMoney").prepend(userIds);
                    $("#hiddenForm").submit();
                }

            })
        })
    </script>

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
                <a class="navbar-brand" href="index.do"><img src="assets/images/logos/logo_light.svg" class="default light" alt="Listigo" /> <img src="assets/images/logos/logo_dark.svg" class="default dark" alt="Listigo" /> <img src="assets/images/logos/compact_logo_light.svg" class="compact light" alt="Listigo" /> <img src="assets/images/logos/compact_logo_dark.svg" class="compact dark" alt="Listigo" /></a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="javascript:void(0);" data-toggle="modal" data-target="#sign_in" id="loginUserInfo">登录</a></li>
                </ul>
                <a href="javascript:void(0);" id="hamburger"><span></span></a>
            </div>
        </nav>
    </header>

<div class="container" style="padding-top: 50px;height: 400px">

<div class="userDetails" style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p>
    <h2 style="display: inline-block;">确认旅客信息</h2><br/>
    <p class="text-info">根据你选择的行程信息，为了进行实名制购票，请选择${requestScope.person}名旅客信息</p>
    <span id="addUser" class="float-right"><button type="button" class="btn btn-primary">新增旅客信息</button></span></p><br/><br/>
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
                <td><input type="checkbox" class="choiseUser" value="${userInfo.uiId}"></td>
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

<div style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p style="padding: 10px;background-color: #f6f3f1"> · 支付完成后，订单会立即确认。</p>

    <p style="text-align: right">
    <form action="createOrder.do" method="post" id="hiddenForm">
   <input type="hidden" name="total" value="${requestScope.total}">
    <input type="hidden" name="tourId" value="${requestScope.tourId}">
    <input type="hidden" name="person" value="${requestScope.person}">
    <input type="hidden" name="roomNum" value="${requestScope.roomNum}">
    <input type="hidden" name="roomId" value="${requestScope.roomId}">
        <input type="button" value="同意以下条款，去支付" class="payOrder" id="payMoney">
    </form>
    </p>

</div>

<div style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p style="text-indent: 2em">
        条款和合同
        为支持绿色环保，我同意接受电子合同并默认其合法有效性，如需签署纸质合同将另行致电携程旅行网客服。
        预订限制
        出于安全考虑，18岁以下未成年人需要至少一名成年旅客陪同
        此线路行程强度较大，请确保身体健康适宜旅游，如出行人中有70周岁(含)以上老人、须至少有1位18周岁—69周岁亲友陪同方可参团，敬请谅解
        此线路因服务能力有限，仅接受持有中国有效身份证件的客人预订（不含中国香港、中国澳门和中国台湾），敬请谅解
        如产品确认单中的条款约定与旅游合同主协议（示范文本）不一致的，以产品确认单中的约定为准
        预订说明
        请您在预订时务必提供准确、完整的信息（姓名、性别、证件号码、国籍、联系方式等），以免产生预订错误，影响出行。如因您提供信息错误而造成损失，由您自行承担
        产品说明
        为保障您和其他客人的安全，团队车辆使用前每日至少消毒1次；司机、导服、所有团队客人行程开始前需通过体温检测；司机、导服行中全程佩戴口罩；随车配备客用消毒用品及测温工具；行中团餐部分，实现分餐制，或为您提供公筷
        本产品最少成团人数1人，订单一经携程旅行网以书面形式确认后均默认发团，若因我司原因未发团，旅行社将按双方合同约定的违约条款予以赔付
        本线路在不影响您行程的情况下，部分行程段可能会与其他客人合并用车，共同游玩。如有入住其他不同酒店的客人，当地司导人员会根据团队实际情况安排接送事宜，敬请谅解
    </p>
</div>
</div>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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
