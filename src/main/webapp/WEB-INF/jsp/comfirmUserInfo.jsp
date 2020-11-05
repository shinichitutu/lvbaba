<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/11/5
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>

    <title>Title</title>
    <base href="<%=basePath%>"/>
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

<div class="userDetails" style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p>
    <h2 style="display: inline-block;">旅客信息</h2><span id="addUser"><span
        style="color: black;font-size: 20px;">⊕</span> 新增旅客信息</span></p>
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

        </tr>
        </thead>
        <tbody>

        <c:if test="${empty requestScope.userinfoList}">
            <tr>
                <td colspan="8">暂时没有任何旅客信息</td>
            </tr>
        </c:if>

        <c:forEach items="${requestScope.userinfoList}" var="userInfo" varStatus="i">
            <tr>
                <td><input type="checkbox" value="${userInfo.uiId}"></td>
                <td>${i.count}</td>
                <td>${userInfo.person}</td>
                <td>身份证</td>
                <td>${userInfo.idcard}</td>
                <td>${userInfo.phone}</td>
                <td><span class="modify_UserInfo"
                          onclick="modifyUserInfo('${userInfo.uiId}','${userInfo.person}','${userInfo.idcard}','${userInfo.phone}')">编辑</span>
                </td>

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

<div style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p style="padding: 10px;background-color: #f6f3f1"> · 支付完成后，订单会立即确认。</p>

    <p style="text-align: right">
    <form action="#" method="post">
    总价<input type="text" name="total" value="${requestScope.total}">
    id<input type="text" name="tourId" value="${requestScope.tourId}">
        <input type="button" value="同意以下条款，去支付" class="payOrder">
    </form>
    </p>

</div>

<div style="margin-top: 20px;background-color: white;padding: 10px;border-radius: 10px;">
    <p style="text-indent: 2em">
        条款和合同
        为支持绿色环保，我同意接受电子合同并默认其合法有效性，如需签署纸质合同将另行致电携程旅行网客服。
        预订限制
        出于安全考虑，18岁以下未成年人需要至少一名成年旅客陪同
        此线路行程强度较大，请确保身体健康适宜旅游，如出行人中有70周岁(含)以上老人、须至少有1位18周岁—69周岁亲友陪同方可参团，敬请谅解
        此线路因服务能力有限，仅接受持有中国有效身份证件的客人预订（不含中国香港、中国澳门和中国台湾），敬请谅解
        本产品不可拼房。报价是按照2成人入住1间房计算的价格，请在页面中选择所需房间数或单人房差选项
        产品可尝试申请3人间或加床服务，如您需3成人入住1间房，在预订时备注，后续是否可以安排及相关费用以员工回复为准（温馨提示：当地酒店面积小，加床可能会引起您的不便，敬请谅解）
        如产品确认单中的条款约定与旅游合同主协议（示范文本）不一致的，以产品确认单中的约定为准
        预订说明
        请您在预订时务必提供准确、完整的信息（姓名、性别、证件号码、国籍、联系方式等），以免产生预订错误，影响出行。如因您提供信息错误而造成损失，由您自行承担
        产品说明
        为保障您和其他客人的安全，团队车辆使用前每日至少消毒1次；司机、导服、所有团队客人行程开始前需通过体温检测；司机、导服行中全程佩戴口罩；随车配备客用消毒用品及测温工具；行中团餐部分，实现分餐制，或为您提供公筷
        本产品最少成团人数1人，订单一经携程旅行网以书面形式确认后均默认发团，若因我司原因未发团，旅行社将按双方合同约定的违约条款予以赔付
        本线路在不影响您行程的情况下，部分行程段可能会与其他携程客人合并用车，共同游玩。如有入住其他不同酒店的客人，当地司导人员会根据团队实际情况安排接送事宜，敬请谅解
    </p>
</div>

</body>
</html>
