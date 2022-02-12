<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page import="com.projPic.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO"); 
%>
<%-- <% --%>
<!-- // ProjectService projectSvc = new ProjectService(); -->
<!-- // ProjectVO projectVO = projectSvc.getOneProject(1001);  -->
<%-- %> --%>


<!-- 待辦 -->
<!-- 登入確認 -->
<!-- 留言筆數 -->
<!-- 917 perk迭代 -->


<!DOCTYPE html>
<!-- saved from url=(0060)https://www.zeczec.com/projects/paradisepet2022zeczecnewyear -->
<html lang="zh-Hant-TW">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="csrf-param" content="authenticity_token">
<meta name="csrf-token"
	content="5+gyP059yldfSDrM1IhtsJpYSE663M3nCcO9K2QrgPoAHFunOIF+oaikpmNPaJ1IPFP0ZvFZM2oJr74gGvDGyQ==">
<script
	src="<%=request.getContextPath()%>/project/listOneProj_files/sdk.js.下載"
	async="" crossorigin="anonymous"></script>
<script
	src="<%=request.getContextPath()%>/project/listOneProj_files/nr-1212.min.js.下載"></script>
<script async=""
	src="<%=request.getContextPath()%>/project/listOneProj_files/fbevents.js.下載"></script>
<script id="facebook-jssdk"
	src="<%=request.getContextPath()%>/project/listOneProj_files/sdk.js(1).下載"></script>
<script async=""
	src="<%=request.getContextPath()%>/project/listOneProj_files/analytics.js.下載"></script>
