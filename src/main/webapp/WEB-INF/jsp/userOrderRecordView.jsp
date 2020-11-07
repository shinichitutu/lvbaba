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
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta name="description" content="Listigo | Directory Bootstrap 4 Template"/>
    <meta name="keywords"
          content="listing dashboard, directory panel, listing, responsive directory, directory template, themeforest, listing template, css3, html5"/>
    <title>Listigo | Directory Bootstrap 4 Template</title>
    <link href="assets/images/logos/favicon.png" rel="icon"/>
    <link rel="apple-touch-icon" href="assets/images/logos/touch-icon-iphone.png"/>
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/logos/touch-icon-ipad.png"/>
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/logos/touch-icon-iphone-retina.png"/>
    <link rel="apple-touch-icon" sizes="167x167" href="assets/images/logos/touch-icon-ipad-retina.png"/>
    <link rel="stylesheet" href="assets/css/vendors.bundle.css" type="text/css"/>
    <link rel="stylesheet" href="assets/css/styles.bundle.css" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;600;700;800;900&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&amp;display=swap"
          rel="stylesheet"/>

    <style>
        table {
            width: 1500px;
            border-top: 1px solid #aaaaaa;
        }

        th, td {
            border-bottom: 1px solid #c1b0b0;
            text-align: center;
            padding: 10px 0;
        }
    </style>
    <script>
        $(function () {
            if (${not empty requestScope.returnUserOrderInfo}) {
                alert("${requestScope.returnUserOrderInfo}");
            }
        })

        function returnMoney(obj, orderId) {
            var res = confirm("退票需付手续费，详情参照上面，确认退款吗？")
            console.log(orderId);
            if (res) {
                location.href = "returnUserOrder.do?orderId=" + orderId;
            } else {
                return;
            }
        }

        function addComment(obj, orderId) {
            var str = "<form action='createComment.do' method='get'>" +
                "    <input type='hidden' name='orderId' value='" + orderId + "'/>" +
                "    评分：<input style='margin: 30px 0 20px 30px;width: 150px;' type='number' name='score' max='5' min='1' step='1'/><br/>" +
                "    <span style='display: inline-block;'>评论内容：</span><br/>" +
                "   <textarea style='margin: 30px 0 20px 0px;width: 300px;height: 100px;' type='text' name='content' placeholder='请输入评论内容'/><br/>" +
                "    <input type='submit' value='点击评论'/>" +
                "</form>";
            $(".addCommentInfo").html("");
            $(".addCommentInfo").html(str);
        }
    </script>
<%--    <script type="text/javascript">--%>
<%--        window.onload = function () {--%>

<%--            var oStar = document.getElementById("star");--%>
<%--            var aLi = oStar.getElementsByTagName("li");--%>
<%--            var oUl = oStar.getElementsByTagName("ul")[0];--%>
<%--            var oSpan = oStar.getElementsByTagName("span")[1];--%>
<%--            var oP = oStar.getElementsByTagName("p")[0];--%>
<%--            var i = iScore = iStar = 0;--%>
<%--            var aMsg = [--%>
<%--                "很不满意|差得太离谱，与卖家描述的严重不符，非常不满",--%>
<%--                "不满意|部分有破损，与卖家描述的不符，不满意",--%>
<%--                "一般|质量一般，没有卖家描述的那么好",--%>
<%--                "满意|质量不错，与卖家描述的基本一致，还是挺满意的",--%>
<%--                "非常满意|质量非常好，与卖家描述的完全一致，非常满意"--%>
<%--            ]--%>

<%--            for (i = 1; i <= aLi.length; i++) {--%>
<%--                aLi[i - 1].index = i;--%>

<%--                //鼠标移过显示分数--%>
<%--                aLi[i - 1].onmouseover = function () {--%>
<%--                    fnPoint(this.index);--%>
<%--                    //浮动层显示--%>
<%--                    oP.style.display = "block";--%>
<%--                    //计算浮动层位置--%>
<%--                    oP.style.left = oUl.offsetLeft + this.index * this.offsetWidth - 104 + "px";--%>
<%--                    //匹配浮动层文字内容--%>
<%--                    oP.innerHTML = "<em><b>" + this.index + "</b> 分 " + aMsg[this.index - 1].match(/(.+)\|/)[1] + "</em>" + aMsg[this.index - 1].match(/\|(.+)/)[1]--%>
<%--                };--%>

<%--                //鼠标离开后恢复上次评分--%>
<%--                aLi[i - 1].onmouseout = function () {--%>
<%--                    fnPoint();--%>
<%--                    //关闭浮动层--%>
<%--                    oP.style.display = "none"--%>
<%--                };--%>

<%--                //点击后进行评分处理--%>
<%--                aLi[i - 1].onclick = function () {--%>
<%--                    iStar = this.index;--%>
<%--                    oP.style.display = "none";--%>
<%--                    oSpan.innerHTML = "<strong>" + (this.index) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"--%>
<%--                }--%>
<%--            }--%>

<%--            //评分处理--%>
<%--            function fnPoint(iArg) {--%>
<%--                //分数赋值--%>
<%--                iScore = iArg || iStar;--%>
<%--                for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : "";--%>
<%--            }--%>

<%--        };--%>
<%--    </script>--%>
</head>

