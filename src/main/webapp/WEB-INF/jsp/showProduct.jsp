<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/26
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>产品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#d1").click(function () {
                $("#d2").css("display","block");
                $("#d3").css("display","none");
            })

            //ajax请求国家列表
            $.ajax({
                type:"post",
                url:"showCountry.do",
                dataType:"json",
                success:function (obj) {
                    var str ="";
                    $.each(obj,function (index,item) {
                        str += "<option value='"+item.country+"'>"+item.country+"</option>";
                    })
                    $(".a_country").append(str);
                    $(".d_country").append(str);
                }
            })

            //出发地城市的获取
            $(".d_country").change(function () {
                $(".d_city option:gt(0)").remove();
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
                            $(".d_city").append(str);
                        }
                    })
                }
            })

            //目的地城市获取
            $(".a_country").change(function () {
                $(".a_city option:gt(0)").remove();
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
                            $(".a_city").append(str);
                        }
                    })
                }
            })

            //当目的地失焦之后，通过目的地Id获取对应地方的酒店列表
            $(".a_city").change(function () {
                var arrAreaId = $(".a_city option:selected").val();
                $(".hotelId option:gt(0)").remove();
                $.ajax({
                    type:"post",
                    data:{areaId:arrAreaId},
                    url:"showHotelInfo.do",
                    dataType:"json",
                    success:function (obj) {
                        var str = "";
                        $.each(obj,function (index,item) {
                            str += "<option value='"+item.hotelId+"'>"+item.hotelName+"--<span style='color: gold;'>"+item.hotelLevel+"星</span></option>";
                        })
                        $(".hotelId").append(str);
                    }
                })
            })

            $(".addProduct").click(function () {
                var productName=$(".productName").val();
                if (productName==null || productName==''){
                    alert("产品名称不能为空");
                    return;
                }

                var daId=$(".d_city option:selected").val();
                if (daId==null || daId==0){
                    alert("出发地不能为空");
                    return;
                }

                var arrAreaId=$(".a_city option:selected").val();
                if (arrAreaId==null || arrAreaId==0){
                    alert("目的地不能为空");
                    return;
                }

                var limLow=$(".limLow").val();
                if (limLow==null || limLow==''){
                    alert("人数下限不能为空");
                    return;
                }

                var limUp=$(".limUp").val();
                if (limUp==null || limUp==''){
                    alert("人数上限不能为空");
                    return;
                }

                var days=$(".days").val();
                if (days==null || days==''){
                    alert("行程天数不能为空");
                    return;
                }

                var hotelId=$(".hotelId option:selected").val();
                if (hotelId==null || hotelId==''){
                    alert("入住酒店不能为空");
                    return;
                }

                var productFee=$(".productFee").val();
                if (productFee==null || productFee==''){
                    alert("团费不能为空");
                    return;
                }

                $.ajax({
                    type:"post",
                    data:{productName:productName,daId:daId,arrAreaId:arrAreaId,limLow:limLow,limUp:limUp,days:days,hotelId:hotelId,productFee:productFee},
                    dataType:"text",
                    url:"addProductInfo.do",
                    success:function (obj) {
                        if("false"==obj){
                            alert("新增失败");
                        }else{
                            alert("新增成功");
                            location.href="showProduct.do";
                        }
                    }
                })
            })

            if (${not empty requestScope.delProductInfo}){
                alert("${requestScope.delProductInfo}");
            }

            $("#d3").on("click",".modifyProductInfo",function () {
                var productName=$("#u_productName").val();
                if (productName==null || productName==''){
                    alert("产品名称不能为空");
                    return;
                }

                var limLow=$("#u_limLow").val();
                if (limLow==null || limLow==''){
                    alert("人数下限不能为空");
                    return;
                }

                var limUp=$("#u_limUp").val();
                if (limUp==null || limUp==''){
                    alert("人数上限不能为空");
                    return;
                }

                var days=$("#u_days").val();
                if (days==null || days==''){
                    alert("行程天数不能为空");
                    return;
                }

                var hotelId=$("#u_hotelId option:selected").val();
                if (hotelId==null || hotelId==''){
                    alert("入住酒店不能为空");
                    return;
                }

                var productFee=$("#u_productFee").val();
                if (productFee==null || productFee==''){
                    alert("团费不能为空");
                    return;
                }

                $.ajax({
                    type:"post",
                    data:{productName:productName,limLow:limLow,limUp:limUp,days:days,hotelId:hotelId,productFee:productFee},
                    dataType:"text",
                    url:"updateProductInfo.do",
                    success:function (obj) {
                        if("false"==obj){
                            alert("更新失败");
                        }else{
                            alert("更新成功");
                            location.href="showProduct.do";
                        }
                    }
                })
            })
        })
        function updateProduct(productId,productName,d_area,a_area,limLow,limUp,days,hotelId,productFee,arrAreaId) {
            $("#d2").css("display","none");
            $("#d3").css("display","block");
            // $(".hotelId option:gt(0)").remove();
            var str = "";
            $.ajax({
                type:"post",
                data:{areaId:arrAreaId},
                url:"showHotelInfo.do",
                dataType:"json",
                success:function (obj) {
                    $.each(obj,function (index,item) {
                        str += "<option value='"+item.hotelId+"'>"+item.hotelName+"--<span style='color: gold;'>"+item.hotelLevel+"星</span></option>";
                    })
                    var form ="<form action='#' method='post'/>" +
                        "<p>产品名称：<input type='text' id='u_productName' value='"+productName+"'/></p>" +
                        "<p><input type='hidden' id='u_productId' value='"+productId+"'/></p>" +
                        "<p>出发地："+d_area+"</p>" +
                        "<p>出发地："+a_area+"</p>" +
                        "<p>人数下限：<input type='number' min='1' max='5' id='u_limLow' value='"+limLow+"' ></p>" +
                        "<p>人数上限：<input type='number' min='5' max='30' id='u_limUp' value='"+limUp+"' ></p>" +
                        "<p>行程天数：<input type='number' min='1' max='10' id='u_days' value='"+days+"' /></p>" +
                        "<p>入住酒店：<select id='u_hotelId'>" +
                        "<option value='0'>--请选择--</option>" +str+
                        "</select><span>选择了目的地之后，才能看到酒店</span></p>" +
                        "<p>基础团费：<input type='number' min='500' max='10000' step='500' id='u_productFee' value='"+productFee+"'/></p>" +
                        "<p><input type='button' value='提交修改' class='modifyProductInfo'/></p></form>";

                    $("#d3").html("");
                    $("#d3").html(form);
                }
            })
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
    <table class="table table-hover">
        <thead>
        <tr>
            <td>序号</td>
            <td>产品名称</td>
            <td>出发地</td>
            <td>目的地</td>
            <td>人数下限</td>
            <td>人数上限</td>
            <td>行程天数</td>
            <td>入住酒店</td>
            <td>基本团费</td>
            <td>评分</td>
            <td>查询旅行团</td>
            <td>删除产品</td>
            <td>修改产品</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.products}" var="product" varStatus="i">
            <tr>
                <td>${i.count}</td>
                <td>${product.productName}</td>
                <td>${product.d_area.country}-${product.d_area.city}</td>
                <td>${product.a_area.country}-${product.a_area.city}</td>
                <td>${product.limLow}</td>
                <td>${product.limUp}</td>
                <td>${product.days}</td>
                <td>${product.hotel.hotelName}-${product.hotel.hotelLevel}☆</td>
                <td>${product.productFee}</td>
                <td>${product.productScore}</td>
                <td><a href="showTour.do?productId=${product.productId}">查询旅行团</a></td>
                <td><input type="button" value="删除产品" onclick="location.href='deleteProduct.do?productId=${product.productId}'"/></td>
                <td><input type="button" value="修改产品" onclick="updateProduct('${product.productId}','${product.productName}',
                        '${product.d_area.country}-${product.d_area.city}','${product.a_area.country}-${product.a_area.city}','${product.limLow}',
                        '${product.limUp}','${product.days}','${product.hotelId}','${product.productFee}','${product.arrAreaId}')"/></td>

            </tr>
        </c:forEach>
        </tbody>

    </table>
    <div style="text-align: center">
        <c:if test="${requestScope.page>1}">
            <a href="showProduct.do?page=${requestScope.page-1}"><input type="button" value="上一页"></a>
        </c:if>
        <c:forEach begin="1" end="${requestScope.pages}" step="1" var="i">
            <a href="showProduct.do?page=${i}">${i}</a>
        </c:forEach>
        <c:if test="${requestScope.page < requestScope.pages}">
            <a href="showProduct.do?page=${requestScope.page+1}"><input type="button" value="下一页"></a>
        </c:if></div>
