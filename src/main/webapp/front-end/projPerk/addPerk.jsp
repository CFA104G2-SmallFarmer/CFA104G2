<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page import="com.project.model.*"%>

<%
ProjPerkVO projPerkVO = (ProjPerkVO) request.getAttribute("projPerkVO"); //EmpServlet.java(Concroller), 存入req的empVO物件 
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<title>我家門前有塊地 | ${projectVO.proj_name}</title>
<!-- datepicker加入這段 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https:/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		})

	});
	//設定中文語系
	$.datepicker.regional['zh-TW'] = {
		dayNames : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ],
		dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
		monthNames : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
				"十月", "十一月", "十二月" ],
		monthNamesShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
				"九月", "十月", "十一月", "十二月" ],
		prevText : "上月",
		nextText : "次月",
		weekHeader : "週"

	};
	//將預設語系設定為中文
	$.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
</script>
<!-- 加入這段 -->



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">





<link
	href="<%=request.getContextPath()%>/front-end/projPerk/addPerk_css/css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/projPerk/addPerk_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
</head>

<body class="intent-mouse">
	<header style="height: 90px">
		<jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" />
	</header>
	<header style="padding-bottom: 5px"
		class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
</header>
	<div class="bb b--near-white">
		<div class="container"></div>
		<div class="bt b--light-gray bb">
			<div class="container cf">

				<div class="container ph3 ph0-l pt3 cf">
					<h2 class="flex mt0">
						<!-- <a class="order-1 f6 ml4-l black w-100 w-auto-l" href="https://www.zeczec.com/account"><i
              class="material-icons v-mid dark-gray f4">check</i>
            成功贊助記錄
          </a> -->
						<span class="order-0 flex-auto black w-100 w-auto-l"
							href="https://www.zeczec.com/account/cancelled"> <i
							class="material-icons v-mid dark-gray f3">error</i> 新增回饋方案 <span
							style="font-size: 18px; color: gray;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;認養專案：<%=projectVO.getProj_name()%></span>
						</span> </span>
						<p>
							<%-- 錯誤表列 --%>
							<c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>
						</p>
						<!-- <span class="order-3 f6 ml4-l black w-100 w-auto-l" href="https://www.zeczec.com/account/atm"><i
              class="material-icons v-mid dark-gray f4">timer</i>
            等待付款記錄
          </span> -->
					</h2>

				</div>

			</div>
		</div>
	</div>
	<div class="container"></div>
	<div class="container mv4">
		<div class="gutter3-l flex">
			<div class="w-100 ph3 mb4 mb0">
				<!-- form開始 -->
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/projPerk/projPerk.do"
					name="form1" enctype="multipart/form-data">

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
									<img id="img1" class="w-100 mb3"
										src="<%=request.getContextPath()%>/front-end/projPerk/addPerk_css/farmforUploadPic/farmforUploadPic.png"
										alt="">
								</div>

								<label class="b" for="user_avatar">顯示圖片</label> <input
									id="upPic" class="w-100 border-box mv3" accept="image/*"
									type="file" name="perk_pic"
									value="<%=(projPerkVO == null) ? "" : projPerkVO.getPerk_pic()%>">
								<script>
									$("#upPic").change(function() {
										//當檔案改變後，做一些事 
										readURL(this); // this代表<input id="upPic">
									});

									function readURL(input) {
										if (input.files && input.files[0]) {
											var reader = new FileReader();
											reader.onload = function(e) {
												$("#img1").attr('src',
														e.target.result);
											}
											reader
													.readAsDataURL(input.files[0]);
										}
									}
								</script>
							</div>

						</div>

						<div class="w-60-l w-100 ph3">


							<input name="proj_id" type="hidden"
								value="<%=projectVO.getProj_id()%>">
							<%-- <%=projPerkVO.getProj_id()%> --%>


							<label class="b" for="perk_abbr_name">方案簡稱 <!--                 <span style="color: rgb(98, 134, 113);">&nbsp;&nbsp;(客人看不到，只有小農自己知道，方便訂單管理)</span> -->
							</label> <input maxlength="5" class="w-100" placeholder="長度不得超過5個字"
								type="text"
								value="<%=(projPerkVO == null) ? "" : projPerkVO.getPerk_abbr_name()%>"
								name="perk_abbr_name" id="perk_abbr_name"> <label
								class="b" for="perk_fund">方案金額</label> <span>NT$</span><input
								class="w-100" placeholder="請輸入數字" type="text"
								value="<%=(projPerkVO == null) ? "" : projPerkVO.getPerk_fund()%>"
								name="perk_fund" id="perk_fund"> <label class="b"
								for="perk_limited">方案限量份數</label> <input class="w-100"
								placeholder="請輸入數字" type="text"
								value="<%=(projPerkVO == null) ? "" : projPerkVO.getPerk_limited()%>"
								name="perk_limited" id="perk_limited"> <label class="b"
								for="perk_intro">方案回饋內容</label>
							<textarea maxlength="200" placeholder="文長不得超過200個字"
								maxlength="600" class="w-100" name="perk_intro" value=""
								id="perk_intro" style="width: 250px; height: 250px;"><%=(projPerkVO == null) ? "" : projPerkVO.getPerk_intro()%></textarea>
							<label class="b" for="perk_ship_date">預計寄送時間</label> <input
								class="w-60" type="text" placeholder="請選擇日期"
								name="perk_ship_date" value="${projPerkVO.perk_ship_date}"
								id="datepicker">
							<!-- <input type="text" id="datepicker"> -->
							<label class="b" for="perk_ship_area">可寄送區域</label> <select
								class="mb0 w-100" name="perk_ship_area" id="order_country">

								<option data-shipping-cost="120" value="台灣（本島)"
									${(projPerkVO.perk_ship_area=="台灣（本島)")? "selected":""}>
									台灣（本島)</option>
								<option data-shipping-cost="120" value="台灣（本島）+ 台灣（外島)"
									${(projPerkVO.perk_ship_area=="台灣（本島）+ 台灣（外島)")? "selected":""}>
									台灣（本島）+ 台灣（外島)</option>
							</select> <br> <br> <input type="hidden" name="action"
								value="insert">
							<div class="mt4">
								<input type="submit" name="commit" value="新增"
									class="button green b--green b mb3">
							</div>
						</div>
					</div>
				</form>
				<!-- form結束 -->










				<!-- Code injected by live-server -->
				<script type="text/javascript">
					// <![CDATA[  <-- For SVG support
					if ('WebSocket' in window) {
						(function() {
							function refreshCSS() {
								var sheets = [].slice.call(document
										.getElementsByTagName("link"));
								var head = document
										.getElementsByTagName("head")[0];
								for (var i = 0; i < sheets.length; ++i) {
									var elem = sheets[i];
									var parent = elem.parentElement || head;
									parent.removeChild(elem);
									var rel = elem.rel;
									if (elem.href
											&& typeof rel != "string"
											|| rel.length == 0
											|| rel.toLowerCase() == "stylesheet") {
										var url = elem.href.replace(
												/(&|\?)_cacheOverride=\d+/, '');
										elem.href = url
												+ (url.indexOf('?') >= 0 ? '&'
														: '?')
												+ '_cacheOverride='
												+ (new Date().valueOf());
									}
									parent.appendChild(elem);
								}
							}
							var protocol = window.location.protocol === 'http:' ? 'ws://'
									: 'wss://';
							var address = protocol + window.location.host
									+ window.location.pathname + '/ws';
							var socket = new WebSocket(address);
							socket.onmessage = function(msg) {
								if (msg.data == 'reload')
									window.location.reload();
								else if (msg.data == 'refreshcss')
									refreshCSS();
							};
							if (sessionStorage
									&& !sessionStorage
											.getItem('IsThisFirstTime_Log_From_LiveServer')) {
								console.log('Live reload enabled.');
								sessionStorage.setItem(
										'IsThisFirstTime_Log_From_LiveServer',
										true);
							}
						})();
					} else {
						console
								.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
					}
					// ]]>
				</script>

				<div id="draggable-live-region" aria-relevant="additions"
					aria-atomic="true" aria-live="assertive" role="log"
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
			    <footer>
         <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>
</body>





</html>