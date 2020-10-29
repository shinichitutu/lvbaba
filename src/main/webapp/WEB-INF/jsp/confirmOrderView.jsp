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
</head>
<body style="margin:0 auto;">
<div style="width: 1200px;">
    旅游提醒：可接待体温正常、持有健康码绿码、未途经或来自国内疫情中、高风险地区的境内人员。 若您持有非绿码、来自或途经国内疫情中、高风险地区、或是港澳台/外籍人员，请务必详细了解当地疫情相关规定，合理安排出行。
</div>
<div style="width: 1200px;">
    <div class="tourInfo">
        乌镇+杭州2日1晚跟团游(5钻)
        船游西湖·深度纯玩·【一整天360打卡网红乌镇日夜景】拒绝走马观花+【泛舟西湖赏美景】A线住乌镇景区内5钻酒店+可免费使用景区内电瓶车+健身房，B线入住乌镇旗下特色客栈+多次入园+赠晚餐
        B线-宿5钻子夜大酒店上海出发2020年10月31日(星期六)-2020年11月1日(星期日)3成人房间数：3
    </div>
    <div class="orderDetail">
        <p><h3 style="display: inline">明细</h3><span>以下为您所选择的全部资源明细，下单前请仔细查看核实。</span></p>
        <br/>
        <br/>
        <br/>
    </div>
    <div class="userDetails">
        <p><h3 style="display: inline">旅客信息</h3></p>
        <br/>
        <br/>
        <br/>
    </div>
</div>
</body>
</html>
