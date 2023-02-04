<%@page import="com.mem.model.MemVO" %>
<%@page import="com.mem.model.MemService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.project.model.*" %>
<%@ page import="com.projPerk.model.*" %>
<%@ page import="com.projOrder.model.*" %>
<%@ page import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector" %>

<%
    ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
    ProjOrderVO projOrderVO = (ProjOrderVO) request.getAttribute("projOrderVO");
    MemVO memVO = (MemVO) session.getAttribute("memVO");
%>


<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService"/>
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService"/>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="zh_TW" property="og:locale">
    <meta content="zh_TW" property="og:locale:alternate">

    <title>我家門前有塊地 | 認養成功
    </title>
    <link href="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" media="all"
          href="<%=request.getContextPath()%>/front-end/projOrder/addOrderByMem_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

</head>

<body class="intent-mouse">
    <header style="height: 80px">
        <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp"/>
    </header>
    <header style="padding-bottom: 5px"
            class="relative z-2 bb pv2 ph3 ph0-l b--near-white"></header>

    <div class="container"></div>
    <div class="bt b--light-gray bb">
        <div class="container cf">
            <div class="w-100">
                <div class="w5-l dib fl-l mr3-l w-100">
                    <div class="aspect-ratio-project-cover bg-near-white"
                         style="background-image: url(&#39;data:image/jpg;base64,${projectVO.base64Image}&#39;)"></div>
                    <!-- 圖片待抽換 -->
                </div>
                <div class="pv2 ph0-l ph3"><a href="#">
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
                <h1 style="color:#717d34"><strong>&nbsp;&nbsp;認養成功！</strong></h1>
                如需修改訂單收件資料、查看訂單明細，請至會員中心的「認養訂單管理」。
                <br>
                <br>
                <div>
<%--                    暫時移除，因為好像不需要了--%>
<%--                    <button class="button" style="margin-right:10px;float: right;" type="button" href="<%=request.getContextPath()%>/front-end/projOrder/listAllOrderByMem.jsp">--%>
<%--                        瀏覽全部認養專案--%>
<%--                    </button>--%>
                <FORM id="list-all-order" METHOD="post" ACTION="<%=request.getContextPath()%>/projOrder/projOrder.do">
                    <input type="hidden" name="order_id" value="${projOrderVO.order_id}">
                    <input type="hidden" name="mem_id" value="${projOrderVO.mem_id}">
                    <input type="hidden" name="action" value="getOne_For_Update_ByMem">
                    <button class="button" form="list-all-order" style="margin-right:10px;float: right;" value="Submit">前往查看訂單明細</button>
                </FORM>
                <br>
                </div>
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
    </script>

    <footer>
        <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp"/>
    </footer>
</body>

</html>