<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>
<%
	ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%>
<!-- 核心在1173 -->
<!-- 704有圖要抽換 -->

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="zh_TW" property="og:locale">
<meta content="zh_TW" property="og:locale:alternate">
<link
	href="#"
	rel="apple-touch-icon">
<link
	href="#"
	rel="shortcut icon" type="image/x-icon">
<title>我家門前有塊地</title>
<link href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/css" rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

<style type="text/css"
	data-fbcssmodules="css:fb.css.base css:fb.css.dialog css:fb.css.iframewidget css:fb.css.customer_chat_plugin_iframe">
.fb_hidden {
	position: absolute;
	top: -10000px;
	z-index: 10001
}.fb_reposition {
	overflow: hidden;
	position: relative
}.fb_invisible {
	display: none
}.fb_reset {
	background: none;
	border: 0;
	border-spacing: 0;
	color: #000;
	cursor: auto;
	direction: ltr;
	font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
	font-size: 12px;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	letter-spacing: normal;
	line-height: 1;
	margin: 0;
	overflow: visible;
	padding: 0;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	text-shadow: none;
	text-transform: none;
	visibility: visible;
	white-space: normal;
	word-spacing: normal
}.fb_reset>div {
	overflow: hidden
}@
keyframes fb_transform {
	from {opacity: 0;
	transform: scale(.95)
}to {
	opacity: 1;
	transform: scale(1)
}}
.fb_animate {
	animation: fb_transform .3s forwards
}.fb_dialog {
	background: rgba(82, 82, 82, .7);
	position: absolute;
	top: -10000px;
	z-index: 10001
}.fb_dialog_advanced {
	border-radius: 8px;
	padding: 10px
}.fb_dialog_content {
	background: #fff;
	color: #373737
}.fb_dialog_close_icon {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 0 transparent;
	cursor: pointer;
	display: block;
	height: 15px;
	position: absolute;
	right: 18px;
	top: 17px;
	width: 15px
}.fb_dialog_mobile .fb_dialog_close_icon {
	left: 5px;
	right: auto;
	top: 5px
}.fb_dialog_padding {
	background-color: transparent;
	position: absolute;
	width: 1px;
	z-index: -1
}.fb_dialog_close_icon:hover {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent
}.fb_dialog_close_icon:active {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent
}.fb_dialog_iframe {
	line-height: 0
}.fb_dialog_content .dialog_title {
	background: #6d84b4;
	border: 1px solid #365899;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	margin: 0
}.fb_dialog_content .dialog_title>span {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif)
		no-repeat 5px 50%;
	float: left;
	padding: 5px 0 7px 26px
}body.fb_hidden {
	height: 100%;
	left: 0;
	margin: 0;
	overflow: visible;
	position: absolute;
	top: -10000px;
	transform: none;
	width: 100%
}.fb_dialog.fb_dialog_mobile.loading {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif)
		white no-repeat 50% 50%;
	min-height: 100%;
	min-width: 100%;
	overflow: hidden;
	position: absolute;
	top: 0;
	z-index: 10001
}.fb_dialog.fb_dialog_mobile.loading.centered {
	background: none;
	height: auto;
	min-height: initial;
	min-width: initial;
	width: auto
}.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
	width: 100%
}.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
	background: none
}.loading.centered #fb_dialog_loader_close {
	clear: both;
	color: #fff;
	display: block;
	font-size: 19px;
	padding-top: 20px
}#fb-root #fb_dialog_ipad_overlay {
	background: rgba(0, 0, 0, .4);
	bottom: 0;
	left: 0;
	min-height: 100%;
	position: absolute;
	right: 0;
	top: 0;
	width: 100%;
	z-index: 10000
}#fb-root #fb_dialog_ipad_overlay.hidden {
	display: none
}.fb_dialog.fb_dialog_mobile.loading iframe {
	visibility: hidden
}.fb_dialog_mobile .fb_dialog_iframe {
	position: sticky;
	top: 0
}.fb_dialog_content .dialog_header {
	background: linear-gradient(from(#738aba), to(#2c4987));
	border-bottom: 1px solid;
	border-color: #043b87;
	box-shadow: white 0 1px 1px -1px inset;
	color: #fff;
	font: bold 14px Helvetica, sans-serif;
	text-overflow: ellipsis;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
	vertical-align: middle;
	white-space: nowrap
}.fb_dialog_content .dialog_header table {
	height: 43px;
	width: 100%
}.fb_dialog_content .dialog_header td.header_left {
	font-size: 13px;
	padding-left: 5px;
	vertical-align: middle;
	width: 60px
}.fb_dialog_content .dialog_header td.header_right {
	font-size: 13px;
	padding-right: 5px;
	vertical-align: middle;
	width: 60px
}.fb_dialog_content .touchable_button {
	background: linear-gradient(from(#4267B2), to(#2a4887));
	background-clip: padding-box;
	border: 1px solid #29487d;
	border-radius: 3px;
	display: inline-block;
	line-height: 18px;
	margin-top: 3px;
	max-width: 85px;
	padding: 4px 12px;
	position: relative
}.fb_dialog_content .dialog_header .touchable_button input {
	background: none;
	border: none;
	color: #fff;
	font: bold 12px Helvetica, sans-serif;
	margin: 2px -12px;
	padding: 2px 6px 3px 6px;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}.fb_dialog_content .dialog_header .header_center {
	color: #fff;
	font-size: 17px;
	font-weight: bold;
	line-height: 18px;
	text-align: center;
	vertical-align: middle
}.fb_dialog_content .dialog_content {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat 50% 50%;
	border: 1px solid #4a4a4a;
	border-bottom: 0;
	border-top: 0;
	height: 150px
}.fb_dialog_content .dialog_footer {
	background: #f5f6f7;
	border: 1px solid #4a4a4a;
	border-top-color: #ccc;
	height: 40px
}#fb_dialog_loader_close {
	float: left
}.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
	visibility: hidden
}#fb_dialog_loader_spinner {
	animation: rotateSpinner 1.2s linear infinite;
	background-color: transparent;
	background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);
	background-position: 50% 50%;
	background-repeat: no-repeat;
	height: 24px;
	width: 24px
}@
keyframes rotateSpinner { 0%{
	transform: rotate(0deg)
}100
%
{
transform
:
rotate
(
360deg
)
}
}
.fb_iframe_widget {
	display: inline-block;
	position: relative
}.fb_iframe_widget span {
	display: inline-block;
	position: relative;
	text-align: justify
}.fb_iframe_widget iframe {
	position: absolute
}.fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span,
	.fb_iframe_widget_fluid_desktop iframe {
	max-width: 100%
}.fb_iframe_widget_fluid_desktop iframe {
	min-width: 220px;
	position: relative
}.fb_iframe_widget_lift {
	z-index: 1
}.fb_iframe_widget_fluid {
	display: inline
}.fb_iframe_widget_fluid span {
	width: 100%
}.fb_mpn_mobile_landing_page_slide_out {
	animation-duration: 200ms;
	animation-name: fb_mpn_landing_page_slide_out;
	transition-timing-function: ease-in
}.fb_mpn_mobile_landing_page_slide_out_from_left {
	animation-duration: 200ms;
	animation-name: fb_mpn_landing_page_slide_out_from_left;
	transition-timing-function: ease-in
}.fb_mpn_mobile_landing_page_slide_up {
	animation-duration: 500ms;
	animation-name: fb_mpn_landing_page_slide_up;
	transition-timing-function: ease-in
}.fb_mpn_mobile_bounce_in {
	animation-duration: 300ms;
	animation-name: fb_mpn_bounce_in;
	transition-timing-function: ease-in
}.fb_mpn_mobile_bounce_out {
	animation-duration: 300ms;
	animation-name: fb_mpn_bounce_out;
	transition-timing-function: ease-in
}.fb_mpn_mobile_bounce_out_v2 {
	animation-duration: 300ms;
	animation-name: fb_mpn_fade_out;
	transition-timing-function: ease-in
}.fb_customer_chat_bounce_in_v2 {
	animation-duration: 300ms;
	animation-name: fb_bounce_in_v2;
	transition-timing-function: ease-in
}.fb_customer_chat_bounce_in_from_left {
	animation-duration: 300ms;
	animation-name: fb_bounce_in_from_left;
	transition-timing-function: ease-in
}.fb_customer_chat_bounce_out_v2 {
	animation-duration: 300ms;
	animation-name: fb_bounce_out_v2;
	transition-timing-function: ease-in
}.fb_customer_chat_bounce_out_from_left {
	animation-duration: 300ms;
	animation-name: fb_bounce_out_from_left;
	transition-timing-function: ease-in
}.fb_invisible_flow {
	display: inherit;
	height: 0;
	overflow-x: hidden;
	width: 0
}@
keyframes fb_mpn_landing_page_slide_out { 0%{
	margin: 0 12px;
	width: 100%- 24px
}60
%
{
border-radius
:
18px
}
100
%
{
border-radius
:
50
%;
margin
:
0
24px
;
width
:
60px
}
}
@
keyframes fb_mpn_landing_page_slide_out_from_left { 0%{
	left: 12px;
	width: 100%- 24px
}60
%
{
border-radius
:
18px
}
100
%
{
border-radius
:
50
%;
left
:
12px
;
width
:
60px
}
}
@
keyframes fb_mpn_landing_page_slide_up { 0%{
	bottom: 0;
	opacity: 0
}100
%
{
bottom
:
24px
;
opacity
:
1
}
}
@
keyframes fb_mpn_bounce_in { 0%{
	opacity: .5;
	top: 100%
}100
%
{
opacity
:
1
;
top
:
0
}
}
@
keyframes fb_mpn_fade_out { 0%{
	bottom: 30px;
	opacity: 1
}100
%
{
bottom
:
0
;
opacity
:
0
}
}
@
keyframes fb_mpn_bounce_out { 0%{
	opacity: 1;
	top: 0
}100
%
{
opacity
:
.5
;
top
:
100
%
}
}
@
keyframes fb_bounce_in_v2 { 0%{
	opacity: 0;
	transform: scale(0, 0);
	transform-origin: bottom right
}50
%
{
transform
:
scale
(
1
.03
,
1
.03
)
;
transform-origin
:
bottom
right
}
100
%
{
opacity
:
1
;
transform
:
scale
(
1
,
1
)
;
transform-origin
:
bottom
right
}
}
@
keyframes fb_bounce_in_from_left { 0%{
	opacity: 0;
	transform: scale(0, 0);
	transform-origin: bottom left
}50
%
{
transform
:
scale
(
1
.03
,
1
.03
)
;
transform-origin
:
bottom
left
}
100
%
{
opacity
:
1
;
transform
:
scale
(
1
,
1
)
;
transform-origin
:
bottom
left
}
}
@
keyframes fb_bounce_out_v2 { 0%{
	opacity: 1;
	transform: scale(1, 1);
	transform-origin: bottom right
}100
%
{
opacity
:
0
;
transform
:
scale
(
0
,
0
)
;
transform-origin
:
bottom
right
}
}
@
keyframes fb_bounce_out_from_left { 0%{
	opacity: 1;
	transform: scale(1, 1);
	transform-origin: bottom left
}100
%
{
opacity
:
0
;
transform
:
scale
(
0
,
0
)
;
transform-origin
:
bottom
left
}
}
@
keyframes slideInFromBottom { 0%{
	opacity: .1;
	transform: translateY(100%)
}100
%
{
opacity
:
1
;
transform
:
translateY
(
0
)
}
}
@
keyframes slideInFromBottomDelay { 0%{
	opacity: 0;
	transform: translateY(100%)
}
97
%
{
opacity
:
0
;
transform
:
translateY
(
100
%
)
}
100
%
{
opacity
:
1
;
transform
:
translateY
(
0
)
}
}
</style>
</head><!-- 核心 -->
<body class="intent-mouse">	<div class="container"></div>
	<div class="bt b--light-gray bb">
		<div class="container cf">
			<div class="w-100">
				<div class="w5-l dib fl-l mr3-l w-100">
					<div class="aspect-ratio-project-cover bg-near-white"
						style="background-image: url(&#39;https://s3-ap-northeast-1.amazonaws.com/zeczec-prod/asset_431251_image_big.jpg?1643016084&#39;)"></div>
				<!-- 圖片待抽換 -->
				</div>
				<div class="pv2 ph0-l ph3">					<a href="#">
						<h2 class="f5 mb0 dib mt1 f5 b">${projectVO.proj_name}</h2>
					</a>
					<div class="gray f7 mb3">
						<span>提案人</span> <a class="b"
							href="#">${projectVO.f_mem_id} </a><span
							class="mh2">|</span>
					</div>
					<span class="b">NT$${projectVO.proj_total_fund}</span> <span class="f7 dark-gray">
						/ 目標 NT$${projectVO.proj_goal} </span>				</div>
			</div>
		</div>
	</div>
	<div class="container"></div>
	<div class="container mv4">
		<div class="gutter3-l flex">
			<div class="w-100 ph3 mb4 mb0">
				<div class="tc f7 br2 bg-near-white pa2 b tracked dn db-ns">
					<i class="material-icons f6 v-mid">arrow_back</i> 左右捲動看看更多選項 <i
						class="material-icons f6 v-mid">arrow_forward</i>
				</div>
				<div
					class="flex flex-wrap-ns flex-wrap-reverse flex-nowrap-ns nowrap-ns overflow-auto-ns scrollbar-top">						
						<%
						
						Integer proj_id  = projectVO.getProj_id();
						ProjPerkService projSvc = new ProjPerkService();
 						List<ProjPerkVO> list = projSvc.getAll(proj_id);
 						pageContext.setAttribute("list", list);
						%>
						
					<!-- @TODO -->
					<c:forEach var="projPerkVO" items="${list}" >
						<div
							class="w-100 w-50-ns flex-none-ns ws-normal mr3-ns pt3-ns w-30-l">
							<a
								class="pa3 ba bw1 b--inherit round-s light-gray mb4 db border-rainbow "
								href="#"><img
								width="100%" class="mb2 round-s"
								src="${projPerkVO.perk_pic}" alt="${projPerkVO.perk_intro}">
							<div class="black b f4">NT$${projPerkVO.perk_fund}</div>