<script async=""
	src="<%=request.getContextPath()%>/project/listOneProj_files/9ve6cixxpl"></script>
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam-cell.nr-data.net","errorBeacon":"bam-cell.nr-data.net","licenseKey":"6df56d3465","applicationID":"2801605","transactionName":"JQpcTUVZXVhcF01GEwkPV1pDRR5HUQoV","queueTime":3,"applicationTime":269,"agent":""}</script>
<script type="text/javascript">(window.NREUM||(NREUM={})).init={ajax:{deny_list:["bam-cell.nr-data.net"]}};(window.NREUM||(NREUM={})).loader_config={licenseKey:"6df56d3465",applicationID:"2801605"};window.NREUM||(NREUM={}),__nr_require=function(t,e,n){function r(n){if(!e[n]){var i=e[n]={exports:{}};t[n][0].call(i.exports,function(e){var i=t[n][1][e];return r(i||e)},i,i.exports)}return e[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var i=0;i<n.length;i++)r(n[i]);return r}({1:[function(t,e,n){function r(){}function i(t,e,n,r){return function(){return s.recordSupportability("API/"+e+"/called"),o(t+e,[u.now()].concat(c(arguments)),n?null:this,r),n?void 0:this}}var o=t("handle"),a=t(10),c=t(11),f=t("ee").get("tracer"),u=t("loader"),s=t(4),d=NREUM;"undefined"==typeof window.newrelic&&(newrelic=d);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",v=l+"ixn-";a(p,function(t,e){d[e]=i(l,e,!0,"api")}),d.addPageAction=i(l,"addPageAction",!0),d.setCurrentRouteName=i(l,"routeName",!0),e.exports=newrelic,d.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(t,e){var n={},r=this,i="function"==typeof e;return o(v+"tracer",[u.now(),t,n],r),function(){if(f.emit((i?"":"no-")+"fn-start",[u.now(),r,i],n),i)try{return e.apply(this,arguments)}catch(t){throw f.emit("fn-err",[arguments,this,t],n),t}finally{f.emit("fn-end",[u.now()],n)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,e){m[e]=i(v,e)}),newrelic.noticeError=function(t,e){"string"==typeof t&&(t=new Error(t)),s.recordSupportability("API/noticeError/called"),o("err",[t,u.now(),!1,e])}},{}],2:[function(t,e,n){function r(t){if(NREUM.init){for(var e=NREUM.init,n=t.split("."),r=0;r<n.length-1;r++)if(e=e[n[r]],"object"!=typeof e)return;return e=e[n[n.length-1]]}}e.exports={getConfiguration:r}},{}],3:[function(t,e,n){var r=!1;try{var i=Object.defineProperty({},"passive",{get:function(){r=!0}});window.addEventListener("testPassive",null,i),window.removeEventListener("testPassive",null,i)}catch(o){}e.exports=function(t){return r?{passive:!0,capture:!!t}:!!t}},{}],4:[function(t,e,n){function r(t,e){var n=[a,t,{name:t},e];return o("storeMetric",n,null,"api"),n}function i(t,e){var n=[c,t,{name:t},e];return o("storeEventMetrics",n,null,"api"),n}var o=t("handle"),a="sm",c="cm";e.exports={constants:{SUPPORTABILITY_METRIC:a,CUSTOM_METRIC:c},recordSupportability:r,recordCustom:i}},{}],5:[function(t,e,n){function r(){return c.exists&&performance.now?Math.round(performance.now()):(o=Math.max((new Date).getTime(),o))-a}function i(){return o}var o=(new Date).getTime(),a=o,c=t(12);e.exports=r,e.exports.offset=a,e.exports.getLastTimestamp=i},{}],6:[function(t,e,n){function r(t){return!(!t||!t.protocol||"file:"===t.protocol)}e.exports=r},{}],7:[function(t,e,n){function r(t,e){var n=t.getEntries();n.forEach(function(t){"first-paint"===t.name?p("timing",["fp",Math.floor(t.startTime)]):"first-contentful-paint"===t.name&&p("timing",["fcp",Math.floor(t.startTime)])})}function i(t,e){var n=t.getEntries();if(n.length>0){var r=n[n.length-1];if(f&&f<r.startTime)return;p("lcp",[r])}}function o(t){t.getEntries().forEach(function(t){t.hadRecentInput||p("cls",[t])})}function a(t){if(t instanceof g&&!y){var e=Math.round(t.timeStamp),n={type:t.type};e<=l.now()?n.fid=l.now()-e:e>l.offset&&e<=Date.now()?(e-=l.offset,n.fid=l.now()-e):e=l.now(),y=!0,p("timing",["fi",e,n])}}function c(t){"hidden"===t&&(f=l.now(),p("pageHide",[f]))}if(!("init"in NREUM&&"page_view_timing"in NREUM.init&&"enabled"in NREUM.init.page_view_timing&&NREUM.init.page_view_timing.enabled===!1)){var f,u,s,d,p=t("handle"),l=t("loader"),v=t(9),m=t(3),g=NREUM.o.EV;if("PerformanceObserver"in window&&"function"==typeof window.PerformanceObserver){u=new PerformanceObserver(r);try{u.observe({entryTypes:["paint"]})}catch(h){}s=new PerformanceObserver(i);try{s.observe({entryTypes:["largest-contentful-paint"]})}catch(h){}d=new PerformanceObserver(o);try{d.observe({type:"layout-shift",buffered:!0})}catch(h){}}if("addEventListener"in document){var y=!1,w=["click","keydown","mousedown","pointerdown","touchstart"];w.forEach(function(t){document.addEventListener(t,a,m(!1))})}v(c)}},{}],8:[function(t,e,n){function r(t,e){if(!i)return!1;if(t!==i)return!1;if(!e)return!0;if(!o)return!1;for(var n=o.split("."),r=e.split("."),a=0;a<r.length;a++)if(r[a]!==n[a])return!1;return!0}var i=null,o=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var c=navigator.userAgent,f=c.match(a);f&&c.indexOf("Chrome")===-1&&c.indexOf("Chromium")===-1&&(i="Safari",o=f[1])}e.exports={agent:i,version:o,match:r}},{}],9:[function(t,e,n){function r(t){function e(){t(c&&document[c]?document[c]:document[o]?"hidden":"visible")}"addEventListener"in document&&a&&document.addEventListener(a,e,i(!1))}var i=t(3);e.exports=r;var o,a,c;"undefined"!=typeof document.hidden?(o="hidden",a="visibilitychange",c="visibilityState"):"undefined"!=typeof document.msHidden?(o="msHidden",a="msvisibilitychange"):"undefined"!=typeof document.webkitHidden&&(o="webkitHidden",a="webkitvisibilitychange",c="webkitVisibilityState")},{}],10:[function(t,e,n){function r(t,e){var n=[],r="",o=0;for(r in t)i.call(t,r)&&(n[o]=e(r,t[r]),o+=1);return n}var i=Object.prototype.hasOwnProperty;e.exports=r},{}],11:[function(t,e,n){function r(t,e,n){e||(e=0),"undefined"==typeof n&&(n=t?t.length:0);for(var r=-1,i=n-e||0,o=Array(i<0?0:i);++r<i;)o[r]=t[e+r];return o}e.exports=r},{}],12:[function(t,e,n){e.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(t,e,n){function r(){}function i(t){function e(t){return t&&t instanceof r?t:t?u(t,f,a):a()}function n(n,r,i,o,a){if(a!==!1&&(a=!0),!l.aborted||o){t&&a&&t(n,r,i);for(var c=e(i),f=m(n),u=f.length,s=0;s<u;s++)f[s].apply(c,r);var p=d[w[n]];return p&&p.push([b,n,r,c]),c}}function o(t,e){y[t]=m(t).concat(e)}function v(t,e){var n=y[t];if(n)for(var r=0;r<n.length;r++)n[r]===e&&n.splice(r,1)}function m(t){return y[t]||[]}function g(t){return p[t]=p[t]||i(n)}function h(t,e){l.aborted||s(t,function(t,n){e=e||"feature",w[n]=e,e in d||(d[e]=[])})}var y={},w={},b={on:o,addEventListener:o,removeEventListener:v,emit:n,get:g,listeners:m,context:e,buffer:h,abort:c,aborted:!1};return b}function o(t){return u(t,f,a)}function a(){return new r}function c(){(d.api||d.feature)&&(l.aborted=!0,d=l.backlog={})}var f="nr@context",u=t("gos"),s=t(10),d={},p={},l=e.exports=i();e.exports.getOrSetContext=o,l.backlog=d},{}],gos:[function(t,e,n){function r(t,e,n){if(i.call(t,e))return t[e];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,e,{value:r,writable:!0,enumerable:!1}),r}catch(o){}return t[e]=r,r}var i=Object.prototype.hasOwnProperty;e.exports=r},{}],handle:[function(t,e,n){function r(t,e,n,r){i.buffer([t],r),i.emit(t,e,n)}var i=t("ee").get("handle");e.exports=r,r.ee=i},{}],id:[function(t,e,n){function r(t){var e=typeof t;return!t||"object"!==e&&"function"!==e?-1:t===window?0:a(t,o,function(){return i++})}var i=1,o="nr@id",a=t("gos");e.exports=r},{}],loader:[function(t,e,n){function r(){if(!T++){var t=P.info=NREUM.info,e=g.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&e))return u.abort();f(O,function(e,n){t[e]||(t[e]=n)});var n=a();c("mark",["onload",n+P.offset],null,"api"),c("timing",["load",n]);var r=g.createElement("script");0===t.agent.indexOf("http://")||0===t.agent.indexOf("https://")?r.src=t.agent:r.src=v+"://"+t.agent,e.parentNode.insertBefore(r,e)}}function i(){"complete"===g.readyState&&o()}function o(){c("mark",["domContent",a()+P.offset],null,"api")}var a=t(5),c=t("handle"),f=t(10),u=t("ee"),s=t(8),d=t(6),p=t(2),l=t(3),v=p.getConfiguration("ssl")===!1?"http":"https",m=window,g=m.document,h="addEventListener",y="attachEvent",w=m.XMLHttpRequest,b=w&&w.prototype,E=!d(m.location);NREUM.o={ST:setTimeout,SI:m.setImmediate,CT:clearTimeout,XHR:w,REQ:m.Request,EV:m.Event,PR:m.Promise,MO:m.MutationObserver};var x=""+location,O={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1212.min.js"},M=w&&b&&b[h]&&!/CriOS/.test(navigator.userAgent),P=e.exports={offset:a.getLastTimestamp(),now:a,origin:x,features:{},xhrWrappable:M,userAgent:s,disabled:E};if(!E){t(1),t(7),g[h]?(g[h]("DOMContentLoaded",o,l(!1)),m[h]("load",r,l(!1))):(g[y]("onreadystatechange",i),m[y]("onload",r)),c("mark",["firstbyte",a.getLastTimestamp()],null,"api");var T=0}},{}],"wrap-function":[function(t,e,n){function r(t,e){function n(e,n,r,f,u){function nrWrapper(){var o,a,s,p;try{a=this,o=d(arguments),s="function"==typeof r?r(o,a):r||{}}catch(l){i([l,"",[o,a,f],s],t)}c(n+"start",[o,a,f],s,u);try{return p=e.apply(a,o)}catch(v){throw c(n+"err",[o,a,v],s,u),v}finally{c(n+"end",[o,a,p],s,u)}}return a(e)?e:(n||(n=""),nrWrapper[p]=e,o(e,nrWrapper,t),nrWrapper)}function r(t,e,r,i,o){r||(r="");var c,f,u,s="-"===r.charAt(0);for(u=0;u<e.length;u++)f=e[u],c=t[f],a(c)||(t[f]=n(c,s?f+r:r,i,f,o))}function c(n,r,o,a){if(!v||e){var c=v;v=!0;try{t.emit(n,r,o,e,a)}catch(f){i([f,n,r,o],t)}v=c}}return t||(t=s),n.inPlace=r,n.flag=p,n}function i(t,e){e||(e=s);try{e.emit("internal-error",t)}catch(n){}}function o(t,e,n){if(Object.defineProperty&&Object.keys)try{var r=Object.keys(t);return r.forEach(function(n){Object.defineProperty(e,n,{get:function(){return t[n]},set:function(e){return t[n]=e,e}})}),e}catch(o){i([o],n)}for(var a in t)l.call(t,a)&&(e[a]=t[a]);return e}function a(t){return!(t&&t instanceof Function&&t.apply&&!t[p])}function c(t,e){var n=e(t);return n[p]=t,o(t,n,s),n}function f(t,e,n){var r=t[e];t[e]=c(r,n)}function u(){for(var t=arguments.length,e=new Array(t),n=0;n<t;++n)e[n]=arguments[n];return e}var s=t("ee"),d=t(11),p="nr@original",l=Object.prototype.hasOwnProperty,v=!1;e.exports=r,e.exports.wrapFunction=c,e.exports.wrapInPlace=f,e.exports.argsToArray=u},{}]},{},["loader"]);</script>
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="zh_TW" property="og:locale">
<meta content="zh_TW" property="og:locale:alternate">
<link
	href="https://www.zeczec.com/assets/logo-square-04c45286e84ea49d07c97c86625fbf3a75f4f32dd02da3ad3ca70a9a68fd0395.png"
	rel="apple-touch-icon">
<link
	href="https://www.zeczec.com/assets/fav-69601a279a66f2e6e31e508900d4f057559d3affcae42730d045b17d281107a6.png"
	rel="shortcut icon" type="image/x-icon">
<title>嘖嘖 | 林北是小農｜ 喵言汪語賀新年春聯套組</title>
<link href="<%=request.getContextPath()%>/project/listOneProj_files/css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/project/listOneProj_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
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
<meta content="171735882933694" property="fb:app_id">
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
<meta content="zeczec.com" name="twitter:domain">
<style type="text/css"
	data-fbcssmodules="css:fb.css.base css:fb.css.dialog css:fb.css.iframewidget css:fb.css.customer_chat_plugin_iframe">
.fb_hidden {
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reposition {
	overflow: hidden;
	position: relative
}

.fb_invisible {
	display: none
}

.fb_reset {
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
}

.fb_reset>div {
	overflow: hidden
}

@
keyframes fb_transform {
	from {opacity: 0;
	transform: scale(.95)
}

to {
	opacity: 1;
	transform: scale(1)
}

}
.fb_animate {
	animation: fb_transform .3s forwards
}

.fb_dialog {
	background: rgba(82, 82, 82, .7);
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_dialog_advanced {
	border-radius: 8px;
	padding: 10px
}

.fb_dialog_content {
	background: #fff;
	color: #373737
}

.fb_dialog_close_icon {
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
}

.fb_dialog_mobile .fb_dialog_close_icon {
	left: 5px;
	right: auto;
	top: 5px
}

.fb_dialog_padding {
	background-color: transparent;
	position: absolute;
	width: 1px;
	z-index: -1
}

.fb_dialog_close_icon:hover {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent
}

.fb_dialog_close_icon:active {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent
}

.fb_dialog_iframe {
	line-height: 0
}

.fb_dialog_content .dialog_title {
	background: #6d84b4;
	border: 1px solid #365899;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	margin: 0
}

.fb_dialog_content .dialog_title>span {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif)
		no-repeat 5px 50%;
	float: left;
	padding: 5px 0 7px 26px
}

body.fb_hidden {
	height: 100%;
	left: 0;
	margin: 0;
	overflow: visible;
	position: absolute;
	top: -10000px;
	transform: none;
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif)
		white no-repeat 50% 50%;
	min-height: 100%;
	min-width: 100%;
	overflow: hidden;
	position: absolute;
	top: 0;
	z-index: 10001
}

.fb_dialog.fb_dialog_mobile.loading.centered {
	background: none;
	height: auto;
	min-height: initial;
	min-width: initial;
	width: auto
}

.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
	background: none
}

.loading.centered #fb_dialog_loader_close {
	clear: both;
	color: #fff;
	display: block;
	font-size: 19px;
	padding-top: 20px
}

#fb-root #fb_dialog_ipad_overlay {
	background: rgba(0, 0, 0, .4);
	bottom: 0;
	left: 0;
	min-height: 100%;
	position: absolute;
	right: 0;
	top: 0;
	width: 100%;
	z-index: 10000
}

#fb-root #fb_dialog_ipad_overlay.hidden {
	display: none
}

.fb_dialog.fb_dialog_mobile.loading iframe {
	visibility: hidden
}

.fb_dialog_mobile .fb_dialog_iframe {
	position: sticky;
	top: 0
}

.fb_dialog_content .dialog_header {
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
}

.fb_dialog_content .dialog_header table {
	height: 43px;
	width: 100%
}

.fb_dialog_content .dialog_header td.header_left {
	font-size: 13px;
	padding-left: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .dialog_header td.header_right {
	font-size: 13px;
	padding-right: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .touchable_button {
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
}

.fb_dialog_content .dialog_header .touchable_button input {
	background: none;
	border: none;
	color: #fff;
	font: bold 12px Helvetica, sans-serif;
	margin: 2px -12px;
	padding: 2px 6px 3px 6px;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog_content .dialog_header .header_center {
	color: #fff;
	font-size: 17px;
	font-weight: bold;
	line-height: 18px;
	text-align: center;
	vertical-align: middle
}

.fb_dialog_content .dialog_content {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat 50% 50%;
	border: 1px solid #4a4a4a;
	border-bottom: 0;
	border-top: 0;
	height: 150px
}

.fb_dialog_content .dialog_footer {
	background: #f5f6f7;
	border: 1px solid #4a4a4a;
	border-top-color: #ccc;
	height: 40px
}

#fb_dialog_loader_close {
	float: left
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
	visibility: hidden
}

#fb_dialog_loader_spinner {
	animation: rotateSpinner 1.2s linear infinite;
	background-color: transparent;
	background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);
	background-position: 50% 50%;
	background-repeat: no-repeat;
	height: 24px;
	width: 24px
}

@
keyframes rotateSpinner { 0%{
	transform: rotate(0deg)
}

100


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
}

.fb_iframe_widget span {
	display: inline-block;
	position: relative;
	text-align: justify
}

.fb_iframe_widget iframe {
	position: absolute
}

.fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span,
	.fb_iframe_widget_fluid_desktop iframe {
	max-width: 100%
}

.fb_iframe_widget_fluid_desktop iframe {
	min-width: 220px;
	position: relative
}

.fb_iframe_widget_lift {
	z-index: 1
}

.fb_iframe_widget_fluid {
	display: inline
}

.fb_iframe_widget_fluid span {
	width: 100%
}

.fb_mpn_mobile_landing_page_slide_out {
	animation-duration: 200ms;
	animation-name: fb_mpn_landing_page_slide_out;
	transition-timing-function: ease-in
}

.fb_mpn_mobile_landing_page_slide_out_from_left {
	animation-duration: 200ms;
	animation-name: fb_mpn_landing_page_slide_out_from_left;
	transition-timing-function: ease-in
}

.fb_mpn_mobile_landing_page_slide_up {
	animation-duration: 500ms;
	animation-name: fb_mpn_landing_page_slide_up;
	transition-timing-function: ease-in
}

.fb_mpn_mobile_bounce_in {
	animation-duration: 300ms;
	animation-name: fb_mpn_bounce_in;
	transition-timing-function: ease-in
}

.fb_mpn_mobile_bounce_out {
	animation-duration: 300ms;
	animation-name: fb_mpn_bounce_out;
	transition-timing-function: ease-in
}

.fb_mpn_mobile_bounce_out_v2 {
	animation-duration: 300ms;
	animation-name: fb_mpn_fade_out;
	transition-timing-function: ease-in
}

.fb_customer_chat_bounce_in_v2 {
	animation-duration: 300ms;
	animation-name: fb_bounce_in_v2;
	transition-timing-function: ease-in
}

.fb_customer_chat_bounce_in_from_left {
	animation-duration: 300ms;
	animation-name: fb_bounce_in_from_left;
	transition-timing-function: ease-in
}

.fb_customer_chat_bounce_out_v2 {
	animation-duration: 300ms;
	animation-name: fb_bounce_out_v2;
	transition-timing-function: ease-in
}

.fb_customer_chat_bounce_out_from_left {
	animation-duration: 300ms;
	animation-name: fb_bounce_out_from_left;
	transition-timing-function: ease-in
}

.fb_invisible_flow {
	display: inherit;
	height: 0;
	overflow-x: hidden;
	width: 0
}

@
keyframes fb_mpn_landing_page_slide_out { 0%{
	margin: 0 12px;
	width: 100%- 24px
}

60


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
}

60


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
}

