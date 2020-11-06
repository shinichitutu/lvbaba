<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/5
  Time: 10:14
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
    <title>用户旅行订单</title>
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
            if (count<1){
                if (${not empty requestScope.returnUserOrderInfo}){
                    alert("${requestScope.returnUserOrderInfo}");
                }
            }
        })
        function returnMoney(obj,orderId) {
            var res = confirm("退票需付手续费，详情参照上面，确认退款吗？")
            console.log(orderId);
            if (res){
                location.href="returnUserOrder.do?orderId="+orderId;
            }else{
                return;
            }
        }
    </script>
</head>
<body>
<body>
<h3>购票记录</h3>
<h4 style="color: red"> ! 退票需付手续费，出发当天不能退团，出发前3天内退团需付50%手续费，前4-10天内退团需付30%的手续费，前11-30天退团需付20%的手续费，提前一个月退团需付10%的手续费</h4>
<div>
    <table>
        <thead>
            <tr>
                <th>序号</th>
                <th>产品名称</th>
                <th>出发地</th>
                <th>目的地</th>
                <th>出发日期</th>
                <th>返程日期</th>
                <th>交通类型</th>
                <th>去程交通</th>
                <th>返程交通</th>
                <th>入住酒店</th>
                <th>支付价格</th>
                <th>出行人数</th>
                <th>下单时间</th>
                <th>订单状态</th>
                <th>评论</th>
                <th>退款</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${empty requestScope.userorderList}"><tr>
            <td colspan="15">1</td>
            <td colspan="14">暂时没有任何出行信息</td>
        </tr></c:if>
        <c:forEach items="${requestScope.userorderList}" var="orderList" varStatus="i">
            <tr>
                <td>${i.count}</td>
                <td>${orderList.product.productName}</td>
                <td>${orderList.product.d_area.country}·${orderList.product.d_area.city}</td>
                <td>${orderList.product.a_area.country}·${orderList.product.a_area.city}</td>
                <td>${orderList.tour.dDate}</td>
                <td>${orderList.tour.roomDate}</td>
                <td>
                    <c:if test="${'1'.equals(orderList.tour.transType)}">飞机</c:if>
                    <c:if test="${'2'.equals(orderList.tour.transType)}">火车</c:if>
                </td>
                <td>${orderList.tour.go_flight.flightNumber}${orderList.tour.go_train.trNumber}</td>
                <td>${orderList.tour.re_flight.flightNumber}${orderList.tour.re_train.trNumber}</td>
                <td>${orderList.product.hotel.hotelName}</td>
                <td>${orderList.orderPrice}</td>
                <td>${orderList.roomNum}</td>
                <td>${orderList.orderTime}</td>
                <td>${orderList.orderStatus}</td>
                <td><input type="button" value="评论"/></td>
                <td>
                    <c:if test="${!'已退团'.equals(orderList.orderStatus)}">
                        <input type="button" onclick="returnMoney(this,'${orderList.orderId}')" value="退款"/>
                    </c:if>
                    <c:if test="${'已退团'.equals(orderList.orderStatus)}">...
<%--                        <input type="button" onclick="returnMoney(this,'${orderList.orderId}')" disabled value="退款"/>--%>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</body>
</html>
