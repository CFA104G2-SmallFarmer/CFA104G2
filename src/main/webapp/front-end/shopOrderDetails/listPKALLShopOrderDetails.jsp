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
<%

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
<jsp:useBean id="shopOrderSvc" scope="page"
	class="com.shopOrder.model.ShopOrderService" />
<jsp:useBean id="shopProductSvc" scope="page"
	class="com.shopProduct.model.ShopProductService" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>特定編號訂單明細</title>

<!-- 跑版 -->
<!-- <link href="./ShopOrderDetails_files/style.css" rel="stylesheet"type="text/css"> -->
<!-- 跑版 -->

<!-- bookstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- bookstrap -->

<style>
.total_price {
	font-size: 28px;
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
	font-size: 28px;
	color: red;
}


/* bookstrap */

@import url('https://fonts.googleapis.com/css?family=Assistant');

body {
	background: #eee;
	font-family: Assistant, sans-serif
}

.cell-1 {
	border-collapse: separate;
	border-spacing: 0 4em;
	background: #fff;
	border-bottom: 50px solid transparent;
	background-clip: padding-box
}

thead {
	background: #b9d4b3
}

/* bookstrap */
.color-btn{
  /**定義一串顏色，8個顏色，1|2號顏色和最後的7|8號顏色要相同，才能銜接上，看不出迴圈間斷*/
  background: linear-gradient(to right, #5adeff, #2ff598, #FFE419, #A2FF00, #31FFEE, #297BFF, #DC5AFF, #7D4DFF);
  /**動畫的寬度，8個顏色，寬度就是8-1=7*100%，最後一個顏色用來迴圈迴歸的。*/
  background-size: 700% 100%;
  /**動畫使用，線性移動，速率20秒*/
  animation: mymove 20s linear infinite;
  /**適配不同瀏覽器*/
  -webkit-animation: mymove 20s linear infinite;
  -moz-animation: mymove 20s linear infinite;
}
/**定義過度動畫*/
@-webkit-keyframes mymove {
        0% {background-position: 0% 0%;}
        100% {background-position: 100% 0%;}
}
 



</style>
<%-- <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp" /> --%>
<%-- <jsp:include page="/front-end/home/header2/header2.jsp" /> --%>
<jsp:include page="/front-end/home/header.jsp" flush="true" />
<%-- <iframe src="<%= request.getContextPath() %>/front-end/home/header.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
</head>

<body>
	<div class="container mt-5">
		<div class="d-flex justify-content-center row">
			<div class="col-md-10" style="border: 5px gree solid; border-radius:50px;box-shadow:3px 3px 5px 6px #cccccc;">
				<h3 class="Tit">
					<img
						src="<%=request.getContextPath()%>/front-end/shopOrderDetails/images/order1.png "
						width="50" height="50"><font size="4">訂單明細</font>
				</h3>
				<br>
				<div class="rounded">
					<div class="table-responsive table-borderless">
						<!-- 這邊是開始 -->
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">pic</th>
									<th>商品名稱</th>
									<th>單價</th>
									<th>數量</th>
									<th>單位</th>
									<th>小記</th>
								</tr>
							</thead>
							<c:set value="0" var="sum" />

							<!-- 		foreach取出資料	 -->
							<c:forEach var="shopOrderDetailsVO" items="${list}">

								<tbody class="table-body">
									<tr class="cell-1">
										<!-- 							圖片 -->
										<td class="text-center"><img
											src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopOrderDetailsVO.prod_id}"
											alt="" width="100" height="100"></td>
										<!-- 							名稱 -->
										<td align="left">
											<%-- 							<a href="<%=request.getContextPath()%>/front-end/Product/product.do?prod_id=${shopProductVO.prod_id}&action=getOne_list_For_DisplayByMem"> --%>
											<a
											href="<%=request.getContextPath()%>/front-end/Product/product.do?prod_id=${shopOrderDetailsVO.prod_id}&action=getOne_list_For_DisplayByMem">
												<%-- 								${shopOrderDetailsVO.prod_id} --%>
												${shopProductSvc.getOneProduct(shopOrderDetailsVO.prod_id).prod_name}
										</a>
										</td>
										<!-- 							單價 -->
										<td align="left">${shopOrderDetailsVO.order_unit_price}</td>
										<!-- 							數量 -->
										<td>${shopOrderDetailsVO.order_qty}</td>
										<!-- 							單位 -->
										<td>${shopOrderDetailsVO.prod_unit}</td>
										<!-- 							單品小記 -->
										<td>${shopOrderDetailsVO.order_unit_amount}<c:set
												value="${sum+shopOrderDetailsVO.order_unit_amount}"
												var="sum" /> <%-- 						${sum} --%>
									</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td>運費</td>
								<td class="ship">Free</td>
								<td>總計</td>
								<td class="total_price">${sum}</td>
							</tr>

							</tbody>


						</table>
					</div>
					<center>
						<div style="margin: auto 420px;">
							<input type="button" name="back" class="color-btn btn-lg"
								value="上一頁" onClick="javascript:history.back()">
						</div>
					</center>
				</div>
			</div>
		</div>
	</div>

	<!-- 			<button id="btn" class="gree">上一頁</button> -->
	<!-- 這邊是結束 -->

		<br>
		<br>
	<br>
</body>
<footer>
	<jsp:include page="/front-end/home/footer.jsp" flush="true" />
	<%-- 			<iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
</footer>
</html>