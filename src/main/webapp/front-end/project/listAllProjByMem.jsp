<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>
<%
ProjectService projSvc = new ProjectService();
List<ProjectVO> list = projSvc.getAllProject();
pageContext.setAttribute("list", list);
%>

 <jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />

<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />

<!-- 核心在471 -->
<!DOCTYPE html>
<html lang="en" class="js no-touch mdl-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,
    initial-scale=1.0">
<title>瀏覽認養專案</title>

<!-- <link rel="shortcut icon" href="https://www.flyingv.cc/favicon.ico"> -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/css(1)">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/icon">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/notosanstc.css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/css2">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/font-awesome.min.css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/all-19a228fd40.css">
<link
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/owl.carousel.css"
	rel="stylesheet">
<link
	href="<%= request.getContextPath() %>/front-end/project/projectoverview_files/owl.theme.default.css"
	rel="stylesheet">
<style>
ul.pagination {
	display: none !important;
}
</style>
<script async=""
	src="<%= request.getContextPath() %>/front-end/project/projectoverview_files/gtm.js.下載"></script>
<script
	src="<%= request.getContextPath() %>/front-end/project/projectoverview_files/material.min.js.下載"></script>
<script>
	window.default_locale = "zh_TW";
	window.fallback_locale = "zh_TW";
</script>
<meta name="csrf-token"
	content="SosYwft0iG6yUmGI6gcAFUzoL7NAt6gx6DTG61k8">
<meta name="csrf-param" content="_token">
<style type="text/css">
.fancybox-margin {
	margin-right: 17px;
}
</style>



		<script type="text/javascript">
              $(function () {
                var projectexpected_end_date = new Date(${projectVO.expected_end_date}).getDate(); /*募資開始日*/
         /*        var projectStartDay = new Date('2022-05-22 00:00:00').getDate(); /*募資結束日*/
                var thisDay = new Date().getDate(); /*今天*/
                if (thisDay <= projectexpected_end_date) {
                  $(".buyy").hide();
                /*   $(".b--green").attr("disabled", true); */
                

                 /*  printAlert(); */
                } else {
                  $(".buyy").show();
              /*     $(".b--green").attr("disabled", false);  */
                }
              });

              function printAlert() {
                window.alert('專案募資已經結束');
              }
</script>
		
