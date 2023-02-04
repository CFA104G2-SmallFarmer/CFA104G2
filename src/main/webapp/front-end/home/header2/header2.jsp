<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!-- saved from url=(0064)http://127.0.0.1:5500/%E5%89%8D%E5%8F%B0%E9%A6%96%E9%A0%812.html -->
<html lang="zh-tw" class="no-js fontawesome-i2svg-active fontawesome-i2svg-complete arwf-inactive">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
  
  <title>我家門前有塊地</title>
  <meta name="author" content="">
  <style type="text/css">svg:not(:header).svg-inline--fa{overflow:visible}.svg-inline--fa{display:inline-block;font-size:inherit;height:1em;overflow:visible;vertical-align:-.125em}.svg-inline--fa.fa-lg{vertical-align:-.225em}.svg-inline--fa.fa-w-1{width:.0625em}.svg-inline--fa.fa-w-2{width:.125em}.svg-inline--fa.fa-w-3{width:.1875em}.svg-inline--fa.fa-w-4{width:.25em}.svg-inline--fa.fa-w-5{width:.3125em}.svg-inline--fa.fa-w-6{width:.375em}.svg-inline--fa.fa-w-7{width:.4375em}.svg-inline--fa.fa-w-8{width:.5em}.svg-inline--fa.fa-w-9{width:.5625em}.svg-inline--fa.fa-w-10{width:.625em}.svg-inline--fa.fa-w-11{width:.6875em}.svg-inline--fa.fa-w-12{width:.75em}.svg-inline--fa.fa-w-13{width:.8125em}.svg-inline--fa.fa-w-14{width:.875em}.svg-inline--fa.fa-w-15{width:.9375em}.svg-inline--fa.fa-w-16{width:1em}.svg-inline--fa.fa-w-17{width:1.0625em}.svg-inline--fa.fa-w-18{width:1.125em}.svg-inline--fa.fa-w-19{width:1.1875em}.svg-inline--fa.fa-w-20{width:1.25em}.svg-inline--fa.fa-pull-left{margin-right:.3em;width:auto}.svg-inline--fa.fa-pull-right{margin-left:.3em;width:auto}.svg-inline--fa.fa-border{height:1.5em}.svg-inline--fa.fa-li{width:2em}.svg-inline--fa.fa-fw{width:1.25em}.fa-layers svg.svg-inline--fa{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0}.fa-layers{display:inline-block;height:1em;position:relative;text-align:center;vertical-align:-12.5%;width:1em}.fa-layers svg.svg-inline--fa{-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-counter,.fa-layers-text{display:inline-block;position:absolute;text-align:center}.fa-layers-text{left:50%;top:50%;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);-webkit-transform-origin:center center;transform-origin:center center}.fa-layers-counter{background-color:#ff253a;border-radius:1em;color:#fff;height:1.5em;line-height:1;max-width:5em;min-width:1.5em;overflow:hidden;padding:.25em;right:0;text-overflow:ellipsis;top:0;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-bottom-right{bottom:0;right:0;top:auto;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:bottom right;transform-origin:bottom right}.fa-layers-bottom-left{bottom:0;left:0;right:auto;top:auto;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:bottom left;transform-origin:bottom left}.fa-layers-top-right{right:0;top:0;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:top right;transform-origin:top right}.fa-layers-top-left{left:0;right:auto;top:0;-webkit-transform:scale(.25);transform:scale(.25);-webkit-transform-origin:top left;transform-origin:top left}.fa-lg{font-size:1.33333em;line-height:.75em;vertical-align:-.0667em}.fa-xs{font-size:.75em}.fa-sm{font-size:.875em}.fa-1x{font-size:1em}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-6x{font-size:6em}.fa-7x{font-size:7em}.fa-8x{font-size:8em}.fa-9x{font-size:9em}.fa-10x{font-size:10em}.fa-fw{text-align:center;width:1.25em}.fa-ul{list-style-type:none;margin-left:2.5em;padding-left:0}.fa-ul>li{position:relative}.fa-li{left:-2em;position:absolute;text-align:center;width:2em;line-height:inherit}.fa-border{border:solid .08em #eee;border-radius:.1em;padding:.2em .25em .15em}.fa-pull-left{float:left}.fa-pull-right{float:right}.fa.fa-pull-left,.fab.fa-pull-left,.fal.fa-pull-left,.far.fa-pull-left,.fas.fa-pull-left{margin-right:.3em}.fa.fa-pull-right,.fab.fa-pull-right,.fal.fa-pull-right,.far.fa-pull-right,.fas.fa-pull-right{margin-left:.3em}.fa-spin{-webkit-animation:fa-spin 2s infinite linear;animation:fa-spin 2s infinite linear}.fa-pulse{-webkit-animation:fa-spin 1s infinite steps(8);animation:fa-spin 1s infinite steps(8)}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.fa-rotate-90{-webkit-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{-webkit-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{-webkit-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{-webkit-transform:scale(-1,1);transform:scale(-1,1)}.fa-flip-vertical{-webkit-transform:scale(1,-1);transform:scale(1,-1)}.fa-flip-horizontal.fa-flip-vertical{-webkit-transform:scale(-1,-1);transform:scale(-1,-1)}:root .fa-flip-horizontal,:root .fa-flip-vertical,:root .fa-rotate-180,:root .fa-rotate-270,:root .fa-rotate-90{-webkit-filter:none;filter:none}.fa-stack{display:inline-block;height:2em;position:relative;width:2em}.fa-stack-1x,.fa-stack-2x{bottom:0;left:0;margin:auto;position:absolute;right:0;top:0}.svg-inline--fa.fa-stack-1x{height:1em;width:1em}.svg-inline--fa.fa-stack-2x{height:2em;width:2em}.fa-inverse{color:#fff}.sr-only{border:0;clip:rect(0,0,0,0);height:1px;margin:-1px;overflow:hidden;padding:0;position:absolute;width:1px}.sr-only-focusable:active,.sr-only-focusable:focus{clip:auto;height:auto;margin:0;overflow:visible;position:static;width:auto}</style><link rel="shortcut icon" href="https://www.buydirectlyfromfarmers.tw/static/ico/favicon.png">
  <link rel="icon" href="<%=request.getContextPath()%>/front-end/assets/images/favicon.ico" type="image/x-icon" />
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/front-end/assets/images/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/home_files/style.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/home_files/header.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/home_files/index.css">


<!-- 這段給emoji的 -->
  <link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> 
 <link rel="shortcut icon" href="<%=request.getContextPath()%>/front-end/assets/images/favicon.ico" type="image/x-icon" />
  <link rel="icon" href="<%=request.getContextPath()%>/front-end/assets/images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/header2/header_files/header2.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/header2/header_files/style2.css">






 <%--  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/header2/header_files/index.css"> --%>

  <%-- <script type="text/javascript" src="<%=request.getContextPath()%>/front-end/home/header2/header_files/1473064767308.JS"></script> --%>


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


      <div class="logo"><a href="<%=request.getContextPath()%>/front-end/home/home.jsp"><img src="<%=request.getContextPath()%>/front-end/home/header2/header_files/透明LOGO有字有框.png"></a></div>






      <div class="menu">
        <nav class="menu-top">
          <ul>


            <li class="m-logo"><a href="<%=request.getContextPath()%>/front-end/home/home.jsp"><img src="<%=request.getContextPath()%>/front-end/home/header2/header_files/透明LOGO有字有框.png"></a>
            </li>

            <!--desktop only-->



<!--             <li><a href="#"> -->
<!--                 <span class="hover WStdsong-B" style="font-size:14px;"> -->
<!--                   關於本站 -->
<!--                 </span> -->
<!--               </a></li> -->

            <li style="margin-right:16px;"><a id="login_link" href="<%=request.getContextPath()%>/front-end/announcement/listAllAnnounce.jsp">
                <div class="account" >關於本站</div>
              </a></li>
            <li style="margin-right:16px;"><a id="login_link" href="${pageContext.request.contextPath}/projOrder/projOrder.do?action=logout_By_Proj">
                <div class="account" id="logoutmem" >會員登出</div>
              </a></li>
            <li style="margin-right:16px;"><a id="login_link" href="<%=request.getContextPath()%>/front-end/login/loginByMem.jsp">
                <div class="account">會員登入</div>
              </a></li>
            <li style="margin-right:16px;"><a id="login_link" href="<%=request.getContextPath()%>/front-end/mem/addMemByMem.jsp">
                <div class="account">會員註冊</div>
              </a></li>
            <li style="margin-right:16px;"><a id="login_link" href="<%=request.getContextPath()%>/front-end/fMem/addFMem.jsp">
                <div class="account">註冊成為小農</div>
              </a></li>
            <li>
              <!-- <i class="material-icons" style="font-size:48px;color:red">mail_outline</i> -->
              <a href="#"></path></svg> <i class="far fa-bell" style="font-size:30px;color:#aaba8b
              "></i> </a>
            </li>

              <c:if test="${pmemVO.base64Image}">
              <li>
              <!-- <i class="material-icons" style="font-size:48px;color:red">mail_outline</i> -->

<%--				<img src="<%= request.getContextPath() %>/MemGifReader?mem_id=${memVO.mem_id}" class="svg-inline--fa fa-envelope fa-w-16" style="font-size: 30px;color: #aaba8b;">--%>
                <div class="svg-inline--fa fa-envelope fa-w-16"
                     style="font-size: 30px;color: #aaba8b;background-image: url(&#39;data:image/jpg;base64,${pmemVO.base64Image}&#39;)"></div>

              </li>
              </c:if>

          </ul>
        </nav>
        <div class="m-menu-top" style="">
          <div class="menu-btn">
            <span class="top"></span>
            <span class="middle"></span>
            <span class="bottom"></span>
          </div>


          <div class="m-logo"><a href="<%=request.getContextPath()%>/front-end/home/home.jsp"><img src="<%=request.getContextPath()%>/front-end/home/header2/header_files/透明LOGO有字有框.png"></a>
          </div>
        </div>


          <!--mobile only-->
       <!--  <div class="cart-form m-cart-form">
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
        </div> -->

        <!--mobile dropdown menu-list-->
        <nav style="z-index:1000" class="m-menu-list WStdsong-B">
          <ul id="nav-menu">


            <li>

              <a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp">小農商城</a>

            </li>

            <li>

              <a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp">農場旅遊</a>

            </li>

            <li class="about-us"><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp">農產認養</a></li>
            
            
            <li class="qa"><a href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp" >小農論壇</a></li>


            <li class="qa"><a href="<%=request.getContextPath()%>/front-end/fMem/fMemberInfom.jsp">小農專區</a></li>


            <li><a href="<%=request.getContextPath()%>/front-end/mem/memberInfom.jsp">會員專區</a></li>
            <li><a href="<%=request.getContextPath()%>/front-end/login/loginByMem.jsp">登入</a></li>
            <li><a href="<%=request.getContextPath()%>/front-end/mem/addMemByMem.jsp">註冊</a></li>



            <!-- <li>
              <div class="fb"><a target="_blank" href="https://www.facebook.com/BuyDirectlyFromFarmers"><img src="./images/m_menu_fb.png"></a></div>
              <div class="line"><a target="_blank" href="https://line.me/R/ti/p/%40pkj2325g"><img src="./images/m_menu_line.png"></a></div>
              <div class="fb"><a target="_blank" href="https://www.instagram.com/bdfftw"><img src="./images/instagram.png"></a></div>
            </li> -->

          </ul>
        </nav>
        <div class="m-header-scroll">
          <!--desktop menu -->
          <input type="hidden" name="show_sublogo" id="show_sublogo" value="False">
          <nav class="menu-bottom sec-menu-bottom WStdsong-B" style="float:right; left: 2%; position: relative;">
           	<ul>

              <li style="padding: 0;">
					<div class="flip1">
                      <a href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp" style="padding:3px 16px 0 16px;">小農論壇</a>
                      
                      <!-- <div class="dropdown-menu toggle1" style="position:absolute; top:30px;">
                        <a class="dropdown-item" href="#" >最新消息</a>
                        <a class="dropdown-item" href="#" >活動資訊</a>
                        <a class="dropdown-item" href="#" >平台公告</a>
                      </div> -->
                    </div>
              </li>
			  <li style="padding: 0;">
					<div class="flip2">
                      <a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp" style="padding:3px 16px 0 16px;">小農商城</a>
                      </div> 
              </li>              
              <li style="padding: 0;">
					<div class="flip3">
                      <a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp" style="padding:3px 16px 0 16px;">農場旅遊</a>
                      
                    <!--   <div class="dropdown-menu toggle3" style="position:absolute; top:30px;">
                        <a class="dropdown-item" href="#" >Action</a>
                        <a class="dropdown-item" href="#" >Another</a>
                        <a class="dropdown-item" href="#" >Something</a>
                      </div> -->
                    </div>
              </li>

              <li style="padding: 0;">
					<div class="flip4">
                      <a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp" style="padding:3px 16px 0 16px;">農產認養</a>
                      
                     <!--  <div class="dropdown-menu toggle4" style="position:absolute; top:30px;">
                        <a class="dropdown-item" href="https://www.facebook.com/BuyDirectlyFromFarmers" >Action</a>
                        <a class="dropdown-item" href="#" >Another</a>
                        <a class="dropdown-item" href="#" >Something</a>
                      </div> -->
                    </div>
              </li>

                <a href="<%=request.getContextPath()%>/front-end/mem/memberInfom.jsp" style="color:#000;">

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

                <a href="<%=request.getContextPath()%>/front-end/fMem/fMemberInfom.jsp"" style="color:#000;">

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
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/jquery.js"></script>
      <script>
        window.jQuery || document.write('<script src="/static/oscar/js/jquery/jquery-1.9.1.min.js"><\/script>')
      </script>
    
    
    
    
    
      <!-- bdff -->
      <!-- <script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>     -->
      <!-- <script type="text/javascript" src="/static/scripts/jquery.cycle.all.js"></script>             -->
      <!-- <script type="text/javascript" src="/static/scripts/bdff.js"></script> -->
      <!-- <script src="/static/scripts/bdff_ui.js" type="text/javascript" charset="utf-8"></script>  -->
    
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/bdff_bremen.js" type="text/javascript" charset="utf-8"></script>
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/jquery-2.2.1.min.js"></script>
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/plugins.js"></script>
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/menu.js"></script>
    
      <!-- bdff -->
    
    
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/index.js"></script>
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/jquery.dotdotdot.js"></script>
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/dotdotdot-desc.js"></script>
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
      <script src="<%=request.getContextPath()%>/front-end/home/header2/header_files/jquery.cookie.js"></script>
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
    

<!-- dropdown -->      
      <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
      crossorigin="anonymous"></script>

      
      </body></html>