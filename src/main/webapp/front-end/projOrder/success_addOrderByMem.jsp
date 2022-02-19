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
  <link href="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" media="all"
    href="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

</head>

<body class="intent-mouse">
  <header>
         <jsp:include page="/header/header_for_Proj_Fmem.jsp" />
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
  
      <footer>
        <jsp:include page="/footer/footer_for_Proj_Fmem.jsp" />
</footer>
</body>

</html>