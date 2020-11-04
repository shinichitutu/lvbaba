<%--
  Created by IntelliJ IDEA.
  User: 49903
  Date: 2020/11/3
  Time: 10:06
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
    <title>机票预订</title>
    <meta charset="utf-8"/>
    <script src="js/jquery-3.1.0.js"></script>
    <style>
        .searchResult div{
            display: inline-block;
            text-align: center;
        }
        .searchResult{
            width: 1000px;
            height: 120px;
        }
    </style>
    <script>
        $(function () {
            $.ajax({
                type:"post",
                url:"showCountry.do",
                dataType:"json",
                success:function (data) {
                    var str  = "";
                    $.each(data,function (k,v) {
                        str+="<option value='"+v.country+"'>"+v.country+"</option>";
                    })
                    $("[name='d_country']").append(str);
                    $("[name='a_country']").append(str);
                }
            })

            $("[name='d_country']").change(function () {
                $("[name='d_city'] option:gt(0)").remove();
                var country = $("[name='d_country'] option:selected").val();
                $.ajax({
                    type: "post",
                    data:{country:country},
                    url:"showCity.do",
                    dataType: "json",
                    success:function (data) {
                        var str  = "";
                        $.each(data,function (k,v) {
                            str+="<option value='"+v.areaId+"'>"+v.city+"</option>";
                        })
                        $("[name='d_city']").append(str);
                    }
                })
            })

            $("[name='a_country']").change(function () {
                $("[name='a_city'] option:gt(0)").remove();
                var country = $("[name='a_country'] option:selected").val();
                $.ajax({
                    type: "post",
                    data:{country:country},
                    url:"showCity.do",
                    dataType: "json",
                    success:function (data) {
                        var str  = "";
                        $.each(data,function (k,v) {
                            str+="<option value='"+v.areaId+"'>"+v.city+"</option>";
                        })
                        $("[name='a_city']").append(str);
                    }
                })
            })
        })
        function bookeTickets(obj,flightName,flightCanpany,d_country,d_city,a_country,a_city,date,d_time,a_time,flightPrice) {
            $.ajax({
                type:"post",
                data:{flightName:flightName,flightCanpany:flightCanpany, d_country:d_country,d_city:d_city,
                    a_country:a_country,a_city:a_city,date:date,d_time:d_time,a_time:a_time,flightPrice:flightPrice},
                url:"toTicketOrderView.do",
                dataType:"text",
                success:function (obj) {
                    if (null!=obj && obj!=''){
                        alert(obj);
                    }
                }
            })
        }
    </script>
</head>
<body style="width: 1000px;margin: 30px auto 0 auto;background-color:#eef1f1">
    <form action="searchFlightInfo.do" method="post">
        出发地：<select name="d_country">
            <option value="0">--请选择--</option>
        </select>
        <select name="d_city">
            <option value="0">--请选择--</option>
        </select>
        目的地：<select name="a_country">
            <option value="0">--请选择--</option>
        </select>
        <select name="a_city">
            <option value="0">--请选择--</option>
        </select>
        出发日期：<input type="date" name="date"/>
        <input type="submit" value="查询"/>
    </form>
<br/>
<div class="searchResult">
    <c:if test="${empty requestScope.flightDetailInfoList}"><p>暂时没有任何信息</p></c:if>
    <c:forEach items="${requestScope.flightDetailInfoList}" var="fd" varStatus="i">
    <div style="background-color: white;margin: 5px;width: 1000px;border-radius: 5px;">
       <div style="width: 200px;height: 110px;text-align: center;">
            <p><span>${fd.flight.flightNumber}</span></p>
            <p><span>${fd.flight.flightCompany}</span></p>
       </div>
       <div style="width: 540px;height: 110px;">
          <div style="width: 120px;height: 110px;">
              <p><span>${fd.flight.flightDTime}</span></p>
              <p><span>${fd.flight.d_area.country}-${fd.flight.d_area.city}</span</p>
          </div>
           <div style="width: 200px;height: 110px;text-align: center;line-height: 110px;">
                ============》
           </div>
           <div style="width: 120px;height: 110px;">
               <p><span>${fd.flight.flightATime}</span></p>
               <p><span>${fd.flight.a_area.country}-${fd.flight.a_area.city}</span></p>
           </div>
       </div>
       <div style="width: 200px;height: 110px;">
            <div>
                <p>￥<span style="color: firebrick;font-weight: bold;font-size: 30px;">${fd.flight.flightPrice}</span></p>
                <p>经济舱${fd.ratio}折</p>
            </div>
           <div style="margin: 0 auto;height: 110px;">
               <p class="remainVotes" style="color: red;">
                   <c:if test="${fd.fdTickets==0}">已售完</c:if>
                   <c:if test="${fd.fdTickets<=10}">仅剩${fd.fdTickets}</c:if>
               </p>
               <p><input type="submit" value="订票" style="width: 80px;font-size: 20px;height: 40px;border-radius: 15px;background-color: orange;color: white;font-weight: bold;"
               onclick="bookeTickets(this,'${fd.flight.flightNumber}','${fd.flight.flightCompany}','${fd.flight.d_area.country}','${fd.flight.d_area.city}',
                       '${fd.flight.a_area.country}','${fd.flight.a_area.city}','${fd.fdDate}','${fd.flight.flightDTime}','${fd.flight.flightATime}',
                       '${fd.flight.flightPrice}')"/></p>
           </div>
       </div>
    </div>
    </c:forEach>
</div>
</body>
</html>