</div>

<div style="text-align: center">
    <input type="button" value="增加产品" id="d1">
    <p style="color: green">${requestScope.success}</p>
    <p style="color: red">${requestScope.error}</p>
</div>

<%--<table class="table table-hover">--%>

<%--    <c:forEach items="${requestScope.products}" var="product" varStatus="i">--%>
<%--        <tr>--%>
<%--            <td>--%>
<%--            <div class="container">--%>
<%--                <div style="height:300px">--%>
<%--                    <div style="float:left;height: 100%;width: 30%">--%>
<%--                        <img src="../../img/4.png" style="height: 100%;width: 100%">--%>
<%--                    </div>--%>
<%--                    <div style="width:70%;float:left;height: 40%;font-size: 20px">--%>
<%--                        <button style="background-color: gold">优选</button>${product.productName}--%>
<%--                    </div>--%>
<%--                    <div style="width:70%;float:left;height:40%;font-size: 20px">--%>
<%--                        <div style="width:60%;float:left;height:100%;font-size: 20px;">--%>
<%--                            <p style="font-size: 30px;text-align: center;margin-top: 30px">供应商:驴爸爸</p>--%>
<%--                        </div>--%>
<%--                        <div style="width:20%;float:left;height:100%;font-size: 10px;">--%>
<%--                            <p style="font-size: 30px;text-align: center;margin-top: 30px">评分:${product.productScore}</p>--%>
<%--                        </div>--%>
<%--                        <div style="width:20%;float:left;height:100%;">--%>
<%--                            <p style="font-size: 30px;text-align: center;color:red;margin-top: 30px">${product.productFee}元</p>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                    <div style="width:70%;float:left;height: 20%;text-align: center">--%>
<%--                        <p style="font-size: 30px;text-align: center">供应商:驴爸爸</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <hr>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>

