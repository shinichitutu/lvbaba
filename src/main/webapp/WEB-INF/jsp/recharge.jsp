<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2020/11/6
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>充值页面</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/amazeui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script src="../../js/jquery-3.1.0.js"></script>
    <base href="<%=basePath%>"/>
</head>
<body>
<div class="pay">
    <!--主内容开始编辑-->
    <div class="tr_recharge">
        <div class="tr_rechtext">
            <p class="te_retit"><img src="../../img/coin.png" alt="" />充值中心</p>
            <p>虚拟货币,仅供本网站使用</p>
        </div>
            <div class="tr_rechbox">
                <div class="tr_rechhead">
                    <img src="../../img/ys_head2.jpg" />
                    <p>充值帐号：
                        <a>${sessionScope.user.uUsername}</a>
                    </p>
                    <div class="tr_rechheadcion">
                        <img src="../../img/coin.png" alt="" />
                        <span>当前余额：<span>${sessionScope.user.balance}</span></span>
                    </div>
                </div>
                <div class="tr_rechnum">
                </div>
            </div>
            <div class="tr_paybox">
                <form action="recharge.do" class="am-form" id="doc-vld-msg">
                    <input type="number" name="balance" max="10000" min="1" step="1" placeholder="请输入充值金额">
                    <input type="submit" value="确认支付" class="tr_pay am-btn" />
                    <span>温馨提示:一旦充值,概不退还哦</span>
                </form>
                <p style="color: green">${success}</p>
                <p style="color: red">${error}</p>
            </div>

    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/amazeui.min.js"></script>
<script type="text/javascript" src="js/ui-choose.js"></script>

</body>
</html>
