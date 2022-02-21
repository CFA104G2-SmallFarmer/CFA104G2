<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.projOrder.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>

<!-- 迭代在282 -->
<%
//用session那到MemVO
Integer mem_id = MemVO.getMem_id();
//   /*   String mem_id = request.getParameter("mem_id"); */
	String membership= "buyer";
%>


<%
ProjOrderService projOrderSvc = new ProjOrderService();
List<ProjOrderVO> projOrderVO = projOrderSvc.getAllMemOrder(mem_id);  
pageContext.setAttribute("list",projOrderVO); 
%>

<!-- 領班 -->
<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />
<jsp:useBean id="projPerkSvc" scope="page" class="com.projPerk.model.ProjPerkService" />

<!-- 衧霈有改 -->
<jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FMemService" />


<%
request.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","已完成","不成立<br>(未處理)","不成立<br>(已解決)"});
request.setAttribute("proj_pay_arr", new String[]{"信用卡","銀行轉帳"});
request.setAttribute("cancel_reason_arr", new String[]{"","逾期未付款","買家取消","小農取消","專案募資失敗"});
%>

<!-- 我的筆記 join -->
<!-- project物件：(projectSvc.getOneProject(projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id)) -->

<%--專案名稱： ${projectSvc.getOneProject(projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id).proj_name} --%>

<%-- ${projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id} --%>

<%-- 方案金額：${projPerkSvc.getOneProjPerk(projOrderVO.perk_id).perk_fund} --%>
<%-- 方案簡稱：${projPerkSvc.getOneProjPerk(projOrderVO.perk_id).perk_abbr_name} --%>
<%--   農場名稱：${fMemSvc.getOnefMem(projectSvc.getOneProject(projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id).f_mem_id).f_mem_fname} --%>



<!DOCTYPE html>
<html class="TW" style="overflow: scroll;">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <link href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/icon" rel="stylesheet">

  <title>小農認養訂單管理</title>
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0">


  <style>
  span ,p ,a{
  text-decoration:none;
  
  
  }
  
  
  
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
  <link href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/index.f923077f35fa95f6d6ec.css" data-module="vendor" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/index.2b1612d1a8fda6896c22.css" data-module="framework" rel="stylesheet">

  <link data-module="fulfillment-root" rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/FulfillmentVendorCommon.0816a35613b0a49a6edb.css">
  <link data-module="fulfillment-root" rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/FulfillmentBase.dc3ce97257813a5408ff.css">
  <link data-module="order" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/331.155057b0fc3b98ce38f8.css">
  <link data-module="order" rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/old-order-list.3167532992dc830110e3.css">

  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
  <link href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/icon(1)" rel="stylesheet">
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
  
</head>
<body class=" route-index route-portal-sale route-portal-sale-order route-portal-sale-order">

<header>
         <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp" />
</header>

  
  <div class="app-container">
    <div class="page-content-wrapper">
      <div data-v-6de0ecc3="" class="portal-sale-root">
        <div data-v-6de0ecc3="" class="portal-sale-container">
          <div data-v-dff31658="" >
            <div data-v-6de0ecc3="" data-v-dff31658="" class="portal-panel">
              <div data-v-ddf12cca="" data-v-6de0ecc3="" class="list-tabs" data-v-dff31658="">
                <div data-v-ddf12cca="" class="tabs shopee-tabs shopee-tabs-line shopee-tabs-normal">
                  <div class="shopee-tabs__nav">
                    <div class="shopee-tabs__nav-warp">
                      <div class="shopee-tabs__nav-tabs" style="transform: translateX(0px);">
                        <!-- <div class="shopee-tabs__nav-tab " style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">查詢</span>
                          </div>
                        </div> -->
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrderByMem.jsp';" class="shopee-tabs__nav-tab active" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">全部</span>
                          </div>
                        </div>
                        <!-- <div class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">尚未付款</span>
                          </div>
                        </div>
                        <div class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">待出貨</span>
                          </div>
                        </div>
                        <div class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">運送中</span>
                          </div>
                        </div>
                        <div class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">已完成</span>
                          </div>
                        </div>
                        <div class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">不成立(未處理)</span>
                          </div>
                        </div>
                        <div class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">不成立(已解決)</span>
                          </div>
                        </div> -->

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
                  <!-- form結束 -->
                  <div data-v-acb72a84="" class="order-panel-header">
                    <div data-v-acb72a84="" class="title">

                    </div>
                    <div data-v-acb72a84="" class="more-action">
                     <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<%--                     <%=projOrderVO==null%> --%>