100


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
}

100


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
}

100


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
}

100


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
}

50


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
}

50


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
}

100


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
}

100


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
</head>
<!-- 旋轉logo在這裡logo-safari-fix -->
<style>
footer:hover .logo-safari-fix {
	animation: rotate 1s infinite linear, rainbow-fill 1s infinite alternate
}
</style>
<body class="intent-mouse">
	<header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
		<div class="cf container">
			<div class="f6 mv2 flex items-center justify-between">
				<a clsas="dib order-0" href="https://www.zeczec.com/"><h1
						class="gray text-mono hover-logo ma0">
						<div class="dib logo-safari-fix">
							<svg class="logo v-mid" style="height: 28px; width: 28px;"
								viewBox="0 0 138 138" xmlns="http://www.w3.org/2000/svg">
<title>zeczec</title>
<path
									d="M69 0a69 69 0 1 0 69 69A69 69 0 0 0 69 0zm38.7 75.53l-1.55 7.18c-.23 1.18-.81 1.54-1.82 1.49l-40.48-1.9a1.72 1.72 0 0 1-1.43-2.2l2.3-11.94a2.05 2.05 0 0 0-1.87-2.23l-31-2.09c-1 0-1.57-.66-1.57-1.82l1.16-6.81c.22-1.15.8-1.43 1.84-1.37l41.94 2.32a1.94 1.94 0 0 1 1.72 2.13l-2.19 12.13a1.88 1.88 0 0 0 1.87 2.1l30.06 1.39c.93 0 1.24.53 1.03 1.62z"></path>
