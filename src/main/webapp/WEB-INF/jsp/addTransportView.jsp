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
            $("#d_country").change(function () {
                $("#d_city option:gt(0)").remove();
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
                        }
                    })
                }
            })
            $("#a_country").change(function () {
                $("#a_city option:gt(0)").remove();
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
                            var json = eval(obj);
                            $.each(json,function (index,item) {
                                console.log(item);
                                str += "<option value='"+item.id+"'>"+item.city+"</option>";
                                console.log(item.aId);
                            })
                            $("#a_city").append(str);
                        }
                    })
                }
            })
            //
            // var dAId = null;
            // var aAreaId = null;
            // $("#d_city").blur(function () {
            //     dAId = $(this).find("option:selected").val();
            // })
            // $("#a_city").blur(function () {
            //     dAId = $(this).find("option:selected").val();
            // })

            $(".addFlight").click(function () {
                var fNumber = $("input[name = 'fNumber']").val();
                var fCompany = $("input[name = 'fCompany']").val();
                var fDTime = $("input[name = 'fDTime']").val();
                var fATime = $("input[name = 'fATime']").val();
                var dAId = $("#d_city").find("option:selected").val();
                var aAreaId = $("#a_city").find("option:selected").val();
                var fCapacity = $(".f_capacity").val();
                var f_price = $(".f_price").val();
                console.log(fNumber+"--"+fCompany+"---"+fDTime+"---"+fATime+"--"+dAId+"---"+aAreaId+"--"+fCapacity+"---"+f_price);
            })
        })
    </script>
</head>
<body>
<div class="container">
    <h2>添加交通工具</h2>
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
            <p>航班号：<input type="text" name="fNumber"/></p>
            <p>所属航空公司：<input type="text" name="fCompany"/></p>
            <p>出发日期：<input type="datetime-local" name="fDTime"/></p>
            <p>到达日期：<input type="datetime-local" name="fATime"/></p>
            <p>出发地：<select id="d_country">
                <option value="0">--请选择--</option>
                <c:forEach items="${requestScope.countryList}" var="country">
                    <option value="${country.country}">${country.country}</option>
                </c:forEach>
            </select>
            <select id="d_city">
                <option value="0">--请选择--</option>
            </select>
            </p>
            <p>目的地：<select id="a_country">
                <option value="0">--请选择--</option>
                <c:forEach items="${requestScope.countryList}" var="country">
                    <option value="${country.country}">${country.country}</option>
                </c:forEach>
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
            <h3>添加火车信息</h3>
            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
    </div>
</div>
</body>
</html>
