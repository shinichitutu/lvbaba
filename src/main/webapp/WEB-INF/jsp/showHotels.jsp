<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shinichi
  Date: 2020/10/23
  Time: 14:23
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
    <script type="text/javascript" src="../../js/jquery-3.1.0.js"></script>

    <script>
        $(function () {
            $("#btn").click(function () {
                var str1 = "<form action='addHotel.do' method='post'>"+
                    "酒店名称：<input type='text' name='hName'/><br/>"+
                    "酒店地址：<select id='country'><option value='0'>--请选择国家--</option></select><select id='city' name='areaId'><option value='0'>--请选择城市--</option></select><br/>"+
                    "酒店等级：<input type='number' name='hLevel' min='1' max='5'/><br/>"+
                    "<input type='submit' value='添加'/>"+
                    "</form>";
                $("#addHotel").html(str1);

            $.ajax({
                type:"post",
                url:"showCountry2.do",
                dataType:"json",
                success:function (obj) {
                    var str = "";
                    $.each(obj,function (index,item) {
                        str += " <option value='"+item.country+"'>"+item.country+"</option>";
                    });
                    $("#country").append(str);
                }
            });


            $("#country").change(function () {
                $("#city option:gt(0)").remove();
                var country = $(this).val();
                console.log(country);
    /*            if(country==''){
                    return;
                }*/

                $.ajax({
                    type:"post",
                    url:"showCity.do",
                    data:"country="+country,
                    dataType:"json",
                    success:function (obj) {
                        var str ="";
                        $.each(obj,function (index,item) {
                            console.log(item.areaId);
                            str += " <option value='"+item.areaId+"'>"+item.city+"</option>";
                        });

                        $("#city").append(str);

                    }
                })
            })

            })

        })
    </script>
</head>
<body>

<table>
    <thead>
    <tr>
        <th>序号</th>
        <th>酒店名称</th>
        <th>国家</th>
        <th>城市</th>
        <th>酒店等级</th>
        <th>查看客房</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>

    </thead>
    <tbody>
    <c:forEach items="${requestScope.hotelList}" var="hotel" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${hotel.hName}</td>
            <td>${hotel.area.country}</td>
            <td>${hotel.area.city}</td>
            <td>${hotel.hLevel}</td>
            <td><a href="showRooms.do?hId=${hotel.hId}">查看客房</a></td>
            <td>${hotel.hId}</td>
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<input type="button" id="btn" value="添加酒店" />

<div id = "addHotel">
</div>

<c:if test="${null != requestScope.error}">
    <span style="color: red">${requestScope.error}</span>
</c:if>

<c:if test="${null != requestScope.success}">
    <span style="color: red">${requestScope.success}</span>
</c:if>

</body>
</html>