<div style="margin-left: 50px;display: none;" id="d2">
    <form action="#" method="post">
        <p>产品名称：<input type="text" class="productName" placeholder="请输入产品名称"></p>
        <p>出发地：<select class="d_country">
            <option value="0">--请选择--</option>
        </select>
            <select class="d_city">
                <option value="0">--请选择--</option>
            </select></p>
        <p>出发地：<select class="a_country">
            <option value="0">--请选择--</option>
        </select>
            <select class="a_city">
                <option value="0">--请选择--</option>
            </select></p>
        <p>人数下限：<input type="number" min="1" max="5" step="1" class="limLow" placeholder="请选择人数下限"></p>
        <p>人数上限：<input type="number" min="5" max="30" step="1" class="limUp" placeholder="请选择人数上限"></p>
        <p>行程天数：<input type="number" min="1" max="10" step="1" class="days" placeholder="请选择行程天数"></p>
        <p>入住酒店：<select class="hotelId">
            <option value="0">--请选择--</option>
        </select><span>选择了目的地之后，才能看到酒店</span></p>
        <p>基础团费：<input type="number" min="500" max="10000" step="500" class="productFee" placeholder="请输入基本团费"></p>
        <p><input type="submit" value="点击添加" class="addProduct"></p>
    </form>
</div>

<div style="margin-left: 50px;display: none;" id="d3">

</div>
</div>

</body>
</html>