<%--                     <%=projPerkVO==null%> --%>
<%--                     <%=projectVO==null%> --%>
                    <!---->
                  

                  </div>
                </div>
              </div>
              <!---->
              <div data-v-a414b804="" data-v-acb72a84="" class="order-list-pannel">
                <div data-v-a414b804="" class="order-list-section">
                  <div data-v-dff31658="" data-v-a414b804="" class="shopee-fixed-top-card">
                    <div data-v-dff31658="" class="fixed-container" style="top: 112px; z-index: 999;">
                      <div data-v-a414b804="" data-v-dff31658="" class="order-list-header">
                        <span data-v-a414b804="" data-v-dff31658="" class="item-product" min-width:80px;="">認養專案 /
                          收件地址</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">金額</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">回饋方案</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">訂單狀態</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-total">訂單時間</span>
                        <span data-v-a414b804="" data-v-dff31658="" class="item-action"
                          style="padding-left:80px;">操作</span></div>
                    </div>
                  </div>

                  <div data-v-1eaa89e5="" data-v-a414b804="" class="order-list-body"><a data-v-1eaa89e5=""
                      target="_blank" class="order-item">
                      
                     <%--  <%@ include file="page1.file" %>  --%>
<%--                       <c:forEach var="projOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
                       
                       
                       
                       
                       <c:forEach var="projOrderVO" items="${list}">
                  

                      <!-- 這邊是開始 -->
                      
                      <div data-v-1eaa89e5="" class="order-title">
                        <div data-v-1eaa89e5="" class="title-prefix">
                          <div data-v-78a21620="" data-v-1eaa89e5="" class="user-header user-view-item simple-nofollow">
                            <div data-v-78a21620="" class="">
                              <i class="material-icons" style="color: #aaba8b;">person</i>
 							 </div>
                            <div data-v-78a21620="" class="content">
                              <div data-v-78a21620="" class="text-overflow" style="">
                            ${fMemSvc.getOneFMem(projectSvc.getOneProject(projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id).f_mem_id).f_mem_fname}



                              </div>
                            </div>
                            <i class="material-icons" style="color: #aaba8b;display: inline;">sms</i>
                          </div>
                        </div>
                        <div data-v-1eaa89e5="" class="id-btn"><span data-v-1eaa89e5=""
                            class="orderid">訂單編號&nbsp;${projOrderVO.order_id}
<%--                             <%=projOrderVO.getOrder_id()%> --%>
                            </span>
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
                                            <div style="color:#717d34;font-size: 16px;">
                                            ${projectSvc.getOneProject(projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id).proj_name}
<%--                                             <%=projectVO.getProj_name()%> --%>
                                            </div><br>
<%--                                              <span>地址：<%=projOrderVO.getOrder_zipcode()%> <%=projOrderVO.getOrder_addr()%></span> --%>
                                            <span>地址：${projOrderVO.order_zipcode} ${projOrderVO.order_addr}</span>
                                            <span>收件人：${projOrderVO.order_receiver}</span>
                                            <span>收件人電話:${projOrderVO.order_tel}</span>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div data-v-1274329c="" class=" item-total">
                                <div data-v-1274329c="" class="price" style="font-size: 16px;padding-top: 4px;">
										${projPerkSvc.getOneProjPerk(projOrderVO.perk_id).perk_fund}
                                </div>
                                <div data-v-1274329c="" class="payment-method" style="font-size: 16px;">
                                
                                <c:set var="pay_num" scope="request" value="${projOrderVO.order_pay}"/>
                           
                                  
                                ${proj_pay_arr[pay_num]}
                                                                         
                                </div>
                              </div>
                              <div data-v-1274329c="" class=" item-total">
                                <div data-v-1274329c="" class="price">
 								${projPerkSvc.getOneProjPerk(projOrderVO.perk_id).perk_abbr_name}
                                </div>
                                <div data-v-1274329c="" class="payment-method">

                                </div>
                              </div>
                              <div data-v-1274329c="" class="item-total">
                                <div data-v-1274329c="" class="price">
                                <c:set var="num" scope="request" value="${projOrderVO.order_state}"/>
                            
<%--                                   <% int num = projOrderVO.getOrder_state(); %> --%>
                                  
