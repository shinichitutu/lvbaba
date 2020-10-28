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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        table{
            /*border-collapse: collapse;*/
            border: 1px solid black;
            text-align: center;
            /*width: 500px;*/
        }
        td,th{
            border: 1px solid black;
        }
    </style>
    <script>
        function modifyFlight(obj,flightId,flightNumber,flightCompany,d_country,d_city,a_country,a_city,flightDTime,flightATime,flightCapacity,flightPrice) {
            var str = "<tr><form action='' method='post'>" +
                "<td>航班号：<input type='text' value='"+flightNumber+"'/></td>" +
                "<td>航空公司：<input type='text' value='"+flightCompany+"'/></td>" +
                "<td>出发地：<select id='d_country'>" +
                "<option value='0'>"+d_country+"</option>" +
                "</select>" +
                "<select id='d_city'>" +
                "<option value='0'>"+d_city+"</option>" +
                "</select></td>" +
                "<td>目的地：<select id='a_country'>" +
                "<option value='0'>"+a_country+"</option>" +
                "</select>" +
                "<select id='a_city'>" +
                "<option value='0'>"+a_city+"</option>" +
                "</select></td>" +
                "<td>出发日期：<input type='datetime-local' name='flightDTime' value='"+flightDTime+"'/></td>" +
                "<td>到达日期：<input type='datetime-local' name='flightATime' value='"+flightATime+"'/></td>" +
                "<td>容量：<input type='number' class='f_capacity' min='1' max='1000' value='"+flightCapacity+"'/></td>" +
                "<td>价格：<input type='text' class='f_price' value='"+flightPrice+"'/></td>" +
                "<td><input type='submit' class='modifyFlight’ value='提交'/></td>" +
                "</form></tr>";
            $(obj).append(str);
        }
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
    <h3>交通工具管理</h3>
    <br>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#flightInfo">航班信息</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#trainInfo">火车班次信息</a>
        </li>
        <li class="nav-item" onclick="location.href='addTransportView.do'">
            <a class="nav-link" data-toggle="tab" href="showCountry.do">新增交通工具</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div id="flightInfo" class="container tab-pane active container"><br>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>航班号</th>
                        <th>航空公司</th>
                        <th>出发地</th>
                        <th>目的地</th>
                        <th>出发时间</th>
                        <th>到达时间</th>
                        <th>容量</th>
                        <th>机票价格</th>
                        <th>修改航班信息</th>
                        <th>添加详情</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${empty requestScope.flightList}"><tr><td colspan="11">暂时还没有航班信息</td></tr></c:if>
                    <c:forEach items="${requestScope.flightList}" var="flight" varStatus="i">
                        <tr>
                            <td>${i.count}</td>
                            <td>${flight.flightNumber}</td>
                            <td>${flight.flightCompany}</td>
                            <td>${flight.d_area.country}-${flight.d_area.city}</td>
                            <td>${flight.a_area.country}-${flight.a_area.city}</td>
                            <td>${flight.flightDTime}</td>
                            <td>${flight.flightATime}</td>
                            <td>${flight.flightCapacity}</td>
                            <td>${flight.flightPrice}</td>
                          
                            <td><input type="button" class="modifyFlight" value="修改" onclick="
                            modifyFlight(this,${flight.flightId},${flight.flightNumber},${flight.flightCompany},${flight.d_area.country},${flight.d_area.city},
                                ${flight.a_area.country},${flight.a_area.city},${flight.flightDTime},${flight.flightATime},${flight.flightCapacity},
                                ${flight.flightPrice} )"></td>
                            <td><input type="button" class="addFlightDetail" value="增加详情"></td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="trainInfo" class="container tab-pane fade container"><br>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>列车号</th>
                    <th>出发地</th>
                    <th>目的地</th>
                    <th>出发时间</th>
                    <th>到达时间</th>
                    <th>火车容量</th>
                    <th>火车票价格</th>
                    <th>修改列车信息</th>
                    <th>添加详情</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty requestScope.trainList}"><tr><td colspan="10">暂时还没有火车班次信息</td></tr></c:if>
                <c:forEach items="${requestScope.trainList}" var="train" varStatus="i">
                <tr>
                    <td>${i.count}</td>
                    <td>${train.trNumber}</td>
                    <td>${train.d_area.country}-${train.d_area.city}</td>
                    <td>${train.a_area.country}-${train.a_area.city}</td>
                    <td>${train.trDTime}</td>
                    <td>${train.trATime}</td>
                    <td>${train.trCapacity}</td>
                    <td>${train.trPrice}</td>
                    <td><input type="button" class="modifyTrain" value="修改"></td>
                    <td><input type="button" class="addTrainDetail" value="增加详情"></td>
                    </c:forEach>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
