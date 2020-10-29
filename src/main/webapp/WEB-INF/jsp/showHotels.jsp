<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/10/23
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <title>查询酒店</title>
    <base href="<%=basePath%>"/>

    <script type="text/javascript" src="../../js/jquery-3.1.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            function chooseArea() {
                $.ajax({
                    type:"post",
                    url:"showCountry2.do",
                    dataType:"json",
                    success:function (obj) {
                        var str = "";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.country+"'>"+item.country+"</option>";
                        });
                        $("#country").append(str);
                    }
                });


                $("#country").change(function () {
                    $("#city option:gt(0)").remove();
                    var country = $(this).val();
                    console.log(country);
                    $.ajax({
                        type:"post",
                        url:"showCity.do",
                        data:"country="+country,
                        dataType:"json",
                        success:function (obj) {
                            var str ="";
                            $.each(obj,function (index,item) {
                                str += " <option value='"+item.areaId+"'>"+item.city+"</option>";
                            });
                            $("#city").append(str);

                        }
                    })
                })
            }

            function updateArea() {
                $.ajax({
                    type:"post",
                    url:"showCountry2.do",
                    dataType:"json",
                    success:function (obj) {
                        var str = "";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.country+"'>"+item.country+"</option>";
                        });
                        $("#country").empty();
                        $("#country").append(str);
                    }
                });

                $("#country").change(function () {
                    $("#city option:gt(0)").remove();
                    var country = $(this).val();
                    $.ajax({
                        type:"post",
                        url:"showCity.do",
                        data:"country="+country,
                        dataType:"json",
                        success:function (obj) {
                            var str ="";
                            $.each(obj,function (index,item) {
                                str += " <option value='"+item.areaId+"'>"+item.city+"</option>";
                            });
                            $("#city").empty();
                            $("#city").append(str);

                        }
                    })
                })


                $("#city").mousemove(function () {
                    var country = $(this).prev().val();
                    $.ajax({
                        type:"post",
                        url:"showCity.do",
                        data:"country="+country,
                        dataType:"json",
                        success:function (obj) {
                            var str ="";
                            $.each(obj,function (index,item) {
                                str += " <option value='"+item.areaId+"'>"+item.city+"</option>";
                            });
                            $("#city").empty();
                            $("#city").append(str);

                        }
                    })
                })

            }

            $("#btn").click(function () {
                var str1 = "<form action='addHotel.do' method='post'>"+
                    "酒店名称：<input type='text' name='hName'/><br/>"+
                    "酒店地址：<select id='country'><option value='0'>--请选择国家--</option></select><select id='city' name='areaId'><option value='0'>--请选择城市--</option></select><br/>"+
                    "酒店等级：<input type='number' name='hLevel' min='1' max='5'/><br/>"+
                    "<input type='submit' value='添加'/>"+
                    "</form>";
                $("#addHotel").html(str1);
                chooseArea();
            });

            $(".update").click(function () {
                var str = "<form action='updateHotel.do' method='post'>"+
                    "酒店名称：<input type='text' name='hName' value="+$(this).parent().parent().find("td").eq(2).text()+"><br/>"+
                    "酒店地址：<select id='country'><option value='0'>--请选择国家--</option></select><select id='city' name='areaId'><option value='0'>--请选择城市--</option></select><br/>"+
                    "酒店等级：<input type='number' name='hLevel' min='1' max='5' value="+$(this).parent().parent().find("td").eq(5).text()+"><br/>"+
                        "<input type='hidden' name='hId' value="+$(this).parent().parent().find("td").eq(1).text()+">"+
                    "<input type='submit' value='确认修改'/>"+
                    "</form>";
                $("#updateHotel").html(str);

                chooseArea();
            })
        })
    </script>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1 id="go_top">欢迎${sessionScope.admin.adName}登录</h1>
    <p></p>
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
    <a class="navbar-brand" href="adminMain.do" style="margin-left: 50px">驴爸爸旅行</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div   class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav" >
            <li class="nav-item" style="margin-left: 50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="查询产品" style="background-color: orange">
                    <a href="showProduct.do">查询产品</a>
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="查询旅行团" style="background-color: orange">
                    <a href="showTour.do">查询旅行团</a><br/>
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="国内 港澳台  海外酒店" style="background-color: orange">
                    <a href="showHotels.do">酒店</a>
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="查看订单" style="background-color: orange">
                    <a href="showFlightAndTrain.do">添加交通工具</a>
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <!--<a class="nav-link" href="#">度假</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="跟团游  自助游" style="background-color: orange">
                    查询火车
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!--<a class="nav-link" href="#">门票</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="门票查询" style="background-color: orange">
                    门票
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!-- <a class="nav-link" href="#">火车票</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="火车票查询" style="background-color: orange">
                    火车票
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!--<a class="nav-link" href="#">邮轮</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="游轮查询" style="background-color: orange">
                    游轮
                </button>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>酒店编号</th>
            <th>酒店名称</th>
            <th>国家</th>
            <th>城市</th>
            <th>酒店等级</th>
            <th>查看客房</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${requestScope.hotelList}" var="hotel" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${hotel.hId}</td>
                <td>${hotel.hName}</td>
                <td>${hotel.area.country}</td>
                <td>${hotel.area.city}</td>
                <td>${hotel.hLevel}</td>
                <td><a href="showRooms.do?hId=${hotel.hId}">查看客房</a></td>
                <td><input type="button" class="update" value="修改"></td>
                <td><a href="deleteHotel.do?hId=${hotel.hId}">删除</a></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>


    <div style="text-align: center">
        <input type="button" id="btn" value="添加酒店" />
    </div>

    <div id = "addHotel" style="text-align: center">
    </div>
    <div id="updateHotel"></div>


    <c:if test="${null != requestScope.error}">
        <span style="color: red">${requestScope.error}</span>
    </c:if>

    <c:if test="${null != requestScope.success}">
        <span style="color: red">${requestScope.success}</span>
    </c:if>

</div>


<div style="text-align: center">
    <c:if test="${requestScope.page>1}">
        <a href="showHotels.do?page=${requestScope.page-1}"><input type="button" value="上一页"></a>
    </c:if>
    <c:forEach begin="1" end="${requestScope.pages}" step="1" var="i">
        <a href="showHotels.do?page=${i}">${i}</a>
    </c:forEach>
    <c:if test="${requestScope.page < requestScope.pages}">
        <a href="showHotels.do?page=${requestScope.page+1}"><input type="button" value="下一页"></a>
    </c:if></div>
</div>



</body>
</html>
