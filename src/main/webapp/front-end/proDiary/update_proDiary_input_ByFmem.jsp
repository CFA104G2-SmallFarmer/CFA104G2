<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.proDiary.model.*"%>

<%
ProDiaryVO proDiaryVO = (ProDiaryVO) request.getAttribute("proDiaryVO"); //EmpServlet.java(Concroller), 存入req的empVO物件 
/* ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");  */
%>

<!-- 領班 -->
<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />
<jsp:useBean id="proDiarySvc" scope="page" class="com.proDiary.model.ProDiaryService" />

<%-- ${proDiaryVO.dir_id}
${projectSvc.getOneProject(proDiarySvc.getOneProDiary(proDiaryVO.dir_id).proj_id).proj_name} --%>
<!-- 我的筆記 join -->


<%--專案名稱： ${projectSvc.getOneProject(proDiarySvc.getOneProDiary(proDiaryVO.dir_id).proj_id).proj_name} --%>
<!-- proDiary物件 : (proDiarySvc.getOneProDiary(proDiaryVO.dir_id).proj_id) -->

<%-- proj_id  :  ${proDiarySvc.getOneProDiary(proDiaryVO.dir_id).proj_id} --%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<title>我家門前有塊地 | ${projectSvc.getOneProject(proDiarySvc.getOneProDiary(proDiaryVO.dir_id).proj_id).proj_name}</title>
  <!-- datepicker加入這段 -->
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https:/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                
          <!-- 這段給emoji的 -->
          <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous" />
  <script>
    $(function () {
      $("#datepicker").datepicker({
        dateFormat: "yy-mm-dd"
      })

    });
    //設定中文語系
    $.datepicker.regional['zh-TW'] = {
      dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
      dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
      monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
      monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
      prevText: "上月",
      nextText: "次月",
      weekHeader: "週"

    };
    //將預設語系設定為中文
    $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
    
    $(function() {
        //This array containes all the disabled array
          datesToBeDisabled = ["2022-03-25", "2022-03-28"];

            $("#datepicker").datepicker({
              changeMonth: true,
              changeYear: true,
              minDate : 0,
              todayHighlight: 1,
              beforeShowDay: function (date) {
                  var dateStr = jQuery.datepicker.formatDate('yy-mm-dd', date);
                      return [datesToBeDisabled.indexOf(dateStr) == -1];
              },

            });
    });
  </script>
  <!-- 加入這段 -->



  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="csrf-param" content="authenticity_token">
  <meta name="csrf-token"
    content="MTox+EBrRuwHIR0noSGsb2DvNE5yK9mN9yvfhUb5DU+8BoCotRpDcw+HJZiqMtaHV1h0lZRdUnXWNvNmpla3Cg==">




<!-- 
  <link href="https://www.zeczec.com/assets/fav-69601a279a66f2e6e31e508900d4f057559d3affcae42730d045b17d281107a6.png"
    rel="shortcut icon" type="image/x-icon"> -->
  <link href="<%=request.getContextPath()%>/front-end/projPerk/addPerk_css/css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" media="all"
    href="<%=request.getContextPath()%>/front-end/projPerk/addPerk_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
</head>

<body class="intent-mouse">
  <!-- <header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
    <div class="cf container">
      <div class="f6 mv2 flex items-center justify-between">
        <a clsas="dib order-0" href="https://www.zeczec.com/">
        <h1 class="gray text-mono hover-logo ma0">
          <div class="dib logo-safari-fix"><svg class="logo v-mid" style="height: 28px; width: 28px; "
              viewBox="0 0 138 138" xmlns="http://www.w3.org/2000/svg">
              <title>zeczec</title>
              <path
                d="M69 0a69 69 0 1 0 69 69A69 69 0 0 0 69 0zm38.7 75.53l-1.55 7.18c-.23 1.18-.81 1.54-1.82 1.49l-40.48-1.9a1.72 1.72 0 0 1-1.43-2.2l2.3-11.94a2.05 2.05 0 0 0-1.87-2.23l-31-2.09c-1 0-1.57-.66-1.57-1.82l1.16-6.81c.22-1.15.8-1.43 1.84-1.37l41.94 2.32a1.94 1.94 0 0 1 1.72 2.13l-2.19 12.13a1.88 1.88 0 0 0 1.87 2.1l30.06 1.39c.93 0 1.24.53 1.03 1.62z">
              </path>
            </svg>
          </div>
        </h1>

        <div
          class="mt0-ns mt3 pt2 ph2 nb1 nl3 nr3 tc tl-ns pa0-ns mh0-ns items-center db-ns bt bn-ns b--near-white flex-auto order-last order-1-ns w-100 w-auto-ns inline-flex">
          <span style="color: #717d34;font-size: 20px;font-weight: 300;"
            class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns" href="">&nbsp;&nbsp;小農認養管理專區</span>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/categories">認養專案管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/categories">認養訂單管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/start_project">小農日誌管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/start_project">回到首頁</a>
        </div>
        <div class="tr order-2">
          <a aria-label="站內訊息" class="near-black dib gray pa2 mr3 v-mid tooltip tooltip-b"
            href="https://www.zeczec.com/inbox">
            <i class="material-icons f5 v-mid">
              mail
            </i>
          </a>

        </div>
      </div>
    </div>
  </header> -->