<%-- 								<div class="black b f4">${projPerkVO.perk_intro}</div> --%>
								<div class="f7 mv2">
									<span class="f7 white ph2 bg-red b dib"> 剩餘 ${projPerkVO.perk_limited - projPerkVO.perk_total_count} 份 </span><span
										class="black ph2 bg-near-white dib"> 已被贊助 <span
										class="b">${projPerkVO.perk_total_count}</span> / ${projPerkVO.perk_limited} 次
									</span>
								</div>
								<div
								class="black f6 mv-child-0 maxh5 maxh-none-ns overflow-auto">
									<p>
										【${projPerkVO.perk_abbr_name}】 <br>${projPerkVO.perk_intro}
										<%-- 【${projPerkVO.perk_abbr_name}】 <br>NT$${projPerkVO.perk_fund} --%>
									</p>
									<p>
										
									</p>
								</div>
								<div class="mt3 gray tc ph2 f7 ba">預計於${projPerkVO.perk_ship_date}實現</div> 
								 </a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js.下載"
		type="text/javascript"></script>
	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>
	<script type="text/javascript">
  !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
  n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
  document,'script','//connect.facebook.net/en_US/fbevents.js');
</script>
	<script type="text/javascript">
  fbq('init', '465239610292033');
  fbq('track', 'PageView');
</script>
	<noscript>
		<img height='1' width='1' alt='' class='pixel'
			style='visibility: hidden'
			src='https://www.facebook.com/tr?id=465239610292033&amp;ev=PageView&amp;noscript=1&amp;cd[value]=0&amp;cd[currency]=TWD' />
	</noscript>
	<script defer=""
		src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/v652eace1692a40cfa3763df669d7439c1639079717194"
		integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw=="
		data-cf-beacon="{&quot;rayId&quot;:&quot;6d631de9aa976a96&quot;,&quot;token&quot;:&quot;e0311a1880d54b88ab9f48eac7540091&quot;,&quot;version&quot;:&quot;2021.12.0&quot;,&quot;si&quot;:100}"
		crossorigin="anonymous"></script>
	<div id="draggable-live-region" aria-relevant="additions"
		aria-atomic="true" aria-live="assertive" role="log"
		style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>
</body>
</html>