<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPic.model.*"%>


<%
	ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
 	Integer proj_id  = projectVO.getProj_id();
 	ProjPicService projPicSvc = new ProjPicService();
 	List<ProjPicVO> list = projPicSvc.getAllSameProjPic(proj_id);
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />
<jsp:useBean id="projPicSvc1" scope="page" class="com.projPic.model.ProjPicService" />
<%-- <jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FmemService" /> --%>




<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <!-- <script src="./上傳多張圖片頁面_files/465239610292033" async=""></script>
  <script src="./上傳多張圖片頁面_files/sdk.js" async="" crossorigin="anonymous"></script>
  <script async="" src="./上傳多張圖片頁面_files/fbevents.js"></script>
  <script id="facebook-jssdk" src="./上傳多張圖片頁面_files/sdk(1).js"></script>
  <script async="" src="./上傳多張圖片頁面_files/analytics.js"></script> -->
  <!-- 這段jQuery一定要有 -->
  <script src="<%=request.getContextPath()%>/projPic/addProjPic_css/jquery-3.6.0.min.js"></script>
  <!-- 這段jQuery一定要有 -->

  <link rel="stylesheet" media="all"
    href="<%=request.getContextPath()%>/projPic/addProjPic_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

</head>

<body class="intent-mouse">
  <header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
    <div class="cf container">
      <div class="f6 mv2 flex items-center justify-between">

        <h1 class="gray text-mono hover-logo ma0">
          <div class="dib logo-safari-fix"><svg class="logo v-mid" style="height: 28px; width: 28px; "
              viewBox="0 0 138 138" xmlns="http://www.w3.org/2000/svg">
              <title>zeczec</title>
              <path
                d="M69 0a69 69 0 1 0 69 69A69 69 0 0 0 69 0zm38.7 75.53l-1.55 7.18c-.23 1.18-.81 1.54-1.82 1.49l-40.48-1.9a1.72 1.72 0 0 1-1.43-2.2l2.3-11.94a2.05 2.05 0 0 0-1.87-2.23l-31-2.09c-1 0-1.57-.66-1.57-1.82l1.16-6.81c.22-1.15.8-1.43 1.84-1.37l41.94 2.32a1.94 1.94 0 0 1 1.72 2.13l-2.19 12.13a1.88 1.88 0 0 0 1.87 2.1l30.06 1.39c.93 0 1.24.53 1.03 1.62z">
              </path>
            </svg>
          </div>
        </h1>

        <div
          class="mt0-ns mt3 pt2 ph2 nb1 nl3 nr3 tc tl-ns pa0-ns mh0-ns items-center db-ns bt bn-ns b--near-white flex-auto order-last order-1-ns w-100 w-auto-ns inline-flex">
          <span style="color: #717d34;font-size: 20px;font-weight: 300;"
            class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns" href="">&nbsp;&nbsp;小農認養管理專區</span>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/categories">認養專案管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/categories">認養訂單管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/start_project">小農日誌管理</a>
          <div class="divider dib-ns dn">&nbsp;</div>
          <a style="color: #717d34;font-size: 19px;" class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
            href="https://www.zeczec.com/start_project">回到首頁</a>
        </div>
        <!-- <div class="tr order-2">
          <a aria-label="站內訊息" class="near-black dib gray pa2 mr3 v-mid tooltip tooltip-b"
            href="https://www.zeczec.com/inbox">
            <i class="material-icons f5 v-mid">mail</i>
          </a>

        </div> -->
      </div>
    </div>
  </header>
  <div class="container"></div>
  <div class="bb b--near-white">
    <!-- <div class="container">
      <ul class="list pa0 cf mb0 mh3 mh0-l mv0 nowrap overflow-auto">
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/account">
            <i class="icon-ok"></i>
            認養訂單記錄
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib b black bb b--gray" href="https://www.zeczec.com/users/following">
            <i class="icon-forward"></i>
            認養收藏紀錄
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/users/projects">
            <i class="icon-lightbulb"></i>
            提案記錄(要刪)
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/settings">
            <i class="icon-user"></i>
            個人設定(要刪)
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/memberships">
            <i class="icon-user"></i>
            團隊設定
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/users/edit">
            <i class="icon-lock"></i>
            修改密碼
          </a>
        </li>
      </ul>
    </div> -->
  </div>
  <div class="container">
  


<!--   FORM 在這裡 -->

    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projPic/projPic.do" name="form1" enctype="multipart/form-data">
     	<input type="hidden" name="action" value="update">
      <div class="container ph3 ph0-l pv3 cf">
        <h2 style="display: inline-block;" class="flex mt0">修改認養專案內容圖片</h2>

		<input type="hidden" name="proj_id"  value="<%=projectVO.getProj_id()%>">	
        
        <div style="float: right;display: inline-block;">
        <input  type="submit" value="確認修改" class="button green b--green b mb3">
		<input  type ="button" onclick=history.back() value="回到上一頁" class="button green b--green b mb3">
      	</div>
      </div>
      <div class="container pb5">
        <div class="flex gutter3-l">
          <!-- 這裡是開始 -->
          <c:forEach var="projPicVO" items="${list}">
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img" style="position:relative;">
                        <div style="position:absolute;right:0;top:0;">
						<a href="${pageContext.request.contextPath}/projPic/projPic.do?proj_id=${projectVO.proj_id}&proj_pic_id=${projPicVO.proj_pic_id}&action=delete">
						<img src="<%= request.getContextPath() %>/projPic/addProjPic_css/Delete_icon.png"
								style="left:80%;transition:opacity 350ms;width: 20%;height: 20%;
								z-index:999;position:relative;">		
						</a></div>
						
                <img id="img1" class="w-100 mb3" src="data:image/jpg;base64,${projPicVO.base64Image}" alt="">
              
              </div>
              <label class="b">顯示圖片</label>
              <input id="upPic1" onchange="pic1_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="proj_pic">
            <script>
                var file1;
                var fileReader1;

                function pic1_change() {
                  file1 = document.getElementById('upPic1').files[0];
                  if (file1) {
                    fileReader1 = new FileReader();
                    fileReader1.onload = openfile1;
                    readFileContent1();
                  }
                }

                function openfile1(event) {
                  document.getElementById('img1').src = event.target.result;
                }

                function readFileContent1() {
                  fileReader1.readAsDataURL(file1);
                }
              </script> 
            </div>
          </div>
          </c:forEach>
          <!-- 這裡是結束 -->
        </div>
    </FORM>
  </div>


  <script>
    $("#div_id").hide();
  </script>




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
  </div>
  <div id="draggable-live-region" aria-relevant="additions" aria-atomic="true" aria-live="assertive" role="log"
    style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>
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