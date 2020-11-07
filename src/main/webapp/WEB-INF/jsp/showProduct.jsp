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
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <meta name="description" content="Listigo | Directory Bootstrap 4 Template" />
        <meta name="keywords" content="listing dashboard, directory panel, listing, responsive directory, directory template, themeforest, listing template, css3, html5" />
        <title>驴爸爸旅行</title>
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
                                str += "<option value='"+item.hotelId+"'>"+item.hotelName+"--<span style='color: gold;'>"+item.hotelLevel+"☆</span></option>";
                            })
                            $(".hotelId").append(str);
                        }
                    })
                })

                $(".addProduct").click(function () {
                    var productName=$(".productName").val();
                    console.log(productName);
                    if (productName==null || productName==''){
                        alert("产品名称不能为空");
                        return;
                    }

                    var daId=$(".d_city option:selected").val();
                    console.log(daId);
                    if (daId==null || daId==0){
                        alert("出发地不能为空");
                        return;
                    }

                    var arrAreaId=$(".a_city option:selected").val();
                    console.log(arrAreaId);
                    if (arrAreaId==null || arrAreaId==0){
                        alert("目的地不能为空");
                        return;
                    }

                    var limLow=$(".limLow").val();
                    console.log(limLow);
                    if (limLow==null || limLow==''){
                        alert("人数下限不能为空");
                        return;
                    }

                    var limUp=$(".limUp").val();
                    console.log(limUp);
                    if (limUp==null || limUp==''){
                        alert("人数上限不能为空");
                        return;
                    }

                    var days=$(".days").val();
                    console.log(days);
                    if (days==null || days==''){
                        alert("行程天数不能为空");
                        return;
                    }

                    var hotelId=$(".hotelId option:selected").val();
                    console.log(hotelId);
                    if (hotelId==null || hotelId==''){
                        alert("入住酒店不能为空");
                        return;
                    }

                    var productFee=$(".productFee").val();
                    console.log(productFee);
                    if (productFee==null || productFee==''){
                        alert("团费不能为空");
                        return;
                    }

                    $(".addProduct").submit();
                    // $.ajax({
                    //     type:"post",
                    //     data:{productName:productName,daId:daId,arrAreaId:arrAreaId,limLow:limLow,limUp:limUp,days:days,hotelId:hotelId,productFee:productFee},
                    //     dataType:"text",
                    //     url:"addProductInfo.do",
                    //     success:function (obj) {
                    //         if("false"==obj){
                    //             alert("新增失败");
                    //         }else{
                    //             alert("新增成功");
                    //             location.href="showProduct.do";
                    //         }
                    //     }
                    // })
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

                    console.log($())
                    $(this).submit();
                    // $.ajax({
                    //     type:"post",
                    //     data:{productName:productName,limLow:limLow,limUp:limUp,days:days,hotelId:hotelId,productFee:productFee},
                    //     dataType:"text",
                    //     url:"updateProductInfo.do",
                    //     success:function (obj) {
                    //         if("false"==obj){
                    //             alert("更新失败");
                    //         }else{
                    //             alert("更新成功");
                    //             location.href="showProduct.do";
                    //         }
                    //     }
                    // })
                })
            })

            function updateProduct(productId,productName,d_area,a_area,limLow,limUp,days,hotelId,productFee,arrAreaId,filePath) {
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
                        var form ="<form action='updateProductInfo.do' method='post' enctype='multipart/form-data'/>" +
                            "<p>产品名称：<input required type='text' id='u_productName' name='productName' value='"+productName+"'/></p>" +
                            "<p><input type='hidden' id='u_productId' name='productId' value='"+productId+"'/></p>" +
                            "<p>出发地："+d_area+"</p>" +
                            "<p>出发地："+a_area+"</p>" +
                            "<p>人数下限：<input required type='number' min='1' max='5' id='u_limLow' name='limLow' value='"+limLow+"' ></p>" +
                            "<p>人数上限：<input required type='number' min='5' max='30' id='u_limUp' name='limUp' value='"+limUp+"' ></p>" +
                            "<p>行程天数：<input required type='number' min='1' max='10' id='u_days' name='days' value='"+days+"' /></p>" +
                            "<p>入住酒店：<select id='u_hotelId'>" +
                            "<option value='0'>--请选择--</option>" +str+
                            "</select><span>选择了目的地之后，才能看到酒店</span></p>" +
                            "<p>基础团费：<input required type='number' min='500' max='10000' step='500' name='productFee' id='u_productFee' value='"+productFee+"'/></p>" +
                            "<p>产品图片：<input required type='file' name='file1'></p>" +
                            "<p><input type='submit' value='提交修改' class='modifyProductInfo'/></p></form>";

                        $("#d3").html("");
                        $("#d3").html(form);
                    }
                })
            }

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
                                <img src="assets/images/user/32/user-1.jpg" alt="" />
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
                <td>序号</td>
                <td>产品图片</td>
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
                    <td><img style="width: 200px;height: 160px;" src="${product.files.filePath}"></td>
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
                            '${product.limUp}','${product.days}','${product.hotelId}','${product.productFee}','${product.arrAreaId}','${product.files.filePath}')"/></td>

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



    <div style="margin-left: 50px;display: none;" id="d2">
        <form action="addProductInfo.do" method="post" enctype="multipart/form-data">
            <p>产品名称：<input required type="text" name="productName" class="productName" placeholder="请输入产品名称"></p>
            <p>出发地：<select class="d_country">
                <option value="0">--请选择--</option>
            </select>
                <select required class="d_city" name="daId">
                    <option value="0">--请选择--</option>
                </select></p>
            <p>出发地：<select required class="a_country">
                <option value="0">--请选择--</option>
            </select>
                <select required class="a_city" name="arrAreaId">
                    <option value="0">--请选择--</option>
                </select></p>
            <p>人数下限：<input required type="number" min="1" max="5" step="1" name="limLow" class="limLow" placeholder="请选择人数下限"></p>
            <p>人数上限：<input required type="number" min="5" max="30" step="1" name="limUp" class="limUp" placeholder="请选择人数上限"></p>
            <p>行程天数：<input required type="number" min="1" max="10" step="1" name="days" class="days" placeholder="请选择行程天数"></p>
            <p>入住酒店：<select required class="hotelId" name="hotelId">
                <option value="0">--请选择--</option>
            </select><span>选择了目的地之后，才能看到酒店</span></p>
            <p>基础团费：<input required type="number" min="500" max="10000" step="500" name="productFee" class="productFee" placeholder="请输入基本团费"></p>
            <p>选择文件：<input required type="file" name="file"></p>
            <p><input type="submit" value="点击添加" class="addProduct"></p>
        </form>
    </div>

    <div style="margin-left: 50px;display: none;" id="d3">

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
