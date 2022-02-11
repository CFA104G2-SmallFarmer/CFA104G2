<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopOrderDetails.model.*"%>
<%@ page import="com.shopOrder.model.*"%>
<%@ page import="java.util.*"%>

<%
ShopOrderDetailsService shopOrderDetailsSvc = new ShopOrderDetailsService();
List<ShopOrderDetailsVO> list = shopOrderDetailsSvc.getPKAll(1);
pageContext.setAttribute("list", list);
%>

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
	color: rgb(7, 1, 1);
	border-radius: 50px;
	cursor: pointer;
}
</style>

</head>
<body id="order_main" style="overflow-x: hidden;">


	<div style="width: 900px; display: block; margin: auto;">

		<article class="ov">
			<!-- 這邊是開始 -->
			<h3 class="Tit">
				<i class="fa fa-pencil-square-o"></i> 訂單の明細
			</h3>
			<br>
			<table class="shoppTab">

				<tbody>
					<tr align="center">
						<td class="bgF3" align="left">商品名稱</td>
						<td width="80" align="left" class="bgF3">單價</td>
						<td width="50" class="bgF3">數量</td>
						<td width="50" class="bgF3" colspan="2">單位</td>
						<td width="50" class="bgF3">小計</td>
					</tr>

<!-- 		foreach取出資料	 -->
		<c:forEach var="shopOrderDetailsVO" items="${list}">
						<tr align="center">
							<td align="left"><a
								href="">${shopOrderDetailsVO.prod_id}</a>
							</td>
<!-- 							單價 -->
							<td align="left">${shopOrderDetailsVO.order_unit_price}</td>
<!-- 							數量 -->
							<td >${shopOrderDetailsVO.order_qty}</td>
<!-- 							單位 -->
							<td colspan="2">${shopOrderDetailsVO.prod_unit}</td>
<!-- 							單品小記 -->
							<td>${shopOrderDetailsVO.order_unit_amount }</td>
						</tr>
			</c:forEach>
			
						<tr align="center">
							<td colspan="5" align="right">運費</td>
							<td>$100</td>
						</tr>
						<tr align="center">
							<td colspan="5" align="right">總計</td>
							<td class="total_price">
<%-- 							${shopOrderVO.amount} --%>
							${shopOrderDetailsVO.order_id+100}
<%-- 								${shopOrderSvc.getOneOrder(shopOrderVO.order_id(1)).order_amount} --%>
							</td>
						</tr>
				</tbody>
			</table>
<!-- 			<button id="btn" class="gree">上一頁</button> -->
			<input type="button"name="back" class="gree" value="上一頁"onClick="javascript:history.back()">
			<!-- 這邊是結束 -->
</body>
</html>