<header style="height: 90px">
		<jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" />
	</header>
	
	<header style="padding-bottom: 5px"
		class="relative z-2 bb pv2 ph3 ph0-l b--near-white">

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
            新增日誌
             <span style="font-size:18px;color:gray;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;認養專案:${projectSvc.getOneProject(proDiarySvc.getOneProDiary(proDiaryVO.dir_id).proj_id).proj_name}</span>
          </span> 
          </span>
          <p><%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if></p>
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
      <!-- form開始 -->
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/proDiary/proDiary.do" name="form1" enctype="multipart/form-data">
          
          <div class="flex mb5 f6 gutter3">
            <div class="w-30-ns w-100 fl ph3">
              <!-- <div class="cf">
                <img class="w-100 round mb3" src="./小農新增回饋方案_files/farmforUploadPic/farmforUploadPic.png"
                  alt="Fallback">

                <label class="b" for="user_avatar">顯示圖片</label>

                <label class="b" for="user_avatar">上傳方案插圖</label>
                <input class="w-100 border-box mv3" accept="image/*" type="file" name="user[avatar]" id="user_avatar">

              </div> -->

              <div class="cf">
                <div class="for_img1">
                  <img id="img1" class="w-100 mb3" src="<%=request.getContextPath()%>/proDiary/ProDiaryDBGifReader4?id=${proDiaryVO.dir_id}" alt="">
                </div>
                
                <label class="b" for="user_avatar">顯示圖片</label>
                <input id="upPic" class="w-100 border-box mv3" accept="image/*" type="file" name="dir_pic"value="<%=(proDiaryVO==null)? "" : proDiaryVO.getDir_pic()%>">
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

              
      		 <input name="dir_id" type="hidden"  value="${proDiaryVO.dir_id}"> 
              
              
              <label class="b" for="dir_upload_date">日誌日期</label>
              <input  class="w-60" type="text" placeholder="請選擇日期" name="dir_upload_date" value="${proDiaryVO.dir_upload_date}"
                id="datepicker">
                
                <label class="b" for="dir_procedure">生產過程</label>
              <select  class="mb0 w-100" name="dir_procedure" id="dir_procedure">
       														
                <option data-shipping-cost="120" value="育苗" ${(proDiaryVO.dir_procedure=="育苗")? "selected":""}>
                  育苗
                </option>
                <option data-shipping-cost="120" value="整地" ${(proDiaryVO.dir_procedure=="整地")? "selected":""}>
                  整地
                </option>
                 <option data-shipping-cost="120" value="灌溉" ${(proDiaryVO.dir_procedure=="灌溉")? "selected":""}>
                  灌溉
                </option>
                <option data-shipping-cost="120" value="除草" ${(proDiaryVO.dir_procedure=="除草")? "selected":""}>
                  除草
                </option>
                <option data-shipping-cost="120" value="採收" ${(proDiaryVO.dir_procedure=="採收")? "selected":""}>
                  採收
                </option>
                <option data-shipping-cost="120" value="修剪" ${(proDiaryVO.dir_procedure=="修剪")? "selected":""}>
                  修剪
                </option>
                <option data-shipping-cost="120" value="保護" ${(proDiaryVO.dir_procedure=="保護")? "selected":""}>
                  保護
                </option>
                <option data-shipping-cost="120" value="施肥" ${(proDiaryVO.dir_procedure=="施肥")? "selected":""}>
                  施肥
                </option>
                <option data-shipping-cost="120" value="包裝" ${(proDiaryVO.dir_procedure=="包裝")? "selected":""}>
                  包裝
                </option>
                <option data-shipping-cost="120" value="運輸" ${(proDiaryVO.dir_procedure=="運輸")? "selected":""}>
                  運輸
                </option>
                <option data-shipping-cost="120" value="加工" ${(proDiaryVO.dir_procedure=="加工")? "selected":""}>
                  加工
                </option>
                <option data-shipping-cost="120" value="餵食" ${(proDiaryVO.dir_procedure=="餵食")? "selected":""}>
                  餵食
                </option>
                
             
              </select>
              
              
               <label style="margin:5px" class="b" for="dir_product">產品/種苗</label>
              <input maxlength="15" class="w-100" placeholder="長度不得超過15個字" type="text" value="<%=(proDiaryVO==null)? "" :proDiaryVO.getDir_product()%>"
                name="dir_product" id="dir_product">
                
                <label class="b" for="dir_emoji">心情</label>
              <%-- <input maxlength="15" class="w-100" placeholder="長度不得超過15個字" type="text" value="<%=(proDiaryVO==null)? "" :proDiaryVO.getDir_product()%>"
                name="dir_product" id="dir_product"> --%>
              
              <div class="absolute mv3 ml3">
                  <input required class="js-payment-method" type="radio" value="開心" ${(proDiaryVO.dir_emoji=="開心")? "checked":""}
                    name="dir_emoji" id="happy">
                </div>
                <label
                  style="background-color: white;"class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                  for="happy">&nbsp;<i class='fas fa-grin'
                    style='color:rgb(147, 147, 147, 0.769);font-size:32px;'></i>
                  &nbsp;開心
                </label>
                
                
                <div class="absolute mv3 ml3">
                  <input required class="js-payment-method" type="radio" value="歡樂" ${(proDiaryVO.dir_emoji=="歡樂")? "checked":""}
                    name="dir_emoji" id="very_happy">
                </div>
                <label
                  style="background-color: white;"class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                  for="very_happy">&nbsp;<i class='fas fa-laugh-squint'
                    style='color:rgb(147, 147, 147, 0.769);font-size:32px;'></i>
                  &nbsp;歡樂
                </label>
              
              
              
              
                            <div class="absolute mv3 ml3">
                  <input required class="js-payment-method" type="radio" value="難過" ${(proDiaryVO.dir_emoji=="難過")? "checked":""}
                    name="dir_emoji" id="sad">
                </div>
                <label
                  style="background-color: white;"class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                  for="sad">&nbsp;
                  <i class='fas fa-sad-tear'
                    style='color:rgb(147, 147, 147, 0.769);font-size:32px;'></i>
                  &nbsp;難過
                </label>
                
                
                                            <div class="absolute mv3 ml3">
                  <input required class="js-payment-method" type="radio" value="驚訝" ${(proDiaryVO.dir_emoji=="驚訝")? "checked":""}
                    name="dir_emoji" id="surprise">
                </div>
                <label
                  style="background-color:white;"class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                  for="surprise">&nbsp;<i class='fas fa-surprise'
                    style='color:rgb(147, 147, 147, 0.769);font-size:32px;'></i>
                  &nbsp;驚訝
                </label>
                                       <div class="absolute mv3 ml3">
                  <input required class="js-payment-method" type="radio" value="不顯示心情" ${(proDiaryVO.dir_emoji=="不顯示心情")? "checked":""}
                    name="dir_emoji" id="noemoji">
                </div>
                <label
                  style="background-color:white;"class="db mb2 br2 hover-b--dark-gray b--transparent ba b pointer bg-near-white pl4 pv3 pl4 payment-method-option"
                  for="noemoji">&nbsp;
                  &nbsp;不顯示心情
                </label>
                
                <label class="b" for="dir_notes">心情筆記</label>
              <textarea maxlength="200" placeholder="文長不得超過200個字" maxlength="200" class="w-100" name="dir_notes" value=""
                id="dir_notes" style="width: 400px; height: 100px;"><%=(proDiaryVO==null)? "" :proDiaryVO.getDir_notes()%></textarea>
                 
               <label class="b" for="dir_upload_state">上架狀態</label>
              <select  class="mb0 w-100" name="dir_upload_state" id="dir_upload_state">
       														
                <option data-shipping-cost="120" value="0" ${(proDiaryVO.dir_upload_state=="0")? "selected":""}>
                  儲存不發布
                </option>
                <option data-shipping-cost="120" value="1" ${(proDiaryVO.dir_upload_state=="1")? "selected":""}>
                  儲存並馬上發布
                </option>
               </select>
              
          
              <br>
              <input type="hidden" name="action" value="update">
              <div class="mt4"><input type="submit" name="commit" value="修改" class="button green b--green b mb3">
              </div>
            </div>
        </form>
        <!-- form結束 -->










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
    <footer>
         <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>




</html>