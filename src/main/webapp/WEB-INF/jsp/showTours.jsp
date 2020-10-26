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
            })
            $(".remove").click(function () {
                var tId=$(this).next().val()
                console.log(tId)
                $.ajax({
                    type:"post",
                    data:{tId:tId},
                    dataType:"text",
                    url:"removeTour.do",
                    success:function (obj) {
                        console.log(obj)
                        window.location.href="showTour.do";
                    }
                })
            })
            $(".update").click(function () {
                var tId=$(this).next().val()
                console.log(tId)
                $.ajax({
                    type:"post",
                    data:{tId:tId},
                    dataType:"json",
                    url:"updateTour.do",
                    success:function (obj) {
                        console.log(obj)
                        window.location.href="showTour.do";
                    }
                })
            })
        })
    </script>
    <base href="<%=basePath%>"/>
</head>
<body>

<div style="display: none" id="d2">
    <form action="insertTour.do" method="post">
        <input type="text" name="pId">
        <input type="text" name="dDate">
        <input type="text" name="rDate">
        <input type="text" name="cType">
        <input type="text" name="goId">
        <input type="text" name="returnId">
        <input type="text" name="bookNum">
        <input type="text" name="tStatus">
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
                <td>${tour.pId}</td>
                <td>${tour.dDate}</td>
                <td>${tour.rDate}</td>
                <td>${tour.cType}</td>
                <td>${tour.goId}</td>
                <td>${tour.returnId}</td>
                <td>${tour.bookNum}</td>
                <td>${tour.tStatus}</td>
                <td><input type="button" value="修改产品" class="update"><input type="hidden" value="${tour.tId}"></td>
                <td><input type="button" value="删除产品" class="remove"><input type="hidden" value="${tour.tId}"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div style="text-align: center">
    <%--增加产品--%>
    <input type="button" value="增加产品" id="d1">
</div>
<div id="update">

</div>
<p style="color: green">${requestScope.success}</p>
<p style="color: red">${requestScope.error}</p>
</body>
</html>
