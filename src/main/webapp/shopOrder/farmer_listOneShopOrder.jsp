<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.shopOrder.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%
ShopOrderVO shopOrderVO = (ShopOrderVO) request.getAttribute("shopOrderVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<%
MemVO memVO = (MemVO) request.getAttribute("memVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<%
ShopProductVO shopProductVO = (ShopProductVO) request.getAttribute("shoporderVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>


<!DOCTYPE html>

<html class="TW" style="overflow: scroll;">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <link href="./farmer_order_css/icon" rel="stylesheet">

  <title>小農商城訂單管理</title>
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
  <link href="./farmer_order_css/index.f923077f35fa95f6d6ec.css" data-module="vendor" rel="stylesheet">
  <link href="./farmer_order_css/index.2b1612d1a8fda6896c22.css" data-module="framework" rel="stylesheet">

  <link data-module="fulfillment-root" rel="stylesheet" type="text/css"
    href="./farmer_order_css/FulfillmentVendorCommon.0816a35613b0a49a6edb.css">
  <link data-module="fulfillment-root" rel="stylesheet" type="text/css"
    href="./farmer_order_css/FulfillmentBase.dc3ce97257813a5408ff.css">
  <link data-module="order" rel="stylesheet" type="text/css" href="./farmer_order_css/331.155057b0fc3b98ce38f8.css">
  <link data-module="order" rel="stylesheet" type="text/css"
    href="./farmer_order_css/old-order-list.3167532992dc830110e3.css">

  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
  <link href="./farmer_order_css/icon(1)" rel="stylesheet">
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
  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
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
  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
  <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
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

                        <div class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label">
<!--                            連結到訂單主頁 -->
                            <a href="./farmer_searchShopOrderPage.jsp" style="font-size: 30px ;color: #717d34 "><b>商城小農訂單管理</a>
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
<!-- 搜尋開始 -->
          <div data-v-550e8c91="" data-v-6de0ecc3="" class="page fulfillment-order">
            <div data-v-550e8c91="" class="fulfillment-order-page-content">
              <div data-v-acb72a84="" data-v-550e8c91="" class="order-list">
                <div data-v-acb72a84="" class="padding-wrap">
<!-- 查詢第二次就掛掉         action = shopOrder.do        -->
                  <form METHOD="post" ACTION="shopOrder.do">
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
                                    class="shopee-input__input" name="order_id">
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
                  </form>
                </div>
                <div data-v-acb72a84="" class="order-panel-header">
                  <div data-v-acb72a84="" class="title">
                    查詢結果
                  </div>
                  <div data-v-acb72a84="" class="more-action">
                    <!---->
                    <%=shopOrderVO==null%>
                    <%=memVO==null%>
<%--                     <%=shopProductVO==null%> --%>

                  </div>
                </div>
              </div>
              <!---->
              <div data-v-a414b804="" data-v-acb72a84="" class="order-list-pannel">
                <div data-v-a414b804="" class="order-list-section">
                  <div data-v-dff31658="" data-v-a414b804="" class="shopee-fixed-top-card">
                    <div data-v-dff31658="" class="fixed-container" style="top: 112px; z-index: 999;">
                      <div data-v-a414b804="" data-v-dff31658="" class="order-list-header">
                        <span data-v-a414b804="" data-v-dff31658="" class="item-product" min-width:80px;>
                          會員資料</span>
                          <span data-v-a414b804="" data-v-dff31658="" class="item-total">金額</span>
                          <span data-v-a414b804="" data-v-dff31658="" class="item-total">付款方式</span>
                          <span data-v-a414b804="" data-v-dff31658="" class="item-total">運送方式</span>
                          <span data-v-a414b804="" data-v-dff31658="" class="item-total">訂單時間</span>
                          <span data-v-a414b804="" data-v-dff31658="" class="item-action"
                            style="padding-left:80px;">功能</span></div>
                      </div>
                  </div>

                  <div data-v-1eaa89e5="" data-v-a414b804="" class="order-list-body"><a data-v-1eaa89e5=""
                      target="_blank" class="order-item">
                      <!-- 這邊是開始 -->
                      <div data-v-1eaa89e5="" class="order-title">
                        <div data-v-1eaa89e5="" class="title-prefix">
                          <div data-v-78a21620="" data-v-1eaa89e5="" class="user-header user-view-item simple-nofollow">
                            <div data-v-78a21620="" class="">
                              <i class="material-icons" style="color: #aaba8b;">person</i>

                            </div>
                            <div data-v-78a21620="" class="content">
                              <div data-v-78a21620="" class="text-overflow" style="">
                                <%=shopOrderVO.getMem_id()%>
                              </div>
                            </div>
                            <i class="material-icons" style="color: #aaba8b;display: inline;">sms</i>
                          </div>
                        </div>
                        <div data-v-1eaa89e5="" class="id-btn">
                        <span data-v-1eaa89e5="" class="orderid" style="color: red;font-size: 20px;">
                        訂單狀態 : &nbsp;
                        
                        <% int num = shopOrderVO.getOrder_state(); %>
                                  
                        <%= ((String[])request.getAttribute("order_state"))[num] %>
                            <%--${order_state_arr[x ]}這個方式會失敗，上面的會成功  --%>
                            
                            </span>
                        </div>
                      </div>
<!-- 訂單明細 -->
                        <div data-v-1274329c="" data-v-1eaa89e5="" class="order-item-root-wrap">
                          <div data-v-1274329c="" class="order-content">
                            <div data-v-1274329c="" class="order-list-item">
                              <div data-v-1274329c="" class="body">
                                <div data-v-1274329c="" class="item-product">
                                  <div data-v-3eef092e="" data-v-1274329c="" class="order-view-item order-view-item--small"
                                    highlight-return-item="" order-pre-order-flag="">
                                    <div data-v-3eef092e="" class="order-product-list">
                                      <div data-v-3eef092e="" class="order-product-wrapper normal-wrapper">
                                        <div data-v-3eef092e="" class="ct-item-product">
                                          <div data-v-3eef092e="" class="ct-item-product-inner">
                                            <div data-v-3eef092e="" class="ct-item-product-info">
                                              <div style="color:#717d34;font-size: 16px;">
                                                <div onclick="location.href='https://www.google.com.tw';"
                                                  style="cursor :pointer; color:#717d34;font-size: 16px;">
                                                  訂單編號&nbsp; : 
                                                  <%=shopOrderVO.getOrder_id()%></div>
                                              	</div>
                                              <span>
                                              收貨地址：<%=shopOrderVO.getOrder_add()%>
                                              </span>
                                              <span>收件人：陳小明</span>
                                              <span>收件人電話:0923123412</span>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>

                                <div data-v-1274329c="" class=" item-total">
                                  <div data-v-1274329c="" class="price" style="font-size: 16px;padding-top: 4px;">
									<!--金額-->
                                    $<%=shopOrderVO.getOrder_amount()%>
                                  </div>
                                </div>
                                
                                <div data-v-1274329c="" class=" item-total">
                                  <div data-v-1274329c="" class="price" style="font-size: 16px;padding-top: 4px;">
<!--                                     信用卡 -->
<!--                                     <br> -->
<%--                                     <%=shopOrderVO.getOrder_payment()%> --%>
                                    
                                    <% int payment = shopOrderVO.getOrder_payment(); %>
                                  
                        			<%= ((String[])request.getAttribute("order_payment"))[payment] %>
                                  </div>
                                  <div data-v-1274329c="" class="payment-method">
                                  </div>
                                </div>

                                <div data-v-1274329c="" class="item-total">
                                  <div data-v-1274329c="" class="price" style="font-size: 16px;padding-top: 4px;">
                                    小農宅配
                                  </div>
                                  <div data-v-1274329c="" class="payment-method">
                                  </div>
                                </div>

                                <div data-v-1274329c="" class="item-channel">
                                  <div data-v-1274329c="" class="carrier-name" style="font-size: 16px;padding-top: 4px;">
                                    <span>
                                      訂單時間：
                                      <br>
                                      <%=shopOrderVO.getOrder_date()%>
                                    </span>
                                    <br>
                                    <span>
                                      出貨時間：
                                      <br>
                                      <%=shopOrderVO.getOrder_ship_date()%>
                                    </span>
                                    <br>
                                    <span>
                                      完成時間：
                                      <br>
                                      <%=shopOrderVO.getOrder_finish_date()%>
                                    </span>

                                  </div>
                                  <div data-v-1274329c="" class="tracking-number-wrapper">
                                    <div data-v-1274329c="" class="lable">
                                    </div>
                                  </div>
                                </div>
                                  <!-- 功能按鈕 -->
                            <div data-v-1274329c="" class="item-action">
                              <button data-v-4325ccd1="" type="button"
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
                              </button>
                              <!-- 功能按鈕end -->
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                      <!-- 這邊是結束 -->

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
</body>

</html>