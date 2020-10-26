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
                                str += "<option value='"+item.aId+"'>"+item.city+"</option>";
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
                                str += "<option value='"+item.aId+"'>"+item.city+"</option>";
                                console.log(item.aId);
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
                var fCompany = $("input[name = 'fCompany']").val();
                var fDTime = $("input[name = 'fDTime']").val();
                var fATime = $("input[name = 'fATime']").val();
                var daId = $("#d_city").find("option:selected").val();
                var aAreaId = $("#a_city").find("option:selected").val();
                var fCapacity = $(".f_capacity").val();
                var fPrice = $(".f_price").val();
                // console.log(flightNumber+"--"+fCompany+"---"+fDTime+"---"+fATime+"--"+daId+"---"+aAreaId+"--"+fCapacity+"---"+f_price);
                $.ajax({
                    type:"post",
                    data:{flightNumber:flightNumber,fCompany:fCompany,fDTime:fDTime,fATime:fATime,daId:daId,aAreaId:aAreaId,fCapacity:fCapacity,fPrice:fPrice},
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
<div class="container">
    <h2>新增交通工具</h2>
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
            <p>所属航空公司：<input type="text" name="fCompany"/></p>
            <p>出发日期：<input type="datetime-local" name="fDTime"/></p>
            <p>到达日期：<input type="datetime-local" name="fATime"/></p>
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