</head>
<body>
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-NXHVTP"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<script>
		(function(w, d, s, l, i) {
			w[l] = w[l] || [];
			w[l].push({
				'gtm.start' : new Date().getTime(),
				event : 'gtm.js'
			});
			var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
					+ l
					: '';
			j.async = true;
			j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
			f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-NXHVTP');
	</script>
	<!-- 核心 -->
	<div class="wrapper">
		<div class="flyingSidebar hidden-lg hidden-md">
			<div class="sidebar-mask"></div>
			<div class="sidebar-close">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
					viewBox="0 0 32 32">
                    <g fill="none" fill-rule="evenodd">
                        <path fill="#FFF"
						d="M22.57 23.581l1.011-1.01c.559-.559.559-1.464 0-2.022L19.033 16l4.548-4.549c.559-.558.559-1.463 0-2.021l-1.01-1.011c-.559-.559-1.464-.559-2.022 0L16 12.967 11.451 8.42c-.558-.559-1.463-.559-2.021 0l-1.011 1.01c-.559.559-.559 1.464 0 2.022L12.967 16 8.42 20.549c-.559.558-.559 1.463 0 2.021l1.01 1.011c.559.559 1.464.559 2.022 0L16 19.033l4.549 4.548c.558.559 1.463.559 2.021 0z">
                        </path>
                    </g>
                </svg>
			</div>
			<div class="sidebar-wrapper">
				<div class="sidebar-header">
					<div class="hlogo">
						<a href="https://www.flyingv.cc/"> <svg
								xmlns="http://www.w3.org/2000/svg" width="144" height="64"
								viewBox="0 0 144 64">
                                <g fill="none" fill-rule="evenodd">
                                    <path fill="#F8414A"
									d="M55.269 22.87c.382-.058.412-.034.421.351.002.068 0 .134 0 .2 0 6.334.025 12.668-.01 19-.014 2.573-.534 5.055-1.732 7.356-.704 1.354-1.657 2.481-2.982 3.26-1.044.613-2.178.9-3.375.954-1.189.053-2.353-.123-3.498-.43-.925-.247-1.824-.569-2.703-.948-.354-.152-.373-.175-.291-.54.294-1.303.596-2.607.896-3.91.018-.077.04-.155.107-.208.163.022.252.15.364.237.67.51 1.405.849 2.24.974 1.376.204 2.892-.517 3.59-1.728.385-.667.592-1.4.75-2.149.215-1.013.256-2.044.294-3.074.008-.24-.009-.477-.079-.758-.131.141-.132.29-.163.419-.16.685-.423 1.322-.823 1.902-.66.954-1.588 1.466-2.72 1.523-1.712.086-3.272-.43-4.67-1.42-.864-.614-1.417-1.47-1.776-2.463-.298-.823-.465-1.676-.549-2.544-.158-1.655-.195-3.313-.153-4.975.072-2.865.142-5.727.134-8.594 0-.226-.008-.454-.004-.682.009-.386.037-.429.414-.511 1.164-.26 2.33-.512 3.497-.765l2.022-.436c.48-.103.496-.086.51.397.062 2.088.04 4.177.081 6.264.04 2.022.089 4.042.164 6.062.043 1.123.084 2.248.224 3.364.106.84.74 1.363 1.566 1.29.436-.04.772-.264 1.046-.594.276-.335.45-.726.574-1.138.224-.748.323-1.52.328-2.299.01-1.217-.014-2.436-.013-3.655.002-2.65.011-5.3.018-7.952.002-.612.003-.616.592-.726l5.63-1.043.079-.012zm41.468.052c1.987-.36 3.481.364 4.485 2.116.104.184.198.373.313.59.14-.126.108-.239.108-.34.004-.268-.002-.535-.002-.803 0-.444.027-.486.44-.56 1.865-.337 3.73-.672 5.595-1.005.396-.07.446-.027.458.366.005.147.002.294.002.441-.002 5.769-.004 11.539-.004 17.307-.001 1.084.026 2.169-.085 3.25-.152 1.484-.426 2.936-.94 4.34-.682 1.858-1.883 3.229-3.633 4.127-1.21.62-2.471 1.015-3.831 1.104-1.945.127-3.759-.321-5.489-1.189-.059-.03-.116-.063-.173-.097-.308-.186-.336-.233-.242-.584.281-1.033.57-2.062.855-3.093.053-.194.098-.39.164-.579.065-.19.14-.21.287-.073.905.85 2.002.966 3.157.845.303-.03.603-.093.903-.14.835-.128 1.42-.616 1.858-1.316.388-.62.602-1.31.74-2.023.251-1.31.267-2.632.155-3.958-.006-.066-.011-.133-.088-.198-.127.054-.112.193-.139.294-.1.403-.214.8-.385 1.18-.656 1.46-1.826 2.133-3.365 2.225-.745.044-1.484-.044-2.21-.207-1.158-.26-2.09-.895-2.833-1.815-.759-.938-1.248-2.014-1.548-3.182-.057-.223-.075-.448-.077-.677-.027-2.743-.03-5.489.022-8.231.02-.976.009-1.954.127-2.928.05-.412.118-.82.219-1.223.277-1.102.897-1.958 1.831-2.581 1.018-.68 2.124-1.166 3.325-1.383zm-70.944-8.82h.1c.293.014.332.056.24.337-.186.573-.385 1.14-.576 1.71-.269.8-.532 1.6-.802 2.397-.134.397-.155.418-.567.413-1.023-.013-2.04.029-3.043.249-.429.094-.848.216-1.238.425-.513.275-.795.688-.791 1.288.005.71-.011 1.42-.003 2.13.005.447.068.507.517.508 1.59.005 3.18.002 4.771.003.682 0 .69.008.69.694v3.695c0 .08.001.16-.003.24-.019.333-.074.395-.407.4-.544.008-1.087.003-1.63.003H19.75c-.12 0-.238.006-.358.008-.174.005-.272.092-.28.27-.006.161-.01.322-.01.482v17.218c.004.569.025.59-.66.713l-5.323.95c-.365.065-.425.017-.435-.35-.01-.32-.004-.642-.004-.964V29.534c0-.724-.002-.718-.728-.77-.528-.04-1.055-.1-1.582-.155-.31-.033-.36-.08-.365-.403-.008-.656-.004-1.313-.004-1.968 0-.656-.003-1.312.002-1.968.003-.438.067-.498.511-.52l1.587-.092c.423-.024.485-.072.49-.5.012-1.032.064-2.06.183-3.085.108-.931.268-1.85.547-2.751.37-1.196 1.182-1.974 2.279-2.476.768-.352 1.594-.489 2.426-.582 1.399-.157 2.803-.166 4.208-.16 1.153.004 2.306 0 3.46 0 .065 0 .132-.005.198-.002zm8.347.085c.47-.091.483-.049.483.501v28.99c0 .503-.045.483-.695.605l-5.393 1.013c-.54.101-.554.087-.554-.48V15.978c.003-.552.01-.56.56-.671l5.498-1.1zm31.798 8.673c.163-.028.258.033.259.211 0 .133.004.267.004.4V43.47c-.003.603-.003.601-.596.72-1.833.365-3.665.732-5.498 1.096-.537.108-.55.1-.55-.472V24.715l.001-.1c.013-.368.036-.41.39-.487 1.088-.237 2.178-.467 3.267-.699l2.45-.518c.091-.02.182-.037.273-.051zm14.731-.099c1.622-.016 3.089.434 4.339 1.502 1.035.883 1.591 2.05 1.865 3.37.088.42.115.847.114 1.277v14.777c-.01.433-.035.473-.459.555-1.847.358-3.695.711-5.543 1.065-.079.016-.158.023-.238.028-.11.006-.18-.05-.187-.16-.01-.147-.014-.295-.014-.442-.001-4.699-.004-9.397.003-14.095.001-.656-.19-1.24-.527-1.781-.424-.681-1.044-.89-1.783-.61-.532.204-.966.553-1.359.96-.108.112-.148.25-.152.401-.005.175-.007.348-.007.522 0 4.431 0 8.862-.002 13.293 0 .758.031.723-.714.865-1.757.33-3.515.667-5.272 1.001-.04.008-.079.016-.118.021-.374.052-.413.02-.424-.363-.003-.093-.001-.187-.001-.281V24.95c0-.81-.029-.744.724-.91l5.164-1.135c.052-.012.104-.028.156-.035.258-.034.302 0 .325.263.06.68.057 1.365.07 2.046.002.14-.033.293.079.434.154-.087.182-.24.246-.364.303-.59.696-1.108 1.2-1.535.726-.614 1.561-.944 2.515-.953zm56.908-8.743c.139 0 .329-.072.405.073.072.14-.09.263-.164.383-3.742 6.084-7.486 12.167-11.231 18.25-2.477 4.024-4.958 8.047-7.428 12.077-.188.308-.392.445-.76.442-1.884-.018-3.766-.008-5.65-.008l-.079-.001c-.397-.01-.437-.047-.448-.433-.004-.134-.001-.267-.001-.402v-22.25c0-.162.002-.322-.002-.482-.011-.436-.054-.474-.464-.392-.43.086-.857.182-1.284.274-.078.017-.156.04-.234.046-.14.012-.233-.056-.251-.198-.016-.118-.019-.24-.019-.36l-.001-4.82c0-.053 0-.108.003-.16.015-.345.04-.388.376-.456.635-.13 1.275-.246 1.914-.364 1.98-.367 3.962-.731 5.942-1.1.687-.128.688-.133.688.575v8.395l.001 8.393c0 .208-.039.425.08.644.196-.102.258-.288.351-.439 1.38-2.222 2.756-4.45 4.132-6.673 2.17-3.51 4.346-7.014 6.505-10.53.223-.364.476-.5.897-.496 2.24.02 4.481.008 6.722.012zm-36.654 14.527c-.544-.709-1.498-.888-2.24-.388-.664.451-1.058 1.099-1.064 1.916-.015 2.636-.005 5.27-.005 7.904 0 .337.05.668.167.984.373 1.002 1.4 1.433 2.334.928.784-.421 1.268-1.08 1.269-2.023v-3.933c0-1.35-.004-2.7.002-4.052.003-.505-.161-.945-.463-1.336zM65.95 14.149c.148-.02.23.048.242.195.01.106.01.213.01.32v5.117l-.003.1c-.017.292-.045.338-.337.406-.542.125-1.087.237-1.632.352l-4.081.867c-.58.123-.59.118-.59-.464l-.001-3.852.001-1.325c.002-.417.03-.455.428-.535 1.922-.385 3.845-.765 5.768-1.147.065-.014.13-.026.195-.034z">
                                    </path>
                                </g>
                            </svg>
						</a>
					</div>
					<div class="hwrapper">
						<div id="mobileSearch">
							<a href="https://www.flyingv.cc/projects?sort=hot#"><svg
									xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									viewBox="0 0 32 32">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#212121"
										d="M22.894 23.781l.884-.884c.294-.294.294-.769.003-1.063l-3.115-3.115c-.141-.14-.332-.219-.532-.219h-.509c.862-1.103 1.375-2.49 1.375-4 0-3.59-2.91-6.5-6.5-6.5S8 10.91 8 14.5s2.91 6.5 6.5 6.5c1.51 0 2.897-.513 4-1.375v.51c0 .2.078.39.219.53l3.115 3.116c.294.294.77.294 1.06 0zM14.5 18.5c-2.21 0-4-1.787-4-4 0-2.21 1.787-4 4-4 2.21 0 4 1.788 4 4 0 2.21-1.788 4-4 4z">
                                        </path>
                                    </g>
                                </svg></a>
						</div>
					</div>
				</div>
				<ul class="sidebar-menu">
					<li id="momenu">
						<form method="GET" action="https://www.flyingv.cc/projects/search"
							accept-charset="UTF-8">
							<div>
								<input class="searchForm" id="searchMobile" placeholder="搜尋專案"
									name="q" type="text">
							</div>
						</form>
					</li>
					<li><a href="https://www.flyingv.cc/about">關於</a></li>
					<li><a href="https://www.flyingv.cc/projects/create">提案</a></li>
					<li><a href="https://www.flyingv.cc/projects">探索</a></li>
				</ul>
				<div id="mobileLanguageDropdown">
					<a>中文 <svg xmlns="http://www.w3.org/2000/svg" width="24"
							height="24" viewBox="0 0 24 24" class="svg-dropdown">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#212121"
								d="M12.594 14.747l4.16-4.274C17.28 9.93 16.906 9 16.158 9H7.84c-.748 0-1.122.93-.594 1.473l4.162 4.274c.325.337.857.337 1.185 0z">
                                </path>
                            </g>
                        </svg> <svg xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" viewBox="0 0 24 24"
							class="svg-dropdownActive">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#212121"
								d="M12.594 9.253l4.16 4.274c.527.543.153 1.473-.595 1.473H7.84c-.748 0-1.122-.93-.594-1.473l4.162-4.274c.325-.337.857-.337 1.185 0z">
                                </path>
                            </g>
                        </svg></a>
					<div id="mobileLanguageMenu" class="dropTog" style="">
						<a href="https://www.flyingv.cc/projects?lang=en">English</a> <a
							href="https://www.flyingv.cc/projects?lang=ja">日本語</a>
					</div>
				</div>
				<div class="sidebar-footer">
					<ul>
						<li><a href="https://rolla.flyingv.cc/">Rolla</a></li>
						<li><a href="https://vstory.flyingv.cc/" target="_blank">VStory</a></li>
						<li><a href="https://shopee.tw/flyingv" target="_blank">VCollection
								x&nbsp;&nbsp;<span><img
									src="<%= request.getContextPath() %>/front-end/project/projectoverview_files/Shopee_icon.svg"
									alt="Shopee" style="margin-bottom: -6px; margin-left: -6px;"></span>
						</a></li>
					</ul>
					<a class="sidebar-fb" href="https://www.facebook.com/FlyingV.cc"
						target="_blank"><svg xmlns="http://www.w3.org/2000/svg"
							width="48" height="48" viewBox="0 0 48 48">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#FFF"
								d="M21.665 37.5v-9.18h-3.797V24h3.797v-3.293c0-3.746 2.23-5.815 5.645-5.815 1.636 0 3.346.292 3.346.292v3.676h-1.885c-1.856 0-2.436 1.153-2.436 2.335V24h4.146l-.663 4.32h-3.483v9.18h8.272c1.597 0 2.893-1.296 2.893-2.893V13.393c0-1.597-1.296-2.893-2.893-2.893H13.393c-1.597 0-2.893 1.296-2.893 2.893v21.214c0 1.597 1.296 2.893 2.893 2.893h8.272z">
                                </path>
                            </g>
                        </svg></a> <a class="sidebar-flickr"
						href="https://www.flickr.com/photos/126745179@N03/albums"
						target="_blank"><svg xmlns="http://www.w3.org/2000/svg"
							width="48" height="48" viewBox="0 0 48 48">
                            <g fill="none" fill-rule="evenodd">
                                <path fill="#FFF"
								d="M34.607 37.5c1.597 0 2.893-1.296 2.893-2.893V13.393c0-1.597-1.296-2.893-2.893-2.893H13.393c-1.597 0-2.893 1.296-2.893 2.893v21.214c0 1.597 1.296 2.893 2.893 2.893h21.214zM19.21 27.797c-2.116 0-3.827-1.712-3.827-3.827 0-2.116 1.711-3.827 3.827-3.827 2.115 0 3.827 1.711 3.827 3.827 0 2.115-1.712 3.827-3.827 3.827zm9.582 0c-2.115 0-3.827-1.712-3.827-3.827 0-2.116 1.712-3.827 3.827-3.827 2.116 0 3.827 1.711 3.827 3.827 0 2.115-1.711 3.827-3.827 3.827z">
                                </path>
                            </g>
                        </svg></a>
				</div>
			</div>
		</div>
		<header>
         <jsp:include page="/front-end/home/header2/header2.jsp" />
</header>


		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<!-- 陳列區 -->
		<section class="mainBlock" id="categoryPad">
			<div class="container">
				<div id="containWrapper">
					<div id="projects">
						<div class="row lists">
							<!-- @TODO -->
							<c:forEach var="projectVO" items="${list}" >
								<%-- 	原始		<c:forEach var="projectVO" items="${list}" --%>
								<%-- 			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
								<!-- 			這邊的數字再依page1跟page2來改 -->
								<!-- form表單的舊方法 -->
								<!-- 	<FORM METHOD="get" ACTION="project.do" > -->
								<!-- 	<b>選擇員工編號:</b> -->
								<!-- 	<select size="1" name="proj_id"> -->
								<%-- 	<option value="${projectVO.proj_id}">${projectVO.proj_id} --%>
								<!-- 	</select> -->
								<!-- 	<input type="hidden" name="action" value="getOne_For_Display_ByMem"> -->
								<!-- 	<input type="submit" value="送出"> -->
								<!-- 	</FORM> -->

								<div class="col-md-4 col-sm-6">
									<div class="projectCard">
										<a
											href="${pageContext.request.contextPath}/project/project.do?proj_id=${projectVO.proj_id}&action=getOne_For_Display_ByMem"
											class="projectUrl" data-id="${projectVO.proj_id}"
											data-title="${projectVO.proj_name}" data-category="1"></a>
										<div class="projectThumb">
											<%@ taglib prefix="fmt"
												uri="http://java.sun.com/jsp/jstl/fmt"%>
											<%-- 	<c:set var="a" value="<%= request.getContextPath() %>/front-end/project/projectoverview_files/" /> --%>
											<%-- 	<c:set var="imgName" value="${projectVO.proj_id}" /> --%>
											<%-- 	<c:set var="b" value=".png" /> --%>
											<%-- 	<c:set var="imgPath" value="${a}${imgName}${b}" /> --%>
											<%-- 	<c:out value="${imgPath}"/>	 --%>
											<!-- 	<img src="<%= request.getContextPath() %>/front-end/project/projectoverview_files/1001.png" -->
											<%-- 	alt="${projectVO.proj_name}"  --%>
											<!-- 	class="projectCoverImg img-responsive"> -->
											<img src="data:image/jpg;base64,${projectVO.base64Image}"
												alt="${projectVO.proj_name}"
												class="projectCoverImg img-responsive">
											<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> --%>
											<%-- <p>Length of String : ${fn:length(pic)}</p> --%>
										</div>
										<div class="pcontent">
											<div>
												<!-- <label class="tag">科技設計</label>  -->
												<!-- 	破爛寫法 -->
												<%-- 	<label class="tag red"> --%>
												<%-- 	<c:if	test="${Math.round(projectVO.proj_total_fund/projectVO.proj_goal)*100>=100}" --%>
												<%-- 			var="condition"> --%>
												<%-- 		SUCCESS!</c:if> --%>
												<!-- 		</label> -->
												<label class="tag red">
													${Math.round((projectVO.proj_total_fund/projectVO.proj_goal)*100)>=100?"已達標":"未達標"}
												</label>
											</div>
											<h2 class="title">${projectVO.proj_name}</h2>
											<p class="creator">
												<a href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a>
											</p>
										</div>
										<div class="downMeta">
											<div class="progressbar  goal ">
												<div class="bar" style="width: 100%;"></div>
											</div>
											<span class="goalMoney">${projectVO.proj_total_fund}</span>&nbsp;
											<span class="hidden-md goalpercent goal"> <c:out
													value="${Math.round(projectVO.proj_total_fund/projectVO.proj_goal*100)}" />
												%
											</span>
											<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
											<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
												prefix="fmt"%>
											<!-- 先取值 -->
											<fmt:formatDate var="mydate"
												value="${projectVO.expected_end_date}"
												pattern="yyyy-MM-dd HH:mm:ss" />
											<!-- parsing -->
											<fmt:parseDate var="someDate" value="${mydate}"
												pattern="yyyy-MM-dd HH:mm:ss" />
											<!-- 取當前時間	 -->
											<jsp:useBean id="nowDate" class="java.util.Date" />
											<!-- 取時間差(毫秒) -->
											<c:set var="interval" value="${someDate.time - nowDate.time}" />
											<fmt:formatNumber var="dayleft"
												value="${interval/1000/60/60/24}" pattern="#0" />
											<!-- 算完取條件判斷後呈現 -->
											<span class="date pull-right"> <strong> <c:set
														var="prefix" value="還剩" /> <c:set var="suffix" value="天" />
													<c:choose>
														<c:when test="${interval<=0}">已結案 </c:when>
														<c:otherwise>${prefix}${dayleft}${suffix}</c:otherwise>
													</c:choose>
											</strong>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>
<footer>
        <jsp:include page="/front-end/home/footer.jsp" />
</footer>

		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
			aria-labelledby="msgLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/front-end/project/projectoverview_files/all-c2e193e63f.js.下載"></script>
	<script>
		$(function() {
			if ($.support.pjax) {
				$(document).pjax('[data-pjax] a, a[data-pjax]',
						'#containWrapper');
			}
		});
		$(document)
				.on(
						'pjax:complete ready',
						function() {
							$('.btn-more')
									.on(
											'click',
											function() {
												$('#projects')
														.jscroll(
																{
																	autoTrigger : true,
																	nextSelector : '.pagination li.active + li a',
																	contentSelector : 'div.lists',
																	loadingHtml : '<div class="text-center"><i class="fa fa-spinner fa-spin"></i> Loading...</div>',
																	callback : function() {
																		var arr = $(this).context
																				.getElementsByClassName('projectUrl');
																		var additionalProjects = [];
																		for (var i = 0; i < arr.length; i++) {
																			additionalProjects[i] = {
																				'name' : arr[i]
																						.getAttribute('data-title'),
																				'id' : arr[i]
																						.getAttribute('data-id'),
																				'category' : arr[i]
																						.getAttribute('data-category')
																			}
																		}
																		window.dataLayer = window.dataLayer
																				|| [];
																		window.dataLayer
																				.push({
																					'ecommerce' : {
																						'currencyCode' : 'TWD',
																						'impressions' : additionalProjects
																					}
																				});
																	}
																});
												$(this).hide();
											});
						});
	</script>
	<script
		src="<%=request.getContextPath()%>/front-end/project/projectoverview_files/owl.carousel.min.js.下載"></script>
	<script>
		function gotoSuccess() {
			// go success
			$('.gotoSuccess').on(
					'click',
					function(e) {
						e.preventDefault();
						var category = $('.category-item .content.active')
								.attr('data-cslug');
						var sort = $('.current-sort').attr('data-sort');
						$('.current-filter > strong').text("成功專案");
						$('.current-filter').attr('data-filter', 'success');
						$.pjax({
							url : "https://www.flyingv.cc/projects"
									+ "?filter=success" + "&sort=" + sort
									+ "&category=" + category,
							container : "#containWrapper",
						});
					});
		} // impressions
		$(document).on('pjax:complete ready', function() {
			window.dataLayer = window.dataLayer || [];
			var products = [];
			$("#projects .projectCard .projectUrl").each(function(index) {
				products[index] = {
					'name' : $(this).attr('data-title'),
					'id' : $(this).attr('data-id'),
					'category' : $(this).attr('data-category'),
				};
			});
			if (products.length > 0) {
				window.dataLayer = window.dataLayer || [];
				window.dataLayer.push({
					'ecommerce' : {
						'currencyCode' : 'TWD',
						'impressions' : products
					}
				});
			}
			gotoSuccess();
		}); // product click
		$(".projectUrl").on('click', function(e) {
			var productObj = {
				'title' : $(this).attr('data-title'),
				'id' : $(this).attr('data-id'),
				'category' : $(this).attr('data-category'),
				'url' : $(this).attr('href')
			};
			e.preventDefault();
			dataLayer.push({
				'event' : 'productClick',
				'ecommerce' : {
					'click' : {
						'actionField' : {
							'list' : '探索'
						}, // Optional list property.
						'products' : [ {
							'name' : productObj.title, // Name or ID is required.
							'id' : productObj.id,
							'category' : productObj.category,
						} ]
					}
				},
				'eventCallback' : function() {
					document.location = productObj.url
				}
			});
		}); // dropdown
		$('.fv-dropdown').on('click', function(e) {
			e.stopPropagation();
			$(this).find('.fv-dropdown-menu').fadeToggle('fast');
			$(this).toggleClass('active');
		}); // filter category
		$('.category-item .content').on(
				'click',
				function(e) {
					e.preventDefault();
					var filter = $('.current-filter').attr('data-filter');
					var sort = $('.current-sort').attr('data-sort');
					$('.category-item .content').removeClass('active');
					$(this).addClass('active');
					$.pjax({
						url : "https://www.flyingv.cc/projects" + "?filter="
								+ filter + "&sort=" + sort + "&category="
								+ $(this).attr('data-cslug'),
						container : "#containWrapper",
					});
				}); // filter status
		$('#filterMenu > a').on(
				'click',
				function(e) {
					e.preventDefault();
					var category = $('.category-item .content.active').attr(
							'data-cslug');
					var sort = $('.current-sort').attr('data-sort');
					$('.current-filter > strong').text($(this).text());
					$('.current-filter').attr('data-filter',
							$(this).attr('data-filter'));
					$.pjax({
						url : "https://www.flyingv.cc/projects" + "?filter="
								+ $(this).attr('data-filter') + "&sort=" + sort
								+ "&category=" + category,
						container : "#containWrapper",
					});
				}); // sort
		$('#sortMenu > a').on(
				'click',
				function(e) {
					e.preventDefault();
					var category = $('.category-item .content.active').attr(
							'data-cslug');
					var filter = $('.current-filter').attr('data-filter');
					$('.current-sort > strong').text($(this).text());
					$('.current-sort').attr('data-sort',
							$(this).attr('data-sort'));
					$.pjax({
						url : "https://www.flyingv.cc/projects" + "?filter="
								+ filter + "&sort=" + $(this).attr('data-sort')
								+ "&category=" + category,
						container : "#containWrapper",
					});
				});
		gotoSuccess();
	</script>
	<script>
		var lastCheck = new Date();
		var caffeineSendDrip = function() {
			var ajax = window.XMLHttpRequest ? new XMLHttpRequest
					: new ActiveXObject('Microsoft.XMLHTTP');
			ajax.onreadystatechange = function() {
				if (ajax.readyState === 4 && ajax.status === 204) {
					lastCheck = new Date();
				}
			};
			ajax.open('GET', '/genealabs/laravel-caffeine/drip');
			ajax.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			ajax.send();
		};
		setInterval(function() {
			caffeineSendDrip();
		}, 300000);
		if (2000 > 0) {
			setInterval(function() {
				if (new Date() - lastCheck >= 7082000) {
					location.reload(true);
				}
			}, 2000);
		}
	</script>
</body>
</html>