<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/26
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>旅行团</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>

    <script>
        $(function () {
            $("#d1").click(function () {
                $("#d2").css("display","block")
            });

            $(".remove").click(function () {
                var tourId=$(this).next().val();
                console.log(tourId);
                $.ajax({
                    type:"post",
                    data:{tourId:tourId},
                    dataType:"text",
                    url:"removeTour.do",
                    success:function (obj) {
                        console.log(obj);
                        window.location.href="showTour.do";
                    }
                })
            });

            $(".update").click(function () {
                var tourId=$(this).next().val();
                console.log(tourId);
                $.ajax({
                    type:"post",
                    data:{tourId:tourId},
                    dataType:"json",
                    url:"updateTour.do",
                    success:function (obj) {
                        console.log(obj);
                        window.location.href="showTour.do";
                    }
                })
            });

            $(".choice").click(function () {
                var str1 = "去程";
                var str2 ="返程";
                if($("#f").prop("checked")){
                    $("#trans").html(str1);
                }
                if($("#t").prop("checked")){
                    $("#trans").html(str2);
                }
            });


            $("#deDate").blur(function () {
                var deDate = $(this).val();
                var daId = ${requestScope.product.daId};
                var arrAreaId =${requestScope.product.arrAreaId};
                if(deDate!=''){
                    var date = timeStampString(new Date(new Date(deDate).setDate(new Date(deDate).getDate()+${requestScope.product.days-1})));
                }
                $("#reDate").val(date);

                $("#flight2 option:gt(0)").remove();
                console.log("返程"+date);
                $.ajax({
                    type:"post",
                    url:"searchFlight.do",
                    data:{date:date,daId:arrAreaId,arrAreaId:daId},
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.fdId+"'>"+item.flight.flightNumber+"</option>";
                        });
                        $("#flight2").append(str);

                    }
                })

            });


            function timeStampString(time){
                var datetime = new Date();
                datetime.setTime(time);
                var year = datetime.getFullYear();
                var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                return year + "-" + month + "-" + date;
            }


            $("#deDate").change(function () {
                $("#flight option:gt(0)").remove();
                var date = $(this).val();
                var daId = ${requestScope.product.daId};
                var arrAreaId =${requestScope.product.arrAreaId};
                $.ajax({
                    type:"post",
                    url:"searchFlight.do",
                    data:{date:date,daId:daId,arrAreaId:arrAreaId},
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.fdId+"'>"+item.flight.flightNumber+"</option>";
                        });
                        $("#flight").append(str);
                    }
                });

                $.ajax({
                    type:"post",
                    url:"searchTrain.do",
                    data:{date:date,daId:daId,arrAreaId:arrAreaId},
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            str += " <option value='"+item.tdId+"'>"+item.train.trNumber+"</option>";
                        });
                        $("#train").append(str);
                    }
                })

            });
        })

    </script>

    <base href="<%=basePath%>"/>
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

<div style="display: none" id="d2">
    <form action="insertTour.do" method="post">
        <input type="hidden" name="productId" value="${requestScope.productId}">
        出发日期<input type="date" name="dDate" id="deDate"><br/>
        返回日期<input type="date" name="rDate" id="reDate"><br/>
        交通类型：
        飞机<input type="radio" name="tran" class="choice" value="f" id="f">
        火车<input type="radio" name="tran" class="choice" value="t" id="t">

        选择去程航班<select id='flight'><option value='0'>--请选择去程航班--</option></select>
    `   选择返程航班<select id='flight2'><option value='0'>--请选择返程航班--</option></select>

        选择去程火车<select id='train'><option value='0'>--请选择去程火车--</option></select>
        选择返程火车<select id='train2'><option value='0'>--请选择返程火车--</option></select>

        <div id="trans"></div>
        <input type="submit" value="点击添加">
    </form>
</div>

<div class="container">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>旅行团id</td>
            <td>产品id</td>
            <td>出发日期</td>
            <td>返回日期</td>
            <td>交通类型</td>
            <td>去程交通id</td>
            <td>返回交通id</td>
            <td>已预订人数</td>
            <td>状态</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.tours}" var="tour" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${tour.productId}</td>
                <td>${tour.dDate}</td>
                <td>${tour.roomDate}</td>
                <td>${tour.transType}</td>
                <td>${tour.goId}</td>
                <td>${tour.returnId}</td>
                <td>${tour.bookNum}</td>
                <td><c:if test="${tour.tourStatus eq 1}">
                    已成团
                </c:if>
                    <c:if test="${tour.tourStatus eq 2}">
                        未成团
                    </c:if>
                </td>
                <td><input type="button" value="修改产品" class="update"><input type="hidden" value="${tour.tourId}"></td>
                <td><input type="button" value="删除产品" class="remove"><input type="hidden" value="${tour.tourId}"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<div style="text-align: center">
    <%--增加产品--%>
    <input type="button" value="增加产品" id="d1"><br/>
        <c:if test="${requestScope.page>1}">
            <a href="showTour.do?page=${requestScope.page-1}"><input type="button" value="上一页"></a>
        </c:if>
        <c:forEach begin="1" end="${requestScope.pages}" step="1" var="i">
            <a href="showTour.do?page=${i}">${i}</a>
        </c:forEach>
        <c:if test="${requestScope.page < requestScope.pages}">
            <a href="showTour.do?page=${requestScope.page+1}"><input type="button" value="下一页"></a>
        </c:if>
</div>

<div id="update">
</div>


<p style="color: green">${requestScope.success}</p>
<p style="color: red">${requestScope.error}</p>
</body>
</html>
