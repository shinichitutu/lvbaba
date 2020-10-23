<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/9/29
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Bootstrap 实例</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            //根据后端传递的跳转参数判断当前应该显示什么

            // 判断用户名是否可以使用
            var flag_name = false;
            // 判断mm1的状态
            var flag_mm1 = false;
            // 判断mm2的状态
            var flag_mm2 = false;
            // // 当进来的时候设置我们的注册界面是隐藏的
            // $("#register").css("display", "none")

            // 当我们跳转到注册界面时，我们的注册按钮是不能点击的
            $("#register_btn").attr("disabled", "disabled");

            // 通过不同点击事件，切换我们登录及注册界面
            $(".click_register").click(function () {
                $(this).css("color","red");
                $(".click_login").css("color","");
                console.log($("#register").css("display"));
                if ($("#register").css("display") == "none") {
                    $("#register").css("display", "block");
                    $("#login").css("display", "none");
                }
            })

            $(".click_login").click(function () {
                $(this).css("color","red");
                $(".click_register").css("color","");
                console.log($("#login").css("display"));
                if ($("#login").css("display") == "none") {
                    $("#login").css("display", "block");
                    $("#register").css("display", "none");
                }
            })

            // 当我们用户名输入完成之后，失焦事件触发，判断当前用户名是否重复可用
            $("#username_register").blur(function () {
                var reg = /^[a-zA-Z].{5,17}$/;
                var username = $(this).val();
                console.log(username);
                if (null == username) {
                    $(this).css("border", "1px solid red");
                    alert("账号不能为空");
                } else if (reg.test(username) == false) {
                    $(this).css("border", "1px solid red");
                    $(".showUserNameInfo").html("密码的长度为6-18为，不能以数字开头，不能重复");
                    $(".showUserNameInfo").css("color", "red")
                } else {
                    $(this).css("border", "");
                    $.ajax({
                        type: "post",
                        data: "username=" + username,
                        url: "testUserName.do",
                        dataType: "text",
                        success: function (obj) {
                            if ("true" == obj) {
                                $(".showUserNameInfo").html("可以使用");
                                $(".showUserNameInfo").css("color", "green")
                                flag_name = true;
                            } else {
                                $("#username_register").css("border", "1px solid red");
                                $(".showUserNameInfo").html("名字重复");
                                $(".showUserNameInfo").css("color", "red")
                            }
                        }
                    })
                }
                testSubmit(flag_name, flag_mm1, flag_mm2);
            })

            // 密码输入框失焦之后判断其输入的格式
            $("#pwd_register1").blur(function () {
                var reg = /^.{6,20}$/;
                var mm = $(this).val();
                if (null == mm) {
                    $(this).css("border", "1px solid red");
                    alert("密码不能为空");
                } else if (reg.test(mm) == false) {
                    $(this).css("border", "1px solid red");
                    $(".showPasswordInfo").html("密码的长度为6-18为，不能以数字开头，不能重复");
                    $(".showPasswordInfo").css("color", "red")
                } else {
                    $(this).css("border", "");
                    $(".showPasswordInfo").html("");
                    flag_mm1 = true;
                }
                testSubmit(flag_name, flag_mm1, flag_mm2);
            })

            // 再次确认密码输入框失焦之后判断其输入的格式以及与上一次的密码是否一样
            $("#pwd_register2").blur(function () {
                var mm = $(this).val();
                if (null == mm) {
                    $(this).css("border", "1px solid red");
                    alert("密码不能为空");
                } else if (mm != $("#pwd_register1").val()) {
                    $(this).css("border", "1px solid red");
                    $(".showAgainPasswordInfo").html("两次密码不相同");
                    $(".showAgainPasswordInfo").css("color", "red")
                } else {
                    $(this).css("border", "");
                    $(".showAgainPasswordInfo").html("");
                    flag_mm2 = true;
                }
                testSubmit(flag_name, flag_mm1, flag_mm2);
            })

            //当信息填完整之后，我们进行注册
            $("#register_btn").click(function () {
                var name = $("#nc_register").val();
                var userName = $("#username_register").val();
                var password = $("#pwd_register1").val();
                $.ajax({
                    type: "post",
                    data: "name=" + name + "&username=" + userName + "&password=" + password,
                    url: "register.do",
                    dataType: "text",
                    success: function (obj) {
                        if ("true" == obj) {
                            alert("注册成功")
                            $("#register").css("display", "none");
                            $("#login").css("display", "block");
                            location.href = "#login";
                        } else {
                            alert("注册失败")
                        }
                    }
                })
            })

            //判断登录用户名和密码不为空
            // 登录界面用户名的状态
            var flag_login_name=false;
            // 登录界面密码的状态
            var flag_login_pwd=false;
            // 设置登录按钮不可点击

            // $("#login_btn").attr("disabled","disabled");
            // 判断用户名是否为空

            $("#name_login").blur(function () {
                var userName = $(this).val();
                if (null==userName){
                    $(this).css({"border":"1px solid red"});
                    alert("用户名不能为空");
                }else{
                    $(this).css({"border":""});
                    flag_login_name=true;
                }
                // cancelLoginBtn(flag_login_name,flag_login_pwd);
            })

            // 判断密码是否为空
            $("#pwd_login").blur(function () {
                var pwd = $(this).val();
                if (null==pwd){
                    $(this).css({"border":"1px solid red"});
                    alert("密码不能为空");
                }else{
                    $(this).css({"border":""});
                    flag_login_pwd=true;
                }
                // cancelLoginBtn(flag_login_name,flag_login_pwd);
            })

            // 登录按钮触发事件
            $("#login_btn").click(function () {
                var name = $("#name_login").val();
                var pwd = $("#pwd_login").val();
                var check =$("#remember").val();
                $.ajax({
                    type:"post",
                    data:"uUsername="+name+"&uPassword="+pwd,
                    url:"login.do",
                    dataType:"text",
                    success:function (obj) {
                        if ("false"==obj){
                            alert("账号或密码有误，请重新登录");
                        }else if("true"==obj){
                            location.href="toIndex.do";
                        }else{
                            location.href="index.jsp";
                        }
                    }
                })
            })

            //取消注册按钮不能点击的方法
            function testSubmit(flag_name, flag_mm1, flag_mm2) {
                if (flag_name && flag_mm1 && flag_mm2) {
                    $("#register_btn").removeAttr("disabled");
                }
            }

            // //取消登录按钮不能点击的方法
            // function cancelLoginBtn(flag_login_name, flag_login_pwd) {
            //     if (flag_login_name && flag_login_pwd) {
            //         $("#login_btn").removeAttr("disabled");
            //     }
            // }

        })
    </script>