<body>

<h3>购票记录</h3>
<br/><br/><br/>
<h4 style="color: red"> ! 退票需付手续费，已发团不能退团，出发前3天内退团需付50%手续费，前4-10天内退团需付30%的手续费，前11-30天退团需付20%的手续费，提前一个月退团需付10%的手续费</h4>
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
        <c:if test="${empty requestScope.userorderList}">
            <tr>
                <td colspan="15">1</td>
                <td colspan="14">暂时没有任何出行信息</td>
            </tr>
        </c:if>
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
                <td>
                    <c:if test="${'已确认发团'.equals(orderList.orderStatus)}">
                        <input type="button" onclick="addComment(this,'${orderList.orderId}')" value="评论"/>
                    </c:if>
                </td>
                <td>
                    <c:if test="${!'已成团'.equals(orderList.orderStatus) && !'待成团'.equals(orderList.orderStatus) || '5'.equals(orderList.tour.tourStatus) || '6'.equals(orderList.tour.tourStatus)}">...</c:if>
                    <c:if test="${('待成团'.equals(orderList.orderStatus) || '已成团'.equals(orderList.orderStatus)) && !'5'.equals(orderList.tour.tourStatus) && !'6'.equals(orderList.tour.tourStatus)}">
                        <input type="button" onclick="returnMoney(this,'${orderList.orderId}')" value="退款"/>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<br/>
<div class="addCommentInfo">
<%--    <input type='hidden' name='orderId' value='"+orderId+"'/>" +--%>
<%--    &lt;%&ndash;        评分：<input style='margin: 30px 0 20px 30px;width: 150px;' type='number' name='score' max='5' min='1' step='1'/><br/>" +&ndash;%&gt;--%>
<%--    评分：--%>
<%--    <div id="star">--%>
<%--        <ul>--%>
<%--            <li><a href="javascript:;">1</a></li>--%>
<%--            <li><a href="javascript:;">2</a></li>--%>
<%--            <li><a href="javascript:;">3</a></li>--%>
<%--            <li><a href="javascript:;">4</a></li>--%>
<%--            <li><a href="javascript:;">5</a></li>--%>
<%--        </ul>--%>
<%--        <span></span>--%>
<%--        <p></p>--%>
<%--    </div><!--star end-->--%>
<%--    <span style='display: inline-block;'>评论内容：</span><br/>" +--%>
<%--    <textarea style='margin: 30px 0 20px 0px;width: 300px;height: 100px;' type='text' name='content'--%>
<%--              placeholder='请输入评论内容'/><br/>" +--%>
<%--    <input type='submit' value='点击评论'/>" +--%>
</div>

</body>
</html>
