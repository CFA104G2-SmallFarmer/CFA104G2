<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.projOrder.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>
<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>

<%
//用session那到FMemVO
Integer f_mem_id = fMemVO.getF_mem_id();

	String membership= "seller";
%>
	
	
<%
Integer order_state = 3;
ProjOrderService projOrderSvc = new ProjOrderService();

Map<Integer, List<ProjOrderVO>> list2 = projOrderSvc.getAll_groupingBy_order_state(f_mem_id);
List<ProjOrderVO> list =list2.get(order_state);
pageContext.setAttribute("list", list);


/* List<ProjOrderVO> list = (List<ProjOrderVO>)request.getAttribute("ProjOrderVOlist_ByState"); */



%>

<!-- 領班 -->
<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />
<jsp:useBean id="projPerkSvc" scope="page" class="com.projPerk.model.ProjPerkService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />



<%
request.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","已完成","不成立(未處理)","不成立(已解決)"});
request.setAttribute("proj_pay_arr", new String[]{"信用卡","銀行轉帳"});
request.setAttribute("cancel_reason_arr", new String[]{"","逾期未付款","買家取消","小農取消","專案募資失敗"});
%>


<!DOCTYPE html>
<html class="TW" style="overflow: scroll;">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <link href="<%=request.getContextPath()%>/front-end/projOrder/farmer_order_css/icon" rel="stylesheet">

  <title>我家門前有塊地 | 小農認養訂單管理</title>
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
    <style>
    /*****************************/
.wrap {
    max-width: 960px;
    margin: 0 auto;
}

.header {
padding_top:10px;
    height: 78px;
 
    position: relative;
}

.logo {
    float: left;
    width: 250px;
    height: 76px;
    padding: 5px;
    /* background: #ffffff; */
    /* border: 3px solid rgb(255, 216, 157); */
}

.menu {
    float: right;
    font-size: 24px;

}

.menu li {
    list-style-type: none;
    float: left;
    display: inline-block;
    height: 60px;

}

.menu li a {
    display: block;
    color: #717d34;
    text-decoration: none;
    padding-left: 1em;
    padding-right: 0;
    padding-top: 0.4em;

}

.menu li a:hover {
    /* background: #8ca27e; */
    color: #8ca27e;
}

/*在pc隱藏漢堡選單,showmenu右上角點擊按鈕*/

.showmenu {
    display: none;
    color: #FFCCCC;
}

/*在手機瀏覽漢堡選單*/
.div1 {
    width: 35px;
    height: 5px;
    background-color: #aaba8b;
    margin: 6px 0;
}