</svg>
						</div>
						<svg class="v-mid ml2" style="height: 20px; width: 44px;"
							viewBox="0 0 64.08 28.95" xmlns="http://www.w3.org/2000/svg">
<title>嘖嘖</title>
<path
								d="M10.44 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41h-1.67a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.34a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .43.54zm14.04 1.73a.42.42 0 0 0-.42-.41H11.33a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.47 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.44-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42H2.74a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64z"></path>
<path
								d="M16.307 23.2l.808 1.057-5.972 4.57a.59.59 0 0 1-.827-.11l-.456-.596a.59.59 0 0 1 .11-.824l5.504-4.21a.59.59 0 0 1 .827.11zM49.01 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41H55.3a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.32a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .41.54zm14.04 1.73a.42.42 0 0 0-.42-.41H49.9a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.48 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.41-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42h-2.41a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64zm-25.984 5.764l.754-.985a.59.59 0 0 1 .827-.11l5.504 4.21a.59.59 0 0 1 .11.825l-.453.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.02-.126z"></path>
<path
								d="M54.943 23.217l.808 1.056-5.97 4.57a.59.59 0 0 1-.826-.11l-.45-.588a.59.59 0 0 1 .11-.827l5.504-4.21a.59.59 0 0 1 .827.11zm1.857 1.037l.753-.985a.59.59 0 0 1 .828-.11l5.506 4.21a.59.59 0 0 1 .11.825l-.455.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.012-.134zm-5.87-7.534l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.34 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.37.28zm-38.53 0l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.39 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.32.28z"></path>
