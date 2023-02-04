<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>
<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>

<%
//用session那到FMemVO
Integer f_mem_id = fMemVO.getF_mem_id();
//   /*   String mem_id = request.getParameter("mem_id"); */
	String membership= "seller";
	%>

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
         <jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" />
</header>
  <div class="app-container">
    <div class="page-content-wrapper">
      <div data-v-6de0ecc3="" class="portal-sale-root">
        <div data-v-6de0ecc3="" class="portal-sale-container">
          <div data-v-dff31658="" class="fixed-container fixed-top">
            <div data-v-6de0ecc3="" data-v-dff31658="" class="portal-panel">
              <div data-v-ddf12cca="" data-v-6de0ecc3="" class="list-tabs" data-v-dff31658="">
                <div data-v-ddf12cca="" class="tabs shopee-tabs shopee-tabs-line shopee-tabs-normal">
                  <div class="shopee-tabs__nav">
                    <div class="shopee-tabs__nav-warp">
                      <div class="shopee-tabs__nav-tabs" style="transform: translateX(0px);">
                        <div class="shopee-tabs__nav-tab active" style="white-space: normal;">
                          <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/searchOrderByFmem.jsp';" data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">查詢</span>
                          </div>
                        </div>
                                               <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrderByFmem.jsp';" class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">全部</span>
                          </div>
                        </div>
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_0_ByFmem.jsp';" class="shopee-tabs__nav-tab " style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">待付款</span>
                          </div>
                        </div>
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_1_ByFmem.jsp';" class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">待出貨</span>
                          </div>
                        </div>
                           <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_2_ByFmem.jsp';" class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">運送中</span>
                          </div>
                        </div>
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_3_ByFmem.jsp';" class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">已完成</span>
                          </div>
                        </div>
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_4_ByFmem.jsp';" class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">不成立(未處理)</span>
                          </div>
                        </div>
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_5_ByFmem.jsp';" class="shopee-tabs__nav-tab active" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">不成立(已解決)</span>
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
                  <form method="post" action="${pageContext.request.contextPath}/projOrder/projOrder.do">
                    <div data-v-54562b84="" data-v-acb72a84=""
                      class="order-search-pannel order-search-panel order-search-pannel-inline order-search-improve">
                      <div data-v-4325ccd1="" data-v-54562b84="" class="order-search-container">
                        <div data-v-4325ccd1="" class="shopee-input-group search-input-group"><span
                            class="shopee-input-group__prepend"
                            style="width: 190px;font-size: 18px;text-align: right;">請輸入訂單編號：
                            <div data-v-4325ccd1="" class="search-prepend shopee-select">
                              <div class="shopee-popper" style="display: none;">
                                <div class="shopee-select__menu" style="max-width: 440px; max-height: 218px;">
                                  <div class="shopee-scrollbar">
                                    <div class="shopee-scrollbar__wrapper">
                                      <div class="shopee-scrollbar__content" style="position: relative;">
                                        <div class="shopee-select__options">
                                          <div data-v-4325ccd1="" class="shopee-option selected">
                                            訂單編號
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </span> <span class="shopee-input-group__append">
                            <div data-v-5af42b48="" class="search-warpper">
                              <div data-v-5af42b48="" class="shopee-input order-search-btn">
                                <div class="shopee-input__inner shopee-input__inner--normal">
                                  <input type="text" placeholder="請輸入訂單編號" clearable="true" resize="vertical" rows="2"
                                    minrows="2" maxlength="50" restrictiontype="input" max="Infinity" min="-Infinity"
                                    class="shopee-input__input" name="order_id" >
                                      <input type="hidden" name="f_mem_id" value="${fMemVO.f_mem_id}">
                                    <input type="hidden" name="action" value="getOneByFmem">
                      <!-- name在這裡 -->
                                  <div class="shopee-input__suffix">
                                  </div>
                                </div>
                              </div>
                            </div>


                          </span>
                        </div>
                        <div data-v-4325ccd1="" class="order-search-buttons">
                          <button data-v-4325ccd1="" type="submit" value="Submit"
                            class="search-btn shopee-button shopee-button--primary shopee-button--normal"><span>
                              搜尋
                            </span>
                          </button>
                          <button data-v-4325ccd1="" type="reset" value="Reset"
                            class="shopee-button shopee-button--normal"><span>
                              重置
                            </span>
                          </button>
                        </div>
                      </div>

                    </div>
                  </form>
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



<footer>
   <%--      <jsp:include page="/footer/footer.jsp" /> --%>
   
   <div style="width:100%;height:150px">
   </div>
</footer>

  
</body>

</html>