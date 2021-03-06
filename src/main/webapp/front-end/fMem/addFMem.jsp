<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>
<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO memVO = (MemVO) session.getAttribute("memVO");%>
<!--               本網站由緯育(Tibame)Java雲端服務開發技術養成班-第93期-第二組製作， -->
<!--               非營利用途，僅為學習交流使用。如有不當使用之內容,請向https://www.tibame.com/聯繋。 -->
<!-- 參考網站https://shopee.tw/  https://www.zeczec.com/  https://www.buydirectlyfromfarmers.tw/ -->
<!-- saved from url=(0038)https://shopee.tw/user/account/profile -->
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
<title>註冊小農</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=1240,shrink-to-fit=no">
<meta name="shopee:git-sha"
	content="d6504aeef596b7d401a7f2e10121f3e3e9eb2137">
<meta name="shopee:version" content="pc-v4.108.1">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	dataLayer = []
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

<script>
// var btnSubmit = document.getElementById('btnSubmit');
// var formSubmit = document.getElementById('formSubmit');
// btnSubmit.addEventListener('click', function(e) {
//   e.preventDefault();
// Swal.fire({
// 	  title: '確定要送出?',
// 	  icon: 'warning',
// 	  showCancelButton: true,
// 	  confirmButtonColor: '#3085d6',
// 	  cancelButtonColor: '#d33',
// 	  confirmButtonText: '確定'
// 	}).then((result) => {
// 	  if (result) {
// 	    Swal.fire(
// 	      '已成功註冊',
// 	      '點按會員登入重新登入!'
// 	    ).then((result) => {
// 	    	formSubmit.submit();
// 	    }).catch(swal.noop);
// 	  }
// 	});
// });
</script>

<script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
<!-- sweetalert -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script> -->
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->

<link rel="stylesheet" type="text/css"
	href="./fMem_files/2825.51680d86fe84cd4ddf65.css">
</head>

<body style="" class="nt-s nl-l">
	<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
	<jsp:include page="/front-end/home/memIndex.jsp" flush="true"/>
	<jsp:include page="/front-end/privateMessage/chat.jsp" flush="true"/>
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
									<div style="height:;">
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
								<FORM METHOD="post" ACTION="fMem.do" name="form1"  id="formSubmit" enctype="multipart/form-data" style="width:587px;">
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
															<div class="_3S9myJ"><%=memVO.getMem_id()%></div>
															<input type="hidden" name="mem_id" value="<%=memVO.getMem_id()%>">
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
												<button style="background-color:#b9d4b3;" type="submit" 
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
		
<script>
var btnSubmit = document.getElementById('btnSubmit');
var formSubmit = document.getElementById('formSubmit');
btnSubmit.addEventListener('click', function(e) {
  e.preventDefault();
Swal.fire({
	  title: '確定要送出?',
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '確定'
	}).then((result) => {
	  if (result) {
	    Swal.fire(
	      '已成功註冊',
	      '點按會員登入重新登入!'
	    ).then((result) => {
	    	formSubmit.submit();
	    }).catch(swal.noop);
	  }
	});
});
</script>
		
</body>

</html>