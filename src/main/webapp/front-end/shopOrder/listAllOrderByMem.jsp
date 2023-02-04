<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopOrder.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>

<%-- <%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%> --%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>
<%Integer mem_id = MemVO.getMem_id();%>
<%-- <%Integer f_mem_id = fMemVO.getF_mem_id();%> --%>



<%
  ShopOrderService shopOrderSvc = new ShopOrderService(); 
  List<ShopOrderVO> list = shopOrderSvc.getAllMemOrder(mem_id);
  pageContext.setAttribute("list",list);	 
%>

<%
	String membership= "buyer";
%>

<%
request.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","已完成","已取消"});
request.setAttribute("order_pay_arr", new String[]{"","信用卡","銀行轉帳"});
%>

<!-- join要用的usebean -->
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />



<!DOCTYPE html>
<html class="TW" style="overflow: scroll;">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <link href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/icon" rel="stylesheet">

  <title>會員商城訂單管理</title>
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0">


  <style>
    .ct-item-product-info {
      font-family: sans-serif;
      color: #7b7b7b;
      font-size: 15px;

    }

    .material-icons {
      padding: 3px;
    }

    .shopee-button {
      margin: 1px;
    }
  </style>
  <link href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/index.f923077f35fa95f6d6ec.css" data-module="vendor" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/index.2b1612d1a8fda6896c22.css" data-module="framework" rel="stylesheet">

  <link data-module="fulfillment-root" rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/FulfillmentVendorCommon.0816a35613b0a49a6edb.css">
  <link data-module="fulfillment-root" rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/FulfillmentBase.dc3ce97257813a5408ff.css">
  <link data-module="order" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/331.155057b0fc3b98ce38f8.css">
  <link data-module="order" rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/old-order-list.3167532992dc830110e3.css">

  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
  <link href="<%=request.getContextPath()%>/front-end/shopOrder/farmer_order_css/icon(1)" rel="stylesheet">
  <style type="text/css">
    * {
      <br>-webkit-user-select: text !important;
      <br>-moz-user-select: text !important;
      <br>-ms-user-select: text !important;
      <br>user-select: text !important;
      <br>
    }
  </style>
  <style type="text/css">
    * {
      <br>-webkit-user-select: text !important;
      <br>-moz-user-select: text !important;
      <br>-ms-user-select: text !important;
      <br>user-select: text !important;
      <br>
    }
  </style>
  
<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
  
  
</head>
<!-- <h3>會員買家訂單管理</h3> -->
<body class=" route-index route-portal-sale route-portal-sale-order route-portal-sale-order">
  <div class="app-container">
    <div class="page-content-wrapper">
      <div data-v-6de0ecc3="" class="portal-sale-root">
        <div data-v-6de0ecc3="" class="portal-sale-container">
<!--         刪掉class裡的 fixed-top -->
   <%@ include file="page1.file" %>                    
          <div data-v-dff31658="" class="fixed-container ">
            <div data-v-6de0ecc3="" data-v-dff31658="" class="portal-panel">
              <div data-v-ddf12cca="" data-v-6de0ecc3="" class="list-tabs" data-v-dff31658="">
                <div data-v-ddf12cca="" class="tabs shopee-tabs shopee-tabs-line shopee-tabs-normal">
                  <div class="shopee-tabs__nav">
                    <div class="shopee-tabs__nav-warp">
                      <div class="shopee-tabs__nav-tabs"style="white-space: normal; ">
         
         	
                        <div class="shopee-tabs__nav-tab active" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label">
                          <span data-v-ddf12cca="">全部</span>
                          </div>
                        </div>
                        
                      </div>
                      <div class="shopee-tabs__ink-bar" style="width: 60px; transform: translateX(0px);"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div data-v-550e8c91="" data-v-6de0ecc3="" class="page fulfillment-order">
            <div data-v-550e8c91="" class="fulfillment-order-page-content">
              <div data-v-acb72a84="" data-v-550e8c91="" class="order-list">
                <div data-v-acb72a84="" class="padding-wrap">
               <!--  form開始 -->
                  <form method="post" action="shopOrder.do">
                    <div data-v-54562b84="" data-v-acb72a84=""
                      class="order-search-pannel order-search-panel order-search-pannel-inline order-search-improve">
                    </div>
                  </form>
                  <!-- form結束 -->
                  <div data-v-acb72a84="" class="order-panel-header">
                    <div data-v-acb72a84="" class="title">

                    </div>
                    <div data-v-acb72a84="" class="more-action">
