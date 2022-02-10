<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //MemServlet.java(Concroller), 存入req的memVO物件
%>

<html class="TW" style="overflow: scroll;">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>會員管理</title>
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

<style>
.container{
    display: flex;
    justify-content: center; 
    align-items: center; 
}

.outer{
	display: flex;
	align-items: center;
	text-align: center;
}
</style>

<script type="text/javascript">
	window.performanceHTMLStartTime = Date.now(), performance.clearMarks(),
			performance.mark("index.begin")
</script>

<link href="./css/index.f923077f35fa95f6d6ec.css" data-module="vendor"
	rel="stylesheet">
<link href="./css/index.2b1612d1a8fda6896c22.css"
	data-module="framework" rel="stylesheet">
<script
	src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>

<link data-module="framework" rel="stylesheet" type="text/css"
	href="./css/649.877c9bc30a58814b4de8.css">
<link data-module="home" rel="stylesheet" type="text/css"
	href="./css/663.a3cee9a567c15cbc828d.css">

<link data-module="fulfillment-root" rel="stylesheet" type="text/css"
	href="./css/FulfillmentVendor.17c8ec04ccda647bfdbf.css">
<link data-module="fulfillment-root" rel="stylesheet" type="text/css"
	href="./css/FulfillmentVendorCommon.0816a35613b0a49a6edb.css">
<link data-module="fulfillment-root" rel="stylesheet" type="text/css"
	href="./css/FulfillmentBase.dc3ce97257813a5408ff.css">

<link data-module="order" rel="stylesheet" type="text/css"
	href="./css/order-index.a85ad8d09ff7d58c82c8.css">
<link data-module="order" rel="stylesheet" type="text/css"
	href="./css/331.155057b0fc3b98ce38f8.css">
<link data-module="order" rel="stylesheet" type="text/css"
	href="./css/old-order-list.3167532992dc830110e3.css">
<script
	src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
<script
	src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
</head>

