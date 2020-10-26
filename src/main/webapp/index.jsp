<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>驴爸爸主页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
</head>
<body style="background-color: azure" >

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1 id="go_top">驴爸爸</h1>
    <p></p>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
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
</nav>

<a href="showHotels.do">查看酒店</a><br/>

<a href="addTransportView.do">新增交通工具</a><br/>

<a href="showFlightAndTrain.do">新增交通工具</a><br/>


<div class="container" style="margin-top:30px">
    <div class="row">
        <div class="col-sm-4"  style="background-color: azure" >
            <div class="fakeimg" style="background-color: azure" >
                <div class="container">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#home">机票</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu1">酒店</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu2">度假</a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content" style="background-color: white;border: solid black 1px;">
                        <div id="home" class="container tab-pane active" style="font-size: 10px;width: 100%"><br>
                            <form action="#" method="post">
                                出发城市:<input type="text" placeholder="北京"><br/>
                                到达城市:<input type="text" placeholder="城市名"><br>
                                航程类型:<input type="radio" name="hang">单程<input type="radio" name="hang">返程<br/>
                                出发日期:<input type="datetime"><br/>
                                返回日期:<input type="datetime"><br/>
                                <input type="submit" value="搜索机票">
                            </form>
                        </div>
                        <div id="menu1" class="container tab-pane fade" style="font-size: 10px;width: 100%"><br>
                            <form action="#" method="post">
                                目的地:<input type="text" placeholder="北京"><br>
                                入住日期:<input type="datetime-local"><br>
                                退房日期:<input type="datetime-local"><br>
                                关键字:<input type="text" placeholder="酒店/商圈/地标"><br/>
                                <input type="submit" value="搜索机票">
                            </form></div>
                        <div id="menu2" class="container tab-pane fade" style="font-size: 10px;"><br>
                            <form>
                                出发城市:<input type="text"><br/>
                                目的地:<input type="text"><br/>
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
</body>
</html>
