<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>驴爸爸主页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="js/time.js"></script>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
    <style>
        p{
            margin:0;padding:0;
        }
        #clock{
            font-family: 'Share Tech Mono', monospace;
            color: black;
            text-align: center;
            position: absolute;
            left: 50%;top: 10%;-webkit-transform: translate(-50%, -50%);
            color: black;
        }
        #clock .time{
            letter-spacing: 0.05em;
            font-size: 20px;
            padding: 5px 0;
        }
        #clock .date{
            letter-spacing:0.1em;
            font-size:15px;
        }
        #clock .text{
            letter-spacing: 0.1em;
            font-size:2px;
            padding:20px 0 0;
        }
    </style>
    <script>
        $(function () {
            //ajax请求国家列表
            $.ajax({
                type:"post",
                url:"showCountry.do",
                dataType:"json",
                success:function (obj) {
                    var str ="";
                    $.each(obj,function (index,item) {
                        str += "<option value='"+item.country+"'>"+item.country+"</option>";
                    })
                    $("#a_country").append(str);
                    $("#d_country").append(str);
                    $("#v_d_country").append(str);
                    $("#v_a_country").append(str);
                    $("#h_a_country").append(str);
                }
            })

            //出发地国家改变是获取对应城市信息
            $("#d_country,#v_d_country").change(function () {
                $("#d_city option:gt(0)").remove();
                $("#v_d_city option:gt(0)").remove();
                var country = $(this).val();
                var str = "";
                if (country!='0'){
                    $.ajax({
                        type:"post",
                        data:{country:country},
                        url:"showCity.do",
                        dataType:"json",
                        success:function (obj) {
                            $.each(obj,function (index,item) {

                                console.log(item.areaId)

                                str += "<option value='"+item.areaId+"'>"+item.city+"</option>";
                            })
                            $("#d_city").append(str);
                            $("#v_d_city").append(str);
                        }
                    })
                }
            })

            //目的地国家改变是获取对应城市信息
            $("#a_country,#h_a_country,#v_a_country").change(function () {
                $("#a_city option:gt(0)").remove();
                $("#v_a_city option:gt(0)").remove();
                $("#h_a_city option:gt(0)").remove();
                var country = $(this).val();
                var str = "";
                if (country!='0'){
                    $.ajax({
                        type:"post",
                        data:{country:country},
                        url:"showCity.do",
                        dataType:"json",
                        success:function (obj) {
                            $.each(obj,function (index,item) {

                                console.log(item,item)

                                str += "<option value='"+item.areaId+"'>"+item.city+"</option>";
                            })
                            $("#a_city").append(str);
                            $("#h_a_city").append(str);
                            $("#v_a_city").append(str);
                        }
                    })
                }
            })
        })
    </script>

</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <div id="clock">
        <p class="date">驴爸爸</p>
        <p class="time">{{ time }}</p>
        <p class="text">{{ date }}</p>
    </div>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark background" >
    <a class="navbar-brand" href="#" style="margin-left: 50px">驴爸爸旅行</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div   class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav" >
            <li class="nav-item" style="margin-left: 50px">
                <!--<a class="nav-link" href="#">首页</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="首页" style="background-color: orange">
                    首页
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!--<a class="nav-link" href="#">机票</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="国内机票  国际/港澳台机票" style="background-color: orange">
                    机票
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <!--<a class="nav-link" href="#">酒店</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="国内 港澳台  海外酒店" style="background-color: orange">
                    <a href="showHotels.do">酒店</a>
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <!--<a class="nav-link" href="#">签证</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="签证查询" style="background-color: orange">
                    签证
                </button>
            </li>
            <li class="nav-item" style="margin-left: 50px">
                <!--<a class="nav-link" href="#">度假</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="跟团游  自助游" style="background-color: orange">
                    度假
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!--<a class="nav-link" href="#">门票</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="门票查询" style="background-color: orange">
                    门票
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!-- <a class="nav-link" href="#">火车票</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="火车票查询" style="background-color: orange">
                    火车票
                </button>
            </li>
            <li class="nav-item" style="margin-left:50px">
                <!--<a class="nav-link" href="#">邮轮</a>-->
                <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="游轮查询" style="background-color: orange">
                    游轮
                </button>
            </li>
            <li class="nav-item" style="margin-left: 300px">
                <!--<a class="nav-link" href="#">邮轮</a>-->
                <button type="button" class="btn btn-secondary"
                        data-toggle="tooltip" data-placement="bottom" title="我的订单">
                    <a href="toLoginView.do">我的旅行订单</a>
                </button>
            </li>
        </ul>
    </div>
