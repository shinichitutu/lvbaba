<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/10/29
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>用户查看产品详情</title>
    <script src="js/jquery-3.1.0.js"></script>
    <base href="<%=basePath%>"/>
</head>
<body>
<%--产品页面--%>
<div >
    <div class="container" style="border-bottom: solid;height: 400px">
        <div style="height:100%;width: 70%;float: left">
            <div style="float:left;height: 100%;width: 30%">
                <img src="../../img/4.png" style="height: 100%;width: 100%">
            </div>
            <div style="width:70%;float:left;height: 40%;font-size: 20px">
                <button style="background-color: gold">优选</button>${product.productName}
            </div>
            <div style="width:70%;float:left;height:40%;font-size: 20px">
                <div style="width:60%;float:left;height:100%;font-size: 20px;">
                    <p style="font-size: 30px;text-align: center;margin-top: 30px">供应商:驴爸爸</p>
                </div>
                <div style="width:20%;float:left;height:100%;font-size: 10px;">
                    <p style="font-size: 30px;text-align: center;margin-top: 30px">评分:${product.productScore}</p>
                </div>
                <div style="width:20%;float:left;height:100%;">
                    <p style="font-size: 30px;text-align: center;color:red;margin-top: 30px">${product.productFee}元</p>
                </div>
            </div>
            <div style="width:70%;float:left;height: 20%;text-align: center">
                <p style="font-size: 30px;text-align: center">供应商:驴爸爸</p>
            </div>
        </div>
        <div style="height:100%;width: 30%;float: none;float: left;">
            <input type="date" style="height:10%;width: 100%">
        </div>
    </div>
</div>
<form action="createOne.do" method="post">
<div style="float: none;height: 200px;background-color: navajowhite">
    <div style="height: 100%;width: 20%;float:left">
        <div style="height: 50%;text-align: left;font-size: 30px;">
            出发:
        </div>
        <div style=";height: 50%">
            <input type="date" style="height: 50px;width: 80%" name="dDate">
        </div>
    </div>
    <div style="height: 100%;width: 20%;float:left">
        <div style="height: 50%;text-align: left;font-size: 30px;">
            交通方式
        </div>
        <div style=";height: 50%;font-size: 50px">
            <select style="height: 50px;width: 80%" name="transType">
                <option value="1">火车</option>
                <option value="2">飞机</option>
            </select>
        </div>
    </div>
    <div style="height: 100%;width: 20%;float:left">
        <div style="height: 50%;text-align: left;font-size: 30px;">
            人数:
        </div>
        <div style=";height: 50%">
            <input type="number" max="10" min="1" step="1" name="numberOfTrips" style="height: 50px;width: 80%">
        </div>
    </div>
    <div style="height: 100%;width: 20%;float:left">
        <div style="height: 50%;text-align: left;font-size: 30px;">
            酒店:
        </div>
        <div style=";height: 25%;float: left;width: 30%;font-size: 15px;text-align: right">
            <strong>标间/大床房:</strong>
        </div>
        <div style=";height: 25%;float: left;width: 70%">
            <input type="number" max="5" min="0" step="1" name="sRoom" style="width: 40%">
        </div>
    </div>
    <div style="height: 100%;width: 20%;float:left">
        <input name="productId" type="hidden" value="${product.productId}">
        <input name="daId" type="hidden" value="${product.daId}">
        <input name="arrAreaId" type="hidden" value="${product.arrAreaId}">
        <input name="limLow" type="hidden" value="${product.limLow}">
        <input name="limUp" type="hidden" value="${product.limUp}">
        <input name="days" type="hidden" value="${product.days}">
        <input name="hotelId" type="hidden" value="${product.hotelId}">
        <input name="productName" type="hidden" value="${product.productName}">
        <input name="productFee" type="hidden" value="${product.productFee}">
        <input name="productScore" type="hidden" value="${product.productScore}">
        <input type="submit" value="立即预订" style="margin-top: 20%;text-align: right;font-size: 40px;color: red">
    </div>
</div>
</form>
<p style="color: red;">${requestScope.error}</p>
</body>
</html>
