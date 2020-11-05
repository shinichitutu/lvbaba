<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/3
  Time: 16:54
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
    <title>机票支付</title>
    <meta charset="utf-8"/>
    <script src="js/jquery-3.1.0.js"></script>
    <style>
        .searchResult div{
            display: inline-block;
            text-align: center;
        }
        .searchResult{
            width: 1000px;
            height: 175px;
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
        table {
            width: 800px;
            border-top: 1px solid #aaaaaa;
        }

        th,td {
            border-bottom: 1px solid #c1b0b0;
            text-align: center;
            padding: 10px 0;
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
                            // location.href="toTicketOrderView.do";
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

                          /*  location.href="toTicketOrderView.do"*/
                          window.location.reload();

                        }
                    }
                })
            })

            $("#addUser").click(function () {
                $("#updateUserInfo").css("display", "none");
                $(".add_UserInfo").css("display", "block");
            })

            $(".payFlightMoney").click(function () {
                var str ="";
                $(".choiseUser:checked").each(function () {
                    str +=$(this).val()+","
                })
                var userIds = "<input type='hidden' name='userIds' value='"+str+"'/>";
                $(".payFlightMoney").prepend(userIds)
                $("#hiddenForm").submit();
            })
        })
    </script>
</head>
<body style="width: 1000px;margin: 30px auto 0 auto;background-color:#f1f1f6">
<div class="searchResult">
    <div style="background-color: white;margin: 5px 0;width: 1000px;border-radius: 5px;">
        <div style="width: 200px;height: 110px;text-align: center;">
            <p><span>${sessionScope.ticketrecord.flightName}</span></p>
            <p><span>${sessionScope.ticketrecord.flightCanpany}</span></p>
        </div>
        <div style="width: 540px;height: 110px;">
            <div style="width: 120px;height: 110px;">
                <p><span>${sessionScope.ticketrecord.departureTime}</span></p>
                <p><span>${sessionScope.ticketrecord.departureArea}</span</p>
            </div>
            <div style="width: 200px;height: 110px;text-align: center;line-height: 110px;">
                ============》
            </div>
            <div style="width: 120px;height: 110px;">
                <p><span>${sessionScope.ticketrecord.arrivalTime}</span></p>
                <p><span>${sessionScope.ticketrecord.destinationArea}</span></p>
            </div>
        </div>
        <div style="width: 200px;height: 110px;">
            <div style="text-align: center">
                <p>￥<span style="color: firebrick;font-weight: bold;font-size: 30px;">${sessionScope.ticketrecord.flightPrice}</span></p>
            </div>
        </div>
    </div>
</div>
<div class="userDetails" style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p>
    <h2 style="display: inline-block;">旅客信息</h2><span id="addUser"><span style="color: black;font-size: 20px;">⊕</span> 新增旅客信息</span></p>
    <table>
        <thead>
        <tr>
            <th>选择</th>
            <th>序号</th>
            <th>姓名</th>
            <th>证件类型</th>
            <th>证件号码</th>
            <th>联系电话</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty requestScope.userinfos}">
            <tr>
                <td colspan="8">暂时没有任何旅客信息</td>
            </tr>
        </c:if>
        <c:forEach items="${requestScope.userinfos}" var="userInfo" varStatus="i">
            <tr>
                <td><input type="checkbox" class="choiseUser" value="${userInfo.uiId}"></td>
                <td>${i.count}</td>
                <td>${userInfo.person}</td>
                <td>身份证</td>
                <td>${userInfo.idcard}</td>
                <td>${userInfo.phone}</td>
                <td><span class="modify_UserInfo"
                          onclick="modifyUserInfo('${userInfo.uiId}','${userInfo.person}','${userInfo.idcard}','${userInfo.phone}')">编辑</span>
                </td>
                <td><a href="#">删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/>
    <div id="updateUserInfo"></div>
    <div class="add_UserInfo" style="display: none;">
        <p>旅客姓名：<input type="text" name="person"/></p>
        <p>身份证号码：<input type="text" name="idcard"/></p>
        <p>联系电话：<input type="text" name="phone"/></p>
        <p><input type="button" class="addUserInfo" value="新增"/></p>
    </div>
</div>
<div>
    <form id="hiddenForm" action="payFlightTicket.do" method="post">
        <input type="hidden" name="flightName" value="${sessionScope.ticketrecord.flightName}"/>
        <input type="hidden" name="flightCanpany" value="${sessionScope.ticketrecord.flightCanpany}"/>
        <input type="hidden" name="departureArea" value="${sessionScope.ticketrecord.departureArea}"/>
        <input type="hidden" name="destinationArea" value="${sessionScope.ticketrecord.destinationArea}"/>
        <input type="hidden" name="departureTime" value="${sessionScope.ticketrecord.departureTime}"/>
        <input type="hidden" name="arrivalTime" value="${sessionScope.ticketrecord.arrivalTime}"/>
        <input type="hidden" name="flightPrice" value="${sessionScope.ticketrecord.flightPrice}"/>
        <input type="hidden" name="fdId" value="${sessionScope.ticketrecord.fdId}"/>
        <input type="button" class="payFlightMoney" value="支付" style="width: 120px;height: 60px;"/>
    </form>
</div>
</body>
</html>
