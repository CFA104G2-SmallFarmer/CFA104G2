<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.model.*"%>

<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FMemService" />
<%--   小農暱稱：${memSvc.getOneMem(fMemSvc.getOnefMem.mem_id).mem_nickname} --%>


<!-- form185開始 -->

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="csrf-param" content="authenticity_token">
  <meta name="csrf-token"
    content="MTox+EBrRuwHIR0noSGsb2DvNE5yK9mN9yvfhUb5DU+8BoCotRpDcw+HJZiqMtaHV1h0lZRdUnXWNvNmpla3Cg==">

  <!-- <script type="text/javascript" src="./addProj_files/6df56d3465"></script> -->
  <!-- <script src="./addProj_files/nr-1214.min.js"></script> -->
  <!-- <script async="" src="./addProj_files/clarity.js"></script>
  <script async="" src="./addProj_files/fbevents.js"></script>
  <script async="" src="./addProj_files/analytics.js"></script>
  <script async="" src="./addProj_files/9ve6cixxpl"></script> -->
  
  <!-- <script src="./addProj_files/465239610292033" async=""></script>
  <script src="./addProj_files/sdk.js" async="" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./addProj_files/6df56d3465(1)"></script>
  <script src="./addProj_files/nr-1214.min(1).js"></script>
  <script async="" src="./addProj_files/clarity(1).js"></script>
  <script async="" src="./addProj_files/fbevents(1).js"></script>
  <script async="" src="./addProj_files/analytics(1).js"></script>
  <script async="" src="./addProj_files/9ve6cixxpl(1)"></script>
  <script src="./addProj_files/465239610292033(1)" async=""></script>
  <script src="./addProj_files/sdk(1).js" async="" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./addProj_files/6df56d3465(2)"></script>
  <script src="./addProj_files/nr-1214.min(2).js"></script>
  <script async="" src="./addProj_files/fbevents(2).js"></script>
  <script async="" src="./addProj_files/analytics(2).js"></script>
  <script async="" src="./addProj_files/9ve6cixxpl(2)"></script>
  <script src="./addProj_files/465239610292033(2)" async=""></script>
  <script src="./addProj_files/sdk(2).js" async="" crossorigin="anonymous"></script>
  <script async="" src="./addProj_files/clarity(2).js"></script>
  <script type="text/javascript" src="./addProj_files/6df56d3465(3)"></script>
  <script src="./addProj_files/465239610292033(3)" async=""></script>
  <script src="./addProj_files/sdk(3).js" async="" crossorigin="anonymous"></script>
  <script src="./addProj_files/nr-1214.min(3).js"></script>
  <script async="" src="./addProj_files/fbevents(3).js"></script>
  <script id="facebook-jssdk" src="./addProj_files/sdk(4).js"></script>
  <script async="" src="./addProj_files/analytics(3).js"></script>
  <script async="" src="./addProj_files/9ve6cixxpl(3)"></script> -->

  <!-- <link
    href="https://www.zeczec.com/assets/logo-square-04c45286e84ea49d07c97c86625fbf3a75f4f32dd02da3ad3ca70a9a68fd0395.png"
    rel="apple-touch-icon"> -->
  <link href="https://www.zeczec.com/assets/fav-69601a279a66f2e6e31e508900d4f057559d3affcae42730d045b17d281107a6.png"
    rel="shortcut icon" type="image/x-icon">
  <link href="./addProj_files/css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" media="all"
    href="./addProj_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
</head>

