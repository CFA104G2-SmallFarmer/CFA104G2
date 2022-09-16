<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--               本網站由緯育(Tibame)Java雲端服務開發技術養成班-第93期-第二組製作， -->
<!--               非營利用途，僅為學習交流使用。如有不當使用之內容,請向https://www.tibame.com/聯繋。 -->
<!-- 參考網站https://shopee.tw/  https://www.zeczec.com/  https://www.buydirectlyfromfarmers.tw/ -->
<!-- saved from url=(0038)https://shopee.tw/user/account/profile -->
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


<!-- 當點選小農專區，印出未成為小農提示訊息，並跳轉回首頁 -->
<%
	String mess= (String) session.getAttribute("message");

	if("".equals(mess)  || mess==null){
	}
else{%>

<script type="text/javascript">
alert("<%=mess%>");
</script>

<% session.setAttribute("message", ""); }%>

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
-webkit-keyframes fa-spin {0%{
	-webkit-transform: rotate(0);
	transform: rotate(0) } 100%
{-webkit-transform:
rotate(360deg);transform:rotate(360deg)}}


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
<link rel="icon" href="<%=request.getContextPath()%>/front-end/assets/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/front-end/assets/images/favicon.ico" type="image/x-icon" />

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
	<br > -ms-user-select:text!important; <br >; user-select:text!important;
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
				<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
				<jsp:include page="/front-end/privateMessage/chat.jsp" flush="true"/>

			</header>

		</section>
<!-- 幻燈片 -->
		<div id="uiLockId"
			style="display: none; position: fixed; top: 0; left: 0; z-index: 5; opacity: 0.6; width: 100%; height: 200%; color: white; background-color: #666666; text-align: center">
			<div style="position: fixed; z-index: 100; top: 200px; left: 50%">
				<img style="position: relative; left: -50%;"
					src="<%=request.getContextPath()%>/front-end/home/home_files/farmers-animation.gif"
					alt="Farmer running">
			</div>
		</div>
   <section id="content" style="opacity: 1;" class="">
      <div id="mobile-indicator"></div>
      <div class="index-banner">
		<img
				src="https://www.besthealthmag.ca/wp-content/uploads/2019/03/Strawberry-Benefits.jpg"
				width="1410" height="590" frameborder="0" style="display: block;"/>
        <section class="block">
      </div>
      <div class="container">
        <section class="block">
      </div>
      <div class="container">
	<script type="text/javascript" >(function(a,e,b,f,g,c,d){a[b]=a[b]||function(){(a[b].q=a[b].q||[]).push(arguments)};c=e.createElement(f);c.async=1;c.src="https://www.clarity.ms/tag/"+g+"?ref\x3dgtm2";d=e.getElementsByTagName(f)[0];d.parentNode.insertBefore(c,d)})(window,document,"clarity","script","8frlty15ix");</script>
	<!-- container -->
	<!-- content -->


<section class="block">
          <div class="title">
            <span class="block-titlefont WStdsong-B">小農商城</span>
            <h5 style="line-height: 30px;margin-top: 16px;">看看其他朋友在關注什麼</h5>
            <h5 style="line-height: 30px;margin-top: 0px;">優質商品任你選</h5>
          </div>


          <div class="row">


            <div class="box">
              <a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img src="<%=request.getContextPath()%>/front-end/home/images/product-1.jpg">

                </div>
                <h5><span>有機草莓</span></h5>


                <p style="overflow-wrap: break-word;">台灣所栽種的草莓多數是耐熱品種，香氣和甜度...</p>
              </a>
            </div>




            <div class="box">
              <a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img src="<%=request.getContextPath()%>/front-end/home/images/istockphoto-1321810403-612x612.jpg">

                </div>
                <h5><span>有機椪柑</span></h5>


                <p style="overflow-wrap: break-word;">椪柑是柑桔中果粒最大，接近果蒂處膨起。以環...</p>
              </a>
            </div>



            <div class="box">
              <a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img style= "width:219px; height:146px;"src="<%=request.getContextPath()%>/front-end/home/images/istockphoto-1213438840-612x612.jpg">

                </div>
                <h5><span>梨山高麗菜</span></h5>


                <p style="overflow-wrap: break-word;">甘藍俗稱高麗菜，夏季為高冷地區適合種植，冬...</p>
              </a>
            </div>




            <div class="box">
              <a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img src="<%=request.getContextPath()%>/front-end/home/images/pexels-photo-7543114.jpg">

                </div>
                <h5><span>有機紅蘿蔔</span></h5>


                <p style="overflow-wrap: break-word;">紅蘿蔔的粗纖維，可促進腸胃蠕動，有助消化功...</p>
              </a>
            </div>

          </div>

          <div class="line"></div>			
      </section>
