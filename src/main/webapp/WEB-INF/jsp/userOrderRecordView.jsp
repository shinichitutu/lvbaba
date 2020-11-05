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
<body>
<h3>购票记录</h3>
<h4 style="color: red"> ! 退票需付手续费，出发当天不能退票，出发前3天内50%手续费，前4-10天内30%的手续费，前11-30天20%的手续费，提前一个月退票10%的手续费</h4>
<div style="width: 1300px;height: 200px;">
    <c:if test="${empty requestScope.userorderList}">暂时没有任何出行信息</c:if>
    <c:forEach items="${requestScope.userorderList}" var="orderList" varStatus="i">
      <div>
          <div style="width: 200px;height: 180px;display: inline-block"><img style="width: 200px;height: 180px;" src="${orderList.product.files.filePath}"/></div>
          <div style="width: 1100px;height: 180px;display: inline-block">
              <p style="display: inline-block">
                  <h2>${orderList.product.productName}
              <span style="padding-left: 20px;">${orderList.product.d_area.country}·${orderList.product.d_area.city} 到 ${orderList.product.a_area.country}·${orderList.product.a_area.city}</span>
              <span style="padding-left: 30px;">${orderList.tour.flight.flightNumber}${orderList.tour.train.trNumber}</span></h2>
              </p>
              <div>
                  <div style="width: 400px;display: inline-block;">
                    ${orderList.product.productIntroduction}
                  </div>
                  <div style="display: inline-block;padding-left: 30px;">
                    <p></p>
                  </div>
              </div>
          </div>
      </div>
    </c:forEach>
</div>
</body>
</body>
</html>
