<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>
<%-- <%
	ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%> --%>


<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO"); 
Integer proj_id  = projectVO.getProj_id();
ProjPerkService projPerkSvc = new ProjPerkService();
List<ProjPerkVO> list = projPerkSvc.getAll(proj_id);
pageContext.setAttribute("list",list);
%>
<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />
<jsp:useBean id="projPerkSvc1" scope="page" class="com.projPerk.model.ProjPerkService" />
<%-- <jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FMemService" /> --%>
<!-- 衧配有改 -->
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />

<!-- 核心在1173 -->
<!-- 704有圖要抽換 -->

<!DOCTYPE html>
<!-- saved from url=(0056)https://www.zeczec.com/projects/ICHR/orders/back_project -->
<html lang="zh-Hant-TW">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="csrf-param" content="authenticity_token">
<meta name="csrf-token"
	content="at7SKlt/ImyGEJPpThvpFsPrcCvpbVMKG6UvAClXNinGclBO6imi1c4uGjybebZDHocPtRijEbgglqNwWft0hA=="><script src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/sdk.js.下載" async=""
	crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/nr-1215.min.js.下載"></script>
<script async="" src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/fbevents.js.下載"></script>
<script id="facebook-jssdk" src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/sdk.js(1).下載"></script>
<script async="" src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/analytics.js.下載"></script>
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam-cell.nr-data.net","errorBeacon":"bam-cell.nr-data.net","licenseKey":"6df56d3465","applicationID":"2801605","transactionName":"JQpcTUVZXVhcF01ZEwIAQEoYVFBXUjoSRA4MAFFN","queueTime":3,"applicationTime":151,"agent":""}</script>
<script type="text/javascript">(window.NREUM||(NREUM={})).init={ajax:{deny_list:["bam-cell.nr-data.net"]}};(window.NREUM||(NREUM={})).loader_config={licenseKey:"6df56d3465",applicationID:"2801605"};window.NREUM||(NREUM={}),__nr_require=function(t,e,n){function r(n){if(!e[n]){var i=e[n]={exports:{}};t[n][0].call(i.exports,function(e){var i=t[n][1][e];return r(i||e)},i,i.exports)}return e[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var i=0;i<n.length;i++)r(n[i]);return r}({1:[function(t,e,n){function r(){}function i(t,e,n,r){return function(){return s.recordSupportability("API/"+e+"/called"),o(t+e,[u.now()].concat(c(arguments)),n?null:this,r),n?void 0:this}}var o=t("handle"),a=t(10),c=t(11),f=t("ee").get("tracer"),u=t("loader"),s=t(4),d=NREUM;"undefined"==typeof window.newrelic&&(newrelic=d);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",v=l+"ixn-";a(p,function(t,e){d[e]=i(l,e,!0,"api")}),d.addPageAction=i(l,"addPageAction",!0),d.setCurrentRouteName=i(l,"routeName",!0),e.exports=newrelic,d.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(t,e){var n={},r=this,i="function"==typeof e;return o(v+"tracer",[u.now(),t,n],r),function(){if(f.emit((i?"":"no-")+"fn-start",[u.now(),r,i],n),i)try{return e.apply(this,arguments)}catch(t){throw f.emit("fn-err",[arguments,this,t],n),t}finally{f.emit("fn-end",[u.now()],n)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,e){m[e]=i(v,e)}),newrelic.noticeError=function(t,e){"string"==typeof t&&(t=new Error(t)),s.recordSupportability("API/noticeError/called"),o("err",[t,u.now(),!1,e])}},{}],2:[function(t,e,n){function r(t){if(NREUM.init){for(var e=NREUM.init,n=t.split("."),r=0;r<n.length-1;r++)if(e=e[n[r]],"object"!=typeof e)return;return e=e[n[n.length-1]]}}e.exports={getConfiguration:r}},{}],3:[function(t,e,n){var r=!1;try{var i=Object.defineProperty({},"passive",{get:function(){r=!0}});window.addEventListener("testPassive",null,i),window.removeEventListener("testPassive",null,i)}catch(o){}e.exports=function(t){return r?{passive:!0,capture:!!t}:!!t}},{}],4:[function(t,e,n){function r(t,e){var n=[a,t,{name:t},e];return o("storeMetric",n,null,"api"),n}function i(t,e){var n=[c,t,{name:t},e];return o("storeEventMetrics",n,null,"api"),n}var o=t("handle"),a="sm",c="cm";e.exports={constants:{SUPPORTABILITY_METRIC:a,CUSTOM_METRIC:c},recordSupportability:r,recordCustom:i}},{}],5:[function(t,e,n){function r(){return c.exists&&performance.now?Math.round(performance.now()):(o=Math.max((new Date).getTime(),o))-a}function i(){return o}var o=(new Date).getTime(),a=o,c=t(12);e.exports=r,e.exports.offset=a,e.exports.getLastTimestamp=i},{}],6:[function(t,e,n){function r(t){return!(!t||!t.protocol||"file:"===t.protocol)}e.exports=r},{}],7:[function(t,e,n){function r(t,e){var n=t.getEntries();n.forEach(function(t){"first-paint"===t.name?l("timing",["fp",Math.floor(t.startTime)]):"first-contentful-paint"===t.name&&l("timing",["fcp",Math.floor(t.startTime)])})}function i(t,e){var n=t.getEntries();if(n.length>0){var r=n[n.length-1];if(u&&u<r.startTime)return;var i=[r],o=a({});o&&i.push(o),l("lcp",i)}}function o(t){t.getEntries().forEach(function(t){t.hadRecentInput||l("cls",[t])})}function a(t){var e=navigator.connection||navigator.mozConnection||navigator.webkitConnection;if(e)return e.type&&(t["net-type"]=e.type),e.effectiveType&&(t["net-etype"]=e.effectiveType),e.rtt&&(t["net-rtt"]=e.rtt),e.downlink&&(t["net-dlink"]=e.downlink),t}function c(t){if(t instanceof y&&!w){var e=Math.round(t.timeStamp),n={type:t.type};a(n),e<=v.now()?n.fid=v.now()-e:e>v.offset&&e<=Date.now()?(e-=v.offset,n.fid=v.now()-e):e=v.now(),w=!0,l("timing",["fi",e,n])}}function f(t){"hidden"===t&&(u=v.now(),l("pageHide",[u]))}if(!("init"in NREUM&&"page_view_timing"in NREUM.init&&"enabled"in NREUM.init.page_view_timing&&NREUM.init.page_view_timing.enabled===!1)){var u,s,d,p,l=t("handle"),v=t("loader"),m=t(9),g=t(3),y=NREUM.o.EV;if("PerformanceObserver"in window&&"function"==typeof window.PerformanceObserver){s=new PerformanceObserver(r);try{s.observe({entryTypes:["paint"]})}catch(h){}d=new PerformanceObserver(i);try{d.observe({entryTypes:["largest-contentful-paint"]})}catch(h){}p=new PerformanceObserver(o);try{p.observe({type:"layout-shift",buffered:!0})}catch(h){}}if("addEventListener"in document){var w=!1,b=["click","keydown","mousedown","pointerdown","touchstart"];b.forEach(function(t){document.addEventListener(t,c,g(!1))})}m(f)}},{}],8:[function(t,e,n){function r(t,e){if(!i)return!1;if(t!==i)return!1;if(!e)return!0;if(!o)return!1;for(var n=o.split("."),r=e.split("."),a=0;a<r.length;a++)if(r[a]!==n[a])return!1;return!0}var i=null,o=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var c=navigator.userAgent,f=c.match(a);f&&c.indexOf("Chrome")===-1&&c.indexOf("Chromium")===-1&&(i="Safari",o=f[1])}e.exports={agent:i,version:o,match:r}},{}],9:[function(t,e,n){function r(t){function e(){t(c&&document[c]?document[c]:document[o]?"hidden":"visible")}"addEventListener"in document&&a&&document.addEventListener(a,e,i(!1))}var i=t(3);e.exports=r;var o,a,c;"undefined"!=typeof document.hidden?(o="hidden",a="visibilitychange",c="visibilityState"):"undefined"!=typeof document.msHidden?(o="msHidden",a="msvisibilitychange"):"undefined"!=typeof document.webkitHidden&&(o="webkitHidden",a="webkitvisibilitychange",c="webkitVisibilityState")},{}],10:[function(t,e,n){function r(t,e){var n=[],r="",o=0;for(r in t)i.call(t,r)&&(n[o]=e(r,t[r]),o+=1);return n}var i=Object.prototype.hasOwnProperty;e.exports=r},{}],11:[function(t,e,n){function r(t,e,n){e||(e=0),"undefined"==typeof n&&(n=t?t.length:0);for(var r=-1,i=n-e||0,o=Array(i<0?0:i);++r<i;)o[r]=t[e+r];return o}e.exports=r},{}],12:[function(t,e,n){e.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(t,e,n){function r(){}function i(t){function e(t){return t&&t instanceof r?t:t?u(t,f,a):a()}function n(n,r,i,o,a){if(a!==!1&&(a=!0),!l.aborted||o){t&&a&&t(n,r,i);for(var c=e(i),f=m(n),u=f.length,s=0;s<u;s++)f[s].apply(c,r);var p=d[w[n]];return p&&p.push([b,n,r,c]),c}}function o(t,e){h[t]=m(t).concat(e)}function v(t,e){var n=h[t];if(n)for(var r=0;r<n.length;r++)n[r]===e&&n.splice(r,1)}function m(t){return h[t]||[]}function g(t){return p[t]=p[t]||i(n)}function y(t,e){l.aborted||s(t,function(t,n){e=e||"feature",w[n]=e,e in d||(d[e]=[])})}var h={},w={},b={on:o,addEventListener:o,removeEventListener:v,emit:n,get:g,listeners:m,context:e,buffer:y,abort:c,aborted:!1};return b}function o(t){return u(t,f,a)}function a(){return new r}function c(){(d.api||d.feature)&&(l.aborted=!0,d=l.backlog={})}var f="nr@context",u=t("gos"),s=t(10),d={},p={},l=e.exports=i();e.exports.getOrSetContext=o,l.backlog=d},{}],gos:[function(t,e,n){function r(t,e,n){if(i.call(t,e))return t[e];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,e,{value:r,writable:!0,enumerable:!1}),r}catch(o){}return t[e]=r,r}var i=Object.prototype.hasOwnProperty;e.exports=r},{}],handle:[function(t,e,n){function r(t,e,n,r){i.buffer([t],r),i.emit(t,e,n)}var i=t("ee").get("handle");e.exports=r,r.ee=i},{}],id:[function(t,e,n){function r(t){var e=typeof t;return!t||"object"!==e&&"function"!==e?-1:t===window?0:a(t,o,function(){return i++})}var i=1,o="nr@id",a=t("gos");e.exports=r},{}],loader:[function(t,e,n){function r(){if(!P++){var t=M.info=NREUM.info,e=g.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&e))return u.abort();f(O,function(e,n){t[e]||(t[e]=n)});var n=a();c("mark",["onload",n+M.offset],null,"api"),c("timing",["load",n]);var r=g.createElement("script");0===t.agent.indexOf("http://")||0===t.agent.indexOf("https://")?r.src=t.agent:r.src=v+"://"+t.agent,e.parentNode.insertBefore(r,e)}}function i(){"complete"===g.readyState&&o()}function o(){c("mark",["domContent",a()+M.offset],null,"api")}var a=t(5),c=t("handle"),f=t(10),u=t("ee"),s=t(8),d=t(6),p=t(2),l=t(3),v=p.getConfiguration("ssl")===!1?"http":"https",m=window,g=m.document,y="addEventListener",h="attachEvent",w=m.XMLHttpRequest,b=w&&w.prototype,E=!d(m.location);NREUM.o={ST:setTimeout,SI:m.setImmediate,CT:clearTimeout,XHR:w,REQ:m.Request,EV:m.Event,PR:m.Promise,MO:m.MutationObserver};var x=""+location,O={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1215.min.js"},T=w&&b&&b[y]&&!/CriOS/.test(navigator.userAgent),M=e.exports={offset:a.getLastTimestamp(),now:a,origin:x,features:{},xhrWrappable:T,userAgent:s,disabled:E};if(!E){t(1),t(7),g[y]?(g[y]("DOMContentLoaded",o,l(!1)),m[y]("load",r,l(!1))):(g[h]("onreadystatechange",i),m[h]("onload",r)),c("mark",["firstbyte",a.getLastTimestamp()],null,"api");var P=0}},{}],"wrap-function":[function(t,e,n){function r(t,e){function n(e,n,r,f,u){function nrWrapper(){var o,a,s,p;try{a=this,o=d(arguments),s="function"==typeof r?r(o,a):r||{}}catch(l){i([l,"",[o,a,f],s],t)}c(n+"start",[o,a,f],s,u);try{return p=e.apply(a,o)}catch(v){throw c(n+"err",[o,a,v],s,u),v}finally{c(n+"end",[o,a,p],s,u)}}return a(e)?e:(n||(n=""),nrWrapper[p]=e,o(e,nrWrapper,t),nrWrapper)}function r(t,e,r,i,o){r||(r="");var c,f,u,s="-"===r.charAt(0);for(u=0;u<e.length;u++)f=e[u],c=t[f],a(c)||(t[f]=n(c,s?f+r:r,i,f,o))}function c(n,r,o,a){if(!v||e){var c=v;v=!0;try{t.emit(n,r,o,e,a)}catch(f){i([f,n,r,o],t)}v=c}}return t||(t=s),n.inPlace=r,n.flag=p,n}function i(t,e){e||(e=s);try{e.emit("internal-error",t)}catch(n){}}function o(t,e,n){if(Object.defineProperty&&Object.keys)try{var r=Object.keys(t);return r.forEach(function(n){Object.defineProperty(e,n,{get:function(){return t[n]},set:function(e){return t[n]=e,e}})}),e}catch(o){i([o],n)}for(var a in t)l.call(t,a)&&(e[a]=t[a]);return e}function a(t){return!(t&&t instanceof Function&&t.apply&&!t[p])}function c(t,e){var n=e(t);return n[p]=t,o(t,n,s),n}function f(t,e,n){var r=t[e];t[e]=c(r,n)}function u(){for(var t=arguments.length,e=new Array(t),n=0;n<t;++n)e[n]=arguments[n];return e}var s=t("ee"),d=t(11),p="nr@original",l=Object.prototype.hasOwnProperty,v=!1;e.exports=r,e.exports.wrapFunction=c,e.exports.wrapInPlace=f,e.exports.argsToArray=u},{}]},{},["loader"]);</script>
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="zh_TW" property="og:locale">
<meta content="zh_TW" property="og:locale:alternate">
<link
	href="https://www.zeczec.com/assets/logo-square-04c45286e84ea49d07c97c86625fbf3a75f4f32dd02da3ad3ca70a9a68fd0395.png"
	rel="apple-touch-icon">
<link
	href="https://www.zeczec.com/assets/fav-69601a279a66f2e6e31e508900d4f057559d3affcae42730d045b17d281107a6.png"
	rel="shortcut icon" type="image/x-icon">
<title>嘖嘖 | 𝗠𝗢𝗭𝗧𝗘𝗖𝗛® 冰光淨膚儀 | 能夠在家除毛！何必去美容？ | DIY居家除毛 |
	冰感舒緩痛感</title>
<link href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/css" rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
<meta content="171735882933694" property="fb:app_id">
<meta content="zeczec-com:project" property="og:type">
<meta
	content="嘖嘖 | 𝗠𝗢𝗭𝗧𝗘𝗖𝗛® 冰光淨膚儀 | 能夠在家除毛！何必去美容？ |  DIY居家除毛 |  冰感舒緩痛感"
	property="og:title">
<meta
	content="https://s3-ap-northeast-1.amazonaws.com/zeczec-prod/asset_431251_image_original.jpg?1643016084"
	property="og:image">
<meta
	content="【全身可用 脫毛效果顯著】冰光除毛。舒緩痛感，2種功能性濾光頭，99萬發使用，搭配專屬濾光頭，使肌膚看起來細緻透亮，跟毛毛說掰掰，再也不當毛怪！"
	property="og:description">
<meta content="https://www.zeczec.com/projects/ICHR" property="og:url">
<meta content="MOZTECH 墨子科技" property="zeczec-com:creator">
<meta content="summary_large_image" name="twitter:card">
<meta content="@zeczec_com" name="twitter:site">
<meta
	content="嘖嘖 | 𝗠𝗢𝗭𝗧𝗘𝗖𝗛® 冰光淨膚儀 | 能夠在家除毛！何必去美容？ |  DIY居家除毛 |  冰感舒緩痛感"
	name="twitter:title">
<meta
	content="【全身可用 脫毛效果顯著】冰光除毛。舒緩痛感，2種功能性濾光頭，99萬發使用，搭配專屬濾光頭，使肌膚看起來細緻透亮，跟毛毛說掰掰，再也不當毛怪！"
	name="twitter:description">
<meta
	content="https://s3-ap-northeast-1.amazonaws.com/zeczec-prod/asset_431251_image_original.jpg?1643016084"
	name="twitter:image">
<meta content="zeczec.com" name="twitter:domain">

</head>


<!-- 核心 -->
<body class="intent-mouse">	
<header>
         <jsp:include page="/header/header_for_Proj_Fmem.jsp" />
</header>


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
            查看回饋方案
          </span>
          <!-- <span class="order-3 f6 ml4-l black w-100 w-auto-l" href="https://www.zeczec.com/account/atm"><i
              class="material-icons v-mid dark-gray f4">timer</i>
            等待付款記錄
          </span> -->
        </h2>

      </div>

    </div>
  </div>
<div class="container"></div>
<div class="bt b--light-gray bb">
		<div class="container cf">
			<div class="w-100">
				<div class="w5-l dib fl-l mr3-l w-100">
					<div class="aspect-ratio-project-cover bg-near-white"
						style="background-image: url(&#39;data:image/jpg;base64,${projectVO.base64Image}&#39;)"></div>
				<!-- 圖片待抽換 -->
				</div>
				<div class="pv2 ph0-l ph3">					<a href="#">
						<h2 class="f5 mb0 dib mt1 f5 b">${projectVO.proj_name}</h2>
					</a>
					<div class="gray f7 mb3">
						<span>由</span> <a class="b"
							href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a><span
							class="mh2">發起</span>
					</div>
					<span class="b">目前總認養金額NT$${projectVO.proj_total_fund}</span> <span class="f7 dark-gray">
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
<%-- 						<%
						
						Integer proj_id  = projectVO.getProj_id();
						ProjPerkService projSvc = new ProjPerkService();
 						List<ProjPerkVO> list = projSvc.getAll(proj_id);
 						pageContext.setAttribute("list", list);
						%> --%>
						
					<!-- @TODO -->
					<c:forEach var="projPerkVO" items="${list}" >
						<div
							class="w-100 w-50-ns flex-none-ns ws-normal mr3-ns pt3-ns w-30-l">
							<a
								class="pa3 ba bw1 b--inherit round-s light-gray mb4 db border-rainbow "
								href="https://www.zeczec.com/projects/ICHR/orders/back_project?selected_reward=72641#details"><img
								width="100%" class="mb2 round-s"
								src="<%=request.getContextPath()%>/projPerk/ProjPerkDBGifReader4?id=${projPerkVO.perk_id}" alt="${projPerkVO.perk_intro}">
							<div class="black b f4">NT$${projPerkVO.perk_fund}</div>
<%-- 								<div class="black b f4">${projPerkVO.perk_intro}</div> --%>
								<div class="f7 mv2">
									<span style="background-color:#b35900 ;" class="f7 white ph2 bg-red b dib"> 剩餘 ${projPerkVO.perk_limited - projPerkVO.perk_total_count} 份 </span><span
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
									<br>
									 <p style="margin-block-start:0px">
                    寄送地區：${projPerkVO.perk_ship_area}
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
		
		<footer>
        <jsp:include page="/footer/footer_for_Proj_Fmem.jsp" />
</footer>
		
</body>
</html>