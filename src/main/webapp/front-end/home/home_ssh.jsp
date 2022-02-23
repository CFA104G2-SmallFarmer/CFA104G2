<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 已完成頁首頁尾的引入，內文尚未修改 動態路徑尚未完成-->
<!DOCTYPE html>
<html lang="zh-tw"
	class="no-js fontawesome-i2svg-active fontawesome-i2svg-complete arwf-inactive">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/8frlty15ix"></script>
<script async="" src="./home_files/clarity.js"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/8frlty15ix"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/gtm.js"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/analytics.js"></script>
<script defer=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/all.js"></script>

<meta name="google-site-verification"
	content="jTLy2uztFyeCd-TzuYYqOIOkRNTOdiikG5fC8Eacm6I">
<meta name="google-site-verification"
	content="B2cWaUCcewU8njTlgb7JZb0nC4RHQBPnV4f5opNFJh4">

<title>首頁</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="created" content="17th 一月 2022 10:11">
<meta name="keywords" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<meta name="author" content="">




<style type="text/css">
svg:not(:root).svg-inline--fa {
	overflow: visible
}

.svg-inline--fa {
	display: inline-block;
	font-size: inherit;
	height: 1em;
	overflow: visible;
	vertical-align: -.125em
}

.svg-inline--fa.fa-lg {
	vertical-align: -.225em
}

.svg-inline--fa.fa-w-1 {
	width: .0625em
}

.svg-inline--fa.fa-w-2 {
	width: .125em
}

.svg-inline--fa.fa-w-3 {
	width: .1875em
}

.svg-inline--fa.fa-w-4 {
	width: .25em
}

.svg-inline--fa.fa-w-5 {
	width: .3125em
}

.svg-inline--fa.fa-w-6 {
	width: .375em
}

.svg-inline--fa.fa-w-7 {
	width: .4375em
}

.svg-inline--fa.fa-w-8 {
	width: .5em
}

.svg-inline--fa.fa-w-9 {
	width: .5625em
}

.svg-inline--fa.fa-w-10 {
	width: .625em
}

.svg-inline--fa.fa-w-11 {
	width: .6875em
}

.svg-inline--fa.fa-w-12 {
	width: .75em
}

.svg-inline--fa.fa-w-13 {
	width: .8125em
}

.svg-inline--fa.fa-w-14 {
	width: .875em
}

.svg-inline--fa.fa-w-15 {
	width: .9375em
}

.svg-inline--fa.fa-w-16 {
	width: 1em
}

.svg-inline--fa.fa-w-17 {
	width: 1.0625em
}

.svg-inline--fa.fa-w-18 {
	width: 1.125em
}

.svg-inline--fa.fa-w-19 {
	width: 1.1875em
}

.svg-inline--fa.fa-w-20 {
	width: 1.25em
}

.svg-inline--fa.fa-pull-left {
	margin-right: .3em;
	width: auto
}

.svg-inline--fa.fa-pull-right {
	margin-left: .3em;
	width: auto
}

.svg-inline--fa.fa-border {
	height: 1.5em
}

.svg-inline--fa.fa-li {
	width: 2em
}

.svg-inline--fa.fa-fw {
	width: 1.25em
}

.fa-layers svg.svg-inline--fa {
	bottom: 0;
	left: 0;
	margin: auto;
	position: absolute;
	right: 0;
	top: 0
}

.fa-layers {
	display: inline-block;
	height: 1em;
	position: relative;
	text-align: center;
	vertical-align: -12.5%;
	width: 1em
}

.fa-layers svg.svg-inline--fa {
	-webkit-transform-origin: center center;
	transform-origin: center center
}

.fa-layers-counter, .fa-layers-text {
	display: inline-block;
	position: absolute;
	text-align: center
}

.fa-layers-text {
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	-webkit-transform-origin: center center;
	transform-origin: center center
}

.fa-layers-counter {
	background-color: #ff253a;
	border-radius: 1em;
	color: #fff;
	height: 1.5em;
	line-height: 1;
	max-width: 5em;
	min-width: 1.5em;
	overflow: hidden;
	padding: .25em;
	right: 0;
	text-overflow: ellipsis;
	top: 0;
	-webkit-transform: scale(.25);
	transform: scale(.25);
	-webkit-transform-origin: top right;
	transform-origin: top right
}

.fa-layers-bottom-right {
	bottom: 0;
	right: 0;
	top: auto;
	-webkit-transform: scale(.25);
	transform: scale(.25);
	-webkit-transform-origin: bottom right;
	transform-origin: bottom right
}

.fa-layers-bottom-left {
	bottom: 0;
	left: 0;
	right: auto;
	top: auto;
	-webkit-transform: scale(.25);
	transform: scale(.25);
	-webkit-transform-origin: bottom left;
	transform-origin: bottom left
}

.fa-layers-top-right {
	right: 0;
	top: 0;
	-webkit-transform: scale(.25);
	transform: scale(.25);
	-webkit-transform-origin: top right;
	transform-origin: top right
}

.fa-layers-top-left {
	left: 0;
	right: auto;
	top: 0;
	-webkit-transform: scale(.25);
	transform: scale(.25);
	-webkit-transform-origin: top left;
	transform-origin: top left
}

.fa-lg {
	font-size: 1.33333em;
	line-height: .75em;
	vertical-align: -.0667em
}

.fa-xs {
	font-size: .75em
}

.fa-sm {
	font-size: .875em
}

.fa-1x {
	font-size: 1em
}

.fa-2x {
	font-size: 2em
}

.fa-3x {
	font-size: 3em
}

.fa-4x {
	font-size: 4em
}

.fa-5x {
	font-size: 5em
}

.fa-6x {
	font-size: 6em
}

.fa-7x {
	font-size: 7em
}

.fa-8x {
	font-size: 8em
}

.fa-9x {
	font-size: 9em
}

.fa-10x {
	font-size: 10em
}

.fa-fw {
	text-align: center;
	width: 1.25em
}

.fa-ul {
	list-style-type: none;
	margin-left: 2.5em;
	padding-left: 0
}

.fa-ul>li {
	position: relative
}

.fa-li {
	left: -2em;
	position: absolute;
	text-align: center;
	width: 2em;
	line-height: inherit
}

.fa-border {
	border: solid .08em #eee;
	border-radius: .1em;
	padding: .2em .25em .15em
}

