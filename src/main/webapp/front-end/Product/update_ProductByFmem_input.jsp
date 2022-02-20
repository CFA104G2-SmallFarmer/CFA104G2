<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopProduct.model.*"%>

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
 
<body class="intent-mouse">
	<header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
 		<jsp:include page="/front-end/header/header.jsp" flush="true"/>
  	</header>
</body>
<body>

	<div data-v-ddf12cca=""
		class="tabs shopee-tabs shopee-tabs-line shopee-tabs-normal">
		<div class="shopee-tabs__nav">
			<div class="shopee-tabs__nav-warp">
				<div class="shopee-tabs__nav-tabs"
					style="transform: translateX(300px);">

					<div class="shopee-tabs__nav-tab active"
						style="white-space: normal;">
						<div data-v-ddf12cca="" class="tab-label">
							<span data-v-ddf12cca="">全部</span>
						</div>
					</div>
					<div class="shopee-tabs__nav-tab" style="white-space: normal;">
						<div data-v-ddf12cca="" class="tab-label">
							<span data-v-ddf12cca="">新增商品</span>
						</div>
					</div>
					<div class="shopee-tabs__nav-tab" style="white-space: normal;">
						<div data-v-ddf12cca="" class="tab-label">
							<span data-v-ddf12cca="">我的商品</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container"></div>
	<div class="container mv4">
		<div class="gutter3-l flex">
			<div class="w-100 ph3 mb4 mb0">
<!--   form開始 -->
				 <form class="js-previewable-sum"
          action="product.do" enctype="multipart/form-data" method="post" name="form1">
					<div class="flex mb5 f6 gutter3">
						<div class="w-30-ns w-20 fl ph3">
							<div class="cf">
								 <img id="img1" class="w-60 mb3" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="">
							
								<input class="w-100 border-box mv3" accept="image/*" type="file" name="prod_pic" id="upPic" onchange="pic1_change()" >
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
<!-- 						<div class="cf">
								<img class="w-60 round mb3"
									src="./updateprod_files_css/fallback(1).jpg" alt="Fallback">
								<label class="b" for="user_avatar">顯示圖片</label> <input
									class="w-100 border-box mv3" accept="image/*" type="file"
									name="user[avatar]" id="user_avatar">
							</div>
							<div class="cf">
								<img class="w-60 round mb3"
									src="./updateprod_files_css/fallback(1).jpg" alt="Fallback">
								<label class="b" for="user_avatar">顯示圖片</label> <input
									class="w-100 border-box mv3" accept="image/*" type="file"
									name="user[avatar]" id="user_avatar">
							</div>   -->	
						</div>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
</c:if>
					<div class="w-70-l w-150 ph2">
						<div class="dn-ns db pt2" id="details"></div>
							<div class=""><br>
								<label>商品編號:</label><br>
								<td><%=shopProductVO.getProd_id()%></td><br> 
								
								<label for="user_email">小農會員編號:</label><br>
								 <input required="required" class="w-20 mb3" type="text" value=" <%=shopProductVO.getF_mem_id()%>" name="f_mem_id" /><br> 
								 <label  for="user_name">商品名稱:</label> <br>
								 <input required="required" class="w-30 mb3" type="text" value="<%=shopProductVO.getProd_name()%>" name="prod_name" /><br>

								 <label >商品類別:</label><br>
             					 <jsp:useBean id="productTypeSvc" scope="page" class="com.shopProductType.model.ShopProductTypeService" />
              					<select required="required" class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30" size="1" name="prod_type_id"><br>
									<c:forEach var="shopProductTypeVO" items="${productTypeSvc.all}">
										<option value="${shopProductTypeVO.prod_type_id}" ${(shopProductVO.prod_type_id==shopProductTypeVO.prod_type_id)? 'selected':'' } >${shopProductTypeVO.prod_type_name}
									</c:forEach>
								</select><br>
								
								 <label  for="prod_status">商品狀態:</label><br>
					                <select required="required" class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30"
					                 name="prod_status" id="prod_status"><br>
					                  
					                  <option value="0">
					                  已下架
					                </option>
					                <option value="1">
					                  已上架
					                </option>
					                
					                </select>

								<div class="flex mt3">
									<div class="flex-auto">
										<label  for="order_address">商品價格:</label><tr>$</tr><br>
										<input required="required" class="mb3 w-50" type="text"
											value="<%=shopProductVO.getProd_price()%>" name="prod_price" />
									</div>
									<div class="flex-auto">
										<label  for="order_postcode">商品單位:</label><br> 
										<input required="required" class="mb3 w-50 js-postcode-field"
											type="text" value="<%=shopProductVO.getProd_unit()%>"
											name="prod_unit" />
									</div>
								</div>
							</div>
							<div class="flex mt4">
								<div class="flex-auto">
									<label  for="order_recipient">商品數量:</label><br>
									<input required="required" class="mb3 w-55" type="text"
										value="<%=shopProductVO.getProd_qty()%>" name="prod_qty" />
								</div>

								<div class="flex-auto">
									<label  for="order_postcode">商品上架日期:</label><br> 
									<input required="required" class="mb3 w-55 js-postcode-field"
										type="text" value="<%=shopProductVO.getProd_reg_date()%>"
										name="prod_reg_date" />
								</div>
							</div>
							<!-- <label class="mt3 b" for="order_country">熱門標籤:</label>
              <select required="required"
                class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30"
                autocomplete="country-name" name="order[country]" id="order_country">
                <option>虎年特惠</option><option>聖誕節</option>
              </select> -->
							<label  for="order_note">商品介紹:<span class="gray mb3">特色說明</span></label><br>
							<textarea placeholder="123"  class="w-100 height-100" type="text" value="" name="prod_intro" />
                  <%= (shopProductVO==null)?"": shopProductVO.getProd_intro()%>
                  </textarea>

							<input type="hidden" name="action" value="update">
							<input type="hidden" name="prod_id" value="<%=shopProductVO.getProd_id()%>"> 
							<input class="db js-submit-order button green mt3" type="submit" value="送出修改">
			</div>
		</div>
	</div>
	</form>
	<!-- form結束 -->
	</div>
	</div>
	 <!-- 頁尾 -->
<footer class="pt5 pb6 f6 bt light-gray relative">
   <jsp:include page="/front-end/footer/footer.jsp" flush="true"/>
  </footer>
</body>
</html>