</svg>
					</h1> </a>
				<div
					class="mt0-ns mt3 pt2 ph2 nb1 nl3 nr3 tc tl-ns pa0-ns mh0-ns items-center db-ns bt bn-ns b--near-white flex-auto order-last order-1-ns w-100 w-auto-ns inline-flex">
					<div class="divider dib-ns dn">&nbsp;</div>
					<a class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="https://www.zeczec.com/categories">探索</a> <a
						class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="https://www.zeczec.com/users/sign_in?return_to=%2Fstart_project">提案</a>
				</div>
				<div class="button-group order-2">
					<a
						class="button-s b-ns ph2 ph3-ns button dark-gray bg-near-white bn ml1"
						rel="nofollow" href="https://www.zeczec.com/users/sign_in">登入</a>
					<a
						class="button button-s b-ns ph2 ph3-ns dark-gray bg-near-white bn ml1"
						rel="nofollow" href="https://www.zeczec.com/users/sign_up">註冊</a>
					<a class="button button-s b-ns ph2 pl3-ns fb bg-near-white bn ml1"
						rel="nofollow" href="https://www.zeczec.com/users/sign_in">Facebook
						登入</a>
				</div>
			</div>
		</div>
	</header>
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
						class="f4 mt2 mb1">${projectVO.proj_name}</h2> </a><span
					class="f6 mr1">提案人</span><a class="b f6"
					href="https://www.zeczec.com/users/Pet-Paradise0507">${projectVO.f_mem_id}</a>
				<p class="f6 gray mv3">${projectVO.proj_abstract}</p>
				<div class="mv3 relative flex items-center flex-nowrap">
					<svg class="progress mr3 succeeded sprint">
					<circle class="progress-run js-percentage-circle" cx="32" cy="32"
							r="32" style="stroke-dasharray: 201 200"></circle>
					<text class="stroke js-percentage-raised" text-anchor="middle"
							transform="rotate(90)" x="32" y="-27">
					${Math.round(projectVO.proj_total_fund/projectVO.proj_goal*100)}%
					</text>
					<text class="js-percentage-raised" text-anchor="middle"
							transform="rotate(90)" x="32" y="-27">
					${Math.round(projectVO.proj_total_fund/projectVO.proj_goal*100)}%
					</text>
					</svg>
					<div class="flex-auto">
						<div class="f3 b js-sum-raised nowrap">NT$${projectVO.proj_total_fund}</div>
						<div class="f7">目標 NT$${projectVO.proj_goal}</div>
					</div>
				</div>
				<div class="ph3-l">
					<div class="bt b--light-gray pt3 nl3 nr3"></div>
				</div>
				<div class="mb1 f7">
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
				<div class="mb2 f7">
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
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--drak-gray b"
						href="https://www.zeczec.com/projects/paradisepet2022zeczecnewyear">
						<div class="dib pv1">專案內容</div>
					</a> <a
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--transparent"
						href="https://www.zeczec.com/projects/paradisepet2022zeczecnewyear/comments">
						<div class="dib pv1">留言</div> <span class="f7 b ml3 gray">0</span>
					</a>
				</div>