<%--                                   <%= ((String[])request.getAttribute("order_state_arr"))[num] %> --%>
                                  
                                ${order_state_arr[num]}
                              

                                </div>
                                <div data-v-1274329c="" class="payment-method">
                                </div>
                              </div>
                              <div data-v-1274329c="" class="item-channel">
                                <div data-v-1274329c="" class="carrier-name">
                                  <span>
                                    訂單時間：<br>${projOrderVO.order_time}
                                  </span>
                                  <br>
                                  
                                <c:choose>
							    <c:when test="${empty projOrderVO.order_ship_time}">
							    </c:when>
							    <c:otherwise>
                                  <span>
                                    出貨時間：<br>${projOrderVO.order_ship_time}
                                  </span>
                                  <br>
							    </c:otherwise>
								</c:choose>   

                                <c:choose>
							    <c:when test="${empty projOrderVO.order_completion_time}">
							    </c:when>
							    <c:otherwise>
							      <span>
                                    完成時間：<br>${projOrderVO.order_completion_time}
                                  </span>
                                  <br>
							    </c:otherwise>
								</c:choose>   
                                                               
							    <c:choose>
							    <c:when test="${projOrderVO.order_cancel_reason ==0}">
							    </c:when>
							    <c:otherwise>
							       <span>
                                    取消時間：<br>${projOrderVO.order_cancel_time}
                                  </span>
                                  <br>原因：<br>
<%-- 							       ${projOrderVO.order_cancel_reason} --%>
							    </c:otherwise>
								</c:choose>
                                                                   
                                    <c:set var="y" scope="request" value="${projOrderVO.order_cancel_reason}"/>
                                                           
                                ${cancel_reason_arr[y]}
                                <script>console.log(${y})</script>
                                <script>console.log(typeof(${y}))</script>
                                
<%--                                    ${projOrderVO.order_cancel_reason}  --%>
                                  
<%--                                   <% int y = projOrderVO.getOrder_cancel_reason(); %>  --%>
                                  