.fa-pull-left {
	float: left
}

.fa-pull-right {
	float: right
}

.fa.fa-pull-left, .fab.fa-pull-left, .fal.fa-pull-left, .far.fa-pull-left,
	.fas.fa-pull-left {
	margin-right: .3em
}

.fa.fa-pull-right, .fab.fa-pull-right, .fal.fa-pull-right, .far.fa-pull-right,
	.fas.fa-pull-right {
	margin-left: .3em
}

.fa-spin {
	-webkit-animation: fa-spin 2s infinite linear;
	animation: fa-spin 2s infinite linear
}

.fa-pulse {
	-webkit-animation: fa-spin 1s infinite steps(8);
	animation: fa-spin 1s infinite steps(8)
}

@
-webkit-keyframes fa-spin { 0%{
	-webkit-transform: rotate(0);
	transform: rotate(0)
}

100
%
{
-webkit-transform
:
rotate(
360deg
);
transform
:
rotate(
360deg
)
}
}
@
keyframes fa-spin { 0%{
	-webkit-transform: rotate(0);
	transform: rotate(0)
}

100
%
{
-webkit-transform
:
rotate(
360deg
);
transform
:
rotate(
360deg
)
}
}
.fa-rotate-90 {
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg)
}

.fa-rotate-180 {
	-webkit-transform: rotate(180deg);
	transform: rotate(180deg)
}

.fa-rotate-270 {
	-webkit-transform: rotate(270deg);
	transform: rotate(270deg)
}

.fa-flip-horizontal {
	-webkit-transform: scale(-1, 1);
	transform: scale(-1, 1)
}

.fa-flip-vertical {
	-webkit-transform: scale(1, -1);
	transform: scale(1, -1)
}

.fa-flip-horizontal.fa-flip-vertical {
	-webkit-transform: scale(-1, -1);
	transform: scale(-1, -1)
}

:root .fa-flip-horizontal, :root .fa-flip-vertical, :root .fa-rotate-180,
	:root .fa-rotate-270, :root .fa-rotate-90 {
	-webkit-filter: none;
	filter: none
}

.fa-stack {
	display: inline-block;
	height: 2em;
	position: relative;
	width: 2em
}

.fa-stack-1x, .fa-stack-2x {
	bottom: 0;
	left: 0;
	margin: auto;
	position: absolute;
	right: 0;
	top: 0
}

.svg-inline--fa.fa-stack-1x {
	height: 1em;
	width: 1em
}

.svg-inline--fa.fa-stack-2x {
	height: 2em;
	width: 2em
}

.fa-inverse {
	color: #fff
}

.sr-only {
	border: 0;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	margin: -1px;
	overflow: hidden;
	padding: 0;
	position: absolute;
	width: 1px
}

.sr-only-focusable:active, .sr-only-focusable:focus {
	clip: auto;
	height: auto;
	margin: 0;
	overflow: visible;
	position: static;
	width: auto
}
</style>
<link rel="shortcut icon"
	href="https://www.buydirectlyfromfarmers.tw/static/ico/favicon.png">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/home/home_files/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/home/home_files/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/home/home_files/index.css">

<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/clarity(1).js"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/8frlty15ix(1)"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/gtm(1).js"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/home/home_files/analytics(1).js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/front-end/home/home_files/1473064767308.JS"></script>