<section class="block">
          <div class="title">
            <span class="block-titlefont WStdsong-B">農場旅遊</span>
            <h5 style="line-height: 30px;margin-top: 16px;">看看其他朋友在關注什麼</h5>
            <h5 style="line-height: 30px;margin-top: 0px;">還有優質好行程</h5>
          </div>


          <div class="row">


            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img style="width:219px; height:146px;" src="<%=request.getContextPath()%>/front-end/home/images/牛牛.jpg">

                </div>
                <h5><span>飛天牧場</span></h5>


                <p style="overflow-wrap: break-word;">假日帶小朋友到飛天牧場玩，分為乳牛生態...</p>
              </a>
            </div>




            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img style="width:219px; height:146px;" src="<%=request.getContextPath()%>/front-end/home/images/16166553118483882050.jpg">

                </div>
                <h5><span>「小農衝衝」半日遊</span></h5>


                <p style="overflow-wrap: break-word;">捲起褲管也是潮！　青年作伙返鄉去...</p>
              </a>
            </div>



            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img style="width:219px; height:146px;" src="<%=request.getContextPath()%>/front-end/home/images/D072014D-24AA-A638-AAAD-E455B73CCBAF.jpg">

                </div>
                <h5><span>「螢戀梨之鄉」半日遊</span></h5>


                <p style="overflow-wrap: break-word;">有的吃又有的玩的幸福鄉間之旅東勢為台灣梨樹種植面積最...</p>
              </a>
            </div>



            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img style="width:219px; height:146px;" src="<%=request.getContextPath()%>/front-end/home/images/ldkdjwuwqo21.jpg">

                </div>
                <h5><span>鳳梨園一日遊</span></h5>


                <p style="overflow-wrap: break-word;">好吃又好玩下次，要再去。桶子雞大推。請問是否有人吃過呢? 可以在下方留言...</p>
              </a>
            </div>


          </div>

          <div class="line"></div>			
      </section>
<section class="block">
          <div class="title">
            <span class="block-titlefont WStdsong-B">農產認養</span>
            <h5 style="line-height: 30px;margin-top: 16px;">看看其他朋友在關注什麼</h5>
            <h5 style="line-height: 30px;margin-top: 0px;">還有熱門好物</h5>
          </div>


          <div class="row">


            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img src="<%=request.getContextPath()%>/front-end/home/images/2022文旦主圖.png">

                </div>
                <h5><span>2022緯育開心農場_有機文旦認養活動</span></h5>


                <p style="overflow-wrap: break-word;">文旦蛋蛋蛋蛋幾顆蛋，大家一起採文旦...</p>
              </a>
            </div>



            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img src="<%=request.getContextPath()%>/front-end/home/images/大吳農場稻米_主圖2022.png">

                </div>
                <h5><span>[即將開始] 2022大吳農場_稻米認養活動</span></h5>


                <p style="overflow-wrap: break-word;">跟著吳哥哥一起種稻，採收Servlet...</p>
              </a>
            </div>




            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img src="<%=request.getContextPath()%>/front-end/home/images/小吳蘋果_主圖.png">

                </div>
                <h5><span>2022小吳_好OK蘋果園_蘋果認養活動</span></h5>


                <p style="overflow-wrap: break-word;">蘋果、令狗、pineapple，我願和你有結果...</p>
              </a>
            </div>



            <div class="box">
              <a href="#" id="angus-cattle-mix-chen_4112">
                <div class="pic">
                  <img src="<%=request.getContextPath()%>/front-end/home/images/郭家草莓主圖.png">

                </div>
                <h5><span>2022 郭家草莓園_不能莓有你_草莓認養活動</span></h5>


                <p style="overflow-wrap: break-word;">我早已不能莓有你，你今天種草莓了...</p>
              </a>
            </div>

          </div>

          <div class="line"></div>			
      </section>













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