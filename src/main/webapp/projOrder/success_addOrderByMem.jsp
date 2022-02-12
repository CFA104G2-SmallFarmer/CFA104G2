<%@page import="com.mem.model.MemVO"%>
<%@page import="com.mem.model.MemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>

<%
/* ProjPerkVO projPerkVO = (ProjPerkVO) request.getAttribute("projPerkVO"); //EmpServlet.java(Concroller), 存入req的empVO物件  */
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
MemVO memVO = (MemVO) session.getAttribute("memVO");
%>

<%-- <% --%>
<!-- // 	ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO"); -->
<!-- //  	Integer proj_id  = projectVO.getProj_id(); -->
<!-- //   	ProjPerkService projPerkSvc = new ProjPerkService(); -->
<!-- //  	List<ProjPerkVO> list = projPerkSvc.getAll(proj_id); -->
<!-- //     pageContext.setAttribute("list",list); -->
<%-- %> --%>

<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" /> 
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />


<%-- <% --%>
<!-- // MemService memSvc= new MemService(); -->
<!-- // MemVO memVO= memSvc.getOneMem(77007); -->

<!-- // ProjectService projectSvc = new ProjectService();  -->
<!-- // ProjectVO projectVO=projectSvc.getOneProject(1001); -->
<!-- //  /* 	Integer proj_id  = projectVO.getProj_id(); */  -->
<!-- // ProjPerkService projPerkSvc = new ProjPerkService();   -->
<!-- // ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(1);   -->
<!-- // pageContext.setAttribute("projPerkVO",projPerkVO);  -->
<%-- %> --%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="zh_TW" property="og:locale">
  <meta content="zh_TW" property="og:locale:alternate">

  <title>我家門前有塊地 | 認養成功
  </title>
  <link href="./addOrderByMem_css/css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" media="all"
    href="./addOrderByMem_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

</head>

