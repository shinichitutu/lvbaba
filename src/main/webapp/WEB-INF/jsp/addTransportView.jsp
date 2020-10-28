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
    <script>
        $(function () {
            //ajax请求国家列表
            $.ajax({
                type:"post",
                url:"showCountry.do",
                dataType:"json",
                success:function (obj) {
                    var str ="";
                    console.log(obj)
                    $.each(obj,function (index,item) {
                        console.log(item.city);
                        str += "<option value='"+item.country+"'>"+item.country+"</option>";
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
                if (country!='0'){
                    $.ajax({
                        type:"post",
                        data:{country:country},
                        url:"showCity.do",
                        dataType:"json",
                        success:function (obj) {
                            $.each(obj,function (index,item) {
                                str += "<option value='"+item.areaId+"'>"+item.city+"</option>";
                            })
                            $("#d_city").append(str);
                            $("#tr_d_city").append(str);
                        }
                    })
                }
            })

            //飞机的选择地点与火车的地点公用
            $("#a_country,tr_a_country").change(function () {
                $("#a_city option:gt(0)").remove();
                $("#tr_a_city option:gt(0)").remove();
                var country = $(this).val();
                var str = "";
                if (country!='0'){
                    $.ajax({
                        type:"post",
                        data:{country:country},
                        url:"showCity.do",
                        dataType:"json",
                        success:function (obj) {
                            console.log(obj);
                            $.each(obj,function (index,item) {
                                console.log(item);
                                str += "<option value='"+item.areaId+"'>"+item.city+"</option>";
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
                var dareaId = $("#d_city").find("option:selected").val();
                var arrAreaId = $("#a_city").find("option:selected").val();
                var flightCapacity = $(".f_capacity").val();
                var flightPrice = $(".f_price").val();
                // console.log(flightNumber+"--"+flightCompany+"---"+flightDTime+"---"+flightATime+"--"+daId+"---"+arrAreaId+"--"+flightCapacity+"---"+f_price);
                $.ajax({
                    type:"post",
                    data:{flightNumber:flightNumber,flightCompany:flightCompany,flightDTime:flightDTime,flightATime:flightATime,daId:daId,arrAreaId:arrAreaId,flightCapacity:flightCapacity,flightPrice:flightPrice},
                    url:"addFlight.do",
                    dataType:"text",
                    success:function (obj) {
                        if("false"==obj){
                            alert("添加失败,航班号相同了，请检查");
                        }else{
                            alert("添加成功");
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
                    type:"post",
                    data:{trNumber:trNumber,trDTime:trDTime,trATime:trATime,traId:traId,trAreaId:trAreaId,trCapacity:trCapacity,trPrice:trPrice},
                    url:"addTrain.do",
                    dataType:"text",
                    success:function (obj) {
                        if("false"==obj){
                            alert("添加失败，火车班次相同了，请检查");
                        }else{
                            alert("添加成功");
                        }
                    }
                })
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
            <p>出发日期：<input type="datetime-local" name="flightDTime"/></p>
            <p>到达日期：<input type="datetime-local" name="flightATime"/></p>
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
            <p>容量：<input type="number" class="f_capacity" min="1" step = "1" max="1000"/></p>
            <p>价格：<input type="text" class="f_price"/></p>
            <p><input type="button" value="添加" class="addFlight"/></p>
        </div>
        <div id="trainInfo" class="container tab-pane fade"><br>
            <p>火车次号：<input type="text" name="trNumber"/></p>
            <p>出发日期：<input type="datetime-local" name="trDTime"/></p>
            <p>到达日期：<input type="datetime-local" name="trATime"/></p>
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
            <p>容量：<input type="number" class="tr_capacity" min="1" step = "1" max="1000"/></p>
            <p>价格：<input type="text" class="tr_price"/></p>
            <p><input type="button" value="添加" class="addTrain"/></p>
        </div>
    </div>
</div>
</body>
</html>
