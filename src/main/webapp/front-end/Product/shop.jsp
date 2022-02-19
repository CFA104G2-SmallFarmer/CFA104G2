<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ShopProductService prodServiceSvc = new ShopProductService();
    List<ShopProductVO> list = prodServiceSvc.getAll();
    pageContext.setAttribute("list",list);
    
    
   
%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>瀏覽商城商品</title>

 <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  

    <!-- Template Stylesheet -->
    <link href="css/style1.css" rel="stylesheet">

    <!-- product img -->
    <!-- .img-fluid w-100{
        height:100%;
    object-fit:cover;
    } -->
    <style>

    .img-fluid{
        max-width: 100%;
        height: 200px;
        object-fit:cover;
    }

    </style>


<!-- 頁尾 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">


<!-- 頁首 -->
<script async="" src="<%=request.getContextPath()%>/header/header_files/8frlty15ix"></script>
<script async="" src="<%=request.getContextPath()%>/header/header_files/clarity.js"></script>
<script async="" src="<%=request.getContextPath()%>/header/header_files/8frlty15ix"></script>
<script async="" src="<%=request.getContextPath()%>/header/header_files/gtm.js"></script>
<script async="" src="<%=request.getContextPath()%>/header/header_files/analytics.js"></script>
<script defer="" src="<%=request.getContextPath()%>/header/header_files/all.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
<meta name="google-site-verification" content="jTLy2uztFyeCd-TzuYYqOIOkRNTOdiikG5fC8Eacm6I">
<meta name="google-site-verification" content="B2cWaUCcewU8njTlgb7JZb0nC4RHQBPnV4f5opNFJh4">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="created" content="17th 一月 2022 10:11">
<!-- <meta name="description" content="" /> -->
<meta name="keywords" content="">
<!-- <meta name="viewport" content="width=device-width" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="