</head>
<body style="width: 85%;margin: 100px auto" background="img/denglu.jpg">

<div class="container">
    <h2 style="text-align: center">
        <a style="margin-right: 20px;cursor: pointer" href="#login" class="click_login">登录</a>
        <a style="cursor: pointer" href="#register" class="click_register">注册</a>
    </h2>
    <%--    登录样式表单--%>
    <form action="login.do" method="post" id="login">
        <div class="form-group">
            <label for="name_login">用户名:</label>
            <input type="text" name="name" class="form-control" id="name_login" placeholder="请输入账号">
        </div>
        <div class="form-group">
            <label for="pwd_login">密码:</label>
            <input type="password" name="password" class="form-control" id="pwd_login" placeholder="请输入密码">
        </div>
        <div class="form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" value="true" id="remember"> 记住密码
            </label>
        </div>
        <button type="button" class="btn btn-primary" id="login_btn">登录</button>
    </form>
    <div>${requestScope.loginError}</div>
    <%--注册界面表单--%>
    <form action="register.do" method="post" id="register">
        <div class="form-group">
            <label for="nc_register">昵称:</label>
            <input type="text" name="name" class="form-control" id="nc_register" placeholder="请输入昵称">
        </div>
        <div class="form-group">
            <label for="username_register">用户名:</label>
            <input type="text" name="username" class="form-control" id="username_register"
                   placeholder="请输入账号,账号是唯一不能重复的">
            <span class="showUserNameInfo"></span>
        </div>
        <div class="form-group">
            <label for="pwd_register1">密码:</label>
            <input type="password" name="password" class="form-control" id="pwd_register1" placeholder="请输入密码">
            <span class="showPasswordInfo"></span>
        </div>
        <div class="form-group">
            <label for="pwd_register2">确认密码:</label>
            <input type="password" name="password" class="form-control" id="pwd_register2" placeholder="请输入密码">
            <span class="showAgainPasswordInfo"></span>
        </div>
        <button type="button" class="btn btn-primary" id="register_btn">注册</button>
    </form>
</div>

</body>
</html>
