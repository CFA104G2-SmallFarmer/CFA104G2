<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderVO" %>
<%@ page import="com.fMem.model.FMemVO" %>
<%
    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
    List<FarmTravelOrderVO> farmTravelOrderList = farmTravelOrderService.getAllFarmTravelOrderByFMem(((FMemVO)session.getAttribute("fMemVO")).getF_mem_id());
    pageContext.setAttribute("farmTravelOrderList",farmTravelOrderList);
%>
<html>
<head>
    <title>我的訂單</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">訂單編號</th>
        <th scope="col">農遊行程編號</th>
        <th scope="col">訂單日期</th>
        <th scope="col">報名人數</th>
        <th scope="col">訂單金額</th>
        <th scope="col">訂單狀態</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="farmTravelOrder" items="${farmTravelOrderList}">
        <tr>
            <th scope="row">${farmTravelOrder.order_ID}<br/></th>
            <td>${farmTravelOrder.farm_travel_ID}</td>
            <td>${farmTravelOrder.order_time}</td>
            <td>${farmTravelOrder.people_num}</td>
            <td>${farmTravelOrder.order_fee}</td>
            <td>
                <c:forEach var="farmTravelOrderState" items="${farmTravelOrderStatusByFMem}">
                    <c:if test="${farmTravelOrder.order_state == farmTravelOrderState.key}">
                        ${farmTravelOrderState.value}
                    </c:if>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script>
    $('.completed').click(function (){
        $.post(
            "<%=request.getContextPath()%>/farmTravelOrder.do",
            { action:'completed', order_ID: $(this).val()},
            ()=>{
                window.location.href="<%=request.getContextPath()%>/front-end/farmTravelOrder/listAllFarmTravelOrderByFMem.jsp"
            }
        )
    });
</script>
</body>
</html>