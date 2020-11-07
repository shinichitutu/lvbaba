<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/10/26
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>房间</title>
    <base href="<%=basePath%>"/>

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
            $("#btn").click(function () {
                var str1 = "<form action='addRoom.do' method='post'>"+
                    "客房数量：<input type='number' name='number' min=1/><br/>"+
                    "客房等级：(1-标间/2-大床/3-豪华)<input type='number' name='limit' min='1' max='3'/><br/>"+
                        "<input type='hidden' name='hotelId' value='${requestScope.hotelId}'>"+
                    "<input type='submit' value='添加'/>"+
                    "</form>";
                $("#addRoom").html(str1);
            });

            $(".update").click(function () {
                var str1 = "<form action='updateRoom.do' method='post'>"+
                    "客房数量：<input type='number' name='number' min=1 value='"+$(this).parent().parent().find("td").eq(4).text()+"'><br/>"+
                    "客房等级：(1-标间/2-大床/3-豪华)<input type='number' name='limit' min='1' max='3' value='"+$(this).parent().parent().find("td").eq(2).text()+"'><br/>"+
                    "<input type='hidden' name='roomId' value="+$(this).parent().parent().find("td").eq(1).text()+">"+
                    "<input type='hidden' name='hotelId' value='${requestScope.hotelId}'>"+
                    "<input type='submit' value='确认修改'/>"+
                    "</form>";
                $("#updateRoom").html(str1);
            });
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
        <th>序号</th>
        <th>客房编号</th>
        <th colspan="2">客房类型(编号-名称)</th>
        <th>客房数量</th>
        <th>查看详情</th>
        <th>编辑</th>
<%--        <th>删除(待开发)</th>--%>
    </tr>

    </thead>
    <tbody>
    <c:forEach items="${requestScope.roomList}" var="room" varStatus="status">
      <tr>
          <td>${status.count}</td>
          <td>${room.roomId}</td>
          <td>${room.personLimit}</td>
          <td><c:if test="${room.personLimit eq 1}">
              标间
          </c:if>
              <c:if test="${room.personLimit eq 2}">
                  大床房
              </c:if>
              <c:if test="${room.personLimit eq 3}">
                  豪华房
              </c:if>
                  </td>
          <td>${room.roomNumber}</td>
          <td><a href="showRoomDetail.do?roomId=${room.roomId}">查看详情</a></td>
          <td><input type="button" value="编辑" class="update"></td>
          <%--<td><a href="deleteRoom.do?roomId=${room.roomId}&hotelId=${room.hotelId}"><input type="button" value="删除" class="remove"></a></td>--%>
      </tr>

    </c:forEach>

    </tbody>
</table>
</div>

<div style="text-align: center">
    <input type="button" id="btn" value="添加客房" />
</div>

<div id = "addRoom" style="text-align: center">
</div>

<div id = "updateRoom" style="text-align: center">
</div>

<c:if test="${null != requestScope.error}">
    <span style="color: red">${requestScope.error}</span>
</c:if>

<c:if test="${null != requestScope.success}">
    <span style="color: red">${requestScope.success}</span>
</c:if>

<div style="text-align: center">
    <a href="showHotels.do">返回上级</a>
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
