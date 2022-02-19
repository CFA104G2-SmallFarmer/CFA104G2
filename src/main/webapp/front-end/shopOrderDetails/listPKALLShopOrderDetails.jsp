<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopOrderDetails.model.*"%>
<%@ page import="com.shopOrder.model.*"%>
<%@ page import="java.util.*"%>

<%
ShopOrderDetailsService shopOrderDetailsSvc = new ShopOrderDetailsService();
Integer order_id = Integer.valueOf(request.getParameter("order_id"));
List<ShopOrderDetailsVO> list = shopOrderDetailsSvc.getPKAll(order_id);
pageContext.setAttribute("list", list);
%>
<% %>
<%-- <%ShopOrderService shopOrderSvc = new ShopOrderService(); --%>
<%--  shopOrderVO = shopOrderSvc.getOneShopOrder(1);%> --%>

<%
ShopOrderDetailsVO shopOrderDetailsVO = (ShopOrderDetailsVO) request.getAttribute("shopOrderDetailsVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<%
ShopOrderVO shopOrderVO = (ShopOrderVO) request.getAttribute("shopOrderVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<!-- JOIN -->
<jsp:useBean id="shopOrderSvc" scope="page" class="com.shopOrder.model.ShopOrderService" />
<jsp:useBean id="shopProductSvc" scope="page" class="com.shopProduct.model.ShopProductService" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>特定編號訂單明細</title>

<link href="./ShopOrderDetails_files/style.css" rel="stylesheet"
	type="text/css">

<style>
.total_price {
	font-size: 22px;
	color: red;
}

.gree {
	border: 10;
	background-color: rgb(97, 136, 124);
	color: #eff8ec;
	border-radius: 50px;
	cursor: pointer;
}
.ship {
	font-size: 18px;
	color: red;
}
</style>

</head>
<body id="order_main" style="overflow-x: hidden;">
<jsp:include page="/front-end/home/header.jsp" flush="true"/>

	<div style="width: 900px; display: block; margin: auto;">

		<article class="ov">
			<!-- 這邊是開始 -->
			<h3 class="Tit">
				<img src="<%=request.getContextPath()%>/front-end/shopOrderDetails/images/order.png " width="50" height="50">
				<i class="fa fa-pencil-square-o"></i> <font size="4" >訂單明細</font>
			</h3>
			<br>
			<table class="shoppTab">

				<tbody>
					<tr align="center">
						<td class="bgF3" align="left">商品名稱</td>
						<td class="bgF3" align="left">商品圖片</td>
						<td width="80" align="left" class="bgF3">單價</td>
						<td width="50" class="bgF3"colspan="2">數量</td>
						<td width="50" class="bgF3" colspan="2">單位</td>
						<td width="50" class="bgF3" colspan="2">小計</td>
					</tr>
<c:set value="0" var="sum"/>

<!-- 		foreach取出資料	 -->
		<c:forEach var="shopOrderDetailsVO" items="${list}">
						<tr align="center">
							<td align="left"><a
								href="">
<%-- 								${shopOrderDetailsVO.prod_id} --%>
								${shopProductSvc.getOneProduct(shopOrderDetailsVO.prod_id).prod_name}
								</a>
							</td>
<!-- 							圖片 -->
							<td align="left">${shopOrderDetailsVO.order_unit_price}</td>
<!-- 							單價 -->
							<td align="left">${shopOrderDetailsVO.order_unit_price}</td>
<!-- 							數量 -->
							<td >${shopOrderDetailsVO.order_qty}</td>
<!-- 							單位 -->
							<td colspan="2">${shopOrderDetailsVO.prod_unit}</td>
<!-- 							單品小記 -->
							<td colspan="2">
							${shopOrderDetailsVO.order_unit_amount}
							<c:set value="${sum+shopOrderDetailsVO.order_unit_amount}" var="sum"/>     
							</td>
<%-- 						${sum} --%>
						</tr>
			</c:forEach>
						<tr align="center">
							<td colspan="7" align="right">運費</td>
							<td class="ship">Free</td>
						</tr>
						<tr align="center">
							<td colspan="7" align="right">總計</td>
							<td class="total_price">${sum}
							</td>
						</tr>
				</tbody>
			</table>
<!-- 			<button id="btn" class="gree">上一頁</button> -->
			<div  style="margin: auto 420px;">
			<input  type="button"name="back" class="gree" value="上一頁"onClick="javascript:history.back()">
			</div>
			<!-- 這邊是結束 -->
</body>
			<jsp:include page="/front-end/home/footer.jsp" flush="true"/>
</html>