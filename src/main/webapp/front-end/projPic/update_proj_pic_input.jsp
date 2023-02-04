<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPic.model.*"%>


<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
Integer proj_id = projectVO.getProj_id();
ProjPicService projPicSvc = new ProjPicService();
List<ProjPicVO> list = projPicSvc.getAllSameProjPic(proj_id);
pageContext.setAttribute("list", list);
%>


<%
Integer picNum = 0;
request.setAttribute("eight", new Integer[]{1, 2, 3, 4, 5, 6, 7, 8});
%>


<jsp:useBean id="projectSvc" scope="page"
	class="com.project.model.ProjectService" />
<jsp:useBean id="projPicSvc1" scope="page"
	class="com.projPic.model.ProjPicService" />
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
<%-- <script
	src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/jquery-3.6.0.min.js"></script> --%>
<!-- 這段jQuery一定要有 -->
<title>我家門前有塊地 | ${projectVO.proj_name} |</title>
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
<style>
/*****************************/
.wrap {
	max-width: 960px;
	margin: 0 auto;
}

.header {
	padding_top: 10px;
	height: 78px;
	position: relative;
}

.logo {
	float: left;
	width: 250px;
	height: 76px;
	padding: 5px;
	/* background: #ffffff; */
	/* border: 3px solid rgb(255, 216, 157); */
}

.menu {
	float: right;
	font-size: 24px;
}

.menu li {
	list-style-type: none;
	float: left;
	display: inline-block;
	height: 60px;
}

.menu li a {
	display: block;
	color: #717d34;
	text-decoration: none;
	padding-left: 1em;
	padding-right: 0;
	padding-top: 0.4em;
}

.menu li a:hover {
	/* background: #8ca27e; */
	color: #8ca27e;
}

/*在pc隱藏漢堡選單,showmenu右上角點擊按鈕*/
.showmenu {
	display: none;
	color: #FFCCCC;
}

/*在手機瀏覽漢堡選單*/
.div1 {
	width: 35px;
	height: 5px;
	background-color: #aaba8b;
	margin: 6px 0;
}

@media ( max-width : 767px) {
	.menu {
		/*隱藏選單開始*/
		max-height: 0;
		overflow: hidden;
		/*隱藏選單結束*/
		transition: max-height 2.3s;
		margin-top: 1px;
		/*絕對定位疊在網頁上*/
		position: absolute;
		z-index: 100;
		/*header 80px+1px boder 線條*/
		top: 81px;
		left: 0;
		right: 0;
		background: #d4e1bb;
	}
	.menu li {
		list-style-type: none;
		float: none;
		border-bottom: 1px dashed #919191;
		display: inline;
	}
	.menu li a {
		transition: all 0.2s;
		padding-left: 0;
		padding-right: 0;
		padding-top: 0.7em;
		padding-bottom: 0.7em;
	}
	.menu li a:hover {
		background: #8ca27e;
		color: #fff;
	}
	.showmenu {
		/* transition: all 0.2s; */
		display: block;
		float: right;
		padding: 20px;
	}

	/*jQ點擊後動態在 body 加上 class */
	.menu-show .menu {
		max-height: 500px
	}
}
</style>

</head>

<body class="intent-mouse">
	<%-- <header>
		<jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" />
	</header>
	<header style="padding-bottom: 5px"
		class="relative z-2 bb pv2 ph3 ph0-l b--near-white"></header> --%>
	<header>
		<script>
			$(document).ready(function() {
				$('.showmenu').on('click', function(e) {
					e.preventDefault();
					$('body').toggleClass('menu-show');
				}

				);
			}

			);
		</script>
		<div class="wrap">
			<div class="header">
				<div class="logo">
					<img style="margin-top: 5px"
						src="<%=request.getContextPath()%>/front-end/home/images/farmerManage-Final.png">
				</div>
				<ul class="menu">
					 <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByFmem.jsp">認養專案管理&nbsp;</a></li>

        <li><a href="<%=request.getContextPath()%>/front-end/projOrder/listAllOrderByFmem.jsp">小農認養訂單管理&nbsp;</a></li>

        <li><a href="<%=request.getContextPath()%>/front-end/home/home.jsp"">回到首頁 &nbsp;</a></li>
					<!-- <li><a href="#"><i class="material-icons" style="font-size:27px">mail_outline</i> &nbsp;</a></li> 這行顯示不出來-->
				</ul>
				<div class="div0 showmenu">
					<!-- <a href="#" >menu</a> -->
					<div class="div1"></div>
					<div class="div1"></div>
					<div class="div1"></div>
				</div>

				<!-- <a href="#" class="showmenu">menu</a> -->
			</div>
		</div>
	</header>


	<header style="padding-bottom: 5px"
		class="relative z-2 bb pv2 ph3 ph0-l b--near-white"></header>

	<div class="container">