&lt;直接跟農夫買&gt;官方網站，您可以在這裡找到一群職人農夫，以有機或友善環境方式生產當季蔬果、肉品海鮮、私房手作...還能認養自己的田！超過50間企業指定客製與CSR合作。不只檢驗，產地
">
<meta name="author" content="">
<style type="text/css">svg:not(:root).svg-inline--fa{overflow:visible}.svg-inline--fa{display:inline-block;font-size:inherit;height:1em;overflow:visible;vertical-align:-.125em}.svg-inline--fa.fa-lg{vertical-align:-.225em}.svg-inline--fa.fa-w-1{width:.0625em}.svg-inline--fa.fa-w-2{width:.125em}.svg-inline--fa.fa-w-3{width:.1875em}.svg-inline--fa.fa-w-4{width:.25em}.svg-inline--fa.fa-w-5{width:.3125em}.svg-inline--fa.fa-w-6{width:.375em}.svg-inline--fa.fa-w-7{width:.4375em}.svg-inline--fa.fa-w-8{width:.5em}.svg-inline--fa.fa-w-9{width:.5625em}.svg-inline--fa.fa-w-10{width:.625em}.svg-inline--fa.fa-w-11{width:.6875em}.svg-inline--fa.fa-w-12{width:.75em}.svg-inline--fa.fa-w-13{width:.8125em}.svg-inline--fa.fa-w-14{width:.875em}.svg-inline--fa.fa-w-15{width:.9375em}.svg-inline--fa.fa-w-16{width:1em}.svg-inline--fa.fa-w-17{width:1.0625em}.svg-inline--fa.fa-w-18{width:1.125em}.svg-inline--fa.fa-w-19{width:1.1875em}.svg-inline--fa.fa-w-20{width:1.25em}.svg-inline--fa.fa-pull-left{margin-right:.3em;width:auto}.svg-inline--fa.fa-pull-right{margin-left:.3em;width:auto}.svg-inline--fa.fa-border{height:1.5em}.svg-inline--fa.fa-li{width:2em}.svg-inline--fa.fa-fw{width:1.25em}.fa-layers svg.svg-inline--fa{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0}.fa-layers{display:inline-block;height:1em;position:relative;text-align:center;vertical-align:-12.5%;width:1em}.fa-layers svg.svg-inline--fa{-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-counter,.fa-layers-text{display:inline-block;position:absolute;text-align:center}.fa-layers-text{left:50%;top:50%;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-counter{background-color:#ff253a;border-radius:1em;color:#fff;height:1.5em;line-height:1;max-width:5em;min-width:1.5em;overflow:hidden;padding:.25em;right:0;text-overflow:ellipsis;top:0;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-bottom-right{bottom:0;right:0;top:auto;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:bottom right;transform-origin:bottom right}.fa-layers-bottom-left{bottom:0;left:0;right:auto;top:auto;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:bottom left;transform-origin:bottom left}.fa-layers-top-right{right:0;top:0;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-top-left{left:0;right:auto;top:0;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:top left;transform-origin:top left}.fa-lg{font-size:1.33333em;line-height:.75em;vertical-align:-.0667em}.fa-xs{font-size:.75em}.fa-sm{font-size:.875em}.fa-1x{font-size:1em}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-6x{font-size:6em}.fa-7x{font-size:7em}.fa-8x{font-size:8em}.fa-9x{font-size:9em}.fa-10x{font-size:10em}.fa-fw{text-align:center;width:1.25em}.fa-ul{list-style-type:none;margin-left:2.5em;padding-left:0}.fa-ul>li{position:relative}.fa-li{left:-2em;position:absolute;text-align:center;width:2em;line-height:inherit}.fa-border{border:solid .08em #eee;border-radius:.1em;padding:.2em .25em .15em}.fa-pull-left{float:left}.fa-pull-right{float:right}.fa.fa-pull-left,.fab.fa-pull-left,.fal.fa-pull-left,.far.fa-pull-left,.fas.fa-pull-left{margin-right:.3em}.fa.fa-pull-right,.fab.fa-pull-right,.fal.fa-pull-right,.far.fa-pull-right,.fas.fa-pull-right{margin-left:.3em}.fa-spin{-webkit-animation:fa-spin 2s infinite linear;animation:fa-spin 2s infinite linear}.fa-pulse{-webkit-animation:fa-spin 1s infinite steps(8);animation:fa-spin 1s infinite steps(8)}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.fa-rotate-90{-webkit-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{-webkit-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{-webkit-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{-webkit-transform:scale(-1,1);transform:scale(-1,1)}.fa-flip-vertical{-webkit-transform:scale(1,-1);transform:scale(1,-1)}.fa-flip-horizontal.fa-flip-vertical{-webkit-transform:scale(-1,-1);transform:scale(-1,-1)}:root .fa-flip-horizontal,:root .fa-flip-vertical,:root .fa-rotate-180,:root .fa-rotate-270,:root .fa-rotate-90{-webkit-filter:none;filter:none}.fa-stack{display:inline-block;height:2em;position:relative;width:2em}.fa-stack-1x,.fa-stack-2x{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0}.svg-inline--fa.fa-stack-1x{height:1em;width:1em}.svg-inline--fa.fa-stack-2x{height:2em;width:2em}.fa-inverse{color:#fff}.sr-only{border:0;clip:rect(0,0,0,0);height:1px;margin:-1px;overflow:hidden;padding:0;position:absolute;width:1px}.sr-only-focusable:active,.sr-only-focusable:focus{clip:auto;height:auto;margin:0;overflow:visible;position:static;width:auto}</style><link rel="shortcut icon" href="https://www.buydirectlyfromfarmers.tw/static/ico/favicon.png">





<link rel="icon" href="favicon.ico">
<link rel="stylesheet"
href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css ">
<link rel="stylesheet"
href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_files/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_files/header.css">





<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_files/index.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/header/header_files/1473064767308.JS"></script>


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


<!--<script> window._izq = window._izq || []; window._izq.push(["init" ]); </script> <script src="https://cdn.izooto.com/scripts/04f7867b2dd65d7dd68d138a20f48f774473f07d.js"></script>-->


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

<!-- 我新增的 -->
<script>
	$(document).ready(function() {
		$("div.flip1").click(function() {
			$("div.toggle1").slideToggle("slow");
		});
	});
	
	$(document).ready(function() {
		$("div.flip2").click(function() {
			$("div.toggle2").slideToggle("slow");
		});
	});
	
	$(document).ready(function() {
		$("div.flip3").click(function() {
			$("div.toggle3").slideToggle("slow");
		});
	});
	
	$(document).ready(function() {
		$("div.flip4").click(function() {
			$("div.toggle4").slideToggle("slow");
		});
	});
	
	$(document).ready(function() {
		$("div.toggle1").mouseleave(function() {
			$("div.toggle1").slideToggle(10);
		});
	});
	
	$(document).ready(function() {
		$("div.toggle2").mouseleave(function() {
			$("div.toggle2").slideToggle(10);
		});
	});
	
	$(document).ready(function() {
		$("div.toggle3").mouseleave(function() {
			$("div.toggle3").slideToggle(10);
		});
	});
	
	$(document).ready(function() {
		$("div.toggle4").mouseleave(function() {
			$("div.toggle4").slideToggle(10);
		});
	});
	
	$(document).ready(function() {
		$(".flip2,.flip3,.flip4").mouseenter(function() {
			$("div.toggle1").hide(10);
		});
	});
	
	$(document).ready(function() {
		$(".flip1,.flip3,.flip4").mouseenter(function() {
			$("div.toggle2").hide(10);
		});
	});
	
	$(document).ready(function() {
		$(".flip1,.flip2,.flip4").mouseenter(function() {
			$("div.toggle3").hide(10);
		});
	});
	
	$(document).ready(function() {
		$(".flip1,.flip2,.flip3").mouseenter(function() {
			$("div.toggle4").hide(10);
		});
	});

	</script>

<script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script>
<script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script>
<script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script><script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script><style type="text/css">* {<br>		-webkit-user-select: text !important;<br>		-moz-user-select: text !important;<br>		-ms-user-select: text !important;<br>		 user-select: text !important;<br>	}</style><style type="text/css">* {<br>        -webkit-user-select: text !important;<br>        -moz-user-select: text !important;<br>        -ms-user-select: text !important;<br>         user-select: text !important;<br>    }</style></head>

<body id="default" class="default" style="">
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-P3M896W" height="0" width="0"
  style="display:none;visibility:hidden"></iframe></noscript>



<section class="header-wrapper" style="position: static;">

<header id="header">
  <section id="alert-popup">
	<div class="alert-close">
	  <span class="top"></span>
	  <span class="bottom"></span>
	</div>




  </section>


  <div class="logo"><a href="https://www.buydirectlyfromfarmers.tw/"><img src="<%=request.getContextPath()%>/header/header_files/透明LOGO有字有框.png"></a></div>






  <div class="menu">
	<nav class="menu-top">
	  <ul>


		<li class="m-logo"><a href="https://www.buydirectlyfromfarmers.tw/"><img src="<%=request.getContextPath()%>/header/images/透明LOGO有字有框.png"></a>
		</li>

		<!--desktop only-->



		<li><a href="https://www.buydirectlyfromfarmers.tw/about-bdff/">
			<span class="hover WStdsong-B" style="font-size:14px;">
			  來認識我們
			</span>
		  </a></li>


		<li id="qqq"><a href="https://www.buydirectlyfromfarmers.tw/faq/">
			<span class="hover WStdsong-B" style="font-size:14px;">
			  常見問答
			</span>
		  </a></li>

		<li><a id="login_link" href="https://www.buydirectlyfromfarmers.tw/accounts/login/">
			<div class="account">會員登入</div>
		  </a></li>
		<li><a id="login_link" href="https://www.buydirectlyfromfarmers.tw/accounts/login/">
			<div class="account">會員註冊</div>
		  </a></li>
		<li><a id="login_link" href="https://www.buydirectlyfromfarmers.tw/accounts/login/">
			<div class="account">註冊成為小農</div>
		  </a></li>
		<li>
		  <!-- <i class="material-icons" style="font-size:48px;color:red">mail_outline</i> -->
		  <a href="http://127.0.0.1:5500/%E5%89%8D%E5%8F%B0%E9%A6%96%E9%A0%812.html#"><svg class="svg-inline--fa fa-bell fa-w-14" style="font-size: 30px;color: #aaba8b;" aria-hidden="true" data-fa-processed="" data-prefix="far" data-icon="bell" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M425.403 330.939c-16.989-16.785-34.546-34.143-34.546-116.083 0-83.026-60.958-152.074-140.467-164.762A31.843 31.843 0 0 0 256 32c0-17.673-14.327-32-32-32s-32 14.327-32 32a31.848 31.848 0 0 0 5.609 18.095C118.101 62.783 57.143 131.831 57.143 214.857c0 81.933-17.551 99.292-34.543 116.078C-25.496 378.441 9.726 448 66.919 448H160c0 35.346 28.654 64 64 64 35.346 0 64-28.654 64-64h93.08c57.19 0 92.415-69.583 44.323-117.061zM224 472c-13.234 0-24-10.766-24-24h48c0 13.234-10.766 24-24 24zm157.092-72H66.9c-16.762 0-25.135-20.39-13.334-32.191 28.585-28.585 51.577-55.724 51.577-152.952C105.143 149.319 158.462 96 224 96s118.857 53.319 118.857 118.857c0 97.65 23.221 124.574 51.568 152.952C406.278 379.661 397.783 400 381.092 400z"></path></svg><!-- <i class="far fa-bell" style="font-size:30px;color:#aaba8b
		  "></i> --></a>
		</li>
		<li>
		  <!-- <i class="material-icons" style="font-size:48px;color:red">mail_outline</i> -->
		  <a href="http://127.0.0.1:5500/%E5%89%8D%E5%8F%B0%E9%A6%96%E9%A0%812.html#"><svg class="svg-inline--fa fa-envelope fa-w-16" style="font-size: 30px;color: #aaba8b;" aria-hidden="true" data-fa-processed="" data-prefix="far" data-icon="envelope" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path></svg><!-- <i class="far fa-envelope" style="font-size:30px;color: #aaba8b
		  "></i> --></a>
		</li>
	  </ul>
	</nav>
	<div class="m-menu-top" style="">
	  <div class="menu-btn">
		<span class="top"></span>
		<span class="middle"></span>
		<span class="bottom"></span>
	  </div>


	  <div class="m-logo"><a href="http://127.0.0.1:5500/%E5%89%8D%E5%8F%B0%E9%A6%96%E9%A0%812.html#"><img src="./images/透明LOGO有字有框.png"></a>
	  </div>
	</div>


	  <!--mobile only-->
	<div class="cart-form m-cart-form">
	  <div class="title WStdsong-B">這些商品已經放入購物籃</div>
	  <table class="cart-info">
	  </table>
	  <div class="btn-groups WStdsong-B">
		<a id="go_to_basket_m" href="https://www.buydirectlyfromfarmers.tw/basket/">
		  <div class="btn cart-check-btn btn-hover"><img src="./images/cart_check.png" width="20">前往結帳</div>
		</a>
		<a>
		  <div class="btn cart-carry-btn btn-hover">繼續購物</div>
		</a>
	  </div>
	</div>

	<!--mobile dropdown menu-list-->
	<nav class="m-menu-list WStdsong-B">
	  <ul id="nav-menu">


		<li>

		  <a href="https://www.buydirectlyfromfarmers.tw/catalogue/planned_products/">計畫性支持專區</a>

		</li>

		<li>

		  <a href="https://www.buydirectlyfromfarmers.tw/catalogue/category/csrte-bie-ding-zhi_36/">CSR特別訂製</a>

		</li>

		<li class="about-us"><a href="https://www.buydirectlyfromfarmers.tw/about-bdff/">來認識我們</a></li>


		<li class="qa"><a href="https://www.buydirectlyfromfarmers.tw/faq/">常見問答</a></li>


		<li><a href="https://www.buydirectlyfromfarmers.tw/accounts/orders/">會員專區</a></li>



		<li>
		  <div class="fb"><a target="_blank" href="https://www.facebook.com/BuyDirectlyFromFarmers"><img src="./images/m_menu_fb.png"></a></div>
		  <div class="line"><a target="_blank" href="https://line.me/R/ti/p/%40pkj2325g"><img src="./images/m_menu_line.png"></a></div>
		  <div class="fb"><a target="_blank" href="https://www.instagram.com/bdfftw"><img src="./images/instagram.png"></a></div>
		</li>

	  </ul>
	</nav>
	<div class="m-header-scroll">
	  <!--desktop menu -->
	  <input type="hidden" name="show_sublogo" id="show_sublogo" value="False">
	  <nav class="menu-bottom sec-menu-bottom WStdsong-B" style="float:right; left: 2%; position: relative;">
		   <ul>

		  <li style="padding: 0;">
				<div class="flip1">
				  <a href="#" style="padding:3px 16px 0px 16px;">關於本站</a>
				  
				  <div class="dropdown-menu toggle1" style="position:absolute; top:30px;">
					<a class="dropdown-item" href="#" >最新消息</a>
					<a class="dropdown-item" href="#" >活動資訊</a>
					<a class="dropdown-item" href="#" >平台公告</a>
				  </div>
				</div>
		  </li>
		  <li style="padding: 0;">
				<div class="flip2">
				  <a href="#" style="padding:3px 16px 0px 16px;">小農商城</a>
				</div>  
				  <div class="dropdown-menu toggle2" style="position:absolute; top:30px;">
					<a class="dropdown-item" href="https://www.facebook.com/BuyDirectlyFromFarmers" >Action</a>
					<a class="dropdown-item" href="#" >Another</a>
					<a class="dropdown-item" href="#" >Something</a>
				  </div>
		  </li>              
		  <li style="padding: 0;">
				<div class="flip3">
				  <a href="#" style="padding:3px 16px 0px 16px;">農場旅遊</a>
				  
				  <div class="dropdown-menu toggle3" style="position:absolute; top:30px;">
					<a class="dropdown-item" href="#" >Action</a>
					<a class="dropdown-item" href="#" >Another</a>
					<a class="dropdown-item" href="#" >Something</a>
				  </div>
				</div>
		  </li>

		  <li style="padding: 0;">
				<div class="flip4">
				  <a href="#" style="padding:3px 16px 0px 16px;">農產認養</a>
				  
				  <div class="dropdown-menu toggle4" style="position:absolute; top:30px;">
					<a class="dropdown-item" href="https://www.facebook.com/BuyDirectlyFromFarmers" >Action</a>
					<a class="dropdown-item" href="#" >Another</a>
					<a class="dropdown-item" href="#" >Something</a>
				  </div>
				</div>
		  </li>

			<a href="javascript:void(0)" style="color:#000;">

			  <span class="hover" style="color:#000;">
				<svg class="svg-inline--fa fa-user fa-w-16" style="color: #aaba8b;font-size: 20px;" 
				aria-hidden="true" data-fa-processed="" data-prefix="fas" data-icon="user" role="img" 
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" 
				d="M96 160C96 71.634 167.635 0 256 0s160 71.634 160 160-71.635 160-160 160S96 248.366 96 160zm304 192h-28.556c-71.006 42.713-159.912
				 42.695-230.888 0H112C50.144 352 0 402.144 0 464v24c0 13.255 10.745 24 24 24h464c13.255 0 24-10.745 24-24v-24c0-61.856-50.144-112-112-112z">
				 </path>
				 </svg> 
				 會員專區
			  </span>
			</a>
		  </li>

		  <li>

			<a href="https://www.buydirectlyfromfarmers.tw/catalogue/category/bian-chi-bian-du_40/" style="color:#000;">

			  <span class="hover" style="color:#000;">
				<svg class="svg-inline--fa fa-smile fa-w-16" style="color: #aaba8b;font-size: 20px;" aria-hidden="true" data-fa-processed="" data-prefix="far" data-icon="smile" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 56c110.532 0 200 89.451 200 200 0 110.532-89.451 200-200 200-110.532 0-200-89.451-200-200 0-110.532 89.451-200 200-200m0-48C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm64 136c-9.535 0-18.512 2.386-26.37 6.589h.017c12.735 0 23.059 10.324 23.059 23.059 0 12.735-10.324 23.059-23.059 23.059s-23.059-10.324-23.059-23.059v-.017C266.386 181.488 264 190.465 264 200c0 30.928 25.072 56 56 56s56-25.072 56-56-25.072-56-56-56zm-128 0c-9.535 0-18.512 2.386-26.37 6.589h.017c12.735 0 23.059 10.324 23.059 23.059 0 12.735-10.324 23.059-23.059 23.059-12.735 0-23.059-10.324-23.059-23.059v-.017C138.386 181.488 136 190.465 136 200c0 30.928 25.072 56 56 56s56-25.072 56-56-25.072-56-56-56zm195.372 182.219c18.819-25.592-19.856-54.017-38.67-28.438-50.135 68.177-135.229 68.18-185.367 0-18.828-25.601-57.478 2.861-38.67 28.438 69.298 94.231 193.323 94.351 262.707 0z"></path></svg><!-- <i class="far fa-smile" style="color:#aaba8b;font-size: 20px;"></i> -->
				小農專區
			  </span>
			</a>
		  </li>

		</ul>
	  </nav>
	</div>
  </div>
</header>
<!-- header -->
</section>


  <!-- jQuery -->
  <script src="<%=request.getContextPath()%>/header/header_files/jquery.js"></script>
  <script>
	window.jQuery || document.write('<script src="/static/oscar/js/jquery/jquery-1.9.1.min.js"><\/script>')
  </script>





  <!-- bdff -->
  <!-- <script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>     -->
  <!-- <script type="text/javascript" src="/static/scripts/jquery.cycle.all.js"></script>             -->
  <!-- <script type="text/javascript" src="/static/scripts/bdff.js"></script> -->
  <!-- <script src="/static/scripts/bdff_ui.js" type="text/javascript" charset="utf-8"></script>  -->

  <script src="<%=request.getContextPath()%>/header/header_files/bdff_bremen.js" type="text/javascript" charset="utf-8"></script>
  <script src="<%=request.getContextPath()%>/header/header_files/jquery-2.2.1.min.js"></script>
  <script src="<%=request.getContextPath()%>/header/header_files/plugins.js"></script>
  <script src="<%=request.getContextPath()%>/header/header_files/menu.js"></script>

  <!-- bdff -->


  <script src="<%=request.getContextPath()%>/header/header_files/index.js"></script>
  <script src="<%=request.getContextPath()%>/header/header_files/jquery.dotdotdot.js"></script>
  <script src="<%=request.getContextPath()%>/header/header_files/dotdotdot-desc.js"></script>
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
  <script src="<%=request.getContextPath()%>/header/header_files/jquery.cookie.js"></script>
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



	  //    if( $('#mobile-indicator').is(':visible')){
	  //        $('.block-slide').remove();
	  //    }


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
	// ]]>
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

<!-- dropdown -->      
  <script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
  crossorigin="anonymous"></script>



<!-- 頁首完  -->






<!-- Header End -->
<!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-4"><br>
                <!-- Price Start -->
                <h5 class="section-title position-relative text-uppercase mb-3">類別搜尋</h5><br>
                
                <div class="bg-light p-4 mb-30">
                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/shop.jsp" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <input class="btn btn-sm btn-primary" type="submit"  value="全部"  >
                            <input type="hidden"  name="prod_id">
                             <input type="hidden" name="action">
                        </div>
                    </FORM>
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <input class="btn btn-sm btn-primary" type="submit"  value="蔬菜"  >
                            <input type="hidden"  value="2"  name="prod_type_id">
                            <input type="hidden"  value="2"  name="prod_type_id">
                             <input type="hidden" name="action"	value="getAll_By_Type_For_DisplayByMem">
                        </div>
                    </FORM>
                    
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                       
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <input class="btn btn-sm btn-primary" type="submit"  value="水果"  >
                            <input type="hidden"  value="1"  name="prod_type_id">
                             <input type="hidden" name="action"	value="getAll_By_Type_For_DisplayByMem">
                           
                        </div>
                    </FORM>
                </div><br>
                <!-- Price End -->            

                <!-- Color Start -->
                <h5 class="section-title position-relative text-uppercase mb-3">價格搜尋</h5><br>
                <div class="bg-light p-4 mb-30">
                    <form METHOD="post" name="form3" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                        <div ><br>
                            <input onClick="document.form3.submit()"  type="radio" id="color-1" value="color-1"  checked>
                            <label for="color-1">$0 - $100</label>
                             <input type="hidden"  value="0"  name="price1">
                             <input type="hidden"  value="100"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form4" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div ><br>
                            <input  onClick="document.form4.submit()" type="radio" id="color-2" value="color-2" >
                            <label  for="color-2">$100 - $200</label>
                            <input type="hidden"  value="100"  name="price1">
                             <input type="hidden"  value="200"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                            
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form5" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form5.submit()" type="radio" id="color-3" value="color-3" >
                            <label  for="color-3">$200 - $300</label>
                            <input type="hidden"  value="200"  name="price1">
                             <input type="hidden"  value="300"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form6" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form6.submit()" type="radio"  id="color-4" value="color-4" >
                            <label  for="color-4">$300 - $400</label>
                            <input type="hidden"  value="300"  name="price1">
                             <input type="hidden"  value="400"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                        </form>
                        
                      <form METHOD="post" name="form7" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form7.submit()" type="radio"  id="color-5" value="color-5" >
                            <label  for="color-5">$400 - $500</label>
                            <input type="hidden"  value="400"  name="price1">
                             <input type="hidden"  value="500"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                    </form>
                </div>  
                <!-- Color End -->
            </div>
            <!-- Shop Sidebar End -->
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

            <!-- Shop Product Start -->
            <div class="col-lg-9">
             <FORM METHOD="post" ACTION="product.do" >
              <div><br>
            		<div>
                		<input type="text"  name="prod_id" placeholder="商品編號搜尋">
                		<input type="hidden" name="action" value="listEmps_ByCompositeQuery">
        				<input type="submit"  value="搜尋" >
            		</div>
        	 </FORM>
        	 </div>
 <jsp:useBean id="shopProductSvc" scope="page" class="com.shopProduct.model.ShopProductService" />
  <!-- --------------------------------------------------------------------------------------- -->      	 
             <div class="row pb-3">
                     <!--   <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">  
                            <div class="ml-2">       
                            </div>
                        </div>
                   </div>
                   <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="images/product-1.jpg" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">大湖草莓</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="images/product-2.jpg" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">梨山高麗菜</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="images/product-3.jpg" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">甜柿</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                               
                            </div>
                        </div>
                    </div>   -->  
                    
                    
  <!-- ---------------------------------------------------------------------------------------------------- --> 
  
    <%@ include file="page3.file" %> 
  		<c:forEach var="shopProductVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">               
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1"><br>
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="<%=request.getContextPath()%>/front-end/Product/product.do?prod_id=${shopProductVO.prod_id}&action=getOne_list_For_DisplayByMem"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">${shopProductVO.prod_name}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5><a>$</a>${shopProductVO.prod_price}<a>元/</a></h5>
                                     <h5>${shopProductVO.prod_unit}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
          </c:forEach>
			    <div class="col-12">
			     	<nav>
			          <ul class="pagination justify-content-center">
			 			<li  class="page-item disabled">
			               <%@ include file="page4.file" %> 
			             </li> 
			         	</ul> 
			          </nav>
                </div>
            </div>
        </div>
       
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->
 <!-- 頁尾 -->
 <section class="">
    <footer class="pt-4 pb-4  text-light" style="background-color:mediumseagreen;">
      <div class="container">
        <div class="row text-center align-items-center">
          <div class="col">
            <ul class="nav justify-content-center">
              <li class="nav-item">
                <a class="nav-link active" href="#" style="color: mintcream; font-size: 18px;"><b>首頁</b></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"style="color: mintcream; font-size: 18px;"><b>來認識我們</b></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"style="color: mintcream; font-size: 18px;"><b>常見問答</b></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"style="color: mintcream; font-size: 18px;"><b>會員專區</b></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"style="color: mintcream; font-size: 18px;"><b>小農專區</b></a>
              </li>
            </ul>
            <div>
            <a href="#" style="text-decoration:none">
              <i class="fab fa-twitter" aria-hidden="true" style="padding: 0px 5px 0px 5px; font-size: 25px;"></i>
            </a>
            <a href="#" style="text-decoration:none">
              <i class="fab fa-facebook" aria-hidden="true" style="padding: 0px 5px 0px 5px; font-size: 25px;"></i>
            </a>
            <a href="#" style="text-decoration:none">
              <i class="fab fa-instagram" aria-hidden="true" style="padding: 0px 5px 0px 5px; font-size: 25px;"></i>
            </a>
            <a href="#" style="text-decoration:none">
              <i class="fab fa-google" aria-hidden="true" style="padding: 0px 5px 0px 5px; font-size: 25px;"></i>
            </a>
          </div>
            <p class="text-h5 mt-4">© 2022 SmallFarm</p>
          </div>
        </div>
      </div>
    </footer>
  </section>

  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
    crossorigin="anonymous"></script>


   
</body>
</html>