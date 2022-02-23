<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fMem.model.*"%>
<%@page import="com.mem.model.MemVO"%>
<%@page import="com.mem.model.MemService"%>
<!-- 有時間可接入信箱更改驗證 -->
<!-- shopee-dropdown__entry--selected 更改框線顏色 -->
<%
request.setAttribute("mem_id", 77007); // 測試用，之後get方法要改成session.get...
%>
<%
Integer mem_id = (Integer) request.getAttribute("mem_id");
FMemVO fMemVO = (FMemVO) request.getAttribute("fMemVO");
%>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
<title>註冊小農</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=1240,shrink-to-fit=no">
<meta name="shopee:git-sha"
	content="d6504aeef596b7d401a7f2e10121f3e3e9eb2137">
<meta name="shopee:version" content="pc-v4.108.1">

<!-- *****************************以下私訊用***************************** -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/privateMessage/css/friendchat.css" type="text/css" />
<link href="https://deo.shopeemobile.com/shopee/shopee-seller-live-tw/chateasy/styles.21833f8f.6faae855a24d979165aa.css" rel="stylesheet" type="text/css" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
$(document).ready(function() {
	$("#clickpri").click(function() {
		$("#showpri").toggle("slow");
	});
});
</script>
<!-- *****************************以上私訊用***************************** -->


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	dataLayer = []
</script>
<script>
	!function(e, t, a, n, r) {
		e[n] = e[n] || [], e[n].push({
			"gtm.start" : (new Date).getTime(),
			event : "gtm.js",
			country : "tw"
		});
		var g = t.getElementsByTagName(a)[0], m = t.createElement(a);
				m.async = !0,
				m.src = "https://www.googletagmanager.com/gtm.js?id=GTM-WJZQSJF",
				g.parentNode.insertBefore(m, g)
	}(window, document, "script", "dataLayer")
</script>
<link href="./fMem_files/bundle.57fe1e2ad5aca5e20f23.css"
	rel="stylesheet">
<style
	data-href="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/1714.97be9cb79641e5619edf.css">
.pAJkCU {
	height: 18.75rem;
	margin: 12.5rem auto 1.25rem;
	display: block
}

._1gN_jU {
	text-align: center;
	font-size: 1rem;
	color: #222
}

._1VLvDx {
	border: .0625rem solid rgba(0, 0, 0, .14);
	border-radius: .625rem;
	margin: .625rem;
	padding: .625rem;
	text-align: center
}

._3sjFp {
	border-radius: .125rem;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 0 1rem;
	overflow: hidden;
	outline: none;
	flex: 0 0 auto;
	position: relative
}

._3sjFp:active:before {
	content: "";
	background-color: rgba(0, 0, 0, .05);
	position: absolute;
	bottom: 0;
	right: 0;
	top: 0;
	left: 0
}

.lJMau {
	height: 2.75rem
}

._3zn07 {
	height: 2.25rem;
	min-width: 4rem
}

._18F8b {
	height: 1.75rem;
	min-width: 4rem;
	padding: 0 .75rem
}

.uxSdp {
	height: 1.25rem;
	min-width: 3.25rem;
	padding: 0 .5rem
}

.xCn81 {
	background: transparent
}