<body class="intent-mouse">
  <header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
    <div class="cf container">
      <div class="f6 mv2 flex items-center justify-between">
        <a clsas="dib order-0" href="https://www.zeczec.com/">
          <h1 class="gray text-mono hover-logo ma0">
            <div class="dib logo-safari-fix"><svg class="logo v-mid" style="height: 28px; width: 28px; "
                viewBox="0 0 138 138" xmlns="http://www.w3.org/2000/svg">
                <title>zeczec</title>
                <path
                  d="M69 0a69 69 0 1 0 69 69A69 69 0 0 0 69 0zm38.7 75.53l-1.55 7.18c-.23 1.18-.81 1.54-1.82 1.49l-40.48-1.9a1.72 1.72 0 0 1-1.43-2.2l2.3-11.94a2.05 2.05 0 0 0-1.87-2.23l-31-2.09c-1 0-1.57-.66-1.57-1.82l1.16-6.81c.22-1.15.8-1.43 1.84-1.37l41.94 2.32a1.94 1.94 0 0 1 1.72 2.13l-2.19 12.13a1.88 1.88 0 0 0 1.87 2.1l30.06 1.39c.93 0 1.24.53 1.03 1.62z">
                </path>
              </svg>
            </div>
            <svg class="v-mid ml2" style="height: 20px; width: 44px; " viewBox="0 0 64.08 28.95"
              xmlns="http://www.w3.org/2000/svg">
              <title>嘖嘖</title>

              <path
                d="M10.44 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41h-1.67a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.34a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .43.54zm14.04 1.73a.42.42 0 0 0-.42-.41H11.33a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.47 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.44-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42H2.74a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64z">
              </path>
              <path
                d="M16.307 23.2l.808 1.057-5.972 4.57a.59.59 0 0 1-.827-.11l-.456-.596a.59.59 0 0 1 .11-.824l5.504-4.21a.59.59 0 0 1 .827.11zM49.01 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41H55.3a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.32a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .41.54zm14.04 1.73a.42.42 0 0 0-.42-.41H49.9a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.48 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.41-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42h-2.41a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64zm-25.984 5.764l.754-.985a.59.59 0 0 1 .827-.11l5.504 4.21a.59.59 0 0 1 .11.825l-.453.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.02-.126z">
              </path>
              <path
                d="M54.943 23.217l.808 1.056-5.97 4.57a.59.59 0 0 1-.826-.11l-.45-.588a.59.59 0 0 1 .11-.827l5.504-4.21a.59.59 0 0 1 .827.11zm1.857 1.037l.753-.985a.59.59 0 0 1 .828-.11l5.506 4.21a.59.59 0 0 1 .11.825l-.455.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.012-.134zm-5.87-7.534l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.34 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.37.28zm-38.53 0l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.39 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.32.28z">
              </path>
            </svg>
          </h1>
        </a>
        <div
          class="mt0-ns mt3 pt2 ph2 nb1 nl3 nr3 tc tl-ns pa0-ns mh0-ns items-center db-ns bt bn-ns b--near-white flex-auto order-last order-1-ns w-100 w-auto-ns inline-flex">
          <div class="divider dib-ns dn">&nbsp;</div>
          <a class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/categories">探索</a>
          <a class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/start_project">提案</a>
        </div>
        <div class="tr order-2">
          <a aria-label="站內訊息" class="near-black dib gray pa2 mr3 v-mid tooltip tooltip-b"
            href="https://www.zeczec.com/inbox">
            <i class="material-icons f5 v-mid">
              mail
            </i>
          </a>
          <div class="js-activatable relative dib" data-userid="2046860">
            <button aria-label="個人選單" class="js-activatable-trigger button-text" type="button">
              <div class="button button-s button-avatar round w2 h2 b--light-gray"><img class="w-100 h-100"
                  src="./addOrderByMem_css/fallback.jpg" alt="Fallback"></div>
              <i class="material-icons f4 v-mid">arrow_drop_down</i>
            </button>
            <div class="dropdown r f6 tc w4">
              <a class="near-black db ph3 pv2 hover-blue db dn-l" href="https://www.zeczec.com/categories">探索</a>
              <a class="near-black db ph3 pv2 hover-blue db dn-l" href="https://www.zeczec.com/start_project">提案</a>
              <div class="bt db dn-l mv2 b--light-gray"></div>
              <a class="near-black db ph3 pv2 hover-blue bb b--light-gray" href="https://www.zeczec.com/users/aa12ex1">
                個人頁面
              </a>
              <a class="near-black db ph3 pv2 hover-blue" href="https://www.zeczec.com/account">
                贊助記錄
              </a>
              <a class="near-black db ph3 pv2 hover-blue" href="https://www.zeczec.com/users/following">
                追蹤計畫
              </a>
              <a class="near-black db ph3 pv2 hover-blue" href="https://www.zeczec.com/users/projects">
                提案記錄
              </a>
              <a class="near-black db ph3 pv2 hover-blue bt b--light-gray" href="https://www.zeczec.com/settings">
                帳號設定
              </a>
              <a class="near-black db ph3 pv2 hover-blue bb b--light-gray" href="https://www.zeczec.com/memberships">
                團隊設定
              </a>
              <form class="db ma3" id="edit_user_2046860" action="https://www.zeczec.com/users/sign_out"
                accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden"
                  name="_method" value="delete"><input type="hidden" name="authenticity_token"
                  value="dGug3k6G5GozPgtBA5hej2OcKv9XH6skWhGxqdqkz4l9rPhPcE3tAci/Q5toHLsTUGQ/QupiV/N6JBBQ0fXo3A=="><button
                  name="button" type="submit" class="button red button-s w-100">登出</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <div class="container"></div>
  <div class="bt b--light-gray bb">
    <div class="container cf">
      <div class="w-100">
        <div class="w5-l dib fl-l mr3-l w-100">
                   <div class="aspect-ratio-project-cover bg-near-white"
            style="background-image: url(&#39;data:image/jpg;base64,${projectVO.base64Image}&#39;)"></div>
          <!-- 圖片待抽換 -->
        </div>
        <div class="pv2 ph0-l ph3"> <a href="#">
            <h2 class="f5 mb0 dib mt1 f5 b">${projectVO.proj_name}</h2>
          </a>
          <div class="gray f7 mb3">
            <span>由</span> <a class="b"
              href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a><span
              class="mh2">發起</span>
          </div>
          <span class="b">目前總認養金額 NT$${projectVO.proj_total_fund}</span> <span class="f7 dark-gray">
            / 目標 NT$${projectVO.proj_goal} </span>
        </div>
      </div>
    </div>
  </div>
  <div class="container"></div>
  <div class="container mv4">
    <div>
      <div style="margin: auto; box-sizing:content-box;display:block;border: solid #aaba8b 2px;padding: 15px;margin: 7px;">
        <h1 style="color:#717d34"><strong>&nbsp;&nbsp;認養成功！</strong></h1><br>
        如需修改訂單收件資料、查看訂單明細，請至會員中心的「認養訂單管理」。<br>
        <button style="margin-right:10px;float: right;">瀏覽全部認養專案</button>
        <button style="margin-right:10px;float: right;">前往查看訂單明細</button>
        <!-- <input style="margin-right:10px 10px 10px 10px;float: right;linehight:30px;display:inlin;font-size: 16px;" type="buttom" name="commit" value="回到瀏覽全部認養專案"
      class="button green b--green b mb3">
      <input style="margin-right:10px 10px 10px 10px;float: right;linehight:30px;display:inline;font-size: 16px;" type="buttom" name="commit" value="前往查看訂單明細"
      class="button green b--green b mb3"> -->
      <br>
      </div>
    </div>
  </div>
  <footer class="pt5 pb6 f6 bt light-gray relative">
    <div class="container dark-gray">
      <div class="flex ph0-l ph3">
        <div class="w-third-l w-100 mt-child-0 mb0-l mb4">
          <h3>社群</h3>
          <a class="db" href="https://www.youtube.com/channel/UC_k_rE8ln6Q75tcC5uvqu8g">YouTube</a>
          <a class="db" href="https://facebook.com/zeczec.com">Facebook</a>
          <a class="db" href="https://instagram.com/zeczec_com">Instagram</a>
          <a class="db" href="https://twitter.com/zeczec_com">Twitter</a>
        </div>
        <div class="w-third-l w-100 mt-child-0 mb0-l mb4">
          <h3>幫助</h3>
          <a class="db" href="https://www.zeczec.com/faq">常見問答</a>
          <a class="db" href="https://www.zeczec.com/docs/terms_of_service">使用條款</a>
          <a class="db" href="https://www.zeczec.com/docs/privacy">隱私權政策</a>
        </div>
        <div class="w-third-l w-100 mt-child-0 mb0-l mb4 relative">
          <h3>
            關於
          </h3>
          <a class="db" href="https://www.zeczec.com/about">關於我們</a>
          <a class="db" href="https://www.zeczec.com/brand">商標資源</a>
          <div class="f7 mt3">© 嘖室股份有限公司</div>
          <a class="absolute-l top-0 right-0 mt3 dib relative" href="https://www.zeczec.com/"><svg
              class="logo mr2 middle" style="height: 28px; width: 28px; " viewBox="0 0 138 138"
              xmlns="http://www.w3.org/2000/svg">
              <title>zeczec</title>
              <path
                d="M69 0a69 69 0 1 0 69 69A69 69 0 0 0 69 0zm38.7 75.53l-1.55 7.18c-.23 1.18-.81 1.54-1.82 1.49l-40.48-1.9a1.72 1.72 0 0 1-1.43-2.2l2.3-11.94a2.05 2.05 0 0 0-1.87-2.23l-31-2.09c-1 0-1.57-.66-1.57-1.82l1.16-6.81c.22-1.15.8-1.43 1.84-1.37l41.94 2.32a1.94 1.94 0 0 1 1.72 2.13l-2.19 12.13a1.88 1.88 0 0 0 1.87 2.1l30.06 1.39c.93 0 1.24.53 1.03 1.62z">
              </path>
            </svg>
          </a>
        </div>
      </div>
    </div>
  </footer>
  <div class="pa3 z-5 bt b--moon-gray w-100 relative bg-near-white fixed bottom-0 js-cookie-banner" hidden="">
    <div class="container pv4-ns">
      <div class="flex-ns flex-nowrap items-center">
        <div class="f6 mr3-ns">
          <p class="mt0">
            嘖嘖網站以及嘖嘖網站使用的第三方服務利用必要的瀏覽器 cookies 技術達成部分網站必須功能。若有興趣了解更多相關資訊或反悔同意的條款，請詳閱我們的<a class="underline dark-gray"
              data-track="GDPR#ClickPrivacy" href="https://www.zeczec.com/docs/privacy">隱私權政策</a>及
            <a class="underline dark-gray" data-track="GDPR#ClickCookies" href="https://www.zeczec.com/cookies">cookies
              需求</a>
            。
          </p>
          <p class="mb0-ns">點下此通知窗以外的任何連結或按鈕、捲動這個頁面、或以任何方式繼續使用嘖嘖網站，代表你同意了我們的隱私權政策及 cookies 存取。</p>
        </div>
        <button class="button f6 bg-dark-green white js-accept-cookies bn" data-track="GDPR#ClickAccept"
          type="button">接受 &amp; 關閉</button>
      </div>
    </div>
  </div>
  <!-- <script src="./小農查看回饋方案新刪修_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js"
    type="text/javascript"></script> -->
  <div id="fb-root" class=" fb_reset">
    <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
      <div></div>
    </div>
  </div>



  <div id="draggable-live-region" aria-relevant="additions" aria-atomic="true" aria-live="assertive" role="log"
    style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>
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
    } else {
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
</body>

</html>