<%-- 錯誤表列start --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<%-- 錯誤表列End --%> 

                  </div>
                </div>
              </div>
              <!-- 訂單瀏覽列start -->
  			<div data-v-a414b804="" data-v-acb72a84="" class="order-list-pannel">
                <div data-v-a414b804="" class="order-list-section">
                  <div data-v-dff31658="" data-v-a414b804="" class="shopee-fixed-top-card">
                    <div data-v-dff31658="" class="fixed-container" style="top: 112px; z-index: 999;">
                      <div data-v-a414b804="" data-v-dff31658="" class="order-list-header">
                        <span data-v-a414b804="" data-v-dff31658="" class="item-product" min-width:80px;="">小農賣家/收件明細</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">金額</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">付款方式</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">運送方式</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">訂單日期</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-action"
                          style="padding-left:80px;">功能</span>
                      </div>
                    </div>
                  </div>

                  <div data-v-1eaa89e5="" data-v-a414b804="" class="order-list-body"><a data-v-1eaa89e5=""
                      target="_blank" class="order-item">
              <!-- 訂單瀏覽列end -->
   <!-- 				foreach取出資料 -->  
	<c:forEach var="shopOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<%--     		<c:forEach var="shopOrderVO" items="${list}">                    --%>
                      <div data-v-1eaa89e5="" class="order-title">
                        <div data-v-1eaa89e5="" class="title-prefix">
                          <div data-v-78a21620="" data-v-1eaa89e5="" class="user-header user-view-item simple-nofollow">
                            <div data-v-78a21620="" class="">
<!--                               <i class="material-icons" style="color: #aaba8b;">person</i> -->

                            </div>
                            <div data-v-78a21620="" class="content">
                              <div data-v-78a21620="" class="text-overflow" style="">
<%--                                 ${shopOrderVO.f_mem_id} --%>
<%--                                 <%=shopOrderVO.getMem_id()%> --%>
                              	${fmemSvc.getOneFMem(shopOrderVO.f_mem_id).f_mem_fname}
                              </div>
                            </div>
                            <i class="material-icons" style="color: #aaba8b;display: inline;">sms</i>
                          </div>
                        </div>
                        
<!--                        訂單狀態  -->
                        <div data-v-1eaa89e5="" class="id-btn" style="color: red; font-size: 18px"><span data-v-1eaa89e5=""
                            class="orderid"><b>
                             <c:set var="num" scope="request" value="${shopOrderVO.order_state}"/>
                            
                            訂單狀態&nbsp;${order_state_arr[num]}
<%--                             <%=shopOrderVO.getOrder_state()%> --%>
                            </span>
                            </b>
                        </div>
                      </div>
                      
                      <div data-v-1274329c="" data-v-1eaa89e5="" class="order-item-root-wrap">
                        <div data-v-1274329c="" class="order-content">
                          <div data-v-1274329c="" class="order-list-item">
                            <div data-v-1274329c="" class="body">
                              <div data-v-1274329c="" class="item-product">
                                <div data-v-3eef092e="" data-v-1274329c=""
                                  class="order-view-item order-view-item--small" highlight-return-item=""
                                  order-pre-order-flag="">
                                  <div data-v-3eef092e="" class="order-product-list">
                                    <div data-v-3eef092e="" class="order-product-wrapper normal-wrapper">
                                      <div data-v-3eef092e="" class="ct-item-product">
                                        <div data-v-3eef092e="" class="ct-item-product-inner">
                                          <div data-v-3eef092e="" class="ct-item-product-info">
                                            <!--                                        ///////////////////////////////////////////////// -->
<!-- 											放入連結到訂單明細 -->
                                            
                                            <div onclick="location.href='<%=request.getContextPath()%>/front-end/shopOrderDetails/listPKALLShopOrderDetails.jsp?order_id=${shopOrderVO.order_id}&action=getPkALL';" 
                                            style="cursor: pointer;color:#717d34;font-size: 16px;">
                                            <input type="hidden" name="order_id"  value="${shopOrderVO.order_id}">
                                            訂單編號&nbsp; : ${shopOrderVO.order_id}
