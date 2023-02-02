<%@page import="com.projOrder.model.ProjOrderVO" %>
<%@page import="com.mem.model.MemVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.project.model.*" %>
<%@ page import="com.projPerk.model.*" %>
<%MemVO memVO = (MemVO) session.getAttribute("memVO");%>

<%
    pageContext.setAttribute("memVO", memVO);
    ProjPerkVO projPerkVO = (ProjPerkVO) session.getAttribute("projPerkVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
    ProjectVO projectVO = (ProjectVO) session.getAttribute("projectVO");
    pageContext.setAttribute("projPerkVO", projPerkVO);
    pageContext.setAttribute("projectVO", projectVO);
    ProjOrderVO projOrderVO = (ProjOrderVO) request.getAttribute("projOrderVO");
%>


<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService"/>
<jsp:useBean id="projPerkSvc1" scope="page" class="com.projPerk.model.ProjPerkService"/>
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService"/>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="zh_TW" property="og:locale">
    <meta content="zh_TW" property="og:locale:alternate">

    <title>我家門前有塊地 | ${projectVO.proj_name} |</title>
    <link href="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" media="all"
          href="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
    <style>

    </style>
</head>

<body class="intent-mouse">

<header>
    <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp"/>
</header>
<header style="padding-bottom: 5px"
        class="relative z-2 bb pv2 ph3 ph0-l b--near-white"></header>
<div class="container"></div>
<div class="bt b--light-gray bb">
    <div class="container cf">
        <div class="w-100">
            <div class="w5-l dib fl-l mr3-l w-100">
                <div class="aspect-ratio-project-cover bg-near-white"
                     style="background-image: url(&#39;data:image/jpg;base64,${projectVO.base64Image}&#39;)"></div>
                <!-- 圖片待抽換 -->
            </div>
            <div class="pv2 ph0-l ph3"><a href="#">
                <h2 class="f5 mb0 dib mt1 f5 b">${projectVO.proj_name}</h2>
            </a>
                <div class="gray f7 mb3">
                    <span></span> <a class="b"
                                     href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a><span
                        class="mh2"></span>
                </div>
                <span class="b">目前總認養金額 NT$${projectVO.proj_total_fund}</span> <span class="f7 dark-gray">
            / 目標 NT$${projectVO.proj_goal} </span>
            </div>
        </div>
    </div>
</div>
<div class="container"></div>
<div class="container mv4">
    <div class="gutter3-l flex">
        <div class="w-100 ph3 mb4 mb0">
            <div class="flex mb5 f6 gutter3">
                <div class="w-40-l w-100 ph3">
                    <div style="margin-bottom: 0px" class="pa3 ba bw1 b--inherit round-s light-gray mb4 db  ">

                        <div width="100%" class="mb2 round-s"
                             style="background-image: url(&#39;data:image/jpg;base64,${projPerkVO.base64Image}&#39;)"></div>


                        <div class="black b f4">NT$${projPerkVO.perk_fund}</div>
                        <div class="f7 mv2">
                  <span style="background-color:#b35900 ;" class="f7 white ph2 bg-red b dib"> 剩餘
                    ${projPerkVO.perk_limited - projPerkVO.perk_total_count} 份 </span><span
                                class="black ph2 bg-near-white dib"> 已被贊助 <span
                                class="b">${projPerkVO.perk_total_count}</span> /
                    ${projPerkVO.perk_limited} 次
                  </span>
                        </div>
                        <div class="black f6 mv-child-0 maxh5 maxh-none-ns overflow-auto">
                            <p>
                                【${projPerkVO.perk_abbr_name}】 <br>${projPerkVO.perk_intro}
                            </p>
                            <br>
                            <p style="margin-block-start:0px">
                                寄送地區：${projPerkVO.perk_ship_area}
                            </p>
                        </div>
                        <div class="mt3 gray tc ph2 f7 ba">預計於${projPerkVO.perk_ship_date}實現</div>
                    </div>
                    <div class="db w-100 bn js-preview-sum mt3" id="preview">
                        <div class="flex items-start f6 pv2">
                            <div class="nowrap b flex-auto">選項金額</div>
                            <div class="nowrap tr">
                                NT$${projPerkVO.perk_fund}
                            </div>
                        </div>
                        <div class="flex items-start f6 bt pv2 b--light-gray">
                            <div class="nowrap b flex-auto">
                                運費
                                ：台灣（本島）
                            </div>
                            <div class="nowrap tr">
                                +
                                NT$0
                            </div>
                        </div>
                        <div class="flex items-start f4 bt pb2 pt3 b--light-gray bw2">
                            <div class="nowrap b flex-auto">總價</div>
                            <div class="nowrap tr">
                                NT$${projPerkVO.perk_fund}

                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-60-l w-100 ph3">

                    <!--  FORM開始 -->
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do" name="form1">
                        <div>
                            <p style="line-height:0px">
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
                        <div class="">
                            <label class="b f6 near-black mb3" >付款方式</label>
                            <c:choose>
                                <c:when test="${projectVO.proj_pay==1}">
                                    <div class="absolute mv3 ml3">
                                        <input required class="js-payment-method" type="radio"
                                               value="1" ${(projOrderVO.order_pay==1)? "checked":""}
                                               name="order_pay" id="order_payment_method_credit_card">
                                    </div>
                                    <label
                                            style="background-color: #eff8ec;"
                                            class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                                            for="order_payment_method_credit_card"><i
                                            class="f5 v-mid material-icons mh2">credit_card</i>
                                        信用卡付款
                                    </label>
                                </c:when>
                                <c:when test="${projectVO.proj_pay==2}">
                                    <div class="absolute mv3 ml3">
                                        <input class="js-payment-method" type="radio"
                                               value="2" ${(projOrderVO.order_pay==2) ? "checked":""} name="order_pay"
                                               id="order_payment_method_atm">
                                    </div>

                                    <label style="background-color: #eff8ec;"
                                           class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                                           for="order_payment_method_atm"><i class="f5 v-mid material-icons mh2">account_balance</i>
                                        銀行轉帳
                                    </label>
                                </c:when>
                                <c:otherwise>
                                    <div class="absolute mv3 ml3">
                                        <input required class="js-payment-method" type="radio"
                                               value="1" ${(projOrderVO.order_pay==1)? "checked":""}
                                               name="order_pay" id="order_payment_method_credit_card1">
                                    </div>
                                    <label
                                            style="background-color: #eff8ec;"
                                            class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                                            for="order_payment_method_credit_card1"><i
                                            class="f5 v-mid material-icons mh2">credit_card</i>
                                        信用卡付款
                                    </label>
                                    <div class="absolute mv3 ml3">
                                        <input class="js-payment-method" type="radio"
                                               value="2" ${(projOrderVO.order_pay==2) ? "checked":""} name="order_pay"
                                               id="order_payment_method_atm1">
                                    </div>
                                    <label style="background-color: #eff8ec;"
                                           class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                                           for="order_payment_method_atm1"><i class="f5 v-mid material-icons mh2">account_balance</i>
                                        銀行轉帳
                                    </label>
                                </c:otherwise>
                            </c:choose>
                            <div class="br1 pa3 js-credit-card-warning ba b--black-10 mt2 br2">
                                <ul class="ma0 pl3-ns black-70">
                                    <li>
                                        您了解您的認養是支持小農的一種方式٩(●˙▿˙●)۶ฺ，也了解認養專案實踐過程中充滿變數，專案不一定能確保回饋。
                                    </li>
                                </ul>
                            </div>
                            <div class="br1 pa3 js-atm-warning ba b--black-10 dn mt2 br2">
                                <ul class="ma0 pl3-ns black-70">
                                    <li>
                                        您了解您的認養是支持小農的一種方式٩(●˙▿˙●)۶ฺ，也了解認養專案實踐過程中充滿變數，專案不一定能確保回饋。
                                    </li>
                                </ul>
                            </div>
                            <label class="mt3 b">收件地點</label>
                            <div class="flex mt3">
                                <div class="flex-auto">
                                    <label class="b" for="order_address">地址</label>
                                    <input maxlength="40" placeholder="請輸入收件地址" class="mb3 w-100"
                                           autocomplete="street-address" type="text"
                                           value="${projOrderVO.order_addr}" name="order_addr" id="order_address">
                                </div>
                                <div class="w4 pl3 js-postcode">
                                    <label class="b" for="order_postcode">郵遞區號</label>
                                    <input placeholder="請輸入3碼" class="mb3 w-100 js-postcode-field"
                                           autocomplete="postal-code"
                                           type="text" value="${projOrderVO.order_zipcode}" name="order_zipcode"
                                           id="order_postcode">
                                </div>
                            </div>
                            <label class="b" for="order_recipient">收件人</label>
                            <input maxlength="25" placeholder="請輸入收件人名稱" class="mb3 w-100" type="text"
                                   value="${projOrderVO.order_receiver}" name="order_receiver"
                                   id="order_recipient">
                            <label class="b" for="order_phone">聯絡電話</label>
                            <input placeholder="寄送人聯絡及付款確認使用。請填寫全碼，如 0910123888、0223459827。"
                                   class="mb3 w-100" maxlength="20"
                                   autocomplete="tel-national" size="20" type="text" value="${projOrderVO.order_tel}"
                                   name="order_tel"
                                   id="order_phone">
                            <button class="button green" type="submit">
                                立刻認養&nbsp;
                                <span class="b">
                    NT<span class="js-sum">${projPerkVO.perk_fund}</span>
                    </span>
                            </button>
                            <a class="gray f6 ml3 dn-ns"
                               href="#">
                                <i class="material-icons v-mid f6 mr1">help_outline</i>
                                金額細節
                            </a>
                            <p style="font-size: 14px;" class="f7 gray mt2 lh-title">
                                募資結束前，都可以修改訂單收件資料。
                                <br>
                                <br>
                                提案人有權決定是否接受認養訂單。
                                <br>
                                如提案人因故決定不接受認養訂單，將會取消訂單並主動退還訂單款項。
                            </p>
                            <input type="hidden" name="mem_id" value="${memVO.mem_id}">
                            <input type="hidden" name="perk_id" value="${projPerkVO.perk_id}">
                            <input type="hidden" name="action" value="insert">
                            <button type="submit" class="dn js-update-sum"
                                    formnovalidate="">Preview
                            </button>
                        </div>
                    </FORM>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/back-7b8325ae78ca7c794fdc8c2ff6c2ef5676fc24748e3a262866e67978e98c4561.js"
        type="text/javascript"></script>
<div id="fb-root" class=" fb_reset">
    <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
        <div></div>
    </div>
</div>

<script type="text/javascript">
    fbq('init', '465239610292033');
    fbq('track', 'PageView');
</script>

<div id="draggable-live-region" aria-relevant="additions" aria-atomic="true" aria-live="assertive" role="log"
     style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>

<footer>
    <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp"/>
</footer>

</body>
</html>
