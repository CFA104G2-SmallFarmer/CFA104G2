<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page import="com.projPic.model.*"%>
<%@ page import="com.proDiary.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 這頁css連project的 -->
<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");

ProDiaryService proDiarySvc = new ProDiaryService();
List<ProDiaryVO> list2 = proDiarySvc.getAll(projectVO.getProj_id());
pageContext.setAttribute("list2", list2);
/* ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO"); */

Map<Date, List<ProDiaryVO>>  list3 = proDiarySvc.getAll_groupingBy_date(projectVO.getProj_id());
pageContext.setAttribute("list3", list3);		
java.sql.Date dir_upload_date =(java.sql.Date)request.getAttribute("dir_upload_date");
pageContext.setAttribute("dir_upload_date3", dir_upload_date);	
%>
<%-- ${list3.key[0]}
${dir_upload_date3} --%>
<%-- <% --%>
<!-- // ProjectService projectSvc = new ProjectService(); -->
<!-- // ProjectVO projectVO = projectSvc.getOneProject(1001);  -->
<%-- %> --%>
 <jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />

<%-- <jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FMemService" /> --%> 
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />

<!-- 待辦 -->
<!-- 登入確認 -->
<!-- 留言筆數 -->
<!-- 917 perk迭代 -->


<!DOCTYPE html>
<!-- saved from url=(0060)https://www.zeczec.com/projects/paradisepet2022zeczecnewyear -->
<html lang="zh-Hant-TW">
<head>
<!-- 這段給emoji的 -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="csrf-param" content="authenticity_token">
<%-- <meta name="csrf-token"
	content="5+gyP059yldfSDrM1IhtsJpYSE663M3nCcO9K2QrgPoAHFunOIF+oaikpmNPaJ1IPFP0ZvFZM2oJr74gGvDGyQ==">
<script
	src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/sdk.js.下載"
	async="" crossorigin="anonymous"></script>
<script
	src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/nr-1212.min.js.下載"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/fbevents.js.下載"></script>
<script id="facebook-jssdk"
	src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/sdk.js(1).下載"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/analytics.js.下載"></script>