@media (max-width: 767px) {
    .menu {
        /*隱藏選單開始*/
        max-height: 0;
        overflow: hidden;
        /*隱藏選單結束*/
        transition: max-height 2.3s;
        margin-top: 1px;
        /*絕對定位疊在網頁上*/
        position: absolute;
        z-index: 100;
        /*header 80px+1px boder 線條*/
        top: 81px;
        left: 0;
        right: 0;
        background: #d4e1bb;
    }

    .menu li {

        list-style-type: none;
        float: none;
        border-bottom: 1px dashed #919191;
        display: inline;
    }



    .menu li a {
        transition: all 0.2s;
        padding-left: 0;
        padding-right: 0;
        padding-top: 0.7em;
        padding-bottom: 0.7em;
    }

    .menu li a:hover {
        background: #8ca27e;
        color: #fff;
    }

    .showmenu {
        /* transition: all 0.2s; */
        display: block;
        float: right;
        padding: 20px;


    }

    /*jQ點擊後動態在 body 加上 class */
    .menu-show .menu {
        max-height: 500px
    }/*****************************/
.wrap {
    max-width: 960px;
    margin: 0 auto;
}

.header {
padding_top:10px;
    height: 78px;
 
    position: relative;
}

.logo {
    float: left;
    width: 250px;
    height: 76px;
    padding: 5px;
    /* background: #ffffff; */
    /* border: 3px solid rgb(255, 216, 157); */
}

.menu {
    float: right;
    font-size: 24px;
margin-top:20px;
}

.menu li {
    list-style-type: none;
    float: left;
    display: inline-block;
    height: 60px;
   margin-top:20px;

}

.menu li a {
    display: block;
    color: #717d34;
    text-decoration: none;
    padding-left: 1em;
    padding-right: 0;
    padding-top:0.9em;

} 

.menu li a:hover {
    /* background: #8ca27e; */
    color: #8ca27e;
}

/*在pc隱藏漢堡選單,showmenu右上角點擊按鈕*/

.showmenu {
    display: none;
    color: #FFCCCC;
}

/*在手機瀏覽漢堡選單*/
.div1 {
    width: 35px;
    height: 5px;
    background-color: #aaba8b;
    margin: 6px 0;
}

@media (max-width: 767px) {
    .menu {
        /*隱藏選單開始*/
        max-height: 0;
        overflow: hidden;
        /*隱藏選單結束*/
        transition: max-height 2.3s;
        margin-top: 1px;
        /*絕對定位疊在網頁上*/
        position: absolute;
        z-index: 100;
        /*header 80px+1px boder 線條*/
        top: 81px;
        left: 0;
        right: 0;
        background: #d4e1bb;
    }

    .menu li {

        list-style-type: none;
        float: none;
        border-bottom: 1px dashed #919191;
        display: inline;
    }



    .menu li a {
        transition: all 0.2s;
        padding-left: 0;
        padding-right: 0;
        padding-top: 0.7em;
        padding-bottom: 0.7em;
    }

    .menu li a:hover {
        background: #8ca27e;
        color: #fff;
    }

    .showmenu {
        /* transition: all 0.2s; */
        display: block;
        float: right;
        padding: 20px;


    }

    /*jQ點擊後動態在 body 加上 class */
    .menu-show .menu {
        max-height: 500px
    }
  </style>
  
</head>

<body class=" route-index route-portal-sale route-portal-sale-order route-portal-sale-order">

<header>

         <%--  <jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" />  --%>
         
</header>
<header>
<script>
    $(document).ready(function () {
        $('.showmenu').on('click', function (e) {
            e.preventDefault();
            $('body').toggleClass('menu-show');
          }

        );
      }

    );
  </script>
  <div class="wrap">
    <div class="header">
      <div class="logo"><img style="margin-top:5px;width:210px"src="<%=request.getContextPath()%>/front-end/home/images/farmerManage-Final.png">
      </div>
      <ul class="menu">
               <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByFmem.jsp">小農認養專案管理&nbsp;</a></li>

        <li><a href="<%=request.getContextPath()%>/front-end/projOrder/listAllOrderByFmem.jsp">小農認養訂單管理&nbsp;</a></li>

       <li><a href="<%=request.getContextPath()%>/front-end/home/home.jsp">回到首頁 &nbsp;</a></li>
        <li><a href="#"><span class="material-icons" style="font-size:27px">mail_outline</span></a></li>
      </ul>
      <div class="div0 showmenu">
        <!-- <a href="#" >menu</a> -->
        <div class="div1"></div>
        <div class="div1"></div>
        <div class="div1"></div>
      </div>

      <!-- <a href="#" class="showmenu">menu</a> -->
    </div>
     </div>
</header>
<div style="border:solid 2px lightgray"></div>

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
                        <div class="shopee-tabs__nav-tab" style="white-space: normal;">
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
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_0_ByFmem.jsp';" class="shopee-tabs__nav-tab  " style="white-space: normal;">
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
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_3_ByFmem.jsp';" class="shopee-tabs__nav-tab active" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">已完成</span>
                          </div>
                        </div>
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_4_ByFmem.jsp';" class="shopee-tabs__nav-tab" style="white-space: normal;">
                          <div data-v-ddf12cca="" class="tab-label"><span data-v-ddf12cca="">不成立(未處理)</span>
                          </div>
                        </div>
                        <div onclick="location.href=
'<%=request.getContextPath()%>/front-end/projOrder/listAllOrder_State_5_ByFmem.jsp';" class="shopee-tabs__nav-tab" style="white-space: normal;">
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
                       <c:set var="num" scope="request" value="${param.order_state}"/>
                    

<h1 style="float:left;font-size:30px"><strong>已完成</strong></h1><br>


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
                      
                   
                       
<%@ include file="/front-end/projOrder/page1.file" %>
                                            
                       <c:forEach var="projOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                  

                      <!-- 這邊是開始 -->
                      
                      <div data-v-1eaa89e5="" class="order-title">
                        <div data-v-1eaa89e5="" class="title-prefix">
                          <div data-v-78a21620="" data-v-1eaa89e5="" class="user-header user-view-item simple-nofollow">
                            <div data-v-78a21620="" class="">
                              <i class="material-icons" style="color: #aaba8b;">person</i>

                            </div>
                            <div data-v-78a21620="" class="content">
                              <div data-v-78a21620="" class="text-overflow" style="">
                              ${memSvc.getOneMem(projOrderVO.mem_id).mem_name}


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

                                            </div><br>

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
<%--                                   <%=projPerkVO.getPerk_abbr_name()%> --%>
                                </div>
                                <div data-v-1274329c="" class="payment-method">

                                </div>
                              </div>
                              <div data-v-1274329c="" class="item-total">
                                <div data-v-1274329c="" class="price">
                                <c:set var="num" scope="request" value="${projOrderVO.order_state}"/>

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
							      <%--  ${projOrderVO.order_cancel_reason} --%>
							    </c:otherwise>
								</c:choose>
                                  
                                    <c:set var="y" scope="request" value="${projOrderVO.order_cancel_reason}"/>
                                                           
                                ${cancel_reason_arr[y]}
                                

                                </div>
                                <div data-v-1274329c="" class="tracking-number-wrapper">
                                  <div data-v-1274329c="" class="lable">
                                  </div>
                                </div>
                              </div>
                              <div data-v-1274329c="" class="item-action">
                              
                              <c:choose>
    							<c:when test="${projOrderVO.order_state ==0}">
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
    							
    							<input type="hidden" name="f_mem_id" value="${fMemVO.f_mem_id}">
    							<input type="hidden" name="membership" value="seller">
    							
    							<button data-v-4325ccd1=""
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      確認收款
                                    </span></button>
                                 </FORM>
                                     <br>
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
			
			    				<input type="hidden" name="f_mem_id" value="${fMemVO.f_mem_id}">
    							<input type="hidden" name="membership" value="seller">
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      取消訂單
                                    </span>
                                  </button> 
                                  </FORM>
   							 </c:when>
   							 <c:when test="${projOrderVO.order_state ==1}">
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
			     				<input type="hidden" name="action" value="update_state_to_2_and_then_show_All">	 			  
			
								<input type="hidden" name="f_mem_id" value="${fMemVO.f_mem_id}">
    							<input type="hidden" name="membership" value="seller">
			
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      已出貨
                                    </span>
                                  </button> 
                                  </FORM>
                                    
                                    <br>
                                    
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
			
								<input type="hidden" name="f_mem_id" value="${fMemVO.f_mem_id}">
    							<input type="hidden" name="membership" value="seller">
			
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      取消訂單
                                    </span>
                                  </button> 
                                  </FORM>
   							 </c:when>
    							<c:when test="${projOrderVO.order_state ==2}">
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
			
								<input type="hidden" name="f_mem_id" value="${fMemVO.f_mem_id}">
    							<input type="hidden" name="membership" value="seller">
			
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      完成訂單
                                    </span>
                                  </button> 
                                  </FORM>
   							 </c:when>
   							   	<c:when test="${projOrderVO.order_state ==3}">
    							
   							 </c:when>
   							  	<c:when test="${projOrderVO.order_state ==4}">
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
			
								<!-- 	下單同時更新專案募資總額、人數及方案總人數這三項，所以取這變數			 -->
								<input type="hidden" name="perk_id"  value="${projOrderVO.perk_id}">	
			
								<input type="hidden" name="f_mem_id" value="${fMemVO.f_mem_id}">
    							<input type="hidden" name="membership" value="seller">
			
			
                                  <button data-v-4325ccd1="" 
                                    class="shopee-button shopee-button--normal" type="submit"><span>
                                      確認退款
                                    </span>
                                  </button> 
                                  </FORM>
   							 </c:when>
   						
  						  <c:otherwise>
  						  
  						  
  					  		</c:otherwise>
							</c:choose>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- 這邊是結束 -->
                      </c:forEach>
          <%@ include file="/front-end/projOrder/page2.file" %>


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