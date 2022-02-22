<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopOrderDetails.model.*"%>
<%@ page import="com.shopOrder.model.*"%>
<%@ page import="com.shopProduct.model.*"%>

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

<!-- 跑版 -->
<!-- <link href="./ShopOrderDetails_files/style.css" rel="stylesheet"type="text/css"> -->
<!-- 跑版 -->

<!-- bookstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- bookstrap -->

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
<!-- bookstrap -->
   @import url('https://fonts.googleapis.com/css?family=Assistant');

body {
    background: #eee;
    font-family: Assistant, sans-serif
}

.cell-1 {
    border-collapse: separate;
    border-spacing: 0 4em;
    background: #fff;
    border-bottom: 5px solid transparent;
    background-clip: padding-box
}

thead {
    background: #dddcdc
}

<!-- bookstrap -->
</style>
<%-- <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp" /> --%>
<%-- <jsp:include page="/front-end/home/header2/header2.jsp" /> --%>
<jsp:include page="/front-end/home/header.jsp" flush="true"/>
<%-- <iframe src="<%= request.getContextPath() %>/front-end/home/header.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
</head>

<body id="order_main" style="overflow-x: hidden;">

	<div style="width: 900px; display: block; margin: auto;">

<!-- 		<article class="ov"> -->
<!-- 		</article> -->
			<!-- 這邊是開始 -->
			<h3 class="Tit">
				<img src="<%=request.getContextPath()%>/front-end/shopOrderDetails/images/order.png " width="50" height="50">
				<i class="fa fa-pencil-square-o"></i> <font size="4" >訂單明細</font>
			</h3>
			<br>
			<table class="shoppTab">

				<tbody>
					<tr align="center">
						<td class="bgF3" align="left">商品圖片</td>
						<td class="bgF3" align="left">商品名稱</td>
						<td width="80" align="left" class="bgF3">單價</td>
						<td width="50" class="bgF3"colspan="2">數量</td>
						<td width="50" class="bgF3" colspan="2">單位</td>
						<td width="50" class="bgF3" colspan="2">小計</td>
					</tr>
<c:set value="0" var="sum"/>

<!-- 		foreach取出資料	 -->
		<c:forEach var="shopOrderDetailsVO" items="${list}">
						<tr align="center">
<!-- 							圖片 -->
							<td align="left">
							 <img src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopOrderDetailsVO.prod_id}" alt="" width="100" height="100">
							</td>
<!-- 							名稱 -->
							<td align="left">
<%-- 							<a href="<%=request.getContextPath()%>/front-end/Product/product.do?prod_id=${shopProductVO.prod_id}&action=getOne_list_For_DisplayByMem"> --%>
							<a href="<%=request.getContextPath()%>/front-end/Product/product.do?prod_id=${shopOrderDetailsVO.prod_id}&action=getOne_list_For_DisplayByMem">
<%-- 								${shopOrderDetailsVO.prod_id} --%>
								${shopProductSvc.getOneProduct(shopOrderDetailsVO.prod_id).prod_name}
								</a>
							</td>
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
			</div>
			<!-- 這邊是結束 -->

<br>
</body>
<footer>
			<jsp:include page="/front-end/home/footer.jsp" flush="true"/>
<%-- 			<iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
</footer>
</html>