<script async=""
	src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/9ve6cixxpl"></script>
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam-cell.nr-data.net","errorBeacon":"bam-cell.nr-data.net","licenseKey":"6df56d3465","applicationID":"2801605","transactionName":"JQpcTUVZXVhcF01GEwkPV1pDRR5HUQoV","queueTime":3,"applicationTime":269,"agent":""}</script>
<script type="text/javascript">(window.NREUM||(NREUM={})).init={ajax:{deny_list:["bam-cell.nr-data.net"]}};(window.NREUM||(NREUM={})).loader_config={licenseKey:"6df56d3465",applicationID:"2801605"};window.NREUM||(NREUM={}),__nr_require=function(t,e,n){function r(n){if(!e[n]){var i=e[n]={exports:{}};t[n][0].call(i.exports,function(e){var i=t[n][1][e];return r(i||e)},i,i.exports)}return e[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var i=0;i<n.length;i++)r(n[i]);return r}({1:[function(t,e,n){function r(){}function i(t,e,n,r){return function(){return s.recordSupportability("API/"+e+"/called"),o(t+e,[u.now()].concat(c(arguments)),n?null:this,r),n?void 0:this}}var o=t("handle"),a=t(10),c=t(11),f=t("ee").get("tracer"),u=t("loader"),s=t(4),d=NREUM;"undefined"==typeof window.newrelic&&(newrelic=d);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",v=l+"ixn-";a(p,function(t,e){d[e]=i(l,e,!0,"api")}),d.addPageAction=i(l,"addPageAction",!0),d.setCurrentRouteName=i(l,"routeName",!0),e.exports=newrelic,d.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(t,e){var n={},r=this,i="function"==typeof e;return o(v+"tracer",[u.now(),t,n],r),function(){if(f.emit((i?"":"no-")+"fn-start",[u.now(),r,i],n),i)try{return e.apply(this,arguments)}catch(t){throw f.emit("fn-err",[arguments,this,t],n),t}finally{f.emit("fn-end",[u.now()],n)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,e){m[e]=i(v,e)}),newrelic.noticeError=function(t,e){"string"==typeof t&&(t=new Error(t)),s.recordSupportability("API/noticeError/called"),o("err",[t,u.now(),!1,e])}},{}],2:[function(t,e,n){function r(t){if(NREUM.init){for(var e=NREUM.init,n=t.split("."),r=0;r<n.length-1;r++)if(e=e[n[r]],"object"!=typeof e)return;return e=e[n[n.length-1]]}}e.exports={getConfiguration:r}},{}],3:[function(t,e,n){var r=!1;try{var i=Object.defineProperty({},"passive",{get:function(){r=!0}});window.addEventListener("testPassive",null,i),window.removeEventListener("testPassive",null,i)}catch(o){}e.exports=function(t){return r?{passive:!0,capture:!!t}:!!t}},{}],4:[function(t,e,n){function r(t,e){var n=[a,t,{name:t},e];return o("storeMetric",n,null,"api"),n}function i(t,e){var n=[c,t,{name:t},e];return o("storeEventMetrics",n,null,"api"),n}var o=t("handle"),a="sm",c="cm";e.exports={constants:{SUPPORTABILITY_METRIC:a,CUSTOM_METRIC:c},recordSupportability:r,recordCustom:i}},{}],5:[function(t,e,n){function r(){return c.exists&&performance.now?Math.round(performance.now()):(o=Math.max((new Date).getTime(),o))-a}function i(){return o}var o=(new Date).getTime(),a=o,c=t(12);e.exports=r,e.exports.offset=a,e.exports.getLastTimestamp=i},{}],6:[function(t,e,n){function r(t){return!(!t||!t.protocol||"file:"===t.protocol)}e.exports=r},{}],7:[function(t,e,n){function r(t,e){var n=t.getEntries();n.forEach(function(t){"first-paint"===t.name?p("timing",["fp",Math.floor(t.startTime)]):"first-contentful-paint"===t.name&&p("timing",["fcp",Math.floor(t.startTime)])})}function i(t,e){var n=t.getEntries();if(n.length>0){var r=n[n.length-1];if(f&&f<r.startTime)return;p("lcp",[r])}}function o(t){t.getEntries().forEach(function(t){t.hadRecentInput||p("cls",[t])})}function a(t){if(t instanceof g&&!y){var e=Math.round(t.timeStamp),n={type:t.type};e<=l.now()?n.fid=l.now()-e:e>l.offset&&e<=Date.now()?(e-=l.offset,n.fid=l.now()-e):e=l.now(),y=!0,p("timing",["fi",e,n])}}function c(t){"hidden"===t&&(f=l.now(),p("pageHide",[f]))}if(!("init"in NREUM&&"page_view_timing"in NREUM.init&&"enabled"in NREUM.init.page_view_timing&&NREUM.init.page_view_timing.enabled===!1)){var f,u,s,d,p=t("handle"),l=t("loader"),v=t(9),m=t(3),g=NREUM.o.EV;if("PerformanceObserver"in window&&"function"==typeof window.PerformanceObserver){u=new PerformanceObserver(r);try{u.observe({entryTypes:["paint"]})}catch(h){}s=new PerformanceObserver(i);try{s.observe({entryTypes:["largest-contentful-paint"]})}catch(h){}d=new PerformanceObserver(o);try{d.observe({type:"layout-shift",buffered:!0})}catch(h){}}if("addEventListener"in document){var y=!1,w=["click","keydown","mousedown","pointerdown","touchstart"];w.forEach(function(t){document.addEventListener(t,a,m(!1))})}v(c)}},{}],8:[function(t,e,n){function r(t,e){if(!i)return!1;if(t!==i)return!1;if(!e)return!0;if(!o)return!1;for(var n=o.split("."),r=e.split("."),a=0;a<r.length;a++)if(r[a]!==n[a])return!1;return!0}var i=null,o=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var c=navigator.userAgent,f=c.match(a);f&&c.indexOf("Chrome")===-1&&c.indexOf("Chromium")===-1&&(i="Safari",o=f[1])}e.exports={agent:i,version:o,match:r}},{}],9:[function(t,e,n){function r(t){function e(){t(c&&document[c]?document[c]:document[o]?"hidden":"visible")}"addEventListener"in document&&a&&document.addEventListener(a,e,i(!1))}var i=t(3);e.exports=r;var o,a,c;"undefined"!=typeof document.hidden?(o="hidden",a="visibilitychange",c="visibilityState"):"undefined"!=typeof document.msHidden?(o="msHidden",a="msvisibilitychange"):"undefined"!=typeof document.webkitHidden&&(o="webkitHidden",a="webkitvisibilitychange",c="webkitVisibilityState")},{}],10:[function(t,e,n){function r(t,e){var n=[],r="",o=0;for(r in t)i.call(t,r)&&(n[o]=e(r,t[r]),o+=1);return n}var i=Object.prototype.hasOwnProperty;e.exports=r},{}],11:[function(t,e,n){function r(t,e,n){e||(e=0),"undefined"==typeof n&&(n=t?t.length:0);for(var r=-1,i=n-e||0,o=Array(i<0?0:i);++r<i;)o[r]=t[e+r];return o}e.exports=r},{}],12:[function(t,e,n){e.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(t,e,n){function r(){}function i(t){function e(t){return t&&t instanceof r?t:t?u(t,f,a):a()}function n(n,r,i,o,a){if(a!==!1&&(a=!0),!l.aborted||o){t&&a&&t(n,r,i);for(var c=e(i),f=m(n),u=f.length,s=0;s<u;s++)f[s].apply(c,r);var p=d[w[n]];return p&&p.push([b,n,r,c]),c}}function o(t,e){y[t]=m(t).concat(e)}function v(t,e){var n=y[t];if(n)for(var r=0;r<n.length;r++)n[r]===e&&n.splice(r,1)}function m(t){return y[t]||[]}function g(t){return p[t]=p[t]||i(n)}function h(t,e){l.aborted||s(t,function(t,n){e=e||"feature",w[n]=e,e in d||(d[e]=[])})}var y={},w={},b={on:o,addEventListener:o,removeEventListener:v,emit:n,get:g,listeners:m,context:e,buffer:h,abort:c,aborted:!1};return b}function o(t){return u(t,f,a)}function a(){return new r}function c(){(d.api||d.feature)&&(l.aborted=!0,d=l.backlog={})}var f="nr@context",u=t("gos"),s=t(10),d={},p={},l=e.exports=i();e.exports.getOrSetContext=o,l.backlog=d},{}],gos:[function(t,e,n){function r(t,e,n){if(i.call(t,e))return t[e];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,e,{value:r,writable:!0,enumerable:!1}),r}catch(o){}return t[e]=r,r}var i=Object.prototype.hasOwnProperty;e.exports=r},{}],handle:[function(t,e,n){function r(t,e,n,r){i.buffer([t],r),i.emit(t,e,n)}var i=t("ee").get("handle");e.exports=r,r.ee=i},{}],id:[function(t,e,n){function r(t){var e=typeof t;return!t||"object"!==e&&"function"!==e?-1:t===window?0:a(t,o,function(){return i++})}var i=1,o="nr@id",a=t("gos");e.exports=r},{}],loader:[function(t,e,n){function r(){if(!T++){var t=P.info=NREUM.info,e=g.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&e))return u.abort();f(O,function(e,n){t[e]||(t[e]=n)});var n=a();c("mark",["onload",n+P.offset],null,"api"),c("timing",["load",n]);var r=g.createElement("script");0===t.agent.indexOf("http://")||0===t.agent.indexOf("https://")?r.src=t.agent:r.src=v+"://"+t.agent,e.parentNode.insertBefore(r,e)}}function i(){"complete"===g.readyState&&o()}function o(){c("mark",["domContent",a()+P.offset],null,"api")}var a=t(5),c=t("handle"),f=t(10),u=t("ee"),s=t(8),d=t(6),p=t(2),l=t(3),v=p.getConfiguration("ssl")===!1?"http":"https",m=window,g=m.document,h="addEventListener",y="attachEvent",w=m.XMLHttpRequest,b=w&&w.prototype,E=!d(m.location);NREUM.o={ST:setTimeout,SI:m.setImmediate,CT:clearTimeout,XHR:w,REQ:m.Request,EV:m.Event,PR:m.Promise,MO:m.MutationObserver};var x=""+location,O={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1212.min.js"},M=w&&b&&b[h]&&!/CriOS/.test(navigator.userAgent),P=e.exports={offset:a.getLastTimestamp(),now:a,origin:x,features:{},xhrWrappable:M,userAgent:s,disabled:E};if(!E){t(1),t(7),g[h]?(g[h]("DOMContentLoaded",o,l(!1)),m[h]("load",r,l(!1))):(g[y]("onreadystatechange",i),m[y]("onload",r)),c("mark",["firstbyte",a.getLastTimestamp()],null,"api");var T=0}},{}],"wrap-function":[function(t,e,n){function r(t,e){function n(e,n,r,f,u){function nrWrapper(){var o,a,s,p;try{a=this,o=d(arguments),s="function"==typeof r?r(o,a):r||{}}catch(l){i([l,"",[o,a,f],s],t)}c(n+"start",[o,a,f],s,u);try{return p=e.apply(a,o)}catch(v){throw c(n+"err",[o,a,v],s,u),v}finally{c(n+"end",[o,a,p],s,u)}}return a(e)?e:(n||(n=""),nrWrapper[p]=e,o(e,nrWrapper,t),nrWrapper)}function r(t,e,r,i,o){r||(r="");var c,f,u,s="-"===r.charAt(0);for(u=0;u<e.length;u++)f=e[u],c=t[f],a(c)||(t[f]=n(c,s?f+r:r,i,f,o))}function c(n,r,o,a){if(!v||e){var c=v;v=!0;try{t.emit(n,r,o,e,a)}catch(f){i([f,n,r,o],t)}v=c}}return t||(t=s),n.inPlace=r,n.flag=p,n}function i(t,e){e||(e=s);try{e.emit("internal-error",t)}catch(n){}}function o(t,e,n){if(Object.defineProperty&&Object.keys)try{var r=Object.keys(t);return r.forEach(function(n){Object.defineProperty(e,n,{get:function(){return t[n]},set:function(e){return t[n]=e,e}})}),e}catch(o){i([o],n)}for(var a in t)l.call(t,a)&&(e[a]=t[a]);return e}function a(t){return!(t&&t instanceof Function&&t.apply&&!t[p])}function c(t,e){var n=e(t);return n[p]=t,o(t,n,s),n}function f(t,e,n){var r=t[e];t[e]=c(r,n)}function u(){for(var t=arguments.length,e=new Array(t),n=0;n<t;++n)e[n]=arguments[n];return e}var s=t("ee"),d=t(11),p="nr@original",l=Object.prototype.hasOwnProperty,v=!1;e.exports=r,e.exports.wrapFunction=c,e.exports.wrapInPlace=f,e.exports.argsToArray=u},{}]},{},["loader"]);</script> --%>
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="zh_TW" property="og:locale">
<meta content="zh_TW" property="og:locale:alternate">

<title>我家門前有塊地 | ${projectVO.proj_name}</title>
<link href="<%=request.getContextPath()%>/front-end/project/listOneProj_files/css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/project/listOneProj_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
<script async="" type="text/javascript">
    (function(c,l,a,r,i,t,y){
        c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
        y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "9ve6cixxpl");    window.clarityDetectCount = 0    function tagClarity() {
        if (typeof clarity === 'function') {                clarity("set", "project_id", "11336");
        } else {
            if (window.clarityDetectCount > 5) {
                return;
            }
            window.clarityDetectCount++;
            setTimeout(tagClarity, 1000);
        }
    }    setTimeout(tagClarity, 500);
</script>
<!-- <meta content="171735882933694" property="fb:app_id">
<meta content="zeczec-com:project" property="og:type">
<meta content="嘖嘖 | 林北是小農｜ 喵言汪語賀新年春聯套組" property="og:title">
<meta
	content="https://s3-ap-northeast-1.amazonaws.com/zeczec-prod/asset_423058_image_original.jpg?1641180138"
	property="og:image">
<meta
	content="在世界的各個⾓落，總能見到小農的身影，他們⼀生孤單、飢餓的在街頭流浪， 而等待他們的終點，常常是像垃圾一樣被丟棄。 我們是林北是小農，我們希望小農也能好好走完最後⼀哩路，能有圓滿的善終。"
	property="og:description">
<meta
	content="https://www.zeczec.com/projects/paradisepet2022zeczecnewyear"
	property="og:url">
<meta content="林北是小農" property="zeczec-com:creator">
<meta content="summary_large_image" name="twitter:card">
<meta content="@zeczec_com" name="twitter:site">
<meta content="嘖嘖 | 林北是小農｜ 喵言汪語賀新年春聯套組" name="twitter:title">
<meta
	content="在世界的各個⾓落，總能見到小農的身影，他們⼀生孤單、飢餓的在街頭流浪， 而等待他們的終點，常常是像垃圾一樣被丟棄。 我們是林北是小農，我們希望小農也能好好走完最後⼀哩路，能有圓滿的善終。"
	name="twitter:description">
<meta
	content="https://s3-ap-northeast-1.amazonaws.com/zeczec-prod/asset_423058_image_original.jpg?1641180138"
	name="twitter:image">
<meta content="zeczec.com" name="twitter:domain"> -->

<style>
.buya :hover{

background-color:#f7f6e4;

color:deepgray;

}
/* .buya >.buy1 {
font-weight:400;
font-size:23px;
} */

</style>


</head>

<body class="intent-mouse">
	<header>
        <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp" /> 
</header>

	<header style="padding-bottom: 5px"
		class="relative z-2 bb pv2 ph3 ph0-l b--near-white"></header>
	
	<!-- 	核心 -->
	<div class="container"></div>
	<div class="container mv4-l mt3-l">
		<div class="gutter3-l flex">
			<div class="w-70-l w-100 ph3-l">
				<div class="relative right-0 w-100 bottom-0 mw7">
					<div
						class="overflow-hidden aspect-ratio-project-cover bg-near-white br2-l"
						style="background-image: url('data:image/jpg;base64,${projectVO.base64Image}')">
					</div>
				</div>
			</div>
			<div class="w-30-l w-100 ph3">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<a class="db"
					href="https://www.zeczec.com/projects/paradisepet2022zeczecnewyear"><h2
						class="f4 mt2 mb1">${projectVO.proj_name}</h2> </a><a class="b f6"
					href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a>
				<p class="f6 gray mv3">${projectVO.proj_abstract}</p>
				<div class="mv3 relative flex items-center flex-nowrap">
					
					<div class="flex-auto">
						<div class="f3 b js-sum-raised nowrap">NT$${projectVO.proj_total_fund}</div>
						<div class="f7">目標 NT$${projectVO.proj_goal}</div>
					</div>
				</div>
				<div class="ph3-l">
					<div class="bt b--light-gray pt3 nl3 nr3"></div>
				</div>
				<div class="mb1 f7"style="font-size:16px">
					<span class="mr2 b">贊助人數</span> <span class="js-backers-count">${projectVO.proj_total_count}</span>
				</div>
				<!-- 先取值 -->
				<fmt:formatDate var="mydate" value="${projectVO.expected_end_date}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				<!-- parsing -->
				<fmt:parseDate var="someDate" value="${mydate}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				<!-- 取當前時間	 -->
				<jsp:useBean id="nowDate" class="java.util.Date" />
				<!-- 取時間差(毫秒) -->
				<c:set var="interval" value="${someDate.time - nowDate.time}" />
				<fmt:formatNumber var="dayleft" value="${interval/1000/60/60/24}"
					pattern="#0" />
				<div class="mb1 f7" id="dayleft">
					<!-- 算完取條件判斷後呈現 -->
					<span class="mr2 b"> <c:set var="prefix" value="剩餘時間" /> <c:set
							var="suffix" value="天" /> <c:choose>
							<c:when test="${interval<=0}">已結案</c:when>
							<c:otherwise>${prefix}${dayleft}${suffix}</c:otherwise>
						</c:choose>
					</span>
				</div>
				<script type="text/javascript">
					let e=document.getElementById("dayleft")
					if (${interval}<=0){e.setAttribute("style","display:none;")}
     			</script>
				<div class="mb2 f7"style="font-size:16px">
					<span class="mr2 b">時程</span> ${projectVO.start_date} –
					${projectVO.expected_end_date}
				</div>
			</div>
		</div>
	</div>
	<div class="bt bb light-gray ph3 ph0-l mt0-l mt3 top-0 bg-white sticky">
		<div class="container cf f6 relative">
			<div class="gutter3 flex">
				<div
					class="mh3 mh0-ns ph0 ph3-ns w-70-l overflow-auto nowrap flex flex-nowrap">
				<a
								class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--transparent"
						href="${pageContext.request.contextPath}/project/project.do?proj_id=${projectVO.proj_id}&action=getOne_For_Display_ByMem">
						<div style="font-size:16px"class="dib pv1">專案內容</div>
					</a> 
					<a
				class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--drak-gray b"
						href="${pageContext.request.contextPath}/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&action=go_to_listAll_ProDiary_from_listOneProjByMem">
						<div style="font-size:18px;" class="dib pv1 gray">小農日誌</div> <span class="dib pv1 gray"><i class='fas fa-seedling' style='font-size:19px;'></i></span>
					</a> 
					<a
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--transparent"
						href="${pageContext.request.contextPath}/projDiscussion/projDiscussion.do?proj_id=${projectVO.proj_id}&action=getAllDisc_For_Display_By_Mem">
						<div style="font-size:16px"class="dib pv1">留言</div> <span class="f7 b gray"><i class="material-icons" style="font-size:19px">sms</i></span>
					</a>
				</div>
				<c:choose>
					<c:when test="${interval<=0}">
						<div class="w-30-l pv3 ph3 tc w-100">
							<div class="nt3 dn-l"></div>
							<div class="pv2 dark-gray bg-near-white f7">專案已結束</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="w-30-l pv3 ph3 tc w-100">
							<div class="nt3 dn-l"></div>
							<a class="bg-white button w-100 green hover-green focus grow"
								href="${pageContext.request.contextPath}/projPerk/projPerk.do?proj_id=${projectVO.proj_id}&action=getAllPerk_For_Display_ByMem">
								贊助專案</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="container mv4">
		<div class="gutter3-l flex">
			<div class="w-100 ph3 mb4 mb0 w-70-l">
				<div class="mt4 dn db-l"></div>
				<div
					class="mv-child-0 nested-media lh-copy overflow-hidden overflow-visible-ns"
					id="project_content">
					<div
						class="js-expand-project-content maxh7 mb3 overflow-hidden relative maxh-none-ns mv-child-0 overflow-visible-ns">
						<table class="w-100"
							style="table-layout: fixed; border-spacing: 0;">
							<tbody>
								<tr>
									<td>

										<div class="flex gutter3-l">
										
												<div style="margin-bottom: 30px;height:28px;"
					class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
					
					
						<div
							style="color:#aaba8b;font-size:20px;border-radius: 10px; text-align:center;border: solid #aaba8b 2px; padding: 15px; padding: 10px;"
							class="w-60 ph3 ph0-l flex-none self-start"> ${dir_upload_date3}</div>
					
				</div>
									

											<c:forEach var="proDiaryVO" items="${list3[dir_upload_date3]}">

												<!-- 這裡是開始 -->
												<div class=" ph3 pv3 w-50-ns w-100">
													<div class="cf" style="border:solid 1px lightgray;padding:10px">
														<%-- <FORM style="display: inline-block" METHOD="post"
															ACTION="<%=request.getContextPath()%>/proDiary/proDiary.do"
															name="form5">
															<button type="submit" style="margin-bottom: 10px;"
																class="button-s b-ns ph2 ph3-ns button dark-gray bg-near-white bn ml1"
																rel="nofollow" href="#">修改</button>
															<input type="hidden" name="dir_id"
																value="${proDiaryVO.dir_id}"> <input
																type="hidden" name="action"
																value="go_to_update_ProDiary_from_listOneProjByFmem">
														</FORM>

														<FORM style="display: inline-block" METHOD="post"
															ACTION="<%=request.getContextPath()%>/proDiary/proDiary.do"
															name="form6">
															<button type="submit" style="margin-bottom: 10px;"
																class="button-s b-ns ph2 ph3-ns button dark-gray bg-near-white bn ml1"
																rel="nofollow" href="#">刪除</button>
															<input type="hidden" name="dir_id"
																value="${proDiaryVO.dir_id}"> <input
																type="hidden" name="action" value="delete">
														</FORM>

														<c:choose>
															<c:when test="${proDiaryVO.dir_upload_state==0}">
																<FORM style="display: inline-block" METHOD="post"
																	ACTION="<%=request.getContextPath()%>/proDiary/proDiary.do"
																	name="form6">
																	<button type="submit" style="background-color:#f7ffd4;margin-bottom: 10px;"
																		class="button-s b-ns ph2 ph3-ns button dark-gray bg-near-white bn ml1"
																		rel="nofollow" href="#">馬上發布</button>
																	<input type="hidden" name="dir_id"
																		value="${proDiaryVO.dir_id}"> <input
																		type="hidden" name="action"
																		value="change_dir_upload_state_to_1_from_listOneProjByFmem">
																</FORM>
															</c:when>
															<c:when test="${proDiaryVO.dir_upload_state==1}">

															</c:when>
															 <c:otherwise>
        什么都没有。
    </c:otherwise>
														</c:choose> --%>


														<div style="position: relative;" class="for_all_img">
															<!-- <span style="font-size: 24px;position:absolute;color:#E6B800; bottom:3%;right:3%; z-index:1000;"> <i class='fas fa-grin-beam' style='position:absolute;font-size:36px'></i>sss</span> -->
															<c:choose>
    <c:when test="${proDiaryVO.dir_emoji=='開心'}">
       														<i class='fas fa-circle'
																style='color: rgb(80, 80, 80); bottom: 2.5%; right: 2.3%; position: absolute; font-size: 34px; z-index: 0.1;'></i>
															<i class='fas fa-grin'
																style='color: rgb(255, 247, 0); bottom: 3%; right: 3%; position: absolute; font-size: 30px; z-index: 0;'></i>

    </c:when>
    <c:when test="${proDiaryVO.dir_emoji=='歡樂'}">
       															
															<i class='fas fa-circle'
																style='color: rgb(80, 80, 80); bottom: 2.5%; right: 2.3%; position: absolute; font-size: 34px; z-index: 0.1;'></i>
															<i class='fas fa-laugh-squint'
																style='color: rgb(255, 247, 0); bottom: 3%; right: 3%; position: absolute; font-size: 30px; z-index: 0;'></i>
    </c:when>
        <c:when test="${proDiaryVO.dir_emoji=='難過'}">
       															
															<i class='fas fa-circle'
																style='color: rgb(80, 80, 80); bottom: 2.5%; right: 2.3%; position: absolute; font-size: 34px; z-index: 0.1;'></i>
															<i class='fas fa-sad-tear'
																style='color: rgb(255, 247, 0); bottom: 3%; right: 3%; position: absolute; font-size: 30px; z-index: 0;'></i>
    </c:when>
  
   <c:when test="${proDiaryVO.dir_emoji=='驚訝'}">
															<i class='fas fa-circle'
																style='color: rgb(80, 80, 80); bottom: 2.5%; right: 2.3%; position: absolute; font-size: 34px; z-index: 0.1;'></i>
															<i class='fas fa-surprise'
																style='color: rgb(255, 247, 0); bottom: 3%; right: 3%; position: absolute; font-size: 30px; z-index: 0;'></i>       
       
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
															
															
															
															<!-- <i class='fas fa-circle'
																style='color: rgb(80, 80, 80); bottom: 2.5%; right: 2.3%; position: absolute; font-size: 34px; z-index: 0.1;'></i>
															<i class='fas fa-grin'
																style='color: rgb(255, 247, 0); bottom: 3%; right: 3%; position: absolute; font-size: 30px; z-index: 0;'></i> -->

															<!-- <img id="img2" class="w-100 mb3"
															src="farmforUploadPic/farmforUploadPic.png" alt=""> -->
															<img width="100%" class="mb2 round-s"
																src="<%=request.getContextPath()%>/proDiary/ProDiaryDBGifReader4?id=${proDiaryVO.dir_id}"
																alt="">
															<!-- 圖片呈現成功 -->
														</div>
														<!-- <label class="b" for="2">顯示圖片</label> -->
														<!-- <input id="upPic2" onchange="pic2_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                  name="2"> -->

														<p
															style="font-size: 17px; margin-bottom: 4px; margin-top: 4px;">
															日期：${proDiaryVO.dir_upload_date}<br>
															<%-- 日誌發布狀態：${proDiaryVO.dir_upload_state}<br> --%>
															生產過程：${proDiaryVO.dir_procedure}<br>
															產品/種苗：${proDiaryVO.dir_product}<br>
															<%-- 心情：${proDiaryVO.dir_emoji}<br>  --%>
															心情筆記：
														<div
															style="font-size: 17px;  margin: 0px; height: auto;padding:3px">
															${proDiaryVO.dir_notes}</div>


														</p>
														<!-- 									<script>
                  var file2;
                  var fileReader2;

                  function pic2_change() {
                    file2 = document.getElementById('upPic2').files[0];
                    if (file2) {
                      fileReader2 = new FileReader();
                      fileReader2.onload = openfile2;
                      readFileContent2();
                    }
                  }

                  function openfile2(event) {
                    document.getElementById('img2').src = event.target.result;
                  }

                  function readFileContent2() {
                    fileReader2.readAsDataURL(file2);
                  }
                </script> -->
													</div>

												</div>
											</c:forEach>
											<!-- 這裡是結束 -->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<button class="mb4 button dark-gray w-100 js-expand-project dn-ns"
						data-track="MobileClick#ExpandContent"
						style="box-shadow: 0 0 100px 100px white;" type="button">
						<i class="material-icons f5 fl">keyboard_arrow_down</i> <i
							class="material-icons f5 fr">keyboard_arrow_down</i> 展開計畫內容
					</button>
				</div>
			</div>
			<div class="w-30-l ph3-l ph0 flex-ns flex-wrap flex-column-l w-100">
				<%-- <div style="margin-bottom: 20px;"
					class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
					<a href="${pageContext.request.contextPath}/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&action=insert_ProDiary_from_listOneProjByFmem">
						<div
							style="font-size:20px;color:#3f3f3f;text-align:center;border-radius: 10px; background-color:#f7ffd4;border: solid white 2px; padding: 15px; padding: 10px;"
							class="w-100-l ph3 ph0-l flex-none self-start"><strong>新增日誌</strong></div>
					</a>
				</div> --%>
				<div style="margin-bottom: 20px;"
					class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
					<a href="${pageContext.request.contextPath}/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&action=go_to_listAll_ProDiary_from_listOneProjByMem">
						<div
							style="font-size:20px;color:#3f3f3f;text-align:center;border-radius: 10px; background-color:#e0ffd8;border: solid white 2px; padding: 15px; padding: 10px;"
							class="w-100-l ph3 ph0-l flex-none self-start"><strong>查看全部日誌</strong></div>
					</a>
				</div>
				<c:if test="${!empty list3}">
<c:forEach var="list3" items="${list3}">
				<div style="margin-bottom: 30px;height:28px;"
					class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
					<a href="<%=request.getContextPath()%>/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&dir_upload_date=${list3.key}&action=go_to_listAll_ProDiary_ByDate_from_listOneProjByMem">
					
						<div
							style="color:#aaba8b;font-size:20px;border-radius: 10px; text-align:center;border: solid #aaba8b 2px; padding: 15px; padding: 10px;"
							class="w-60 ph3 ph0-l flex-none self-start"> ${list3.key}</div>
					</a>
				</div>
	</c:forEach>
	</c:if>
				<%-- 				<%
				Integer proj_id = projectVO.getProj_id();
				ProjPerkService projSvc = new ProjPerkService();
				List<ProjPerkVO> list = projSvc.getAll(proj_id);
				pageContext.setAttribute("list", list);
				%> --%>
				<!-- @TODO -->
				<!-- perk迭代區 -->
				<%-- <c:forEach var="projPerkVO" items="${list}" begin="<%=0%>"
					end="<%=10%>">
					<div class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
						<a
							class="pa3 ba bw1 b--inherit round-s light-gray mb4 db border-rainbow "
							href="https://www.zeczec.com/users/sign_in?return_to=%2Fprojects%2Fparadisepet2022zeczecnewyear%2Forders%2Fback_project%3Fselected_reward%3D72345%23details"><img
							width="100%" class="mb2 round-s"
							src="data:image/jpg;base64,${projPerkVO.base64Image}"
							alt="72345 banner">
							<div class="black b f4">NT$${projPerkVO.perk_fund}</div>
							<div class="f7 mv2">
								<span style="background-color: #717d34;"
									class="f7 white ph2 bg-red b dib"> 剩餘
									${projPerkVO.perk_limited - projPerkVO.perk_total_count} 份 </span><span
									class="black ph2 bg-near-white dib"> 已被贊助 <span
									class="b">${projPerkVO.perk_total_count}</span> /
									${projPerkVO.perk_limited} 次
								</span>
							</div>
							<div class="black f6 mv-child-0 maxh5 maxh-none-ns overflow-auto">
								<br>【${projPerkVO.perk_abbr_name}】
								<p>
									${projPerkVO.perk_intro} <br>特惠價
									${projPerkVO.perk_fund}（限量${projPerkVO.perk_limited}組）
								</p>
								<p>寄送地區：${projPerkVO.perk_ship_area}</p>
							</div>
							<div class="mt3 gray tc ph2 f7 ba">預計於${projPerkVO.perk_ship_date}實現</div>
						</a>
					</div>
				</c:forEach> --%>
			</div>
		</div>
	</div>
	<%-- <footer class="pt5 pb6 f6 bt light-gray relative">
		<div class="container dark-gray">
			<div class="flex ph0-l ph3">
				<div class="w-third-l w-100 mt-child-0 mb0-l mb4">
					<h3>社群</h3>
					<a class="db"
						href="https://www.youtube.com/channel/UC_k_rE8ln6Q75tcC5uvqu8g">YouTube</a>
					<a class="db" href="https://facebook.com/zeczec.com">Facebook</a> <a
						class="db" href="https://instagram.com/zeczec_com">Instagram</a> <a
						class="db" href="https://twitter.com/zeczec_com">Twitter</a>
				</div>
				<div class="w-third-l w-100 mt-child-0 mb0-l mb4">
					<h3>幫助</h3>
					<a class="db" href="https://www.zeczec.com/faq">常見問答</a> <a
						class="db" href="https://www.zeczec.com/docs/terms_of_service">使用條款</a>
					<a class="db" href="https://www.zeczec.com/docs/privacy">隱私權政策</a>
				</div>
				<div class="w-third-l w-100 mt-child-0 mb0-l mb4 relative">
					<h3>關於</h3>
					<a class="db" href="https://www.zeczec.com/about">關於我們</a> <a
						class="db" href="https://www.zeczec.com/brand">商標資源</a>
					<div class="f7 mt3">© 我家門前有塊地</div>
					<!-- 旋轉logo在這裡logo-safari-fix -->
					<a
						class="absolute-l top-0 right-0 mt3 dib relative logo-safari-fix"
						href="https://www.zeczec.com/"><img class="logo mr2 middle"
						style="height: 100px; width: 100px;" viewBox="0 0 138 138"
						src="<%=request.getContextPath()%>/project/listOneProj_files/透明LOGO小小農和手.png">
						<!-- 旋轉logo在這裡logo-safari-fix -->
						<title>zeczec</title> <path
							src="<%=request.getContextPath()%>/project/listOneProj_files/透明LOGO小小農和手.png"></path>
						</img> </a>
				</div>
			</div>
		</div>
	</footer> --%>
	
	    <footer>
         <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>
	<script
		src="<%=request.getContextPath()%>/project/listOneProj_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js.下載"
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
	<noscript>
		<img height='1' width='1' alt='' class='pixel'
			style='visibility: hidden'
			src='https://www.facebook.com/tr?id=286198143135387&amp;ev=PageView&amp;noscript=1&amp;cd[value]=0&amp;cd[currency]=TWD' />
	</noscript>
	<script type="text/javascript">
  fbq('init', '286198143135387')
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
		src="<%=request.getContextPath()%>/project/listOneProj_files/v652eace1692a40cfa3763df669d7439c1639079717194"
		integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw=="
		data-cf-beacon="{&quot;rayId&quot;:&quot;6cf01cc79d7756f4&quot;,&quot;token&quot;:&quot;e0311a1880d54b88ab9f48eac7540091&quot;,&quot;version&quot;:&quot;2021.12.0&quot;,&quot;si&quot;:100}"
		crossorigin="anonymous"></script>
	<div id="draggable-live-region" aria-relevant="additions"
		aria-atomic="true" aria-live="assertive" role="log"
		style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>
</html>