<body style="overflow: visible;" class=" route-index route-portal-sale route-portal-sale-order route-portal-sale-order">
	<div id="app">
		<div class="app-container">
 			<div class="page-container has-siderbar" style="margin: auto"> <!--調整螢幕位置在此 -->
				<div class="page-content-wrapper">
					<div data-v-6de0ecc3="" class="portal-sale-root">
						<div data-v-6de0ecc3="" class="portal-sale-container">
							<div data-v-dff31658="" data-v-6de0ecc3="" class="shopee-fixed-top-card">
								<div data-v-dff31658="" class="fixed-container" style="top: 56px; z-index: 1000;">
									<div data-v-6de0ecc3="" data-v-dff31658="" class="portal-panel">
										<div data-v-ddf12cca="" data-v-6de0ecc3="" class="list-tabs" data-v-dff31658="">
											<div data-v-ddf12cca="" class="tabs shopee-tabs shopee-tabs-line shopee-tabs-normal shopee-tabs-top">
												<div class="shopee-tabs__nav">
													<div class="shopee-tabs__nav-warp">
														<div class="shopee-tabs__nav-tabs"
															style="transform: translateX(0px);">
															
															<div class="shopee-tabs__nav-tab active"
																style="white-space: normal;">
																<div data-v-ddf12cca="" class="tab-label">
																	<span data-v-ddf12cca="" style="color:#717d34; font-size:20px">一般會員</span>
																</div>
															</div>
															
															<div class="shopee-tabs__nav-tab"
																style="white-space: normal;">
																<div data-v-ddf12cca="" class="tab-label" style="font-size:20px">
																	<span data-v-ddf12cca="">小農會員</span>
																</div>
															</div>
															
															<div class="shopee-tabs__nav-tab"
																style="white-space: normal;">
																<div data-v-ddf12cca="" class="tab-label" style="font-size:16px">
																	<span data-v-ddf12cca="">
																					<%-- 錯誤表列 --%>
																		<c:if test="${not empty errorMsgs}">
																			<font style="color:red">請修正以下錯誤:</font>
																			<ul>
	    																		<c:forEach var="message" items="${errorMsgs}">
																					<li style="color:red">${message}</li>
																				</c:forEach>
																			</ul>
																		</c:if>
																	</span>
																</div>
															</div>
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div data-v-550e8c91="" data-v-6de0ecc3="" class="page fulfillment-order">
								<div data-v-550e8c91="" class="fulfillment-order-page-content">
									<div data-v-acb72a84="" data-v-550e8c91="" class="order-list">
										<!---->
									<form>
										<div data-v-acb72a84="" class="padding-wrap">
											<div data-v-54562b84="" data-v-acb72a84="" class="order-search-pannel order-search-panel order-search-pannel-inline order-search-improve">												<div data-v-4325ccd1="" data-v-54562b84=""
													class="order-search-container">
													<div data-v-2449cb06="" data-v-4325ccd1="" class="shopee-input-group search-input-group">
														<span data-v-2449cb06="" class="shopee-input-group__prepend" style="width: 190px;">
															<div data-v-4325ccd1="" class="search-prepend shopee-select" data-v-2449cb06="">
																<div class="shopee-selector" style="display: flex; justify-content: center; align-items: center; background-color: #eff8ec ">
																	
																	<div><b>會員編號</b></div>
																	
																</div>
															</div>
														</span> <span data-v-2449cb06="" class="shopee-input-group__append">
															<div data-v-5af42b48="" data-v-4325ccd1="" class="order-search-input" result-scope-text="全部訂單" data-v-2449cb06="">
																<div data-v-5af42b48="" class="search-warpper">
																	<div data-v-5af42b48="" class="shopee-input order-search-btn">
																		<div class="shopee-input__inner shopee-input__inner--normal">
																			<!---->
																			<input type="text" placeholder="請輸入會員編號" clearable="true" 
																			resize="vertical" rows="2" minrows="2" maxlength="50" restrictiontype="input" 
																			max="Infinity" min="-Infinity" class="shopee-input__input" name="mem_id">
																			<input type="hidden" name="action" value="getOne_For_Display">
																		</div>
																	</div>
																</div>
															</div>
														</span>
													</div>
													<div data-v-4325ccd1="" class="order-search-buttons" >
														<button data-v-4325ccd1="" type="submit" class="search-btn shopee-button shopee-button--primary shopee-button--normal" style="background-color:	#64A600 ;border:#64A600">
															<span> 搜尋 </span>
														<%--<% System.out.print("我有執行"); %> --%>
														</button>
														<button data-v-4325ccd1="" type="reset" class="shopee-button shopee-button--normal">
															<span> 重置 </span>
														</button>
													</div>
												</div>
											</div>
										</div>
									</form>

							<div data-v-a414b804="" data-v-acb72a84=""
											class="order-list-pannel">
											<div data-v-a414b804="" class="order-list-section">
											<div data-v-a414b804="" class="order-list-section">
												<div data-v-dff31658="" data-v-a414b804="" class="shopee-fixed-top-card">
													<div data-v-dff31658="" class="fixed-container" style="top: 112px; z-index: 999;">
														<div data-v-a414b804="" data-v-dff31658="" class="order-list-header outer" style="background-color: #eff9ec; font-size:16px; font-weight:bold">
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:90px;">會員編號</span> <!-- 用item-action統一寬度 -->
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:80px;">頭像</span> 
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:230px;">帳號</span> 
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:90px;">姓名</span>
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:120px;">行動電話</span>
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:110px;">加入時間</span> 
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:90px;">帳號狀態</span>
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:80px;">小農身份</span>
														</div>
													</div>
													
													<div data-v-dff31658="" class="fixed-placeholder" style="height: 44px; display: none;"></div>
												</div>
												
											<FORM METHOD="post" ACTION="mem.do" name="form1">
											<input type="hidden" name="mem_id"  value="${memVO.mem_id}">
												<div data-v-a414b804="" data-v-dff31658="" class="order-list-header outer" style="background-color:; font-size:16px; font-weight:bold">
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:90px;"><%=memVO.getMem_id()%></span> <!-- 用item-action統一寬度 -->
															 
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:80px;">
																	<!-- *************以下區使用MemGifReader查詢圖片 *************-->
																<div data-v-1274329c="" class="">
                                      								<div data-v-3eef092e="" data-v-1274329c="" class="order-view-item order-view-item--small" highlight-return-item="" order-pre-order-flag="">
                                       									<div data-v-3eef092e="" class="order-product-list">
                                         									<div data-v-3eef092e="" class="order-product-wrapper normal-wrapper">
                                         										<img data-v-3eef092e="" src="<%= request.getContextPath() %>/MemGifReader?mem_id=<%=memVO.getMem_id()%>" class="item-images" style=" margin: auto;">
                                        									</div>
                                     	 								</div>
                                    										</div>
																		</div>
																	<!-- *************以上區使用MemGifReader查詢圖片************* -->
															</span>
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:230px;"><%=memVO.getMem_acc()%></span> 
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:90px;"><%=memVO.getMem_name()%></span>
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:120px;"><%=memVO.getMem_mobile()%></span>
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:110px;"><%=memVO.getReg_date()%></span> 
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:90px;">
																<div data-v-883305fa="" class="order-list-filter-item shopee-select is-show">
																	<div data-v-883305fa="" class="shopee-select">
																		<select data-v-2449cb06="" tabindex="0" class="shopee-selector shopee-selector--normal shopee-select__options"
																		name="acc_state" style="background: #eff9ec 0px 0px; color: #ffffff; font-size: 14px;padding:0;width:88px; height:32px; color:rgb(128, 140, 153);"><!-- 名字在這 -->
																			<option class="shopee-option" value="0">未驗證</option>
																			<option class="shopee-option" value="1" <c:if test="${memVO.acc_state == 1}">selected</c:if>>已驗證</option>
																			<option class="shopee-option" value="2" <c:if test="${memVO.acc_state == 2}">selected</c:if>>停權</option>
																		</select>
																	</div>
																</div>
															</span>
															<span data-v-a414b804="" data-v-dff31658="" class="" style="width:80px;">
																<div data-v-1274329c="" class="">
                                      								<div data-v-3eef092e="" data-v-1274329c="" class="order-view-item order-view-item--small" highlight-return-item="" order-pre-order-flag="">
                                       									<div data-v-3eef092e="" class="order-product-list">
                                         									<div data-v-3eef092e="" class="order-product-wrapper normal-wrapper">
                                         												<!-- 將數字轉換為驗證文字 -->
																				<c:choose>
																					<c:when test="${memVO.mem_id_state eq 1}">
																					<img data-v-3eef092e="" src="../mem/images/mem_id_state.png" style="width:30px; margin: auto;">
																					</c:when>
																				</c:choose>
                                        									</div>
                                     	 								</div>
                                    								</div>
																</div>
															</span>
															
																<input data-v-4325ccd1="" type="submit" value="送出修改" class="search-btn shopee-button shopee-button--primary shopee-button--normal" style="background-color:#64A600 ;border:#64A600">
	
			     												<input type="hidden" name="action"	value="updateAccState">
														</div>
													</FORM>
										</div>
									</div> 
								</div>
							</div>
						</div>
		<div data-v-a414b804="" class="pagination-placeholder" style="height:1000px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

</html>