<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/4
  Time: 18:40
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
    <title>购票记录</title>
    <meta charset="utf-8"/>
    <script src="js/jquery-3.1.0.js"></script>
    <style>
        table {
            width: 1500px;
            border-top: 1px solid #aaaaaa;
        }

        th,td {
            border-bottom: 1px solid #c1b0b0;
            text-align: center;
            padding: 10px 0;
        }
    </style>
    <script>
        $(function () {
            if (${not empty requestScope.returnTicketInfo}){
                alert("${requestScope.returnTicketInfo}");
            }
        })
        function returnTicket(obj,fdrId) {
            var res = confirm("退票需付手续费，详情参照上面，确认退款吗？")
            if (res){
                location.href="returnTicket.do?fdrId="+fdrId;
            }else{
                return;
            }
        }
    </script>
</head>
<body>
    <h3>购票记录</h3>
    <h4 style="color: red"> ! 退票需付手续费，出发当天不能退票，出发前3天内50%手续费，前4-10天内30%的手续费，前11-30天20%的手续费，提前一个月退票10%的手续费</h4>
    <div>
        <table>
            <thead>
            <tr>
                <th>序号</th>
                <th>航班号</th>
                <th>航空公司</th>
                <th>出发地</th>
                <th>目的地</th>
                <th>出发日期</th>
                <th>到达日期</th>
                <th>购买人姓名</th>
                <th>证件类型</th>
                <th>证件号码</th>
                <th>联系电话</th>
                <th>价格</th>
                <th>状态</th>
                <th>退票</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty requestScope.ticketrecords}">
                <tr>
                    <td colspan="13">暂时没有任何订单信息</td>
                </tr>
            </c:if>
            <c:forEach items="${requestScope.ticketrecords}" var="tkrecord" varStatus="i">
                <tr>
                    <td>${i.count}</td>
                    <td>${tkrecord.flightName}</td>
                    <td>${tkrecord.flightCanpany}</td>
                    <td>${tkrecord.departureArea}</td>
                    <td>${tkrecord.destinationArea}</td>
                    <td>${tkrecord.departureTime}</td>
                    <td>${tkrecord.arrivalTime}</td>
                    <td>${tkrecord.userName}</td>
                    <td>身份证</td>
                    <td>${tkrecord.userIdcard}</td>
                    <td>${tkrecord.userPhone}</td>
                    <td style="color: red;font-weight: bold;font-size: 20px;">${tkrecord.flightPrice}</td>
                    <td>${tkrecord.recordStatus}</td>
                    <td>
                        <c:if test="${'已支付'.equals(tkrecord.recordStatus)}">
                        <a style="cursor: pointer" onclick="returnTicket(this,'${tkrecord.fdrId}')">退票</a></c:if>
                        <c:if test="${'已退票'.equals(tkrecord.recordStatus)}"><a>...</a></c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