<script>
    (function (i, s, o, g, r, a, m) {
      i['GoogleAnalyticsObject'] = r;
      i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
      a = s.createElement(o),
        m = s.getElementsByTagName(o)[0];
      a.async = 1;
      a.src = g;
      m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-51305575-1', 'buydirectlyfromfarmers.tw');
    ga('send', 'pageview');
  </script>

<script>
    (function (w, d, s, l, i) {
      w[l] = w[l] || [];
      w[l].push({
        'gtm.start': new Date().getTime(),
        event: 'gtm.js'
      });
      var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s),
        dl = l != 'dataLayer' ? '&l=' + l : '';
      j.async = true;
      j.src =
        'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
      f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-P3M896W');
  </script>

<script
	src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
<script
	src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
<script
	src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
<script
	src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
<style type="text/css">
* { <br > -webkit-user-select:text!important; <br > -moz-user-select:text!important;
	<br > -ms-user-select:text!important; <br > user-select:text!important;
	<br >
	
}
</style>
<style type="text/css">
* { <br > -webkit-user-select:text!important; <br > -moz-user-select:text!important;
	<br > -ms-user-select:text!important; <br > user-select:text!important;
	<br >
	
}
</style>
</head>

<body id="default" class="default" style="">
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-P3M896W"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>

	<div id="wrapper">
		<section class="header-wrapper">

			<header>
				<!-- 此處加上id="header會跑版" -->
				<!-- 這裡刪掉幻燈片會跑版，勿刪!!! -->
				<!-- 此處導入header.jsp -->
				<%--         <jsp:include page="/front-end/home/header.jsp" flush="true"/> --%>
				<%--         <%@ include file="header.jsp" %> --%>
				<iframe
					src="<%=request.getContextPath()%>/front-end/home/header.jsp"
					width="100%" height="100%" style="display: block;"></iframe>

			</header>

		</section>

		<div id="uiLockId"
			style="display: none; position: fixed; top: 0; left: 0; z-index: 5; opacity: 0.6; width: 100%; height: 200%; color: white; background-color: #666666; text-align: center">
			<div style="position: fixed; z-index: 100; top: 200px; left: 50%">
				<img style="position: relative; left: -50%;"
					src="<%=request.getContextPath()%>/front-end/home/home_files/farmers-animation.gif"
					alt="Farmer running">
			</div>
		</div>
		<section id="content" style="opacity: 1;" class="">
			<iframe
				src="<%=request.getContextPath()%>/front-end/home/homeSlideShow.jsp"
				width="1410" height="590" frameborder="0" style="display: block;"></iframe>

		</section>
		<section id="content" style="opacity: 1;" class="">
			<div class="container">
				<section class="block">
					<div class="title">
						<span class="block-titlefont WStdsong-B">必吃旬味</span>
						<h5 style="line-height: 30px; margin-top: 16px;">認識為你種植的人</h5>
						<h5 style="line-height: 30px; margin-top: 0px;">享受最合季節的美味</h5>
					</div>

					<div class="row">

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/Miaoli_Strawberry_Lan_4365/"
								id="Miaoli_Strawberry_Lan_4365">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-412-1pic-btn.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-412-btn-png.png">

									<img class="label-mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/preorder_mask.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/2b977bd352ffaa8c704fc51929deb2db.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>綜合紅草莓百寶盒</span>
								</h5>


								<h6 class="producer">藍凱文</h6>
								<p style="overflow-wrap: break-word;">每口都是驚喜！一次品嚐多種草莓風味！</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/Fig-shelterfarm_3522/"
								id="Fig-shelterfarm_3522">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-360-pic-btn.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-Fig-shelterfarm-1.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/bf93105d8541c09b0b57977f66b44ced.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>蜂蜜甜 有機轉無花果</span>
								</h5>


								<h6 class="producer">慈恩庇護休閒農場</h6>
								<p class="" style="overflow-wrap: break-word;">果香濃郁、口感綿甜細膩，每一口都是對人與土地愛...</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/fig-tu_1246/"
								id="fig-tu_1246">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-fig-tu-2_1.png">


									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/7f00858ba7d61f24b59b6da8c4a920d9.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>心花朵朵開 有機無花果</span>
								</h5>


								<h6 class="producer">凃清溪</h6>
								<p style="overflow-wrap: break-word;">690元起，香甜軟糯、入口即化！送人自品都驚喜</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/candied_date_ma_2013/"
								id="candied_date_ma_2013">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/candied_date_ma-btn.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/candied-date-ma-png2.png">

									<img class="label-mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/preorder_mask.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/a81a140b43a81f093414c02c3055d220.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>正能量 有機蜜棗</span>
								</h5>

								<h6 class="producer">馬清宮</h6>
								<p class="" style="overflow-wrap: break-word;">內行人才懂的小珠棗開採囉！肉質細緻又香甜。大...</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/honey-tangerine-Lin_3431/"
								id="honey-tangerine-Lin_3431">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-png_2.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-png_1.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/d0f08a79b82e5d1e75cf9c9d505dc8a4.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>幸運草生！ 爆漿茂谷柑</span>
								</h5>

								<h6 class="producer">林秋福</h6>
								<p style="overflow-wrap: break-word;">謝絕除草劑，滿地幸運草來相伴！飽水爽口甜酸濃郁！</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/ling-jiao-sweet-potato-Shuilin-Kao_3482/"
								id="ling-jiao-sweet-potato-Shuilin-Kao_3482">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn_9.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-png_2.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/4d27dbb16170bd06da6e5a28bfe33193.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>謝謝米的有機菱角地瓜</span>
								</h5>

								<h6 class="producer">郭明源</h6>
								<p style="overflow-wrap: break-word;">有機耕作的菱角地瓜，皮薄、肉質細緻帶菱角香氣！</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/sweet-potato_147/"
								id="sweet-potato_147">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn-sweet-potato2.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-033-pic-btn-sweet-potato__2.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/0d27b385552a800d61e3a5313aa9200b.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>謝謝米的有機黃金地瓜</span>
								</h5>

								<h6 class="producer">郭明源</h6>
								<p style="overflow-wrap: break-word;">明源的地瓜不需農藥，因為他採用了和自然互助的方...</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/Pingtung-Babycorn-Wu_4291/"
								id="Pingtung-Babycorn-Wu_4291">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn(1).jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-png_1(1).png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/b36499e0d50beae4b4f508b752f9156a.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>脆嫩清甜 有機紅鬚玉米筍</span>
								</h5>

								<h6 class="producer">吳文志</h6>
								<p style="overflow-wrap: break-word;">只採品質最佳的頭兩穗，現採現出爽脆可口</p>
							</a>
						</div>


						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/yam-Fangyuan-Wei_4361/"
								id="yam-Fangyuan-Wei_4361">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn_2.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-png.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/e91aa92cc536535c90488bb83837e4c2.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>Q彈細緻 人蔘山藥切塊</span>
								</h5>

								<h6 class="producer">魏國賓</h6>
								<p style="overflow-wrap: break-word;">帶淡淡人蔘香氣，是最佳的養生食材</p>
							</a>
						</div>


						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/Yunlin_alusu_wu_4386/"
								id="Yunlin_alusu_wu_4386">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-415-pic-btn.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-415-btn-png.png">

									<img class="label-mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/limited_mask.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/e83b3f8e6c98dae04eda194202fba366.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>日本網紋瓜之王 阿露斯哈密瓜</span>
								</h5>

								<h6 class="producer">吳睿娟、楊忠錦</h6>
								<p style="overflow-wrap: break-word;">日系阿露斯哈密瓜，一株一果，香濃爆汁。</p>
							</a>
						</div>


						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/gift-tankan-2018_2022/"
								id="gift-tankan-2018_2022">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn02.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn-gift-tankan-2018_1.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/4294df0c9e04d3c078c665bdf76f68e9.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>有機桶柑 精美禮盒</span>
								</h5>

								<h6 class="producer">徐淡奎、徐肇徵</h6>
								<p style="overflow-wrap: break-word;">625~700元。果型圓潤、色澤橙黃，適合年節送禮!</p>
							</a>
						</div>


						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/Zucchini-Kale-Daxi-Lin_3511/"
								id="Zucchini-Kale-Daxi-Lin_3511">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn_11.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-png_1.pngFV-348-copy0">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/5696bfc8a3a55794f22d8f84a19cce92.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>蔬食好搭檔 櫛瓜+羽衣甘藍組</span>
								</h5>

								<h6 class="producer">林詹翊</h6>
								<p style="overflow-wrap: break-word;">一次購足健康蔬食的最佳拍檔！</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/beef_tomato_tsai_2644/"
								id="beef_tomato_tsai_2644">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/有機牛番茄_btn-270x270-72.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-279-有機牛番茄_btn.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/a95957dbd5aa85f0933192ce3d1a25be.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>皮薄豐滿 有機牛番茄</span>
								</h5>

								<h6 class="producer">蔡昌旺</h6>
								<p style="overflow-wrap: break-word;">鮮紅圓潤且富含茄紅素，能大口安心食用！</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/yunlin-strawberry-jhang_4336/"
								id="yunlin-strawberry-jhang_4336">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-411-3-pic-btn.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV-411-btn-png_1.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/dea16386644f9b9ead7222954dcfd92e.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>香軟嫩！有機豐香草莓</span>
								</h5>

								<h6 class="producer">章碧瓊</h6>
								<p style="overflow-wrap: break-word;">草莓控農夫，自己和家人都好愛的作品獻給你。</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/honeycrisp-liu-special_4377/"
								id="honeycrisp-liu-special_4377">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV319_btn_1.jpgFV-319-copy0">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/FV319_btn-png_1.pngFV-319-copy0">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/bd0ae096a8ee2ffd976e4ca5a3ca4afc.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>大禹嶺 本土蜜蘋果(惠)（惜福版）</span>
								</h5>

								<h6 class="producer">劉春長</h6>
								<p class="" style="overflow-wrap: break-word;">因溫差大，偶能見珍貴蜜腺，甜酸比佳，口感最討...</p>
							</a>
						</div>

						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/yellow-fruit_2374/"
								id="yellow-fruit_2374">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-yellow-fruit-1.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-yellow-fruit-2.png">

									<div class="head">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/d3bec67aca83762ab1c603c7e51de416.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>高膠質 草生黃金果</span>
								</h5>


								<h6 class="producer">鄞啟東</h6>
								<p style="overflow-wrap: break-word;">豐富膠質，並含豐富可溶性纖維質，是非常養生養顏...</p>
							</a>
						</div>

					</div>

					<div class="line"></div>

				</section>

				<section class="block">
					<div class="title">
						<span class="block-titlefont WStdsong-B">人氣很旺的</span>
						<h5 style="line-height: 30px; margin-top: 16px;">看看其他朋友在關注什麼</h5>
						<h5 style="line-height: 30px; margin-top: 0px;">還有團隊票選好物</h5>
					</div>


					<div class="row">


						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/angus-cattle-mix-chen_4112/"
								id="angus-cattle-mix-chen_4112">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-angus-cattle-mix-chen-1.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-angus-cattle-mix-chen-2.png">

									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/0d4e229ad72da878d98058b9416015da.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>本土產安格斯黑牛 滷牛4天王（牛肋、牛腱、牛腩、半筋半肉牛頸花）</span>
								</h5>


								<h6 class="producer">陳柏吟</h6>
								<p style="overflow-wrap: break-word;">瘦肉鮮美有嚼勁、牛脂濃醇甘香，多層次豐富口感一...</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/gift-dry-mushrooms-2017_1509/"
								id="gift-dry-mushrooms-2017_1509">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/0011111_2.jpg">




									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/7edffc099dd92336c38f72cdbb0a9121.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>有機乾冬菇 特大朵禮盒</span>
								</h5>


								<h6 class="producer">楊凱鈞</h6>
								<p style="overflow-wrap: break-word;">1200元，有機栽培特大朵！附禮盒與專屬燙金提袋</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/sanjeou-braised-pork-knuckle_3361/"
								id="sanjeou-braised-pork-knuckle_3361">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-sanjeou-braised-pork-knuckle-1.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-sanjeou-braised-pork-knuckle-2.png">




									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/67292328041d958aa23b74ad6c84c7aa.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>古早味滷蹄膀</span>
								</h5>


								<h6 class="producer">三久食品</h6>
								<p style="overflow-wrap: break-word;">國產豬肉安心吃，經典台式年味，圍爐輕鬆出大菜！</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/donate-DoubleBlissWelfareAndCharityFoundation_3970/"
								id="donate-DoubleBlissWelfareAndCharityFoundation_3970">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_filespic-btn_1.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-png_2(1).png">




									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/b23ba6b9677284e302ddc8c0aa115a6b.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>認購行動 ♥ 雙福基金會獨居及弱勢長輩糧食募集</span>
								</h5>


								<h6 class="producer">直接跟農夫買</h6>
								<p class="" style="overflow-wrap: break-word;">認購暖心物資包，為弱勢族群募集所需，傳遞愛與關...</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/chrysanthemum_1466/"
								id="chrysanthemum_1466">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-chrysanthemum-1.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic--btn-red-.png">




									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/6c86943658d0d1cbd6d48b6123ae4395.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>本土安心 黃金杭菊(菊花茶)</span>
								</h5>


								<h6 class="producer">謝富羽</h6>
								<p style="overflow-wrap: break-word;">香氣優雅迷人，無農藥殘留無燻硫，安心沖泡！</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/red-dates_1186/"
								id="red-dates_1186">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-red.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic--btn.png">




									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/046d521dfff98dce079e96ead582fec7.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>無農藥栽培 本土紅棗乾</span>
								</h5>


								<h6 class="producer">謝富羽</h6>
								<p class="" style="overflow-wrap: break-word;">入口散發自然香甜氣味，風味十足！豐富的維生素Ｂ...</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/firewood-brown-sugar_340/"
								id="firewood-brown-sugar_340">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/btn-firewood-brown-sugar-001.jpg">

									<img class="mask"
										src="<%=request.getContextPath()%>/front-end/home/home_files/RE-030-pic-btn-firewood-brown-sugar_.png">




									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/5f27a6ec2dfa030b26d193e09bb9761e.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>古法熬製！手工柴燒黑糖</span>
								</h5>


								<h6 class="producer">張玥騰</h6>
								<p style="overflow-wrap: break-word;">糖香馥郁多層次，喉間回甘清爽不甜膩！</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/18ranch-chicken-broth_1208/"
								id="18ranch-chicken-broth_1208">
								<div class="pic">
									<img
										src="<%=request.getContextPath()%>/front-end/home/home_files/pic-btn-18ranch-chicken-broth_1.jpg">

									<img class="mask"
										src="./小農首頁3_files/pic-btn-18ranch-chicken-broth.png">




									<div class="head">


										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/2e405d13f82afa0f8a196c0070ea4200.jpg">

										<img
											src="<%=request.getContextPath()%>/front-end/home/home_files/head1.png">

									</div>
								</div>
								<h5>
									<span>友善飼養 精煉雞高湯</span>
								</h5>


								<h6 class="producer">十八養場團隊</h6>
								<p style="overflow-wrap: break-word;">3小時精煉雞隻精華，甘甜不膩、可快速料理</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/taro-rice-cake-huadon_4311/"
								id="taro-rice-cake-huadon_4311">
								<div class="pic">
									<img src="./小農首頁3_files/btn-taro-rice-cake-huadon-02.jpg">

									<img class="mask"
										src="./小農首頁3_files/btn-taro-rice-cake-huadon-2.png"> <img
										class="label-mask" src="./小農首頁3_files/preorder_mask.png">


									<div class="head">


										<img src="./小農首頁3_files/c6ca5222b5243ed55318f7fe72a00dbc.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>芋頭好多！手工芋頭糕（葷、素）</span>
								</h5>


								<h6 class="producer">張美慧</h6>
								<p style="overflow-wrap: break-word;">嚴選鬆軟綿檳榔心芋＋台灣在來米水磨製漿！</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/turnip-cake_856/"
								id="turnip-cake_856">
								<div class="pic">
									<img src="./小農首頁3_files/pic-btn--turnip-cake-1_1.jpg"> <img
										class="mask" src="./小農首頁3_files/pic-btn--turnip-cake-2.jpg">




									<div class="head">


										<img src="./小農首頁3_files/500ed84e881ed3050cff5323a518c9ab.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>農夫手作蘿蔔糕／芋粿巧</span>
								</h5>


								<h6 class="producer">慶豪＆慧芸</h6>
								<p style="overflow-wrap: break-word;">季節限定，好吃、蘿蔔感明確的蘿蔔糕。</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/donate-Nanjichangfoodbank_3806/"
								id="donate-Nanjichangfoodbank_3806">
								<div class="pic">
									<img src="./小農首頁3_files/未命名-1_2.jpg"> <img class="mask"
										src="./小農首頁3_files/btn-2.png">




									<div class="head">


										<img src="./小農首頁3_files/48018db813ad49d927d9ec57e1e6691e.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>認購行動 ♥ 南機場食物銀行 弱勢家庭食物募集</span>
								</h5>


								<h6 class="producer">直接跟農夫買</h6>
								<p class="" style="overflow-wrap: break-word;">認購暖心食材包，為弱勢家庭募集所需，小額度大暖...</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/blackpeanut-wang_2540/"
								id="blackpeanut-wang_2540">
								<div class="pic">
									<img src="./小農首頁3_files/btn-270x270-72.jpg"> <img
										class="mask" src="./小農首頁3_files/btn-blackpeanut-wang-2.png">




									<div class="head">


										<img src="./小農首頁3_files/711eb30efe0f444ae1d6e13dd2905ce6.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>全程無農藥 帶殼黑金剛花生(原味炒熟)</span>
								</h5>


								<h6 class="producer">王玉彰</h6>
								<p style="overflow-wrap: break-word;">日曬後焙炒，質地細緻綿密，濃郁花生香！</p>
							</a>
						</div>



					</div>

					<div class="line"></div>

				</section>

				<section class="block">
					<div class="title">
						<span class="block-titlefont WStdsong-B">計畫性支持專區</span>
						<div class="cat-d-title">
							<h5 style="line-height: 30px; margin-top: 16px;">預約你期待的農人產物，幫助友善農夫走得更安穩更永續</h5>
						</div>
						<div class="cat-m-title">
							<h5 style="line-height: 30px; margin-top: 16px;">預約你期待的農人產物</h5>
							<h5 style="line-height: 30px; margin-top: 0px;">幫助友善農夫走得更安穩更永續</h5>
						</div>
					</div>


					<div class="block-slide">
						<div id="block-slide1" class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide" style="opacity: 1; max-width: 100%;">


									<a
										href="https://www.buydirectlyfromfarmers.tw/catalogue/clam_guo_955/">
										<img src="./小農首頁3_files/topslides-clamguo_1.jpg">


										<h2>不只飽嘴鮮美，更守護漁村地層</h2>
										<h1>守護水土 鹽水文蛤</h1>

									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="row">


						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/organic_dried_colored_tomatoes_hsu_2949/"
								id="organic_dried_colored_tomatoes_hsu_2949">
								<div class="pic">
									<img
										src="./小農首頁3_files/btn-organic_dried_colored_tomatoes_hsu-1.jpg">

									<img class="mask"
										src="./小農首頁3_files/btn-organic_dried_colored_tomatoes_hsu-2.png">




									<div class="head">


										<img src="./小農首頁3_files/77a54337247e419708d72ef6056ee651.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>萬用！有機彩色番茄果乾</span>
								</h5>


								<h6 class="producer">許復堡</h6>
								<p style="overflow-wrap: break-word;">番茄味濃郁！零食、搭沙拉、油漬都讚！</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/Irwin-mango-chen_1716/"
								id="Irwin-mango-chen_1716">
								<div class="pic">
									<img src="./小農首頁3_files/btn-mango-chen.jpg"> <img
										class="mask" src="./小農首頁3_files/btn-mango-chen-2.png">




									<div class="head">


										<img src="./小農首頁3_files/f2bbfc2ca59a35e299627b5f77cf26e1.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>護土濃香 愛文芒果</span>
								</h5>


								<h6 class="producer">陳甫諭</h6>
								<p style="overflow-wrap: break-word;">農藥零檢出！果香濃郁，香甜微酸層次豐富！</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/pitaya_red_huang_2988/"
								id="pitaya_red_huang_2988">
								<div class="pic">
									<img src="./小農首頁3_files/btn-png_2(2).jpg"> <img
										class="mask" src="./小農首頁3_files/btn-png_4.png">




									<div class="head">


										<img src="./小農首頁3_files/bdabb782a57e67f9e30fcf274f2ce875.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>無草味 自然農法紅肉火龍果</span>
								</h5>


								<h6 class="producer">黃榮霖、楊淑惠</h6>
								<p style="overflow-wrap: break-word;">低熱量，養顏又美身！多元營養素</p>
							</a>
						</div>




						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/surprise-mangobox-chang_3859/"
								id="surprise-mangobox-chang_3859">
								<div class="pic">
									<img src="./小農首頁3_files/FV-384btn.jpg"> <img class="mask"
										src="./小農首頁3_files/btn-FV385-01.png">




									<div class="head">


										<img src="./小農首頁3_files/64244cc784a5b54afd0c4d5ee1a9b446.jpg">

										<img src="./小農首頁3_files/head1.png">

									</div>
								</div>
								<h5>
									<span>有野兔芒果園之 綜合離奇芒果箱</span>
								</h5>


								<h6 class="producer">張玥騰</h6>
								<p style="overflow-wrap: break-word;">每盒都獨一無二！驚奇、離奇、農夫也不知道是什麼...</p>
							</a>
						</div>


						<iframe
							src="<%=request.getContextPath()%>/front-end/home/footer.jsp"
							width="100%" height="100%" style="display: block;"></iframe>
					</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					
					
					
					
					
					
					
					
					
					
					
					
					
					

					<div class="btn btn-hover handdraw-btn"
						style="position: relative; width: 261px; height: 43px;">

						<a
							href="https://www.buydirectlyfromfarmers.tw/catalogue/planned_products/">

							<img src="./小農首頁3_files/handdraw-btn.png"> <span
							class="handdraw-btn-long">看看全部計畫性支持專區&nbsp;&nbsp;&gt;</span>

						</a>
					</div>

					<div class="line"></div>

				</section>
							<div class="index-banner">
				<div class="scroll-btn">
					<i class="arrow-down arrow animated infinite fadeOutDown2"></i>
				</div>
				<div id="index-silde"
					class="swiper-container swiper-container-horizontal swiper-container-fade">
					<div class="swiper-wrapper" style="transition-duration: 0ms;">
						<div class="swiper-slide slide-item swiper-slide-duplicate"
							data-swiper-slide-index="5"
							style="width: 1107px; transform: translate3d(0px, 0px, 0px); opacity: 1; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/promotions/%E4%BA%94%E5%80%8D%E5%8D%B7_%E5%B7%A5%E4%BD%9C%E5%8D%80%E5%9F%9F_1_2.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/5000-quintuple-stimulus-voucher_4104/">
									<div style="width: 100%; height: 100%; diplay: none;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/5000-quintuple-stimulus-voucher_4104/">
									<h2 class="ani     " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;"></h2>
									<h1 class="ani     " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;"></h1>
									<hr class="ani     " swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
									<h3 class="ani     " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
										詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>




						<div class="swiper-slide slide-item" data-swiper-slide-index="0"
							style="width: 1107px; transform: translate3d(-1107px, 0px, 0px); opacity: 1; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/products/2022/01/FV-415-slides2.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/Yunlin_alusu_wu_4386/">
									<div
										style="width: 100%; height: 100%; diplay: none; z-index: 99;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/Yunlin_alusu_wu_4386/">
									<h2 class="ani                    "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0s;"
										swiper-animate-style-cache="visibility: visible; animation-duration: 0.8s; animation-delay: 0s;animation-duration:0.8s;-webkit-animation-duration:0.8s;animation-delay:0s;-webkit-animation-delay:0s;">
										市面極稀有「特大果」，春節前限定！</h2>
									<h1 class="ani                    "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.3s;"
										swiper-animate-style-cache="visibility: visible; animation-duration: 0.8s; animation-delay: 0.3s;animation-duration:0.8s;-webkit-animation-duration:0.8s;animation-delay:0.3s;-webkit-animation-delay:0.3s;">
										日本網紋瓜之王 阿露斯哈密瓜</h1>
									<hr class="ani                    "
										swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.6s;"
										swiper-animate-style-cache="visibility: visible; animation-duration: 0.8s; animation-delay: 0.6s;animation-duration:0.8s;-webkit-animation-duration:0.8s;animation-delay:0.6s;-webkit-animation-delay:0.6s;">
									<h3 class="ani                    "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.8s;"
										swiper-animate-style-cache="visibility: visible; animation-duration: 0.8s; animation-delay: 0.8s;animation-duration:0.8s;-webkit-animation-duration:0.8s;animation-delay:0.8s;-webkit-animation-delay:0.8s;">
										產品詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>




						<div class="swiper-slide slide-item" data-swiper-slide-index="1"
							style="width: 1107px; transform: translate3d(-2214px, 0px, 0px); opacity: 1; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/products/2021/12/slides2_12.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/gift-tankan-2018_2022/">
									<div
										style="width: 100%; height: 100%; diplay: none; z-index: 99;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/gift-tankan-2018_2022/">
									<h2 class="ani               "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">自然完熟、酸甜夠味的果實，以金色提繩紅禮盒傳喜氣</h2>
									<h1 class="ani               "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">有機桶柑
										精美禮盒</h1>
									<hr class="ani               " swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
									<h3 class="ani               "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
										產品詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>




						<div class="swiper-slide slide-item" data-swiper-slide-index="2"
							style="width: 1107px; transform: translate3d(-3321px, 0px, 0px); opacity: 1; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/products/2021/01/slide-sanjeou-braised-pork-knuckle.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/sanjeou-braised-pork-knuckle_3361/">
									<div
										style="width: 100%; height: 100%; diplay: none; z-index: 99;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/sanjeou-braised-pork-knuckle_3361/">
									<h2 class="ani               "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">脂肪甜美、醬香濃郁，膠質黏上嘴唇的瞬間，幸福滿滿～
									</h2>
									<h1 class="ani               "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">古早味滷蹄膀</h1>
									<hr class="ani               " swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
									<h3 class="ani               "
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
										產品詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>




						<div class="swiper-slide slide-item swiper-slide-prev"
							data-swiper-slide-index="3"
							style="width: 1107px; transform: translate3d(-4428px, 0px, 0px); opacity: 1; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/products/2022/01/FV-412-slides2.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/Miaoli_Strawberry_Lan_4365/">
									<div
										style="width: 100%; height: 100%; diplay: none; z-index: 99;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/Miaoli_Strawberry_Lan_4365/">
									<h2 class="ani          " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">不分品種混裝，每一盒都是獨一無二的草莓百寶盒，每一口都是驚喜！</h2>
									<h1 class="ani          " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">綜合紅草莓百寶盒</h1>
									<hr class="ani          " swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
									<h3 class="ani          " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
										產品詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>

						<div class="swiper-slide slide-item swiper-slide-active"
							data-swiper-slide-index="4"
							style="width: 1107px; transform: translate3d(-5535px, 0px, 0px); opacity: 1; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/products/2021/01/FV-343_slides2.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/ling-jiao-sweet-potato-Taixi-Wu_3438/">
									<div
										style="width: 100%; height: 100%; diplay: none; z-index: 99;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/ling-jiao-sweet-potato-Taixi-Wu_3438/">
									<h2 class="ani            fadeInLeft animated"
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: visible; animation-duration: 0.8s; -webkit-animation-duration: 0.8s; animation-delay: 0s; -webkit-animation-delay: 0s;"
										swiper-animate-style-cache="visibility: hidden;">口感鬆軟，帶有淡淡的菱角和牛奶香氣</h2>
									<h1 class="ani            fadeInLeft animated"
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: visible; animation-duration: 0.8s; -webkit-animation-duration: 0.8s; animation-delay: 0.3s; -webkit-animation-delay: 0.3s;"
										swiper-animate-style-cache="visibility: hidden;">又香又鬆
										有機轉型期菱角地瓜</h1>
									<hr class="ani            width130 animated"
										swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: visible; animation-duration: 0.8s; -webkit-animation-duration: 0.8s; animation-delay: 0.6s; -webkit-animation-delay: 0.6s;"
										swiper-animate-style-cache="visibility: hidden;">
									<h3 class="ani            fadeInLeft animated"
										swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: visible; animation-duration: 0.8s; -webkit-animation-duration: 0.8s; animation-delay: 0.8s; -webkit-animation-delay: 0.8s;"
										swiper-animate-style-cache="visibility: hidden;">
										產品詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>

						<div class="swiper-slide slide-item swiper-slide-next"
							data-swiper-slide-index="5"
							style="width: 1107px; transform: translate3d(-6642px, 0px, 0px); opacity: 0; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/promotions/%E4%BA%94%E5%80%8D%E5%8D%B7_%E5%B7%A5%E4%BD%9C%E5%8D%80%E5%9F%9F_1_2.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/5000-quintuple-stimulus-voucher_4104/">
									<div style="width: 100%; height: 100%; diplay: none;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/5000-quintuple-stimulus-voucher_4104/">
									<h2 class="ani     " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;"></h2>
									<h1 class="ani     " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;"></h1>
									<hr class="ani     " swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
									<h3 class="ani     " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: hidden;"
										swiper-animate-style-cache="visibility: hidden;">
										詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>

						<div class="swiper-slide slide-item swiper-slide-duplicate"
							data-swiper-slide-index="0"
							style="width: 1107px; transform: translate3d(-7749px, 0px, 0px); opacity: 0; transition-duration: 0ms;">
							<div class="bg"
								style="background-image: url(&#39;/media/uploads/images/products/2022/01/FV-415-slides2.jpg&#39;)">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/Yunlin_alusu_wu_4386/">
									<div
										style="width: 100%; height: 100%; diplay: none; z-index: 99;"></div>
								</a>
							</div>
							<div class="container">
								<a
									href="https://www.buydirectlyfromfarmers.tw/catalogue/Yunlin_alusu_wu_4386/">
									<h2 class="ani          " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0s;"
										swiper-animate-style-cache="visibility: hidden; animation-duration: 0.8s; animation-delay: 0s;">
										市面極稀有「特大果」，春節前限定！</h2>
									<h1 class="ani          " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.3s;"
										swiper-animate-style-cache="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.3s;">
										日本網紋瓜之王 阿露斯哈密瓜</h1>
									<hr class="ani          " swiper-animate-effect="width130"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.6s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.6s;"
										swiper-animate-style-cache="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.6s;">
									<h3 class="ani          " swiper-animate-effect="fadeInLeft"
										swiper-animate-duration="0.8s" swiper-animate-delay="0.8s"
										style="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.8s;"
										swiper-animate-style-cache="visibility: hidden; animation-duration: 0.8s; animation-delay: 0.8s;">
										產品詳情<i class="arrow-right arrow"></i>
									</h3>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
				<section class="block">
					<div class="title">
						<span class="block-titlefont WStdsong-B">邊吃邊讀</span>
						<h5 style="line-height: 30px; margin-top: 16px;">一起認識真食、閱讀大地</h5>
						<h5 style="line-height: 30px; margin-top: 0px;">我們堅持不抄襲、拷貝網路文章，嚴謹確認資訊，您可安心閱讀：）</h5>
					</div>


					<div class="row">


						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/how-to-pick-a-good-egg_4118/"
								id="how-to-pick-a-good-egg_4118">
								<div class="pic">
									<img src="./小農首頁3_files/pic-btn(2).jpg">
									<div class="sub-title tag-color2">識食</div>
								</div>

								<h5>
									<span>蛋液稀、蛋難剝，跟新鮮有關嗎？達人帶你挑好蛋吃好蛋</span>
								</h5>
								<p style="overflow-wrap: break-word;">你吃過黃金果嗎？金黃色的圓滾外表喜慶又討喜，是...</p>
							</a>
						</div>



						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/roe-cooking_3313/"
								id="roe-cooking_3313">
								<div class="pic">
									<img src="./小農首頁3_files/未命名-1.jpg">
									<div class="sub-title tag-color1">食譜</div>
								</div>

								<h5>
									<span>你知道烏魚子去膜更鮮美嗎?30秒去膜秘訣&amp;5分鐘出前菜!</span>
								</h5>
								<p style="overflow-wrap: break-word;">烏魚子會有一層天然的薄膜包覆魚卵，建議將其去除...</p>
							</a>
						</div>



						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/recipe-dried-ornage-peel_1476/"
								id="recipe-dried-ornage-peel_1476">
								<div class="pic">
									<img src="./小農首頁3_files/AR-028-btn.jpg">
									<div class="sub-title tag-color1">食譜</div>
								</div>

								<h5>
									<span>食譜-原來自製陳皮這麼簡單！</span>
								</h5>
								<p style="overflow-wrap: break-word;">用平底鍋就能做！泡飲、滷味都好用</p>
							</a>
						</div>



						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/abiu-taste-preserve_3461/"
								id="abiu-taste-preserve_3461">
								<div class="pic">
									<img src="./小農首頁3_files/cover1_13.jpg">
									<div class="sub-title tag-color2">識食</div>
								</div>

								<h5>
									<span>帶你嚐鮮超吸睛金黃色果實！黃金果的品嚐方法與保存技巧</span>
								</h5>
								<p style="overflow-wrap: break-word;">你吃過黃金果嗎？金黃色的圓滾外表喜慶又討喜，是...</p>
							</a>
						</div>



						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/Goat-Meat-Domestic-Cooking_3344/"
								id="Goat-Meat-Domestic-Cooking_3344">
								<div class="pic">
									<img src="./小農首頁3_files/btn-270x270-72羊肉.jpg">
									<div class="sub-title tag-color2">識食</div>
								</div>

								<h5>
									<span>不羶又Q彈，認識顛覆味蕾的高質本土羊肉&amp;挑選建議</span>
								</h5>
								<p style="overflow-wrap: break-word;">認識國產羊無羶味的原因，FGM認證挑選安心國產羊肉</p>
							</a>
						</div>



						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/TW-strawberry-variety_2707/"
								id="TW-strawberry-variety_2707">
								<div class="pic">
									<img src="./小農首頁3_files/btn-TW-strawberry-variety.jpg">
									<div class="sub-title tag-color2">識食</div>
								</div>

								<h5>
									<span>這些本土草莓你認識幾種？</span>
								</h5>
								<p style="overflow-wrap: break-word;">草莓控必讀，來拓展你的"莓好"版圖</p>
							</a>
						</div>



						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/dried-mushroom_3355/"
								id="dried-mushroom_3355">
								<div class="pic">
									<img src="./小農首頁3_files/btn.jpg">
									<div class="sub-title tag-color2">識食</div>
								</div>

								<h5>
									<span>鮮香菇VS乾香菇，香氣、營養差別在哪？</span>
								</h5>
								<p style="overflow-wrap: break-word;">有別於一般食材越新鮮越好的原則，坊間卻盛傳無論...</p>
							</a>
						</div>



						<div class="box">
							<a
								href="https://www.buydirectlyfromfarmers.tw/catalogue/peanut-aflatoxin_3444/"
								id="peanut-aflatoxin_3444">
								<div class="pic">
									<img src="./小農首頁3_files/btn(1).jpg">
									<div class="sub-title tag-color2">識食</div>
								</div>

								<h5>
									<span>向黃麴毒素SAY NO，花生這樣選</span>
								</h5>
								<p style="overflow-wrap: break-word;">其實懂得挑，許多用心生產者的花生美味又安全，來...</p>
							</a>
						</div>


					</div>

					<div class="btn btn-hover handdraw-btn"
						style="position: relative; width: 261px; height: 43px;">

						<a
							href="https://www.buydirectlyfromfarmers.tw/catalogue/category/bian-chi-bian-du_40/">

							<img src="./小農首頁3_files/handdraw-btn.png"> <span
							class="handdraw-btn-short">看看全部邊吃邊讀&nbsp;&nbsp;&gt;</span>

						</a>
					</div>

					<div class="line"></div>

				</section>


			</div>
		</section>


	</div>
	<script type="text/javascript" id="">(function(a,e,b,f,g,c,d){a[b]=a[b]||function(){(a[b].q=a[b].q||[]).push(arguments)};c=e.createElement(f);c.async=1;c.src="https://www.clarity.ms/tag/"+g+"?ref\x3dgtm2";d=e.getElementsByTagName(f)[0];d.parentNode.insertBefore(c,d)})(window,document,"clarity","script","8frlty15ix");</script>
	<!-- container -->
	<!-- content -->















	<section class="footer-wrapper">
		<section id="">
			<%--       <jsp:include page="/front-end/home/footer.jsp" flush="true"/> --%>
			<iframe
				src="<%=request.getContextPath()%>/front-end/home/footer.jsp"
				width="100%" height="100%" style="display: block;"></iframe>
		</section>
	</section>

	<!-- jQuery -->
	<script src="./小農首頁3_files/jquery.js"></script>
	<script>
    window.jQuery || document.write('<script src="/static/oscar/js/jquery/jquery-1.9.1.min.js"><\/script>')
  </script>
	<!-- bdff -->

	<script src="./小農首頁3_files/bdff_bremen.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="./小農首頁3_files/jquery-2.2.1.min.js"></script>
	<script src="./小農首頁3_files/plugins.js"></script>
	<script src="./小農首頁3_files/menu.js"></script>

	<!-- bdff -->
	<script src="./小農首頁3_files/index.js"></script>
	<script src="./小農首頁3_files/jquery.dotdotdot.js"></script>
	<script src="./小農首頁3_files/dotdotdot-desc.js"></script>
	<script>
    const elems = document.getElementsByClassName('producer');
    console.log(elems)
    for (let elem of elems) {
      console.log(elem);
      if (elem.innerHTML.length > 8) {
        elem.innerHTML = elem.innerHTML.substring(0, 8) + '...';
      } else {

      }
    }
  </script>

	<!-- bdff -->
	<script src="./小農首頁3_files/jquery.cookie.js"></script>
	<script>
    var django = (function ($) {
      var _urls = {}
      var _conf = {}
      return {
        settings: {
          'MEDIA_URL': '/media/',
          'STATIC_URL': '/static/'
        },

        i18n: function () {
          var strs = {};
          var get = function (k) {
            return _conf[k]
          }
          var set = function (k, v) {
            return _conf[k] = v
          }
          return arguments.length == 2 &&
            set(arguments[0], arguments[1]) ||
            get(arguments[0])
        },

        urls: function () {
          var get = function (k) {
            return _urls[k]
          }
          var set = function (k, v) {
            return _urls[k] = v
          }
          return arguments.length >= 2 &&
            set(arguments[0], arguments[1]) ||
            get(arguments[0])
        }
      }
    })(jQuery)

    $.ajaxSetup({
      beforeSend: function (xhr, settings) {
        if ($.cookie('csrftoken') && (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url)))) {
          xhr.setRequestHeader("X-CSRFToken", $.cookie('csrftoken'))
        }
      }
    });
  </script>

	<script type="text/javascript">
    $(function () {
      oscar.init();

    });
  </script>
	<!-- Version: N/A -->

	<script type="text/javascript" id="">
    (function (a, e, b, f, g, c, d) {
      a[b] = a[b] || function () {
        (a[b].q = a[b].q || []).push(arguments)
      };
      c = e.createElement(f);
      c.async = 1;
      c.src = "https://www.clarity.ms/tag/" + g + "?ref\x3dgtm2";
      d = e.getElementsByTagName(f)[0];
      d.parentNode.insertBefore(c, d)
    })(window, document, "clarity", "script", "8frlty15ix");
  </script>
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
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
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
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}
</script>

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