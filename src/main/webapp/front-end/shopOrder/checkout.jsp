<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopOrder.model.*"%>
<%@ page import="com.shopCart.model.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>

<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%Integer mem_id =  MemVO.getMem_id();%> --%>
<%-- <%Integer f_mem_id =  fMemVO.getF_mem_id();%> --%>

<%
ShopOrderVO shopOrderVO = (ShopOrderVO) request.getAttribute("shopOrderVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
Integer mem_id = shopOrderVO.getMem_id();
Integer f_mem_id = shopOrderVO.getF_mem_id();

ShopCartService scSVC = new ShopCartService();
List<ShopCartVO> list1 = scSVC.getBreakeList(mem_id, f_mem_id);
pageContext.setAttribute("list1", list1);
%>

<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<title>Check out</title>

<!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&display=swap" rel="stylesheet">

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="lib/slick/slick.css" rel="stylesheet">
    <link href="lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style1.css" rel="stylesheet">

    <script
    src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous">
  </script>
  
   <!-- SweetAlert -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

<style type="text/css">
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


</head>
<body>
<%-- ${shopOrderVO.mem_id} --%>
<%-- ${memSvc.getOneMem(shopOrderVO.mem_id).mem_name} --%>
<jsp:include page="/front-end/home/header.jsp" flush="true"/>

<br><br>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopOrder/shopOrder.do" name="form1">
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-8">
				<h2 class="section-title position-relative text-uppercase mb-3">寄送地址</h2>
				<div class="bg-light p-30 mb-5">
					<div class="row">
						<div class="col-md-6 form-group">
							<label> <b>會員編號</b></label> 
							<input class="form-control" type="text"
								placeholder="" name="mem_id" value="${shopOrderVO.mem_id}" readOnly>
						</div>
						<div class="col-md-6 form-group">
							<label><b>會員姓名</b></label> <input class="form-control" type="text" name="mem_name"
								value="${memSvc.getOneMem(shopOrderVO.mem_id).mem_name}" readOnly>
						</div>
						<div class="col-md-6 form-group">
							<label><b>收件人</b></label> <input class="form-control" type="text" name="order_receiver"
								value="<%=(shopOrderVO != null)? "Osper" : shopOrderVO.getOrder_receiver()%>"> 
						</div>
						<div class="col-md-6 form-group">
							<label><b>收件人電話</b></label> <input class="form-control" type="text" name="order_tel"
								value="<%=(shopOrderVO!=null)? "0981000111" : shopOrderVO.getOrder_tel()%>">
						</div>

						<div class="col-md-6 form-group">
							<label><b>收貨地址</b></label> <input class="form-control" type="text" name="order_add"
								value="<%=(shopOrderVO!=null)? "110台北市信義區信義路五段7號" :shopOrderVO.getOrder_add()%>">
						</div>
						<div class="col-md-6 form-group">
							<label><b>宅配方式</b></label> <select class="form-control" type="text">
								<option>低溫宅配(免運費) $0</option>
							
							</select>

						</div>

						<div class="col-md-12">
							<!-- <div class="custom-control custom-checkbox"> -->
							<label><b>備註</b></label> <input style="width: 100%; height: 100%;"
								class="form-control" type="text" name="order_memo"
								value="<%=(shopOrderVO!=null)? "購買備註" :shopOrderVO.getOrder_memo()%>">
							<!-- </div> -->
						</div>
					</div>
				</div>

			</div>
			<div class="col-lg-4">
				<h2 class="section-title position-relative text-uppercase mb-3">付款方式</h2>
				<div class="bg-light p-30 mb-5">
				<input type ="hidden" name="f_mem_id" value="${shopOrderVO.f_mem_id}">
				<input type ="hidden" name="order_amount" value="${shopOrderVO.order_amount}">
				<div></div>
				<h4>${fmemSvc.getOneFMem(shopOrderVO.f_mem_id).f_mem_fname} Total:
				<font style="color:red" size="4"> $${shopOrderVO.order_amount}</font></h4>
				</div>
				<!-- 付款方式 -->
				<div class="mb-5">
					<!-- <h5 class="section-title position-relative text-uppercase mb-3">付款方式</h5> -->
					<div class="bg-light p-30">
						<div class="form-group">
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input" name="order_payment"
									id="paypal" VALUE="1" required> <label class="custom-control-label"
									for="paypal">銀行轉帳</label>
							</div>
						</div> 
						<div class="form-group">
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input" name="order_payment"
									id="directcheck" VALUE="0" required> <label class="custom-control-label"
									for="directcheck">信用卡</label>
							</div>
						</div>
					</div>
					<input type="hidden" name="action" value="pay">
					<button class="btn btn-block color-btn font-weight-bold py-3"
						style="background-color: origin" id="btn1" type="submit" value="付款">付款</button>
				</div>
				<!-- 付款方式End -->
			<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<%-- 錯誤表列 --%>
			</div>
		</div>
	</div>
</FORM>				



<!-- <script type="text/javascript"> -->
<jsp:include page="/front-end/home/footer.jsp" flush="true"/>

</body>
</html>