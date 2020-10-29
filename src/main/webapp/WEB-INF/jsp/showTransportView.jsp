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
            border-top: 1px solid #e0c6c6;
            border-bottom: 1px solid #e0c6c6;
            text-align: center;
        }
        td,th{
            padding: 5px 10px;
            border-top: 1px solid black;
        }
    </style>

    <%--  这个script的内容全是针对航班信息的  --%>
    <script>
        function modifyFlight(obj,flightId,flightNumber,flightCompany,d_country,d_city,a_country,a_city,flightDTime,flightATime,flightCapacity,flightPrice,daId,arrAreaId) {
            // 在点击的当前行的后面添加修改的所需的参数
            /*var str = "<tr style='border: 1px solid #FFE0C6C6;height: 50px;background-color: lightgreen'><form action='' method='post'>" +
                "<td style='width: 30px;'>修改</td>" +
                "<td><input type='text' value='"+flightNumber+"'/></td>" +
                "<td><input type='text' value='"+flightCompany+"'/></td>" +
                "<td><select id='d_country'>" +
                "<option value='0'>"+d_country+"</option>" +
                "</select>" +
                "<select id='d_city'>" +
                "<option value='0'>"+d_city+"</option>" +
                "</select></td>" +
                "<td><select id='a_country'>" +
                "<option value='0'>"+a_country+"</option>" +
                "</select>" +
                "<select id='a_city'>" +
                "<option value='0'>"+a_city+"</option>" +
                "</select></td>" +
                "<td><input type='datetime-local' name='flightDTime'/></td>" +
                "<td><input type='datetime-local' name='flightATime'/></td>" +
                "<td><input type='number' class='f_capacity' min='1' max='1000' value='"+flightCapacity+"'/></td>" +
                "<td><input type='text' class='f_price' value='"+flightPrice+"'/></td>" +
                "<td><input type='submit' class='modifyFlight’ value='提交'/></td>" +
                "<td><input type='reset' class='modifyFlight’ value='重置'/></td>" +
                "</form></tr>";
             //在该行后面新增一行
             $(obj).parent().parent().after(str);*/

            var str = "<form action='#' method='post' id='updateFlightInfo'>" +
                "<p>航班号：<input type='text' name='flightNumber' value='"+flightNumber+"'/></p>" +
                "<p>所属航空公司：<input type='text' name='flightCompany' value='"+flightCompany+"'/></p>" +
                "<p>出发地：<select id='d_country'><option value='"+d_country+"'>"+d_country+"</option></select>" +
                "<select id='d_city'><option value='"+daId+"'>"+d_city+"</option></select></p>" +
                "<p>目的地：<select id='a_country'><option value='"+a_country+"'>"+a_country+"</option></select>" +
                "<select id='a_city'><option value='"+arrAreaId+"'>"+a_city+"</option></select></p>" +
                "<p>出发时间：<input type='datetime-local' name='flightDTime' class='d_time'/></p>" +
                "<p>到达时间：<input type='datetime-local' name='flightATime' class='a_time'/></p>" +
                "<p>容量：<input type='number' name='flightCapacity' class='f_capacity' min='1' max='1000' value='"+flightCapacity+"'/></p>" +
                "<p>票价：<input type='text' name='flightPrice' class='f_price' value='"+flightPrice+"'/></p>" +
                "<p><input type='hidden' name='flightId' value='"+flightId+"'/></p>" +
                "<p><input type='button' id='modifyFlight' value='提交'/>" +
                "<input type='reset' value='重置'/></p></form>";
            $(".modifyFlightInfo").html("");
            $(".modifyFlightInfo").html(str);

            $.ajax({
                type:"post",
                url:"showCountry.do",
                dataType:"json",
                success:function (obj) {
                    var ss="";
                    $.each(obj,function (k,v) {
                        ss +="<option value='"+v.country+"'>"+v.country+"</option>";
                    })
                    $("#d_country").focus(function () {
                        $("#d_country option").remove();
                        $("#d_country").append(ss);
                    })
                    $("#a_country").focus(function () {
                        $("#a_country option").remove();
                        $("#a_country").append(ss);
                    })
                }
            })
        }

        $(function () {
            //获取出发地的城市列表选项
            $(".modifyFlightInfo").on("change","#d_country",function () {
                var country = $(this).val();
                console.log(country);
                $("#d_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#d_city").append(option);
                    }
                })
            })

            //获取目的地的城市列表选项
            $(".modifyFlightInfo").on("change","#a_country",function () {
                var country = $(this).val();
                console.log(country);
                $("#a_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#a_city").append(option);
                    }
                })
            })

            $(".modifyFlightInfo").on("focus","#d_city",function (){
                var country=$("#d_country").val();
                console.log(country);
                $("#d_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#d_city").append(option);
                    }
                })
            })

            $(".modifyFlightInfo").on("focus","#a_city",function (){
                var country=$("#a_country").val();
                console.log(country);
                $("#a_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#a_city").append(option);
                    }
                })
            })

            //当出发时间失焦时，判断是否为空，为空的话提示
            $(".modifyFlightInfo").on("blur",".d_time",function () {
                if ($(this).val()==''){
                    $(".d_time").css("border","1px solid red");
                }else{
                    $("input[name='flightDTime']").css("border","");
                }
            });

            //当到达时间失焦时，判断是否为空，为空的话提示
            $(".modifyFlightInfo").on("blur",".a_time",function () {
                if ($(this).val()==''){
                    $("input[name='flightATime']").css("border","1px solid red");
                }else{
                    $("input[name='flightATime']").css("border","");
                }
            });

            //当我们点击提交按钮是，触发点击事件，当我们的出发时间和到达时间其中为空的话，就直接返回不提交。
            $(".modifyFlightInfo").on("click","#modifyFlight",function () {
                var flightDTime = $("input[name='flightDTime']").val();
                var flightATime = $("input[name='flightATime']").val();
                if (flightDTime==''){
                    $("input[name='flightDTime']").css("border","1px solid red");
                    alert("出发时间不能为空");
                    return;
                }
                if (flightATime==''){
                    $("input[name='flightATime']").css("border","1px solid red");
                    alert("到达时间不能为空");
                    return;
                }
                var flightId = $("[name='flightId']").val();
                var flightNumber = $("[name='flightNumber']").val();
                var flightCompany = $("[name='flightCompany']").val();
                var daId = $("#d_city").val();
                var arrAreaId = $("#a_city").val();
                var flightCapacity = $("[name='flightCapacity']").val();
                var flightPrice = $("[name='flightPrice']").val();

                $.ajax({
                    type:"post",
                    data:{flightId:flightId,flightNumber:flightNumber,flightCompany:flightCompany,flightDTime:flightDTime,
                        flightATime:flightATime,daId:daId,arrAreaId:arrAreaId,flightCapacity:flightCapacity,flightPrice:flightPrice},
                    url:"updateFlight.do",
                    dataType:"text",
                    success:function (obj) {
                        if("false"==obj){
                            alert("修改失败");
                        }else{
                            alert("修改成功");
                            location.href="showFlightAndTrain.do";
                        }
                    }
                })
            })
        })

    </script>
    <%--  这个script的内容全是针对火车信息的  --%>
    <script>
        /**
         *这个script的内容全是针对火车班次的
         */
        function modifyTrain(obj,trId,trNumber,d_country,d_city,a_country,a_city,trDTime,trATime,trCapacity,trPrice,daId,arrAreaId) {
            var str = "<form action='#' method='post' id='updateFlightInfo'>" +
                "<p>列车号：<input type='text' name='trNumber' value='"+trNumber+"'/></p>" +
                "<p>出发地：<select id='d_country'><option value='"+d_country+"'>"+d_country+"</option></select>" +
                "<select id='d_city'><option value='"+daId+"'>"+d_city+"</option></select></p>" +
                "<p>目的地：<select id='a_country'><option value='"+a_country+"'>"+a_country+"</option></select>" +
                "<select id='a_city'><option value='"+arrAreaId+"'>"+a_city+"</option></select></p>" +
                "<p>出发时间：<input type='datetime-local' name='trDTime' class='d_time'/></p>" +
                "<p>到达时间：<input type='datetime-local' name='trATime' class='a_time'/></p>" +
                "<p>容量：<input type='number' name='trCapacity' class='f_capacity' min='1' max='1000' value='"+trCapacity+"'/></p>" +
                "<p>票价：<input type='text' name='trPrice' class='f_price' value='"+trPrice+"'/></p>" +
                "<p><input type='hidden' name='trId' value='"+trId+"'/></p>" +
                "<p><input type='button' id='modifyTrain' value='提交'/>" +
                "<input type='reset' value='重置'/></p></form>";
            $(".modifyTrainInfo").html("");
            $(".modifyTrainInfo").html(str);

            $.ajax({
                type:"post",
                url:"showCountry.do",
                dataType:"json",
                success:function (obj) {
                    var ss="";
                    $.each(obj,function (k,v) {
                        ss +="<option value='"+v.country+"'>"+v.country+"</option>";
                    })
                    $("#d_country").focus(function () {
                        $("#d_country option").remove();
                        $("#d_country").append(ss);
                    })
                    $("#a_country").focus(function () {
                        $("#a_country option").remove();
                        $("#a_country").append(ss);
                    })
                }
            })
        }

        $(function () {
            //获取出发地的城市列表选项
            $(".modifyTrainInfo").on("change", "#d_country", function () {
                var country = $(this).val();
                console.log(country);
                $("#d_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#d_city").append(option);
                    }
                })
            })

            //获取目的地的城市列表选项
            $(".modifyTrainInfo").on("change", "#a_country", function () {
                var country = $(this).val();
                console.log(country);
                $("#a_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#a_city").append(option);
                    }
                })
            })

            $(".modifyTrainInfo").on("focus", "#d_city", function () {
                var country = $("#d_country").val();
                console.log(country);
                $("#d_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#d_city").append(option);
                    }
                })
            })

            $(".modifyTrainInfo").on("focus", "#a_city", function () {
                var country = $("#a_country").val();
                console.log(country);
                $("#a_city option").remove();
                var option = "<option value='0'>--请选择--</option>";
                $.ajax({
                    type: "post",
                    data: {country: country},
                    dataType: "json",
                    url: "showCity.do",
                    success: function (obj) {
                        $.each(obj, function (k, v) {
                            option += "<option value='" + v.areaId + "'>" + v.city + "</option>";
                        })
                        $("#a_city").append(option);
                    }
                })
            })

            //当出发时间失焦时，判断是否为空，为空的话提示
            $(".modifyTrainInfo").on("blur", ".d_time", function () {
                if ($(this).val() == '') {
                    $(".d_time").css("border", "1px solid red");
                } else {
                    $("input[name='trDTime']").css("border", "");
                }
            });

            //当到达时间失焦时，判断是否为空，为空的话提示
            $(".modifyTrainInfo").on("blur", ".a_time", function () {
                if ($(this).val() == '') {
                    $("input[name='trATime']").css("border", "1px solid red");
                } else {
                    $("input[name='trATime']").css("border", "");
                }
            });

            //放我们点击提交按钮是，触发点击事件，当我们的出发时间和到达时间其中为空的话，就直接返回不提交。
            $(".modifyTrainInfo").on("click", "#modifyTrain", function () {
                var trDTime = $("input[name='trDTime']").val();
                var trATime = $("input[name='trATime']").val();
                if (trDTime == '') {
                    $("input[name='trDTime']").css("border", "1px solid red");
                    alert("出发时间不能为空");
                    return;
                }
                if (trATime == '') {
                    $("input[name='trATime']").css("border", "1px solid red");
                    alert("到达时间不能为空");
                    return;
                }
                var trId = $("[name='trId']").val();
                var trNumber = $("[name='trNumber']").val();
                var daId = $("#d_city").val();
                var arrAreaId = $("#a_city").val();
                var trCapacity = $("[name='trCapacity']").val();
                var trPrice = $("[name='trPrice']").val();

                $.ajax({
                    type: "post",
                    data: {
                        trId: trId, trNumber: trNumber, trDTime: trDTime, trATime: trATime, daId: daId,
                        arrAreaId: arrAreaId, trCapacity: trCapacity, trPrice: trPrice
                    },
                    url: "updateTrain.do",
                    dataType: "text",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("修改失败");
                        } else {
                            alert("修改成功");
                            location.href = "showTrainInfo.do";
                        }
                    }
                })
            })
        })
    </script>

    <%--  这个script的内容全是针对航班和列车集体信息的（FlightDetail he TrainDetail）  --%>
    <script>
        /**
         * 添加航班详细信息
         */
        function addFlightDetail(obj,flightId,flightNumber) {
            var str ="<form action='#' method='post'>" +
                "<p><input type='hidden' class='f_id' value='"+flightId+"'/></p>"+
                "<p>航班号："+flightNumber+"</p>"+
                "<p>日期：<input type='date' class='fdDate'/></p>"+
                "<p>票价系数：<input type='number' placeholder='数值在0-1之间' min='0' max='1' step='0.1' class='ratio' style='width: 150px;'/></p>"+
                "<p><input type='button' id='addFDInfo' value='提交'/>"+
                "</form>";
            $(".modifyFlightInfo").html("");
            $(".modifyFlightInfo").html(str);
        }

        /**
         * 添加列车详细信息
         */
        function addTrainDetail(trId,trNumber) {
            var str ="<form action='#' method='post'>" +
                "<p><input type='hidden' class='trId' value='"+trId+"'/></p>"+
                "<p>列车号："+trNumber+"</p>"+
                "<p>日期：<input type='date' class='tdDate'/></p>"+
                "<p><input type='button' id='addTDInfo' value='提交'/>"+
                "</form>";
            $(".modifyTrainInfo").html("");
            $(".modifyTrainInfo").html(str);
        }

        $(function (){
            // 当添加航班具体信息的时间是失焦事件处理
            $(".modifyFlightInfo").on("blur",".fdDate",function () {
                if (''==$(".fdDate").val()){
                    $(".fdDate").css("border","1px solid red");
                }else{
                    $(".fdDate").css("border","");
                }
            })
            // 当添加航班具体信息的票价系数的失焦事件处理
            $(".modifyFlightInfo").on("blur",".ratio",function () {
                var ratio = $(".ratio").val();
                if (''==ratio){
                    $(".ratio").css("border","1px solid red");
                }else{
                    $(".ratio").css("border","");
                    if (parseFloat(ratio)<0.1 || parseFloat(ratio)>1.0){
                        alert("票价系数不在范围内，请重新输入");
                        $(".ratio").css("border","1px solid red");
                        return;
                    }
                }
            })
            // 当添加列车具体信息的时间是失焦事件处理
            $(".modifyTrainInfo").on("blur",".tdDate",function () {
                if (''==$(".tdDate").val()){
                    $(".tdDate").css("border","1px solid red");
                }else{
                    $(".tdDate").css("border","");
                }
            })

            //当点击提交航班详情的时候，判断里面内容是否为空
            $(".modifyFlightInfo").on("click","#addFDInfo",function () {
                var fdDate = $(".fdDate").val();
                if (fdDate==null || fdDate==''){
                    $(".fdDate").css("border","1px solid red");
                    return;
                }
                var ratio = $(".ratio").val();
                if (ratio==null || ratio==''){
                    $(".ratio").css("border","1px solid red");
                    return;
                }
                var flightID = $(".f_id").val();
                console.log(flightID);
                $.ajax({
                    type:"post",
                    data:{flightID:flightID,fdDate:fdDate,ratio:ratio},
                    url:"addFlightDetail.do",
                    dataType:"text",
                    success:function (obj) {
                        if ('false'==obj){
                            alert("添加失败");
                        }else{
                            alert("添加成功");
                        }
                    }
                })
            })

            //当点击提交列车详情的时候，判断里面内容是否为空
            $(".modifyTrainInfo").on("click","#addTDInfo",function () {
                var tdDate = $(".tdDate").val();
                if (tdDate==null || tdDate==''){
                    $(".tdDate").css("border","1px solid red");
                    return;
                }
                var trId = $(".trId").val();
                console.log(trId);
                $.ajax({
                    type:"post",
                    data:{trId:trId,tdDate:tdDate},
                    url:"addTrainDetail.do",
                    dataType:"text",
                    success:function (obj) {
                        if ('false'==obj){
                            alert("添加失败");
                        }else{
                            alert("添加成功");
                        }
                    }
                })
            })

            //判断新增的两个detail信息是否成功
            if ('false'==${not empty requestScope.addFDInfo}){
                alert("新增失败");
            }else if('true'==${not empty requestScope.addFDInfo}){
                alert("新增成功")
            }

            if ('false'==${not empty requestScope.addTDInfo}){
                alert("新增失败");
            }else if('true'==${not empty requestScope.addTDInfo}){
                alert("新增成功")
            }
        })
    </script>

    <%--  处理航班详情的请求  --%>
    <script>
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

        <div id="flightInfo" class="container tab-pane active"><br>
            <table class="tb">
                <thead>
                    <tr>
                        <th style='width: 30px;'>序号</th>
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
                        <th>查看详情</th>
                        <th>删除该航班</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${empty requestScope.flightList}"><tr><td colspan="13">暂时还没有航班信息</td></tr></c:if>
                    <c:forEach items="${requestScope.flightList}" var="flight" varStatus="i">
                        <tr>
                            <td style='width: 30px;'>${i.count}</td>
                            <td>${flight.flightNumber}</td>
                            <td>${flight.flightCompany}</td>
                            <td>${flight.d_area.country}-${flight.d_area.city}</td>
                            <td>${flight.a_area.country}-${flight.a_area.city}</td>
                            <td>${flight.flightDTime}</td>
                            <td>${flight.flightATime}</td>
                            <td>${flight.flightCapacity}</td>
                            <td>${flight.flightPrice}</td>
                          
                            <td><input type="button" class="modifyFlight" value="修改" onclick="
                            modifyFlight(this,'${flight.flightId}','${flight.flightNumber}','${flight.flightCompany}','${flight.d_area.country}','${flight.d_area.city}',
                                '${flight.a_area.country}','${flight.a_area.city}','${flight.flightDTime}','${flight.flightATime}','${flight.flightCapacity}',
                                '${flight.flightPrice}','${flight.daId}','${flight.arrAreaId}')"></td>
                            <td><input type="button" onclick="addFlightDetail(this,'${flight.flightId}','${flight.flightNumber}')" class="addFlightDetail" value="增加详情"></td>
                            <td><input type="button" onclick="location.href='showFlightDetailView.do?flightId=${flight.flightId}'" value="查看详情"></td>
                            <td><input type="button" onclick="location.href='deleteFlight.do?flightId=${flight.flightId}'" value="删除"></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p style="height: 3px;margin-top: 15px;background-color: black;"></p>
            <div class="modifyFlightInfo" style="margin-top: 30px;"></div>
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
                    <th>查看详情</th>
                    <th>删除该航班</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty requestScope.trainList}"><tr><td colspan="12">暂时还没有火车班次信息</td></tr></c:if>
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
                    <td><input type="button" class="modifyTrain" value="修改" onclick="modifyTrain(this,'${train.trId}','${train.trNumber}','${train.d_area.country}',
                            '${train.d_area.city}','${train.a_area.country}','${train.a_area.city}','${train.trDTime}','${train.trATime}',
                            '${train.trCapacity}', '${train.trPrice}','${train.daId}','${train.arrAreaId}' )"></td>
                    <td><input type="button" onclick="addTrainDetail('${train.trId}','${train.trNumber}')" class="addTrainDetail" value="增加详情"></td>
                    <td><input type="button" onclick="location.href='showTrainDetailView.do?trId=${train.trId}'" value="查看详情"></td>
                    <td><input type="button" onclick="location.href='deleteTrain.do?trId=${train.trId}'" value="删除"></td>
                </c:forEach>
                </tr>
                </tbody>
            </table>
            <p style="height: 3px;margin-top: 15px;background-color: black;"></p>
            <div class="modifyTrainInfo" style="margin-top: 30px;"></div>
        </div>
    </div>
</div>
</body>
</html>
