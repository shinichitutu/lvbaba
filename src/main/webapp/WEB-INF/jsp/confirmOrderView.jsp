<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/10/29
  Time: 16:37
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
    <title>确认订单</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        table {
            width: 800px;
            border-top: 1px solid #aaaaaa;
            border-bottom: 1px solid #aaaaaa;
        }

        tr, th {
            border-bottom: 1px solid #aaaaaa;
            text-align: center;
            padding: 10px 0;
        }

        #addUser {
            width: 850px;
            display: block;
            text-align: right;
            padding-right: 100px;
        }

        #addUser, .modify_UserInfo {
            text-decoration: underline;
            cursor: pointer;
            color: #0099ff;
        }
        .costDetail{
            float: right;
            width: 400px;
            background-color: white;
            padding: 10px;
            border-radius: 10px;
        }
        body{
            background-color: #f1f1f6;
        }
        .payOrder{
            font-weight: bold;
            color:white;
            margin-right: 50px;
            width: 250px;
            padding: 10px;
            background-color: rgba(255, 138, 38, 0.83);
        }
    </style>
    <script>
        function modifyUserInfo(uiId, person, idcard, phone) {
            var str = "<p>姓名：<input type='text' class='person' value='" + person + "'/></p>" +
                "<p>身份证号码：<input type='text' class='idcard' value='" + idcard + "'/></p>" +
                "<p>联系电话：<input type='text' class='phone' value='" + phone + "'/></p>" +
                "<p><input type='hidden' class='uiId' value='" + uiId + "'/></p>" +
                "<p><input type='button' class='modifyUserInfo' value='提交'/></p>";
            $("#updateUserInfo").html("");
            $("#updateUserInfo").html(str);
        }

        $(function () {
            $("#updateUserInfo").on("click", ".modifyUserInfo", function () {
                $("#updateUserInfo").css("display", "block");
                $(".add_UserInfo").css("display", "none");

                var uiId = $(".uiId").val();
                var person = $(".person").val();
                if (person == null || person == '') {
                    alert("旅客名字不能为空");
                    return;
                }

                var idcard = $(".idcard").val();
                if (idcard == null || idcard == '') {
                    alert("身份证不能为空");
                    return;
                }

                var phone = $(".phone").val();
                if (uiId == null || uiId == '') {
                    alert("联系电话不能为空");
                    return;
                }

                $.ajax({
                    type: "post",
                    data: {uiId: uiId, person: person, idcard: idcard, phone: phone},
                    url: "updateUserInfo.do",
                    dataType: "text",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("更新旅客信息失败");
                        } else {
                            alert("更新旅客信息成功");
                            window.location.reload();
                        }
                    }
                })
            })

            $(".addUserInfo").click(function () {
                var person = $("[name='person']").val();
                if (person == null || person == '') {
                    alert("姓名不能为空");
                    return;
                }

                var idcard = $("[name='idcard']").val();
                if (idcard == null || idcard == '') {
                    alert("身份证号码不能为空");
                    return;
                }

                var phone = $("[name='phone']").val();
                if (person == null || person == '') {
                    alert("联系电话不能为空");
                    return;
                }

                $.ajax({
                    type: "post",
                    data: {person: person, idcard: idcard, phone: phone},
                    dataType: "text",
                    url: "addUserInfo.do",
                    success: function (obj) {
                        if ("false" == obj) {
                            alert("添加旅客信息失败");
                        } else {
                            alert("添加旅客信息成功");
                            window.location.reload();
                        }
                    }
                })
            })

            $("#addUser").click(function () {
                $("#updateUserInfo").css("display", "none");
                $(".add_UserInfo").css("display", "block");
            })
        })
    </script>
</head>
<body>


<div style="width: 1300px;margin: 30px auto 0 auto;">
    <div style="width: 1300px;background-color: #eedde4;padding: 10px;border-radius: 10px;">
        旅游提醒：可接待体温正常、持有健康码绿码、未途经或来自国内疫情中、高风险地区的境内人员。 若您持有非绿码、来自或途经国内疫情中、高风险地区、或是港澳台/外籍人员，请务必详细了解当地疫情相关规定，合理安排出行。
    </div>

    <br/>

    <div class="costDetail">
        <h5>费用明细</h5>

        <p>基本团费￥${requestScope.product.productFee}</p>
        <p>酒店￥${requestScope.hotelFee}</p>
        <p>往返交通￥${requestScope.transFee}x${requestScope.numberOfTrips}人</p>
        <p>总价￥${requestScope.total}</p>
    </div>

    <div style="width: 880px;" >
        <div class="tourInfo" style="background-color: white;padding: 10px;border-radius: 10px;">
            <%--<h3>${requestScope.departureArea.city}+${requestScope.destinationArea.city}${product.days}日游</h3>--%>
            <h3>${requestScope.product.productName}</h3>
     <%--       <p style="text-indent: 2em">${requestScope.product.productIntroduction}</p>--%>
        </div>
        <div class="orderDetail" style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
            <p>
            <h3 style="display: inline">明细</h3><span>以下为您所选择的全部资源明细，下单前请仔细查看核实。</span></p>
            出发地:${requestScope.departureArea.city}<br/>
            目的地:${requestScope.destinationArea.city}<br/>

            <c:if test="${requestScope.type eq '1'}">
                去程航班号:${requestScope.flightGo.flightCompany}${requestScope.flightGo.flightNumber}<br/>
                预计起飞时间${requestScope.flightdetailGo.fdDate}&nbsp;${requestScope.flightGo.flightDTime}<br/>
                预计达到时间${requestScope.flightdetailGo.fdDate}&nbsp;${requestScope.flightGo.flightATime}<br/>
                回程航班号:${requestScope.flightRe.flightCompany}${requestScope.flightRe.flightNumber}<br/>
                预计起飞时间${requestScope.flightdetailRe.fdDate}&nbsp;${requestScope.flightRe.flightDTime}<br/>
                预计达到时间${requestScope.flightdetailRe.fdDate}&nbsp;${requestScope.flightRe.flightATime}<br/>
            </c:if>

            <c:if test="${requestScope.type eq '2'}">
                去程火车车次：${requestScope.trainGo.trNumber}<br/>
                预计出发时间:${requestScope.traindetailGo.tdDate}&nbsp;${requestScope.trainGo.trDTime}<br/>
                预计到达时间:${requestScope.traindetailGo.tdDate}&nbsp;${requestScope.trainGo.trATime}<br/>
                回程火车车次：${requestScope.trainRe.trNumber}<br/>
                预计出发时间:${requestScope.traindetailRe.tdDate}&nbsp;${requestScope.trainRe.trDTime}<br/>
                预计到达时间:${requestScope.traindetailRe.tdDate}&nbsp;${requestScope.trainRe.trATime}<br/>
            </c:if>

            酒店名称:${requestScope.destinationArea.city}&nbsp${requestScope.hotel.hotelName}<br/>
            房间数:${requestScope.sRoom}间
        </div>

        <form action="comfirmUserInfo.do" method="post">
            <input type="hidden" name="tourId" value="${requestScope.tour.tourId}">
            <input type="hidden" name="total" value="${requestScope.total}">
            <input type="submit" value="下一步">
        </form>

    </div>
</div>


</body>
</html>