<%-- 				<c:choose> --%>
<%-- 					<c:when test="${interval<=0}"> --%>
<!-- 						<div class="w-30-l pv3 ph3 tc w-100"> -->
<!-- 							<div class="nt3 dn-l"></div> -->
<!-- 							<div class="pv2 dark-gray bg-near-white f7">專案已結束</div> -->
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<div class=" pv3 ph3 tc w-100">
						<div style="float:right;font-size:17px;" class="w-30-l pv3 ph3 tc w-100">
							<div class="nt3 dn-l"></div>
							<a class="bg-white button w-100 green hover-green focus grow"
								href="${pageContext.request.contextPath}/projPerk/projPerk.do?proj_id=${projectVO.proj_id}&f_mem_id=70000&action=getAllPerk_For_Display_ByFmem">
							編輯回饋方案</a>
						</div>
							<div style="float:right;font-size:17px;" class="w-30-l pv3 ph3 tc w-100">
							<div class="nt3 dn-l"></div>
							<a class="bg-white button w-100 green hover-green focus grow"
								href="${pageContext.request.contextPath}/projPic/projPic.do?proj_id=${projectVO.proj_id}&f_mem_id=70000&action=getAllPic_For_Display_ByFmem">
							編輯專案圖文</a>
						</div>
							<div style="float:right;font-size:17px;" class="w-30-l pv3 ph3 tc w-100">
							<div class="nt3 dn-l"></div>
							<a class="bg-white button w-100 green hover-green focus grow"
								href="${pageContext.request.contextPath}/project/project.do?proj_id=${projectVO.proj_id}&action=getOne_For_Update">
							
							編輯認養專案</a>
							
						</div>
						</div>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
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
										<!-- 主圖文案放置區 -->
										<div class="wysiwyg-text-align-center">
											<p>
												<b><br></b>
											</p>
											<!-- 		路徑寫法 -->
											<!-- 		<p> -->
											<!-- 		<b><img alt="" -->
											<%-- 		src="<%=request.getContextPath()%>/project/listOneProj_files/asset_422509_image_big.jpg"><span --%>
											<!-- 		class="wysiwyg-color-red"><br></span></b> -->
											<!-- 		</p> -->
											<!-- 		Base64寫法 -->
											
										<!-- @TODO -->	
										<!-- // 	setAttribute(String name, Object value, int scope) -->
											<%
												Integer proj_id1 = projectVO.getProj_id();
												ProjPicService projPicSvc = new ProjPicService();
												List<ProjPicVO> list1 = projPicSvc.getAllSameProjPic(proj_id1);
												pageContext.setAttribute("list1", list1);
											%>

																								
										<!-- pic迭代區 -->
											<p>
												<c:forEach var="projPicVO" items="${list1}">
													<b>
														<img alt=""
														src="data:image/jpg;base64,${projPicVO.base64Image}">
														<span class="wysiwyg-color-red"><br></span>
													</b>
												</c:forEach>
											</p>

										</div>




										<div class="wysiwyg-text-align-center"></div>
										<div class="nt6">
											<div class="pt6" id="project_risk"></div>
										</div>
										<h3 class="mt4">風險與挑戰</h3>
										<p>${projectVO.proj_risk}</p>
										<div class="nt6">
											<div class="pt6" id="project_return"></div>
										</div>
										<h3 class="mt4">退換貨規則</h3>
										<p>如需售後服務／退換貨服務，請私信小農${projectVO.f_mem_id}。</p>
										<div class="nt6">
											<div class="pt6" id="project_contact"></div>
										</div>
										<h3 class="mt4">客服聯絡方式</h3>
										<p>
											集資期間取消贊助：請提供「贊助編號」提供給有塊地客服（<a
												href="mailto:smallfarmer@smf.com">smallfarmer@smf.com</a>）取消贊助。<br>
											其他客服問題請洽小農：${projectVO.f_mem_id}
										</p>
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

				<%
				Integer proj_id = projectVO.getProj_id();
				ProjPerkService projSvc = new ProjPerkService();
				List<ProjPerkVO> list = projSvc.getAll(proj_id);
				pageContext.setAttribute("list", list);
				%>
				<!-- @TODO -->
				<!-- perk迭代區 -->
				<c:forEach var="projPerkVO" items="${list}" begin="<%=0%>"
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
								<span style="background-color:#717d34 ;"class="f7 white ph2 bg-red b dib"> 剩餘
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
							</div>
							<div class="mt3 gray tc ph2 f7 ba">預計於${projPerkVO.perk_ship_date}實現</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<footer class="pt5 pb6 f6 bt light-gray relative">
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