.TOjHY.AHhqR {
	color: #fff;
	border: .0625rem solid transparent;
	background: #ee4d2d;
	background: var(- -nc-primary, #ee4d2d)
}

.TOjHY.xCn81 {
	color: #ee4d2d;
	color: var(- -nc-primary, #ee4d2d);
	border: .0625rem solid #ee4d2d;
	border: .0625rem solid var(- -nc-primary, #ee4d2d)
}

.TOjHY.xCn81:active:before {
	background-color: #ee4d2d;
	background-color: var(- -nc-primary, #ee4d2d);
	opacity: .05
}

._1-4Xn.xCn81 {
	color: rgba(0, 0, 0, .87);
	color: var(- -nc-text-primary, rgba(0, 0, 0, .87));
	border: .0625rem solid rgba(0, 0, 0, .26)
}

._1qQAl.xCn81 {
	color: #fff;
	border: .0625rem solid #fff
}

._1qQAl.xCn81:active:before {
	background-color: #fff;
	opacity: .26
}

._3sjFp:disabled {
	color: rgba(0, 0, 0, .26);
	color: var(- -nc-util-disabled, rgba(0, 0, 0, .26))
}

._3sjFp:disabled.xCn81 {
	border-color: rgba(0, 0, 0, .09);
	border-color: var(- -nc-util-line, rgba(0, 0, 0, .09))
}

._3sjFp:disabled._1qQAl.xCn81 {
	border-color: hsla(0, 0%, 100%, .54);
	color: hsla(0, 0%, 100%, .4)
}

._3sjFp:disabled.TOjHY.AHhqR {
	background: rgba(0, 0, 0, .09)
}

._2HCeY {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

._19rDu {
	margin-left: .25rem
}

._193wCc {
	transition: margin-top .3s cubic-bezier(.4, 0, .2, 1);
	-webkit-overflow-scrolling: touch
}

._193wCc._3cVWns {
	margin-top: 7.4375rem
}

._193wCc._3GgbTj {
	margin-top: 11.125rem
}

.stardust-dropdown {
	position: relative
}

.stardust-dropdown__item-body {
	transition: height .4s cubic-bezier(.4, 0, .2, 1), opacity .4s
		cubic-bezier(.4, 0, .2, 1);
	height: 0;
	opacity: 0;
	overflow: hidden
}

.stardust-dropdown__item-body--open {
	height: auto;
	opacity: 1
}

._3SsG4j {
	text-decoration: none;
	color: rgba(0, 0, 0, .87);
	display: block;
	margin-bottom: .9375rem;
	color: rgba(0, 0, 0, .65)
}

._2PrdXX:hover, ._3SzYTH {
	color: #ee4d2d
}

._2PrdXX {
	font-size: .875rem;
	display: block
}

._2PrdXX, ._3aAm2h {
	text-transform: capitalize;
	transition: color .1s cubic-bezier(.4, 0, .2, 1)
}

._3aAm2h {
	text-decoration: none;
	color: rgba(0, 0, 0, .87);
	display: flex;
	align-items: center;
	margin-bottom: .9375rem
}

._3aAm2h._3RsaDw, ._3aAm2h:hover {
	color: #ee4d2d
}

._21F-bS {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 1.25rem;
	height: 1.25rem;
	line-height: 1.25rem;
	text-align: center;
	border-radius: 50%;
	color: #fff;
	flex-shrink: 0;
	margin-right: .625rem
}

._21F-bS>img {
	width: 100%;
	height: 100%
}

._2i7380 {
	line-height: 1rem
}

._3CHLlN {
	font-weight: 500;
	margin-right: .3125rem
}

._3W8r9U {
	vertical-align: middle;
	position: absolute
}

._3aiYwk {
	display: block;
	padding: 0 0 .1875rem 2.125rem
}

._1_68zU {
	display: flex;
	padding: 15px 0;
	border-bottom: 1px solid #efefef
}

._2BuJEf, .shopee-avatar {
	width: 50px;
	height: 50px
}

._2uLDqN {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-left: 15px;
	overflow: hidden
}

._2lG70n {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	min-height: 1rem;
	font-weight: 600;
	margin-bottom: 5px;
	color: #333
}

._27BCO5 {
	color: #888;
	text-transform: capitalize;
	text-decoration: none
}

.CQhyq2 {
	margin-top: .9375rem;
	display: flex;
	align-items: center
}

.CQhyq2+._3XeQLS {
	margin-top: 1.25rem
}

._3XeQLS {
	margin-top: .9375rem
}

._3XeQLS .oNy5z2 {
	margin-left: 2.125rem
}

._3PN9C9 {
	height: 1.5rem;
	width: 1.5rem;
	border-radius: 50%;
	margin-right: .625rem
}

.oNy5z2 {
	height: 1rem;
	width: 8.75rem
}

._2ZEaD {
	background-color: #a4aaaa;
	background-image: linear-gradient(90deg, #a4aaaa, #000 25%, #a4aaaa 50%);
	background-repeat: no-repeat;
	background-size: 200% 100%;
	background-position: 100% 0;
	-webkit-animation: _2ZEaD 1.5s infinite;
	animation: _2ZEaD 1.5s infinite;
	-webkit-transform: translateZ(0);
	transform: translateZ(0)
}

._2ZEaD .geCJg {
	background: #fff;
	isolation: isolate;
	mix-blend-mode: screen
}

._2ZEaD .M6lQx {
	background: #f1f0f0
}

@
-webkit-keyframes _2ZEaD { 0% {
	background-position: 100% 0
}

to {
	background-position: -100% 0
}

}
@
keyframes _2ZEaD { 0% {
	background-position: 100% 0
}

to {
	background-position: -100% 0
}

}
._36cLcR {
	display: block;
	width: 180px;
	flex-shrink: 0
}

._1ZnP-m {
	list-style: none;
	padding: 0;
	margin: 27px 0 0;
	cursor: pointer
}

._1QwuCJ {
	display: flex;
	padding: 1.25rem 0 3.125rem
}

._3D9BVC {
	position: relative;
	flex-grow: 1;
	width: 980px;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin-left: 1.6875rem;
	min-width: 0;
	background: #fff;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .13);
	border-radius: .125rem
}

._3pDGyR {
	position: absolute;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	background-color: transparent
}

/* 移動顯示手掌 */
.showhand {
	cursor: pointer;
}

/*# sourceMappingURL=https://shopee.sg/assets/1714.97be9cb79641e5619edf.css.map*/
</style>

<!-- 我加的 -->
<script>
	$(document).ready(function() {
		$("#changeadd").click(function() {
			$("#address").toggle("slow");
		});
	});

</script>

<script type="text/javascript">
// 這裡使用最原始的js語法實現，可對應換成jquery語法進行邏輯控制
var visible=document.getElementById('psw_visible');//text block
var invisible=document.getElementById('psw_invisible');//password block
var inputVisible = document.getElementById('input_visible');
var inputInVisible = document.getElementById('input_invisible');
    //隱藏text block，顯示password block
function showPsw(){
var val = inputInVisible.value;//將password的值傳給text
inputVisible.value = val;
invisible.style.display = "none";  
visible.style.display = "";  
}
    //隱藏password，顯示text  
    function hidePsw(){
   var val=inputVisible.value;//將text的值傳給password  
inputInVisible.value = val; 
invisible.style.display = "";  
    visible.style.display = "none";  
}
</script>

<script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="./fMem_files/2825.51680d86fe84cd4ddf65.css">
</head>

<body style="" class="nt-s nl-l" onload="connect();" onunload="disconnect();">
	<jsp:include page="/front-end/home/header.jsp" flush="true"/>
	<jsp:include page="/front-end/home/memIndex.jsp" flush="true"/>
	
	<%
	Integer mem_idChat = (Integer) request.getAttribute("mem_id");
	MemService memSvcChat = new MemService();
	MemVO memVOChat = new MemVO();
	memVOChat = memSvcChat.getOneMem(mem_idChat);
	String mem_name = memVOChat.getMem_name();
	pageContext.setAttribute("mem_name", mem_name);
%>
    <a id="clickpri" style="width:48px; height: 48px;cursor: pointer; z-index:999999; position:fixed; right:5%; top:85%;">
	<img src="<%=request.getContextPath() %>/front-end/privateMessage/images/comment.png" style=" font-size: 30px;color: #aaba8b; width:48px; height: 48px;">
<!--     <svg onclick="sendName();" class="svg-inline--fa fa-envelope fa-w-16" style=" font-size: 30px;color: #aaba8b;" aria-hidden="true" data-fa-processed="" data-prefix="far" data-icon="envelope" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path></svg> -->
    </a>


<div>	
	<div id="showpri"
		style=" display:none; position: fixed; right:5%; top:35%; z-index: 99999;">
		<div class="src-pages-ChatWindow-index__container--1qoj1">
			<div class="src-pages-ChatWindow-index__header--USXSl" style="background-color: #b9d4b3;">
				<div class="src-pages-ChatWindow-index__logo-wrapper--1rM8W">
					<i class="_3kEAcT1Mk5 src-pages-ChatWindow-index__logo--3ygfr"><svg
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 44 22"
							class="chat-icon">
							<path
								d="M4.236 3.314h.016l.052.005h3.29l.05-.005.068.005h1.03c.365 0 .664.3.664.665 0 .332-.247.609-.566.657l-.098.007h-.408v8.837l1.04-.252.353 1.28-1.393.338v4.66H6.972v-4.33l-3.961.959a.666.666 0 01-.817-.464.667.667 0 01.371-.784l.092-.033.907-.22-.001-.012v-9.98h-.408a.666.666 0 01-.664-.663c0-.333.247-.61.567-.658l.097-.007h1.03l.05-.005zm20.7 0h.016l.05.005h3.291l.067-.005.052.005h1.03c.365 0 .664.3.664.665 0 .332-.248.609-.567.657l-.098.007h-.407v8.837l1.039-.252.354 1.28-1.393.338v4.66H27.67v-4.33l-3.96.959a.666.666 0 01-.818-.464.667.667 0 01.371-.784l.093-.033.906-.22-.001-.012v-9.98h-.407a.666.666 0 01-.665-.663c0-.333.247-.61.567-.658l.098-.007h1.03l.05-.005zm-5.142 0c.685 0 1.254.524 1.322 1.19l.007.135v8.27a2.662 2.662 0 01-2.474 2.643l-.185.007h-.231v-1.325h.231l.136-.007a1.333 1.333 0 001.187-1.183l.007-.135V5.301a.656.656 0 00-.566-.655l-.1-.007h-1.706v14.866h-1.33V4.109c0-.404.306-.74.698-.789l.1-.006h2.904zm20.699 0c.686 0 1.254.524 1.323 1.19l.007.135v8.27a2.662 2.662 0 01-2.475 2.643l-.184.007h-.232v-1.325h.232l.135-.007a1.333 1.333 0 001.187-1.183l.007-.135V5.302a.656.656 0 00-.565-.656l-.1-.007h-1.707v14.866h-1.33V4.109c0-.404.306-.74.699-.789l.1-.006h2.903zM14.566 2.48c.365 0 .664.3.664.664 0 .333-.247.61-.566.657l-.098.008-3.035.69v8.15l2.348-.575.014-.438c.005-.22.007-.392.007-.485V5.994a.665.665 0 011.323-.099l.007.1v5.429c-.04 2.16-.385 3.988-1.05 5.3-.608 1.125-1.657 1.95-2.994 2.605l-.29.138-.678-1.1c1.356-.65 2.313-1.51 2.871-2.57a8.875 8.875 0 00.518-1.612l.084-.38.04-.327-2.686.659a.666.666 0 01-.803-.487l-.015-.097-.015-9.57c0-.331.247-.609.567-.657l.098-.007 3.69-.839zm20.7 0c.365 0 .664.3.664.664 0 .333-.247.61-.567.657l-.098.008-3.035.69.001 8.15 2.347-.575.012-.348c.006-.216.008-.394.01-.51V5.994a.665.665 0 011.322-.099l.008.1v5.429c-.04 2.16-.386 3.988-1.05 5.3-.609 1.125-1.657 1.95-2.994 2.605l-.291.138-.678-1.1c1.356-.65 2.313-1.51 2.872-2.57a8.875 8.875 0 00.517-1.612l.084-.38.04-.327-2.686.659a.666.666 0 01-.803-.487l-.015-.097-.014-9.57c0-.331.247-.609.566-.657l.098-.007 3.69-.839zM6.971 11.569H4.926v2.741l2.046-.495v-2.246zm20.699 0h-2.046v2.741l2.046-.495v-2.246zm-20.7-3.46H4.927v2.131h2.046V8.108zm20.7 0h-2.046v2.131h2.046V8.108zM6.97 4.647H4.927V6.78h2.046V4.648zm20.7 0h-2.046V6.78h2.046V4.648z"></path></svg></i>
				</div>
				<div class="src-pages-ChatWindow-index__operator-wrapper--Wcn9j">
					<div
						class="src-pages-ChatWindow-index__operator-item-wrapper--2_9Si">
						<div class="">
							<i
								class="_3kEAcT1Mk5 src-pages-ChatWindow-index__hide-dialog--1STCP src-pages-ChatWindow-index__operator-item--JM24S"><svg
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
									class="chat-icon">
									<path
										d="M14 1a1 1 0 011 1v12a1 1 0 01-1 1H9v-1h5V2H9V1h5zM2 13v1h1v1H2a1 1 0 01-.993-.883L1 14v-1h1zm6 1v1H4v-1h4zM2 3.999V12H1V3.999h1zm5.854 1.319l2.828 2.828a.5.5 0 010 .708l-2.828 2.828a.5.5 0 11-.708-.707L9.121 9H4.5a.5.5 0 010-1h4.621L7.146 6.025a.5.5 0 11.708-.707zM3 1v1H2v.999H1V2a1 1 0 01.883-.993L2 1h1zm5 0v1H4V1h4z"></path></svg></i>
						</div>
					</div>
					<div
						class="src-pages-ChatWindow-index__operator-item-wrapper--2_9Si">
						<div class="">
							<i
								class="_3kEAcT1Mk5 src-pages-ChatWindow-index__minimize--3dPxE src-pages-ChatWindow-index__operator-item--JM24S"><svg
									viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"
									class="chat-icon">
									<path
										d="M14 1a1 1 0 011 1v12a1 1 0 01-1 1H2a1 1 0 01-1-1V2a1 1 0 011-1h12zm0 1H2v12h12V2zm-2.904 5.268l-2.828 2.828a.5.5 0 01-.707 0L4.732 7.268a.5.5 0 11.707-.707l2.475 2.475L10.39 6.56a.5.5 0 11.707.707z"></path></svg></i>
						</div>
					</div>
				</div>
			</div>
			<div class="src-pages-ChatWindow-index__windows--3KL4n">
				<div class="src-pages-ChatWindow-index__details--3uIPO">
					<div class="src-pages-ChatWindow-index__blank--2pLm1">
					<!-- 對話接入點 -->
					<h3 id="statusOutput" class="statusOutput" style="margin: 0; height: 32px;"></h3>
					<div id="messagesArea" class="panel message-area" style="width:100%; height:350px;"></div>
					<div class="panel" style="width: 100%;">
		<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" style="display:inline-block; width: width:calc(100% - 10px);"/> 
		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" style="display:inline-block;"/> 
	</div>
					
					</div>
				</div>
				<div id="row" class="src-pages-ConversationLists-index__root--3_OYj">
				</div>
			</div>
		</div>
		<div class="ReactModalPortal"></div>
	</div>
</div>	
	
	
	<div id="main" style="float:left;">
		<div>
		<div>
			<div class="shopee-progress-bar"></div>
			<div class="_193wCc">
				<div class="container _1QwuCJ" style="width:900px; ">
					<div class="_3D9BVC">
						<div class="h4QDlo" role="main">
							<div class="_2YiVnW">
								<div class="_2w2H6X">
									<h1 class="_3iiDCN">小農註冊</h1>
									<div class="TQG40c">提交資料以供審核</div>
									<div style="height: 36px;">
										<%-- 錯誤表列 --%>
										<c:if test="${not empty errorMsgs}">
											<font style="color: red">請修正以下錯誤:</font>
											<ul>
												<c:forEach var="message" items="${errorMsgs}">
													<li style="color: red">${message}</li>
												</c:forEach>
											</ul>
										</c:if>
									</div>
								</div>
								<FORM METHOD="post" ACTION="fMem.do" name="form1" enctype="multipart/form-data" style="width:587px;">
									<div class="goiz2O">
										<div class="pJout2">
											<!-- 可更改form表單寬度 -->

											<div class="_3BlbUs">
												<div class="_1iNZU3">
													<div class="_2PfA-y">
														<label>會員編號</label>
													</div>
													<div class="_2_JugQ">
														<div class="_2bdFDW">
															<div class="_3S9myJ"><%=mem_id%></div>
															<input type="hidden" name="mem_id" value="<%=mem_id%>">
														</div>
													</div>
												</div>
											</div>

											<div class="_3BlbUs">
												<div class="_1iNZU3">
													<div class="_2PfA-y">
														<label>小農帳號</label>
													</div>
													<div class="_2_JugQ">
														<div class="_2bdFDW">
															<div class="input-with-validator-wrapper">
																<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="text" placeholder="請填入會員帳號" maxlength="255"
																		name="f_mem_acc" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_acc()%>">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="_3BlbUs">
												<div class="_1iNZU3">
													<div class="_2PfA-y">
														<label>密碼</label>
													</div>
													<div class="_2_JugQ">
														<div class="_2bdFDW">
															<div class="input-with-validator-wrapper">
																<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="password" placeholder="請填入密碼" maxlength="25"
																		name="f_mem_pwd" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_pwd()%>">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="_3BlbUs">
												<div class="_1iNZU3">
													<div class="_2PfA-y">
														<label>確認密碼</label>
													</div>
													<div class="_2_JugQ">
														<div class="_2bdFDW">
															<div class="input-with-validator-wrapper">
																<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="password" placeholder="請填入密碼" maxlength="25"
																		name="f_mem_pwd2" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_pwd()%>">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="_3BlbUs">
												<div class="_1iNZU3">
													<div class="_2PfA-y">
														<label>農場名稱</label>
													</div>
													<div class="_2_JugQ">
														<div class="_2bdFDW">
															<div class="input-with-validator-wrapper">
																<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="text" placeholder="請填入農場名稱" maxlength="255"
																		name="f_mem_fname" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_fname()%>">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="_3BlbUs">
												<div class="_1iNZU3">
													<div class="_2PfA-y">
														<label>手機號碼</label>
													</div>
													<div class="_2_JugQ">
														<div class="_2bdFDW">
															<div class="input-with-validator-wrapper">
																<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="text" placeholder="請填入手機號碼" maxlength="10"
																		name="f_mem_mobile" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_mobile()%>">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
												<div class="_3BlbUs">
													<div class="_1iNZU3">
														<div class="_2PfA-y">
															<label class="mt3 b" for="order_country">農場地點</label>
														</div>
														<div class="_2_JugQ">
															<div class="_2w5iZe">
																<select required="required"
																	class="mb0 js-shipping-cost js-country-select js-update-sum-for-postage w-100 shopee-dropdown__entry shopee-dropdown__entry--selected"
																	autocomplete="country-name" name="order[country]"
																	id="order_country">
																	<option data-shipping-cost="0" selected="" value="TW">
																		台灣（本島） Taiwan</option>
																	<option data-shipping-cost="120" value="TWI">
																		台灣（外島） Taiwan's surrounding islands</option>
																</select>
															</div>
														</div>
													</div>
												</div>

												<div class="_3BlbUs">
													<div class="mt3 flex-auto js-city" data-country="TW">
														<div class="_1iNZU3">
															<label class="b _2PfA-y">縣市</label>
															<div class="_2_JugQ">
																<div class="_2w5iZe">
																	<select name="f_mem_city" id="city"
																		class="mb0 js-city-select w-100 shopee-dropdown__entry shopee-dropdown__entry--selected choose-el">
																		<option value=""<c:if test="${empty fMemVO.f_mem_city}">selected</c:if>>- 選擇 -</option>
																		<option value="台北市"
																			<c:if test="${fMemVO.f_mem_city == '台北市'}">selected</c:if>>台北市</option>
																		<option value="基隆市"
																			<c:if test="${fMemVO.f_mem_city == '基隆市'}">selected</c:if>>基隆市</option>
																		<option value="新北市"
																			<c:if test="${fMemVO.f_mem_city == '新北市'}">selected</c:if>>新北市</option>
																		<option value="宜蘭縣"
																			<c:if test="${fMemVO.f_mem_city == '宜蘭縣'}">selected</c:if>>宜蘭縣</option>
																		<option value="新竹市"
																			<c:if test="${fMemVO.f_mem_city == '新竹市'}">selected</c:if>>新竹市</option>
																		<option value="新竹縣"
																			<c:if test="${fMemVO.f_mem_city == '新竹縣'}">selected</c:if>>新竹縣</option>
																		<option value="桃園市"
																			<c:if test="${fMemVO.f_mem_city == '桃園市'}">selected</c:if>>桃園市</option>
																		<option value="苗栗縣"
																			<c:if test="${fMemVO.f_mem_city == '苗栗縣'}">selected</c:if>>苗栗縣</option>
																		<option value="臺中市"
																			<c:if test="${fMemVO.f_mem_city == '臺中市'}">selected</c:if>>臺中市</option>
																		<option value="彰化縣"
																			<c:if test="${fMemVO.f_mem_city == '彰化縣'}">selected</c:if>>彰化縣</option>
																		<option value="南投縣"
																			<c:if test="${fMemVO.f_mem_city == '南投縣'}">selected</c:if>>南投縣</option>
																		<option value="嘉義市"
																			<c:if test="${fMemVO.f_mem_city == '嘉義市'}">selected</c:if>>嘉義市</option>
																		<option value="嘉義縣"
																			<c:if test="${fMemVO.f_mem_city == '嘉義縣'}">selected</c:if>>嘉義縣</option>
																		<option value="雲林縣"
																			<c:if test="${fMemVO.f_mem_city == '雲林縣'}">selected</c:if>>雲林縣</option>
																		<option value="臺南市"
																			<c:if test="${fMemVO.f_mem_city == '臺南市'}">selected</c:if>>臺南市</option>
																		<option value="高雄市"
																			<c:if test="${fMemVO.f_mem_city == '高雄市'}">selected</c:if>>高雄市</option>
																		<option value="屏東縣"
																			<c:if test="${fMemVO.f_mem_city == '屏東縣'}">selected</c:if>>屏東縣</option>
																		<option value="臺東縣"
																			<c:if test="${fMemVO.f_mem_city == '臺東縣'}">selected</c:if>>臺東縣</option>
																		<option value="花蓮縣"
																			<c:if test="${fMemVO.f_mem_city == '花蓮縣'}">selected</c:if>>花蓮縣</option>
																		<option value="連江縣"
																			<c:if test="${fMemVO.f_mem_city == '連江縣'}">selected</c:if>>連江縣</option>
																		<option value="釣魚臺"
																			<c:if test="${fMemVO.f_mem_city == '釣魚臺'}">selected</c:if>>釣魚臺</option>
																		<option value="南海島"
																			<c:if test="${fMemVO.f_mem_city == '南海市'}">selected</c:if>>南海島</option>
																		<option value="澎湖縣"
																			<c:if test="${fMemVO.f_mem_city == '澎湖縣'}">selected</c:if>>澎湖縣</option>
																		<option value="金門縣"
																			<c:if test="${fMemVO.f_mem_city == '金門縣'}">selected</c:if>>金門縣</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="_3BlbUs">
													<div class="mt3 js-district pl3" data-for="TW">
														<div class="_1iNZU3">
															<label class="b _2PfA-y">鄉鎮市區</label>
															<div class="_2_JugQ">
																	<div class="input-with-validator-wrapper">
																	<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="text" placeholder="請填入鄉鎮市區" maxlength="10"
																		name="f_mem_dist" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_dist()%>">
																</div>
																	</div>
															</div>
														</div>
													</div>
												</div>
												<div class="_3BlbUs">
													<div class="flex-auto">
														<div class="_1iNZU3">
															<label class="b _2PfA-y" for="order_address">地址</label>
															<div class="_2_JugQ">
																<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="text" placeholder="請填入地址" maxlength="10"
																		name="f_mem_add" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_add()%>">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="_3BlbUs">
													<div class="w4 pl3 js-postcode">
														<div class="_1iNZU3">
															<label class="b _2PfA-y" for="order_postcode">郵遞區號</label>
																<div class="_2_JugQ">
																<div class="input-with-validator shopee-dropdown__entry--selected">
																	<input type="text" placeholder="請填入郵遞區號" maxlength="10"
																		name="f_mem_zipcode" value="<%=(fMemVO==null)? "" : fMemVO.getF_mem_zipcode()%>">
																</div>
															</div>
														</div>
													</div>
													</div>
												</div>
											</div>
											<!-- 這邊控制傳送至Servlet -->
											<input type="hidden" name="action" value="insert"> 
											<div class="_31PFen">
												<button style="background-color:#b9d4b3;" type="submit" id="demo4"
													class="btn btn-solid-primary btn--m btn--inline"
													aria-disabled="false">送出申請</button>
											</div>
										</div>
								</FORM>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div></div>
		<div class="qgeUgW" id="BackgroundImagePortalAnchor"></div>
	</div>
	</div>
	<div id="modal">
		<div>
			<div
				class="shopee-modal__transition-appear-done shopee-modal__transition-enter-done"></div>
		</div>
	</div>
	<div class="shopee__kZMc3xKQ4ab">
		<div class="shopee__3o9SfdFxcoiKs"></div>
	</div>
	<div class="shopee__fo0dKsgoukkfcaik">
		<div class="shopee-modal-xbcA3dFx0Ck"></div>
	</div>

<iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;"></iframe>

	<script
		src="./fMem_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js"
		type="text/javascript"></script>
	<script
		src="./fMem_files/back-7b8325ae78ca7c794fdc8c2ff6c2ef5676fc24748e3a262866e67978e98c4561.js"
		type="text/javascript"></script>
</body>
<script>
	var MyPoint = "/FriendWS/${mem_name}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${mem_name}';
	var webSocket;

	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			document.getElementById('sendMessage').disabled = false;
// 			document.getElementById('connect').disabled = true;
// 			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("open" === jsonObj.type) {
				refreshFriendList(jsonObj);
			} else if ("history" === jsonObj.type) {
				messagesArea.innerHTML = '';
				var ul = document.createElement('ul');
				ul.id = "area";
				messagesArea.appendChild(ul);
				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					var showMsg = historyData.message;
					var li = document.createElement('li');
					// 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
					historyData.sender_mem === self ? li.className += 'me' : li.className += 'friend';
					li.innerHTML = showMsg;
					ul.appendChild(li);
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("chat" === jsonObj.type) {
				var li = document.createElement('li');
				jsonObj.sender_mem === self ? li.className += 'me' : li.className += 'friend';
				li.innerHTML = jsonObj.message;
				console.log(li);
				document.getElementById("area").appendChild(li);
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("close" === jsonObj.type) {
				refreshFriendList(jsonObj);
			}
			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else if (friend === "") {
			alert("Choose a friend");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender_mem" : self,
				"receiver_mem" : friend,
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	// 有好友上線或離線就更新列表
	function refreshFriendList(jsonObj) {
		var friends = jsonObj.mems;
		var row = document.getElementById("row");
		row.innerHTML = '';
		for (var i = 0; i < friends.length; i++) {
			if (friends[i] === self) { continue; }
			row.innerHTML +='<div id=' + i + ' class="column" name="friendName" value=' + friends[i] + ' ><h2>' + friends[i] + '</h2></div>';
		}
		addListener();
	}
	// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
	function addListener() {
		var container = document.getElementById("row");
		container.addEventListener("click", function(e) {
			var friend = e.srcElement.textContent;
			updateFriendName(friend);
			var jsonObj = {
					"type" : "history",
					"sender_mem" : self,
					"receiver_mem" : friend,
					"message" : "" //是否這邊有問題
				};
			webSocket.send(JSON.stringify(jsonObj));
		});
	}
	
	function disconnect() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
	
</script>
</html>