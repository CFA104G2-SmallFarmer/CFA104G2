<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>
<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>

<%
	ShopProductVO shopProductVO = (ShopProductVO) request.getAttribute("shopProductVO");
%>


<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



  <link href="./addprod_files_css/index.f923077f35fa95f6d6ec.css" data-module="vendor" rel="stylesheet">
  <link href="./addprod_files_css/index.2b1612d1a8fda6896c22.css" data-module="framework" rel="stylesheet">
  <title>小農修改商品表單</title>
  <link href=".addprod_files_css/css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" media="all"
    href="./addprod_files_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
    
         <!-- 這段給emoji的 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <style >
            

    </style>
</head> 
 
<header>
<%--        <iframe src="<%= request.getContextPath() %>/front-end/home/header2/header2.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
</header>
<body>
	<div class="container"></div>
	<div class="container mv4">
		<div class="gutter3-l flex">
			<div class="w-100 ph3 mb4 mb0">
<!--   form開始 -->
				 <form class="js-previewable-sum" action="product.do" enctype="multipart/form-data" method="post" name="form1">
					<div class="flex mb5 f6 gutter3">
						<div class="w-30-ns w-20 fl ph3">
							<div class="cf">
								 <img id="img1" class="w-60 mb3" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="" >
							
								<input class="w-80 border-box mv3" accept="image/*" type="file" name="prod_pic" id="upPic" onchange="pic1_change()" style="font-size:20px" >
							</div>
	 <script>
		var file1;
		var fileReader1;
		function pic1_change() {
			file1 = document.getElementById('upPic').files[0];
			if (file1) {
				fileReader1 = new FileReader();
				fileReader1.onload = openfile1;
				readFileContent1();
			}
		}
		function openfile1(event) {
			document.getElementById('img1').src = event.target.result;
		}
		function readFileContent1() {
			fileReader1.readAsDataURL(file1);
		}
	</script>						
						</div>
					<div class="w-70-l w-150 ph2">
						<div class="dn-ns db pt2" id="details"></div>
							<div class=""><br>
								<label style="font-size:23px">商品編號:</label><br>
								<label style="font-size:23px"><%=shopProductVO.getProd_id()%></label><br> 
								<br>
								<label for="user_email" style="font-size:23px">小農會員編號:</label><br>
								 <input required="required" class="w-20 mb3" type="text" value=" <%=shopProductVO.getF_mem_id()%>" name="f_mem_id" style="font-size:23px" /><br> 
								 <label  for="user_name" style="font-size:23px">商品名稱:</label> <br>
								 <input required="required" class="w-30 mb3" type="text" value="<%=shopProductVO.getProd_name()%>" name="prod_name"  style="font-size:23px"/><br>

								 <label style="font-size:23px" >商品類別:</label><br>
             					 <jsp:useBean id="productTypeSvc" scope="page" class="com.shopProductType.model.ShopProductTypeService" />
              					<select required="required" class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30" size="1" name="prod_type_id" style="font-size:23px"><br>
									<c:forEach var="shopProductTypeVO" items="${productTypeSvc.all}">
										<option value="${shopProductTypeVO.prod_type_id}" ${(shopProductVO.prod_type_id==shopProductTypeVO.prod_type_id)? 'selected':'' } style="font-size:23px">${shopProductTypeVO.prod_type_name}
									</c:forEach>
								</select><br>
								
								 <label  for="prod_status" style="font-size:23px">商品狀態:</label><br>
					                <select required="required" class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30"
					                 name="prod_status" id="prod_status" style="font-size:23px"><br>
					                  
					                   <option value="1" style="font-size:23px">
					                  已上架
					                </option>
					                  <option value="0" style="font-size:23px">
					                  未上架
					                </option>
					               
					                
					                </select>

								<div class="flex mt3">
									<div class="flex-auto">
										<label  for="order_address" style="font-size:23px">商品價格:</label><tr>$</tr><br>
										<input required="required" class="mb3 w-50" type="text"
											value="<%=shopProductVO.getProd_price()%>" name="prod_price" style="font-size:23px" />
									</div>
									<div class="flex-auto">
										<label  for="order_postcode" style="font-size:23px">商品單位:</label><br> 
										<input required="required" class="mb3 w-50 js-postcode-field"
											type="text" value="<%=shopProductVO.getProd_unit()%>"
											name="prod_unit" style="font-size:23px"/>
									</div>
								</div>
							</div>
							<div class="flex mt4">
								<div class="flex-auto">
									<label  for="order_recipient" style="font-size:23px">商品數量:</label><br>
									<input required="required" class="mb3 w-55" type="text"
										value="<%=shopProductVO.getProd_qty()%>" name="prod_qty" style="font-size:23px"/>
								</div>

								<div class="flex-auto">
									<label  for="order_postcode" style="font-size:23px">商品上架日期:</label><br> 
									<input required="required" class="mb3 w-55 js-postcode-field"
										type="text" value="<%=shopProductVO.getProd_reg_date()%>"
										name="prod_reg_date" style="font-size:23px"/>
								</div>
							</div>
							<label  for="order_note" style="font-size:23px">商品介紹:<span class="gray mb3" style="font-size:20px">特色說明</span></label><br>
							<textarea placeholder="123"  class="w-100 height-100" type="text" value="" name="prod_intro" style="font-size:23px"/>
                  			<%= (shopProductVO==null)?"": shopProductVO.getProd_intro()%>
                  			</textarea>

							<input type="hidden" name="action" value="update">
							<input type="hidden" name="prod_id" value="<%=shopProductVO.getProd_id()%>"> 
							<button class="db js-submit-order button green mt3" style="font-size:23px" type="submit" value="送出修改"><i class="material-icons" style="font-size:18px">add</i> 送出修改 </button>
			</div>
		</div>
	</div>
</form>
	<!-- form結束 -->
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
</c:if>
	</div>
	</div>
	 <!-- 頁尾 -->
<footer class="pt5 pb6 f6 bt light-gray relative">
   <jsp:include page="/front-end/home/footer.jsp" flush="true"/>
  </footer>
</body>
</html>
