<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.model.*"%>

<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
pageContext.setAttribute("projectVO",projectVO); 
%>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FMemService" />
<%--   小農暱稱：${memSvc.getOneMem(fMemSvc.getOneFMem.mem_id).mem_nickname} --%>


<!-- form185開始 -->

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <!--  <meta name="csrf-param" content="authenticity_token">
  <meta name="csrf-token"
    content="MTox+EBrRuwHIR0noSGsb2DvNE5yK9mN9yvfhUb5DU+8BoCotRpDcw+HJZiqMtaHV1h0lZRdUnXWNvNmpla3Cg=="> -->

  <!-- <script type="text/javascript" src="<%=request.getContextPath()%>/front-end/project/addProj_files/6df56d3465"></script> -->
  <!-- <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/nr-1214.min.js"></script> -->
  <!-- <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/clarity.js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/fbevents.js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/analytics.js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/9ve6cixxpl"></script> -->
  
  <!-- <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/465239610292033" async=""></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/sdk.js" async="" crossorigin="anonymous"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/front-end/project/addProj_files/6df56d3465(1)"></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/nr-1214.min(1).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/clarity(1).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/fbevents(1).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/analytics(1).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/9ve6cixxpl(1)"></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/465239610292033(1)" async=""></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/sdk(1).js" async="" crossorigin="anonymous"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/front-end/project/addProj_files/6df56d3465(2)"></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/nr-1214.min(2).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/fbevents(2).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/analytics(2).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/9ve6cixxpl(2)"></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/465239610292033(2)" async=""></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/sdk(2).js" async="" crossorigin="anonymous"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/clarity(2).js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/front-end/project/addProj_files/6df56d3465(3)"></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/465239610292033(3)" async=""></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/sdk(3).js" async="" crossorigin="anonymous"></script>
  <script src="<%=request.getContextPath()%>/front-end/project/addProj_files/nr-1214.min(3).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/fbevents(3).js"></script>
  <script id="facebook-jssdk" src="<%=request.getContextPath()%>/front-end/project/addProj_files/sdk(4).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/analytics(3).js"></script>
  <script async="" src="<%=request.getContextPath()%>/front-end/project/addProj_files/9ve6cixxpl(3)"></script> -->

<title>修改認養專案</title>
  <link href="<%=request.getContextPath()%>/front-end/project/addProj_files/css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" media="all"
    href="<%=request.getContextPath()%>/front-end/project/addProj_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
</head>

<body class="intent-mouse">
  <header>
         <jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" />
</header>


  <div class="container"></div>
  <div class="bt b--light-gray bb">
    <div class="container cf">

      <div class="container ph3 ph0-l pt3 cf">
        <h2 class="flex mt0">
          <span class="order-0 flex-auto black w-100 w-auto-l" href="#">
            <i class="material-icons v-mid dark-gray f3">error</i>
            修改認養專案
          </span>
        </h2>

      </div>

    </div>
  </div>
  
  
  <div class="container"></div>
  <div class="container mv4">
    <div class="gutter3-l flex">
      <div class="w-100 ph3 mb4 mb0">


				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>


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
                name="f_mem_id" id="f_mem_id" value="hiddenValue">${memSvc.getOneMem(fMemSvc.getOneFMem(70000).mem_id).mem_nickname}，您好
                
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

<footer>
    <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>
</body>



</html>