</nav >
<hr>

<div class="container" style="margin-top:30px">
    <div class="row">
        <div class="col-sm-4"  style="background-color: azure" >
            <div class="fakeimg" style="background-color: azure" >
                <div class="container">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#airTickets">产品</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#hotel">酒店</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#vacation">度假</a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content" style="background-color: white;border: solid black 1px;">
                        <div id="airTickets" class="container tab-pane active" style="font-size: 10px;width: 100%;text-align: center"><br>
                            <form action="searchProducts.do" method="post">
                                出发城市:<select id="d_country">
                                        <option value="0">--请选择--</option>
                                    </select>
                                    <select id="d_city" name="daId">
                                        <option value="0">--请选择--<</option>
                                    </select>
                                <br/>
                                到达城市:<select id="a_country">
                                        <option value="0">--请选择--</option>
                                    </select>
                                    <select id="a_city" name="arrAreaId">
                                        <option value="0">--请选择--<</option>
                                    </select>
                                    <br/>
                                <%--航程类型:<input type="radio" name="hang">单程<input type="radio" name="hang">返程<br/>
                                出发日期:<input type="datetime"><br/>
                                返回日期:<input type="datetime"><br/>--%>
                                <input type="submit" value="搜索产品" style="text-align: center">
                            </form>
                        </div>
                        <div id="hotel" class="container tab-pane fade" style="font-size: 10px;width: 100%"><br>
                            <form action="#" method="post">
                                目的地:<select id="h_a_country">
                                <option value="0">--请选择--</option>
                            </select>
                                <select id="h_a_city">
                                    <option value="0">--请选择--<</option>
                                </select>
                                <br/>
                                入住日期:<input type="datetime-local"><br>
                                退房日期:<input type="datetime-local"><br>
                                关键字:<input type="text" placeholder="酒店/商圈/地标"><br/>
                                <input type="submit" value="搜索机票">
                            </form></div>
                        <div id="vacation" class="container tab-pane fade" style="font-size: 10px;"><br>
                            <form action="searchProducts.do" method="post">
                                出发城市:<select id="v_d_country" name="daId">
                                <option value="0">--请选择--</option>
                            </select>
                                <select id="v_d_city">
                                    <option value="0">--请选择--<</option>
                                </select>
                                <br/>
                                到达城市:<select id="v_a_country" name="arrAreaId">
                                <option value="0">--请选择--</option>
                            </select>
                                <select id="v_a_city">
                                    <option value="0">--请选择--<</option>
                                </select>
                                <br/>
                                <input type="submit" value="搜索城市"><br/><br/><br/><br/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div id="demo" class="carousel slide" data-ride="carousel">
                <!-- 指示符 -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                <!-- 轮播图片 -->
                <div class="carousel-inner fakeimg">
                    <div class="carousel-item active">
                        <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
                    </div>
                    <div class="carousel-item">
                        <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
                    </div>
                    <div class="carousel-item">
                        <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
                    </div>
                </div>
                <!-- 左右切换按钮 -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>
    </div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<a href="#go_top">返回顶层</a>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<script>
    var clock = new Vue({
        el: '#clock',
        data: {
            time: '',
            date: ''
        }
    });
    var week = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    var timerID = setInterval(updateTime, 1000);
    updateTime();
    function updateTime() {
        var cd = new Date();
        clock.time = zeroPadding(cd.getHours(), 2) + ':' + zeroPadding(cd.getMinutes(), 2) + ':' + zeroPadding(cd.getSeconds(), 2);
        clock.date = zeroPadding(cd.getFullYear(), 4) + '-' + zeroPadding(cd.getMonth()+1, 2) + '-' + zeroPadding(cd.getDate(), 2) + ' ' + week[cd.getDay()];
    };
    function zeroPadding(num, digit) {
        var zero = '';
        for(var i = 0; i < digit; i++) {
            zero += '0';
        }
        return (zero + num).slice(-digit);
    }
</script>
<a href="/home.do">测试</a>
</body>
</html>