<%--                                   <%= ((String[])request.getAttribute("cancel_reason_arr"))[y] %> --%>

                          
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
    							<c:when test="${projOrderVO.order_state ==0}">
    							<%--   會員不需確認收款按鈕 	--%>
   							 <%-- 
    							
    							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
    							<input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    							<input type="hidden" name="order_zipcode"  value="${projOrderVO.order_zipcode}">	
    							<input type="hidden" name="order_addr"  value="${projOrderVO.order_addr}">	
    							
    							<input type="hidden" name="order_receiver"  value="${projOrderVO.order_receiver}">	
    							<input type="hidden" name="order_tel"  value="${projOrderVO.order_tel}">	
    							<input type="hidden" name="order_state"  value="${projOrderVO.order_state}">	
    							<input type="hidden" name="order_ship_time"  value="${projOrderVO.order_ship_time}">	
    							<input type="hidden" name="order_completion_time"  value="${projOrderVO.order_completion_time}">
    							<input type="hidden" name="order_cancel_time"  value="${projOrderVO.order_cancel_time}">		 			  
			    				<input type="hidden" name="order_cancel_reason"  value="${projOrderVO.order_cancel_reason}">	
			     				<input type="hidden" name="action" value="update_state_to_1_and_then_show_All">
    							
    							<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
    							<input type="hidden" name="membership" value="buyer">
    							
    							
    							<button data-v-4325ccd1=""
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      確認收款
                                    </span></button>
                                 </FORM>
                                     <br>
                                 --%>
                                     
                                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
                             <input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    							<input type="hidden" name="order_zipcode"  value="${projOrderVO.order_zipcode}">	
    							<input type="hidden" name="order_addr"  value="${projOrderVO.order_addr}">	
    							<input type="hidden" name="order_receiver"  value="${projOrderVO.order_receiver}">	
    							<input type="hidden" name="order_tel"  value="${projOrderVO.order_tel}">	
    							<input type="hidden" name="order_state"  value="${projOrderVO.order_state}">	
    							<input type="hidden" name="order_ship_time"  value="${projOrderVO.order_ship_time}">	
    							<input type="hidden" name="order_completion_time"  value="${projOrderVO.order_completion_time}">
    							<input type="hidden" name="order_cancel_time"  value="${projOrderVO.order_cancel_time}">		 			  
			    				<input type="hidden" name="order_cancel_reason"  value="${projOrderVO.order_cancel_reason}">	
			     				<input type="hidden" name="action" value="update_state_to_4_and_then_show_All">	 			  
			
			    				<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
    							<input type="hidden" name="membership" value="buyer">
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      取消訂單
                                    </span>
                                  </button> 
                                  </FORM>
                                  
                                 
								<!-- 收件地址按鈕 -->
								
								<!-- 先取值 -->
								<fmt:formatDate var="mydate"
									value="${projectSvc.getOneProject(projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id).expected_end_date}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<!-- parsing -->
								<fmt:parseDate var="someDate" value="${mydate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<!-- 取當前時間	 -->
								<jsp:useBean id="nowDate" class="java.util.Date" />
								<!-- 取時間差(毫秒) -->
								<c:set var="interval" value="${someDate.time - nowDate.time}" />
								<fmt:formatNumber var="dayleft"
									value="${interval/1000/60/60/24}" pattern="#0" />
								<!-- 算完取條件判斷後呈現 -->
								<span > 
								<c:set
									var="prefix" value="還剩" /> <c:set var="suffix" value="天" />
								   <c:choose>
									<c:when test="${interval<=0}">
											
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
 											<input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    										<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
											<input type="hidden" name="action" value="getOne_For_Update_ByMem">	 
				                       <button data-v-4325ccd1="" class="shopee-button shopee-button--normal" type="submit">
				                       <span>修改收件資訊</span>
				                       </button> 
				                     </FORM>
									</c:when>
									<c:otherwise></c:otherwise>
									</c:choose>
									
									
										
   							 </c:when>
   							 
   							 
   							 <c:when test="${projOrderVO.order_state ==1}">
   							 <%--   會員不需已出貨按鈕 	--%>
   							 <%--   
   							  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
                              <input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    							<input type="hidden" name="order_zipcode"  value="${projOrderVO.order_zipcode}">	
    							<input type="hidden" name="order_addr"  value="${projOrderVO.order_addr}">	
    							<input type="hidden" name="order_receiver"  value="${projOrderVO.order_receiver}">	
    							<input type="hidden" name="order_tel"  value="${projOrderVO.order_tel}">	
    							<input type="hidden" name="order_state"  value="${projOrderVO.order_state}">	
    							<input type="hidden" name="order_ship_time"  value="${projOrderVO.order_ship_time}">	
    							<input type="hidden" name="order_completion_time"  value="${projOrderVO.order_completion_time}">
    							<input type="hidden" name="order_cancel_time"  value="${projOrderVO.order_cancel_time}">		 			  
			    				<input type="hidden" name="order_cancel_reason"  value="${projOrderVO.order_cancel_reason}">	
			     				<input type="hidden" name="action" value="update_state_to_3_and_then_show_All">	 			  
			
						    	<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
    							<input type="hidden" name="membership" value="buyer">
			
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      已出貨
                                    </span>
                                  </button> 
                                  </FORM>
                                  <br>
                                  --%>
                                    
                                    
                                    
                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
                               <input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    							<input type="hidden" name="order_zipcode"  value="${projOrderVO.order_zipcode}">	
    							<input type="hidden" name="order_addr"  value="${projOrderVO.order_addr}">	
    							<input type="hidden" name="order_receiver"  value="${projOrderVO.order_receiver}">	
    							<input type="hidden" name="order_tel"  value="${projOrderVO.order_tel}">	
    							<input type="hidden" name="order_state"  value="${projOrderVO.order_state}">	
    							<input type="hidden" name="order_ship_time"  value="${projOrderVO.order_ship_time}">	
    							<input type="hidden" name="order_completion_time"  value="${projOrderVO.order_completion_time}">
    							<input type="hidden" name="order_cancel_time"  value="${projOrderVO.order_cancel_time}">		 			  
			    				<input type="hidden" name="order_cancel_reason"  value="${projOrderVO.order_cancel_reason}">	
			     				<input type="hidden" name="action" value="update_state_to_4_and_then_show_All">	 			  
			
								<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
    							<input type="hidden" name="membership" value="buyer">
			
			
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      取消訂單
                                    </span>
                                  </button> 
                                  </FORM>
                                  
                                  
                                  								<!-- 收件地址按鈕 -->
								
								<!-- 先取值 -->
								<fmt:formatDate var="mydate"
									value="${projectSvc.getOneProject(projPerkSvc.getOneProjPerk(projOrderVO.perk_id).proj_id).expected_end_date}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<!-- parsing -->
								<fmt:parseDate var="someDate" value="${mydate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<!-- 取當前時間	 -->
								<jsp:useBean id="nowDate1" class="java.util.Date" />
								<!-- 取時間差(毫秒) -->
								<c:set var="interval" value="${someDate.time - nowDate1.time}" />
								<fmt:formatNumber var="dayleft"
									value="${interval/1000/60/60/24}" pattern="#0" />
								<!-- 算完取條件判斷後呈現 -->
								<span > 
								<c:set
									var="prefix" value="還剩" /> <c:set var="suffix" value="天" />
								   <c:choose>
									<c:when test="${interval<=0}">
											
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
 											<input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    										<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
											<input type="hidden" name="action" value="getOne_For_Update_ByMem">	 
				                       <button data-v-4325ccd1="" class="shopee-button shopee-button--normal" type="submit">
				                       <span>修改收件資訊</span>
				                       </button> 
				                     </FORM>
									</c:when>
									<c:otherwise></c:otherwise>
									</c:choose>
                                  
                                  
                                  
                                  
                                  
                                  
   							 </c:when>
    							<c:when test="${projOrderVO.order_state ==2}">
    							<%-- 
    							    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
                              <input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    							<input type="hidden" name="order_zipcode"  value="${projOrderVO.order_zipcode}">	
    							<input type="hidden" name="order_addr"  value="${projOrderVO.order_addr}">	
    							<input type="hidden" name="order_receiver"  value="${projOrderVO.order_receiver}">	
    							<input type="hidden" name="order_tel"  value="${projOrderVO.order_tel}">	
    							<input type="hidden" name="order_state"  value="${projOrderVO.order_state}">	
    							<input type="hidden" name="order_ship_time"  value="${projOrderVO.order_ship_time}">	
    							<input type="hidden" name="order_completion_time"  value="${projOrderVO.order_completion_time}">
    							<input type="hidden" name="order_cancel_time"  value="${projOrderVO.order_cancel_time}">		 			  
			    				<input type="hidden" name="order_cancel_reason"  value="${projOrderVO.order_cancel_reason}">	
			     				<input type="hidden" name="action" value="update_state_to_3_and_then_show_All">	 			  
			
								<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
    							<input type="hidden" name="membership" value="buyer">
								--%>
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" disabled><span>
                                      物流運送中
                                    </span>
                                  </button> 
                                  </FORM>
   							 </c:when>
   							 
   							   	<c:when test="${projOrderVO.order_state ==3}">
    							<%--   已完成訂單不需按鈕 --%>	
   							 </c:when>

		  	
							<c:when test="${projOrderVO.order_state ==4}">
    						<%-- 
    								  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">	
                            <input type="hidden" name="order_id"  value="${projOrderVO.order_id}">	
    							<input type="hidden" name="order_zipcode"  value="${projOrderVO.order_zipcode}">	
    							<input type="hidden" name="order_addr"  value="${projOrderVO.order_addr}">	
    							<input type="hidden" name="order_receiver"  value="${projOrderVO.order_receiver}">	
    							<input type="hidden" name="order_tel"  value="${projOrderVO.order_tel}">	
    							<input type="hidden" name="order_state"  value="${projOrderVO.order_state}">	
    							<input type="hidden" name="order_ship_time"  value="${projOrderVO.order_ship_time}">	
    							<input type="hidden" name="order_completion_time"  value="${projOrderVO.order_completion_time}">
    							<input type="hidden" name="order_cancel_time"  value="${projOrderVO.order_cancel_time}">		 			  
			    				<input type="hidden" name="order_cancel_reason"  value="${projOrderVO.order_cancel_reason}">	
			     				<input type="hidden" name="action" value="update_state_to_5_and_then_show_All">	 			  
			
								<input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
    							<input type="hidden" name="membership" value="buyer">
							--%>
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" disabled><span>
                                      退款處理中
                                    </span>
                                  </button> 
                                  </FORM>
   							 </c:when>
   						 							 
   						 											
  						  	  <c:otherwise>
  						  
  						  
  					  		</c:otherwise>
							</c:choose>
                                 <!-- <button data-v-4325ccd1="" type="button"
                                    class="shopee-button shopee-button--normal"><span>
                                      確認收款
                                    </span></button>
                                  <button data-v-4325ccd1="" type="button"
                                    class="shopee-button shopee-button--normal"><span>
                                      已出貨
                                    </span></button>
                                  <button data-v-4325ccd1="" type="button"
                                    class="shopee-button shopee-button--normal"><span>
                                      完成訂單
                                    </span></button>
                                  <br>

                                  <button data-v-4325ccd1="" type="button"
                                    class="shopee-button shopee-button--normal"><span>
                                      取消訂單
                                    </span>
                                  </button>  -->
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- 這邊是結束 -->
                      </c:forEach>
<%--                       <%@ include file="page2.file" %> --%>

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
  <script type="text/javascript">
    document.oncontextmenu = null;
    document.onselectstart = null;
    document.ondragstart = null;
    document.onmousedown = null;
    document.body.oncontextmenu = null;
    document.body.onselectstart = null;
    document.body.ondragstart = null;
    document.body.onmousedown = null;
    document.body.oncut = null;
    document.body.oncopy = null;
    document.body.onpaste = null;
  </script>
<%--   <footer>
        <jsp:include page="/footer/footer.jsp" />
</footer> --%>
  
  <footer>
   <%--      <jsp:include page="/footer/footer.jsp" /> --%>
   
   <div style="width:100%;height:150px">
   </div>
</footer>
  
</body>

</html>