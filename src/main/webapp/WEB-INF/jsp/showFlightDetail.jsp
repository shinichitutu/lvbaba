<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/10/28
  Time: 15:26
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
    <title>显示航班详情</title>
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
</head>
<body>
    <h3 style="margin-top: 15px;"><a href="showFlightAndTrain.do">返回交通工具管理</a></h3>
    <br/>
    <table class="tb">
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
            <th>出发日期</th>
            <th>已售票数</th>
            <th>票价系数</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty requestScope.flightDetailList}"><tr><td colspan="14">暂时还没有航班信息</td></tr></c:if>
        <c:forEach items="${requestScope.flightDetailList}" var="flight">
            <c:forEach items="${flight.flightdetails}" var="flightDetail" varStatus="i">
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
                    <td>${flightDetail.fdDate}</td>
                    <td>${flightDetail.fdTickets}</td>
                    <td>${flightDetail.ratio}</td>

                    <td><input type="button" value="编辑"></td>
                    <td><input type="button" value="删除"></td>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
