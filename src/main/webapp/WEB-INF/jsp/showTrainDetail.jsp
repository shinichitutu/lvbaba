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
    <title>显示列车详情</title>
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
            <th>列车号</th>
            <th>出发地</th>
            <th>目的地</th>
            <th>出发时间</th>
            <th>到达时间</th>
            <th>容量</th>
            <th>车票价格</th>
            <th>出发日期</th>
            <th>已售票数</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty requestScope.trainDetailList}"><tr><td colspan="12">暂时还没有航班信息</td></tr></c:if>
        <c:forEach items="${requestScope.trainDetailList}" var="train">
            <c:forEach items="${train.traindetailList}" var="traindetail" varStatus="i">
                <tr>
                    <td style='width: 30px;'>${i.count}</td>
                    <td>${train.flightNumber}</td>
                    <td>${train.flightCompany}</td>
                    <td>${train.d_area.country}-${train.d_area.city}</td>
                    <td>${train.a_area.country}-${train.a_area.city}</td>
                    <td>${train.flightDTime}</td>
                    <td>${train.flightATime}</td>
                    <td>${train.flightCapacity}</td>
                    <td>${train.flightPrice}</td>
                    <td>${traindetail.tdDate}</td>
                    <td>${traindetail.tdTickets}</td>

                    <td><input type="button" value="编辑"></td>
                    <td><input type="button" value="删除"></td>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