<%--                                             "location.href=${pageContext.request.contextPath}/shopOrderDetails/shopOrderDetails.do?order_id=${shopOrderVO.order_id}&action=getPKAll" --%>
<!--                                        ///////////////////////////////////////////////// -->
                                            </div><br>
                                            <font size="2">地址：${shopOrderVO.order_add}</font>
                                            <br>
                                            <font size="2">收件人：${shopOrderVO.order_receiver}</font>
                                            <br>
                                            <font size="2">收件人電話:${shopOrderVO.order_tel}</font>
                                            <br>
                                            <font size="2">備註:${shopOrderVO.order_memo}</font>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              
                         <!--金額-->
                              <div data-v-1274329c="" class=" item-total">
                                <div data-v-1274329c="" class="price" 
                                style="font-size: 16px;padding-top: 4px;">
									$${shopOrderVO.order_amount}
                                </div>
                              </div>
                              
    					<!--付款方式-->                          
                              <div data-v-1274329c="" class=" item-total">
                                <div data-v-1274329c="" class="price" style="font-size: 16px;">

                                <c:set var="pay_num" scope="request" value="${shopOrderVO.order_payment}"/>
                                ${order_pay_arr[pay_num]}
                                                                         
                                </div>
                                <div data-v-1274329c="" class="payment-method"></div>
                              </div>
                              
						<!--運送方式-->	        
                              <div data-v-1274329c="" class=" item-total">
                                <div data-v-1274329c="" class="price"
											style="font-size: 16px; padding-top: 4px;"> 小農宅配</div>
                                <div data-v-1274329c="" class="payment-method"></div>
                              </div>
                              
                         <!--訂單日期-->     
                              <div data-v-1274329c="" class="item-channel">
                                <div data-v-1274329c="" class="carrier-name">
                                  <span>
                                    訂單日期：<br>${shopOrderVO.order_date}
                                  </span>
                                  <br>
                                  <span>
                                    出貨日期：<br>${shopOrderVO.order_ship_date}
                                  </span>
                                  <br>
                                  <span>
                                    完成日期：<br>${shopOrderVO.order_finish_date}
                                  </span>
                                  <br>
                                  <span>
                                    取消日期：<br>${shopOrderVO.order_cancel_date}
                                  </span>
                          
                                </div>
                                <div data-v-1274329c="" class="tracking-number-wrapper">
                                  <div data-v-1274329c="" class="lable">
                                  </div>
                                </div>
                              </div>
                              <div data-v-1274329c="" class="item-action">
                              
<%--                               <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">		 			   --%>
<%-- 			    				<input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	 --%>
<!-- 			     				<input type="hidden" name="action" value="delete"> -->
<!-- 			  				   </FORM> -->
                            
                              <c:choose>
    							<c:when test="${shopOrderVO.order_state ==0}">
    							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopOrder/shopOrder.do">	
<!--     							<input type="submit" value="修改"> -->
    							<button data-v-4325ccd1=""
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      修改訂單
                                    </span></button>
    							<input type="hidden" name="order_id"  value="${shopOrderVO.order_id}">	
			     				<input type="hidden" name="action" value="grtOne_For_Update">

    							<input type="hidden" name="membership" value="buyer">
    							
                                 </FORM>
                                     <br>
    							
   							 </c:when>
   						
  						  	  <c:otherwise>
  						  
  						  
  					  		</c:otherwise>
							</c:choose>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      </c:forEach>
                      <!-- foreach這邊是結束 -->
<%@ include file="page2.file" %>
                    </a></div><a data-v-1eaa89e5="" target="_blank" class="order-item">
                  </a>
                </div><a data-v-1eaa89e5="" target="_blank" class="order-item">
                </a>
              </div><a data-v-1eaa89e5="" target="_blank" class="order-item">
              </a>
            </div><a data-v-1eaa89e5="" target="_blank" class="order-item">
            </a>
          </div><a data-v-1eaa89e5="" target="_blank" class="order-item">
          </a>
        </div><a data-v-1eaa89e5="" target="_blank" class="order-item">
        </a>
      </div><a data-v-1eaa89e5="" target="_blank" class="order-item">
      </a>
    </div><a data-v-1eaa89e5="" target="_blank" class="order-item">
      <!-- Code injected by live-server -->


    </a>
  </div>
  </div>
  <!-- Code injected by live-server -->

</body>
<jsp:include page="/front-end/home/footer.jsp" flush="true"/>

</html>