<body class="intent-mouse">
  <header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
    <div class="cf container">
      <div class="f6 mv2 flex items-center justify-between">
        <!-- <a clsas="dib order-0" href="https://www.zeczec.com/"> -->
        <h1 class="gray text-mono hover-logo ma0">
          <div class="dib logo-safari-fix"><svg class="logo v-mid" style="height: 28px; width: 28px; "
              viewBox="0 0 138 138" xmlns="http://www.w3.org/2000/svg">
              <title>zeczec</title>
              <path
                d="M69 0a69 69 0 1 0 69 69A69 69 0 0 0 69 0zm38.7 75.53l-1.55 7.18c-.23 1.18-.81 1.54-1.82 1.49l-40.48-1.9a1.72 1.72 0 0 1-1.43-2.2l2.3-11.94a2.05 2.05 0 0 0-1.87-2.23l-31-2.09c-1 0-1.57-.66-1.57-1.82l1.16-6.81c.22-1.15.8-1.43 1.84-1.37l41.94 2.32a1.94 1.94 0 0 1 1.72 2.13l-2.19 12.13a1.88 1.88 0 0 0 1.87 2.1l30.06 1.39c.93 0 1.24.53 1.03 1.62z">
              </path>
            </svg>
          </div>


          <!-- <svg class="v-mid ml2" style="height: 20px; width: 44px; " viewBox="0 0 64.08 28.95"
              xmlns="http://www.w3.org/2000/svg">
              <title>嘖</title>
              <path
                d="M10.44 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41h-1.67a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.34a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .43.54zm14.04 1.73a.42.42 0 0 0-.42-.41H11.33a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.47 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.44-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42H2.74a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64z">
              </path>
              <path
                d="M16.307 23.2l.808 1.057-5.972 4.57a.59.59 0 0 1-.827-.11l-.456-.596a.59.59 0 0 1 .11-.824l5.504-4.21a.59.59 0 0 1 .827.11zM49.01 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41H55.3a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.32a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .41.54zm14.04 1.73a.42.42 0 0 0-.42-.41H49.9a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.48 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.41-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42h-2.41a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64zm-25.984 5.764l.754-.985a.59.59 0 0 1 .827-.11l5.504 4.21a.59.59 0 0 1 .11.825l-.453.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.02-.126z">
              </path>
              <path
                d="M54.943 23.217l.808 1.056-5.97 4.57a.59.59 0 0 1-.826-.11l-.45-.588a.59.59 0 0 1 .11-.827l5.504-4.21a.59.59 0 0 1 .827.11zm1.857 1.037l.753-.985a.59.59 0 0 1 .828-.11l5.506 4.21a.59.59 0 0 1 .11.825l-.455.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.012-.134zm-5.87-7.534l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.34 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.37.28zm-38.53 0l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.39 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.32.28z">
              </path>
            </svg> -->
        </h1>
        <!-- </a> -->
        <div
          class="mt0-ns mt3 pt2 ph2 nb1 nl3 nr3 tc tl-ns pa0-ns mh0-ns items-center db-ns bt bn-ns b--near-white flex-auto order-last order-1-ns w-100 w-auto-ns inline-flex">
          <span style="color: #717d34;font-size: 20px;font-weight: 300;"
            class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns" href="">&nbsp;&nbsp;小農認養管理專區</span>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/categories">認養專案管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/start_project">小農日誌管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/start_project">回到首頁</a>
        </div>
        <!-- <div class="tr order-2">
          <a aria-label="站內訊息" class="near-black dib gray pa2 mr3 v-mid tooltip tooltip-b"
            href="https://www.zeczec.com/inbox">
            <i class="material-icons f5 v-mid">
              mail
            </i>
          </a>
          <div class="js-activatable relative dib" data-userid="2046860">
            <button aria-label="個人選單" class="js-activatable-trigger button-text" type="button">
              <div class="button button-s button-avatar round w2 h2 b--light-gray"><img class="w-100 h-100"
                  src="./addProj_files/fallback.jpg" alt="Fallback"></div>
              <i class="material-icons f4 v-mid">arrow_drop_down</i>
            </button>
            <div class="dropdown r f6 tc w4">
              <a class="near-black db ph3 pv2 hover-blue db dn-l" href="https://www.zeczec.com/categories">探索</a>
              <a class="near-black db ph3 pv2 hover-blue db dn-l" href="https://www.zeczec.com/start_project">提案</a>
              <div class="bt db dn-l mv2 b--light-gray"></div>
              <a class="near-black db ph3 pv2 hover-blue bb b--light-gray" href="https://www.zeczec.com/users/aa12ex1">
                個人頁面
              </a>
              <a class="near-black db ph3 pv2 hover-blue" href="https://www.zeczec.com/account">
                贊助記錄
              </a>
              <a class="near-black db ph3 pv2 hover-blue" href="https://www.zeczec.com/users/following">
                追蹤計畫
              </a>
              <a class="near-black db ph3 pv2 hover-blue" href="https://www.zeczec.com/users/projects">
                提案記錄
              </a>
              <a class="near-black db ph3 pv2 hover-blue bt b--light-gray" href="https://www.zeczec.com/settings">
                帳號設定
              </a>
              <a class="near-black db ph3 pv2 hover-blue bb b--light-gray" href="https://www.zeczec.com/memberships">
                團隊設定
              </a>
              <form class="db ma3" id="edit_user_2046860" action="https://www.zeczec.com/users/sign_out"
                accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden"
                  name="_method" value="delete"><input type="hidden" name="authenticity_token"
                  value="OCdy8NO4TQ/ACnPwNgqd9qP2lPjI+SjJWKf0Zcrh1Im1G8OgJslIkMisS089GecelEHUIy6PozF5utiGKk5uzA=="><button
                  name="button" type="submit" class="button red button-s w-100">登出</button>
              </form>
            </div>
          </div>
        </div> -->
      </div>
    </div>
  </header>

  <div class="container"></div>
  <div class="bt b--light-gray bb">
    <div class="container cf">

      <div class="container ph3 ph0-l pt3 cf">
        <h2 class="flex mt0">
          <!-- <a class="order-1 f6 ml4-l black w-100 w-auto-l" href="https://www.zeczec.com/account"><i
              class="material-icons v-mid dark-gray f4">check</i>
            成功贊助記錄
          </a> -->
          <span class="order-0 flex-auto black w-100 w-auto-l" href="https://www.zeczec.com/account/cancelled">
            <i class="material-icons v-mid dark-gray f3">error</i>
            修改認養專案
          </span>
          <!-- <span class="order-3 f6 ml4-l black w-100 w-auto-l" href="https://www.zeczec.com/account/atm"><i
              class="material-icons v-mid dark-gray f4">timer</i>
            等待付款記錄
          </span> -->
        </h2>

      </div>

    </div>
  </div>
  <div class="container"></div>
  <div class="container mv4">
    <div class="gutter3-l flex">
      <div class="w-100 ph3 mb4 mb0">

	<!--   form開始 -->
        <form  class="js-previewable-sum" id="new_order"
          action="<%= request.getContextPath() %>/project/project.do" enctype="multipart/form-data"  method="post"  name="form1" >
		
		
		<input name="proj_id" type="hidden"  value="<%=projectVO.getProj_id()%>"> 
    	<input name="proj_state" type="hidden"  value="<%=projectVO.getProj_state()%>">       
 		<input name="actual_end_date" type="hidden"  value="<%=projectVO.getActual_end_date()%>">   
        <input name="proj_total_fund" type="hidden"  value="<%=projectVO.getProj_total_fund()%>"> 
        <input name="proj_total_count" type="hidden"  value="<%=projectVO.getProj_total_count()%>"> 
        <input name="mem_report_count" type="hidden"  value="<%=projectVO.getMem_report_count()%>"> 
          
          
          <div class="flex mb5 f6 gutter3">
            <div class="w-30-ns w-100 fl ph3">
             
              <div class="cf">
                <div class="for_img1">
                  <img id="img1" class="w-100 mb3" src="data:image/jpg;base64,${projectVO.base64Image}" alt="">
                </div>
              
              <!-- 			byte[] proj_main_pic, -->
                <label class="b" for="user_avatar">顯示圖片</label>
                <input id="upPic" class="w-100 border-box mv3" accept="image/*" type="file" name="proj_main_pic">
               
                <script>
                  $("#upPic").change(function () {
                    //當檔案改變後，做一些事 
                    readURL(this); // this代表<input id="upPic">
                  });

                  function readURL(input) {
                    if (input.files && input.files[0]) {
                      var reader = new FileReader();
                      reader.onload = function (e) {
                        $("#img1").attr('src', e.target.result);
                      }
                      reader.readAsDataURL(input.files[0]);
                    }
                  }
                </script>
              </div>

            </div>

            <div class="w-60-l w-100 ph3">

              <!-- <label class="b" for="user_name">認養專案名稱：</label><br> -->

			<!--   <input type="hidden" required="required" class="w-100" placeholder="認養專案編號" type="text" value="" -->
			<!--   name="proj_id"> -->
              
                
                <!-- 			Integer f_mem_id, -->
              <input type="hidden"  class="w-100" placeholder="小農編號" type="text" value="70000"
                name="f_mem_id" id="f_mem_id" value="hiddenValue">${memSvc.getOneMem(fMemSvc.getOnefMem(70000).mem_id).mem_nickname}，您好
                
				<!-- 			String proj_name, -->
              <label class="b" for="proj_name">認養專案名稱
                <span style="color: rgb(98, 134, 113);">&nbsp;&nbsp;</span></label>
              <input required="required" maxlength="50" class="w-100" placeholder="長度不得超過50個字" type="text" value="${projectVO.proj_name}"
                name="proj_name" id="proj_name">
                                         
                <!-- 			String proj_abstract, -->              
              <label class="b" for="proj_abstract">認養專案摘要</label>
              <textarea placeholder="長度不得超過500個字" maxlength="500" class="w-100" name="proj_abstract" id="proj_abstract"
                style="width: 250px; height: 250px;" >${projectVO.proj_abstract}</textarea>
                
                <!-- 			Integer proj_goal, -->
              <label class="b" for="proj_goal">募資目標金額</label>
              <span>NT$</span>
              <input required="required" class="w-100" placeholder="請輸入數字" type="text" value="${projectVO.proj_goal}"
                name="proj_goal" id="proj_goal">
              
                <!-- 			Date expected_end_date, -->
              <label class="b" for="expected_end_date">預計結束時間</label>
              <input required="required" class="w-60" placeholder="請選擇月份" type="date" value="${projectVO.expected_end_date}" name="expected_end_date"
                id="expected_end_date">

				<!--            String proj_intro感覺不需要 -->
				
				<!-- 			String proj_risk, --> 
              <label class="b" for="proj_risk">風險與變數</label>
              <textarea placeholder="長度不得超過300個字" maxlength="3000" class="w-100" name="proj_risk" id="proj_risk"
                style="width: 250px; height: 250px;" >${projectVO.proj_risk}</textarea>
                                
                <!-- 			String proj_video感覺不需要 -->
                
				<!-- 			Integer proj_pay -->
              <label class="b" for="proj_pay">可接受之付款方式</label>
              <select required="required" class="mb0 w-100" name="proj_pay" id="proj_pay">
                <option data-shipping-cost="0" value="0" <c:if test="${projectVO.proj_pay == 0}"> selected </c:if> >
                  皆可以(信用卡及銀行轉帳)
                </option>
                <option data-shipping-cost="1" value="1" <c:if test="${projectVO.proj_pay == 1}"> selected </c:if> >
                  信用卡
                </option>
                <option data-shipping-cost="2"  value="2" <c:if test="${projectVO.proj_pay == 2}"> selected </c:if>>
                  銀行轉帳
                </option>
              </select>
              
              
              
              <br>
              <br>
              <input type="hidden" name="action" value="update" >
              <div class="mt4">
              <input type="submit" name="commit" value="確認修改" class="button green b--green b mb3">
              <input type ="button" onclick=history.back() value="回到上一頁" class="button green b--green b mb3"></input>
              </div>
              
            </div>
        </form>
			







        <!-- Code injected by live-server -->
        <script type="text/javascript">
          // <![CDATA[  <-- For SVG support
          if ('WebSocket' in window) {
            (function () {
              function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                  var elem = sheets[i];
                  var parent = elem.parentElement || head;
                  parent.removeChild(elem);
                  var rel = elem.rel;
                  if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() ==
                    "stylesheet") {
                    var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                    elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date()
                      .valueOf());
                  }
                  parent.appendChild(elem);
                }
              }
              var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
              var address = protocol + window.location.host + window.location.pathname + '/ws';
              var socket = new WebSocket(address);
              socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
              };
              if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
              }
            })();
          } else {
            console.error(
              'Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
          }
          // ]]>
        </script>

        <div id="draggable-live-region" aria-relevant="additions" aria-atomic="true" aria-live="assertive" role="log"
          style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>
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
        <!-- Code injected by live-server -->

</body>

</html>