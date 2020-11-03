<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/11/2
  Time: 16:19
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
    <script src="../../js/jquery-3.1.0.js"></script>
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

                    $("#h_a_country").append(str);
                }
            });

            //目的地国家改变是获取对应城市信息
            $("#h_a_country").change(function () {
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
                            });
                            $("#h_a_city").append(str);
                        }
                    })
                }
            })
        })
    </script>

</head>
<body>

<div id="hotel" class="container tab-pane fade" style="font-size: 10px;width: 100%"><br>
    <form action="#" method="post">
        目的地:<select id="h_a_country" name="country">
        <option value="0">--请选择--</option>
    </select>
        <select id="h_a_city" name="city">
            <option value="0">--请选择--<</option>
        </select>
        <br/>
        入住日期:<input type="date" name="date1"><br/>
        退房日期:<input type="date" name="date2"><br/>
        房间数：<input type="number" name="number"><br/>
        <input type="submit" value="搜索酒店">
    </form>
</div>

</body>
</html>