<FORM METHOD="post"
			ACTION="<%=request.getContextPath()%>/projPic/projPic.do"
			name="form1" enctype="multipart/form-data">
			<input type="hidden" name="action" value="insertFromUpdate">
			<input type="hidden" name="proj_id"
				value="<%=projectVO.getProj_id()%>">



		<div class="container ph3 ph0-l pv3 cf">

			<h2 style="display: inline-block;" class="flex mt0">修改認養專案內容圖片</h2>



			<div style="float: right; display: inline-block;">
			 <input
				style="float: right; display: inline;" type="submit" value="上傳"
				class="button green b--green b mb3">
				<input type="button" onclick=history.back() value="回到上一頁"
					class="button green b--green b mb3">
			</div>
		</div>

		




			<div class="container pb5">
				<div class="flex gutter3-l">
					<!-- 這裡是開始 -->
					<c:forEach var="projPicVO" items="${list}">

						<%
						if (picNum < 8) {
							picNum = picNum + 1;
						}
						%>

						<div class="w-25-l ph3 pv3 w-50-ns w-100">
							<div class="cf">
								<div class="for_all_img" style="position: relative;">
									<div style="position: absolute; right: 0; top: 0;">

										<div style="display: inline-block;">

											<a
												href="${pageContext.request.contextPath}/projPic/projPic.do?proj_id=${projectVO.proj_id}&proj_pic_id=${projPicVO.proj_pic_id}&action=delete">
												<img
												src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/Delete_icon.png"
												style="left: 80%; transition: opacity 350ms; width: 20%; height: 20%; z-index: 999; position: relative;">
											</a>

										</div>

									</div>
									<img id="img10" class="w-100 mb3"
										src="data:image/jpg;base64,${projPicVO.base64Image}" alt="">

								</div>


							</div>
						</div>
					</c:forEach>
					<!-- 這裡是結束 -->







					<!--   上傳專用  FORM 在這裡 -->
					<!-- 這裡是開始 -->
					<c:forEach var="pic" items="${eight}" begin="<%=picNum%>"
						end="<%=7%>">


						<div class="w-25-l ph3 pv3 w-50-ns w-100">
							<div class="cf">

								<div class="for_all_img" style="position: relative;">
									<div style="position: absolute; right: 0; top: 0;">

										<div style="display: inline-block;"></div>


									</div>
									<div class="for_all_img">
										<img id="img${pic}" class="w-100 mb3"
											src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png"
											alt="">
									</div>

								</div>



								<label class="b" for="2">在這新增圖片</label> <input id="upPic${pic}"
									onchange="pic${pic}_change()" class="w-100 border-box mv3"
									accept="image/*" type="file" name="${pic}">
								<script>
									var file${pic};
									var fileReader${pic};

									function pic${pic}_change() {
										file${pic} = document
												.getElementById('upPic${pic}').files[0];
										if (file${pic}) {
											fileReader${pic} = new FileReader();
											fileReader${pic}.onload = openfile${pic};
											readFileContent${pic}();
										}
									}

									function openfile${pic}(event) {
										document.getElementById('img${pic}').src = event.target.result;
									}

									function readFileContent${pic}() {
										fileReader${pic}.readAsDataURL(file${pic});
									}
								</script>

							</div>

						</div>

					</c:forEach>
					<!-- 這裡是結束 -->

				</div>







			</div>
		

		<script>
			$("#div_id").hide();
		</script>




		<script type="text/javascript">
			// <![CDATA[  <-- For SVG support
			if ('WebSocket' in window) {
				(function() {
					function refreshCSS() {
						var sheets = [].slice.call(document
								.getElementsByTagName("link"));
						var head = document.getElementsByTagName("head")[0];
						for (var i = 0; i < sheets.length; ++i) {
							var elem = sheets[i];
							var parent = elem.parentElement || head;
							parent.removeChild(elem);
							var rel = elem.rel;
							if (elem.href && typeof rel != "string"
									|| rel.length == 0
									|| rel.toLowerCase() == "stylesheet") {
								var url = elem.href.replace(
										/(&|\?)_cacheOverride=\d+/, '');
								elem.href = url
										+ (url.indexOf('?') >= 0 ? '&' : '?')
										+ '_cacheOverride='
										+ (new Date().valueOf());
							}
							parent.appendChild(elem);
						}
					}
					var protocol = window.location.protocol === 'http:' ? 'ws://'
							: 'wss://';
					var address = protocol + window.location.host
							+ window.location.pathname + '/ws';
					var socket = new WebSocket(address);
					socket.onmessage = function(msg) {
						if (msg.data == 'reload')
							window.location.reload();
						else if (msg.data == 'refreshcss')
							refreshCSS();
					};
					if (sessionStorage
							&& !sessionStorage
									.getItem('IsThisFirstTime_Log_From_LiveServer')) {
						console.log('Live reload enabled.');
						sessionStorage.setItem(
								'IsThisFirstTime_Log_From_LiveServer', true);
					}
				})();
			} else {
				console
						.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
			}
			// ]]>
		</script>
		
		
		
		</FORM>
		
	</div>
	
	
	
	
	<div id="draggable-live-region" aria-relevant="additions"
		aria-atomic="true" aria-live="assertive" role="log"
		style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>


	<footer>
		<jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
	</footer>


</body>

</html>