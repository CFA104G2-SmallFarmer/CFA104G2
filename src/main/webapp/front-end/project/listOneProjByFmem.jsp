<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page import="com.projPic.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>
<%	FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%	MemVO MemVO = (MemVO) session.getAttribute("MemVO");%>
<%  Integer f_mem_id  = fMemVO.getF_mem_id();
	pageContext.setAttribute("f_mem_id", f_mem_id);%>
<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%>
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

<html lang="zh-Hant-TW">
<head>

<!-- 這段給emoji的 -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="zh_TW" property="og:locale">
<meta content="zh_TW" property="og:locale:alternate">

<title>認養專案管理 | ${projectVO.proj_name} </title>
<link href="<%=request.getContextPath()%>/front-end/project/listOneProj_files/css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/project/listOneProj_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">


</style>
</head>
<!-- 旋轉logo在這裡logo-safari-fix -->
<style>
footer:hover .logo-safari-fix {
	animation: rotate 1s infinite linear, rainbow-fill 1s infinite alternate
}
</style>
<body class="intent-mouse">
<header style="height: 80px">
	<jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" /> 
	</header>

	<header class="relative z-2 bb ph3 ph0-l b--near-white">
	
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
					href="https://www.zeczec.com/users/Pet-Paradise0507">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a>
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
				<div class="mb1 f7" style="font-size:16px"id="dayleft">
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
	<div class="bt bb light-gray ph3 ph0-l mt0-l mt3 top-0 bg-white">
		<div class="container cf f6 relative">
			<div class="gutter3 flex">
				<div
					class="mh3 mh0-ns ph0 ph3-ns w-35-l overflow-auto nowrap flex flex-nowrap">
					<a
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--drak-gray b"
						href="${pageContext.request.contextPath}/projPerk/projPerk.do?proj_id=${projectVO.proj_id}&action=go_back_to_listOneProjByFmem">
						<div style="font-size:18px;color:#717d34;"class="f7 b ml3 gray">專案內容</div>
					</a> <a
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--transparent"
						href="${pageContext.request.contextPath}/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&action=go_to_listAll_ProDiary_from_listOneProjByFmem">
						<div style="font-size:16px" class="dib pv1">管理 小農日誌</div> <span class="dib pv1"><i class='fas fa-seedling' style='font-size:19px'></i></span>
					</a> 
					<a
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--transparent"
						href="${pageContext.request.contextPath}/projDiscussion/projDiscussion.do?proj_id=${projectVO.proj_id}&action=getAllDisc_For_Display_By_Mem">
						
						<div style="font-size:16px"class="dib pv1">留言</div> <span class="f7 b gray"><i class="material-icons" style="font-size:19px">sms</i></span>
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
				<div
					style="float: ri;"class="mh3 mh0-ns ph0 ph3-ns w-65-l overflow-auto nowrap flex flex-nowrap">
				<div class=" pv3 ph3 tc w-100">
					<div style="float: right; font-size: 17px;"
						class="w-33-l pv3 ph3 tc w-100">
						<div class="nt3 dn-l"></div>
						<a class="bg-white button w-100 green hover-green focus grow"
							href="${pageContext.request.contextPath}/projPerk/projPerk.do?proj_id=${projectVO.proj_id}&f_mem_id=${f_mem_id}&action=getAllPerk_For_Display_ByFmem">
							編輯回饋方案</a>
					</div>
					<div style="float: right; font-size: 17px;"
						class="w-33-l pv3 ph3 tc w-100">
						<div class="nt3 dn-l"></div>
						<a class="bg-white button w-100 green hover-green focus grow"
							href="${pageContext.request.contextPath}/projPic/projPic.do?proj_id=${projectVO.proj_id}&f_mem_id=${f_mem_id}&action=getAllPic_For_Display_ByFmem">
							編輯專案圖文</a>
					</div>
					<div style="float: right; font-size: 17px;"
						class="w-33-l pv3 ph3 tc w-100">
						<div class="nt3 dn-l"></div>
						<a class="bg-white button w-100 green hover-green focus grow"
							href="${pageContext.request.contextPath}/project/project.do?proj_id=${projectVO.proj_id}&action=getOne_For_Update">

							編輯認養專案</a>

					</div>
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
											<%-- 		src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/asset_422509_image_big.jpg"><span --%>
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
													<b> <img alt=""
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
											其他客服問題請洽小農：${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}
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
					<div style="margin-bottom: 20px;"
						class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
						<div
							style="border: solid lightgray 2px; padding: 15px; padding: 10px;"
							class="w-100-l ph3 ph0-l flex-none self-start">
							<!-- <a
								class="pa3 ba bw1 b--inherit round-s light-gray mb4 db border-rainbow "
								href="https://www.zeczec.com/users/sign_in?return_to=%2Fprojects%2Fparadisepet2022zeczecnewyear%2Forders%2Fback_project%3Fselected_reward%3D72345%23details"> -->
							<img width="100%" class="mb2 round-s"
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
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
	</footer>

	<script
		src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js.下載"
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
		src="<%=request.getContextPath()%>/front-end/project/listOneProj_files/v652eace1692a40cfa3763df669d7439c1639079717194"
		integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw=="
		data-cf-beacon="{&quot;rayId&quot;:&quot;6cf01cc79d7756f4&quot;,&quot;token&quot;:&quot;e0311a1880d54b88ab9f48eac7540091&quot;,&quot;version&quot;:&quot;2021.12.0&quot;,&quot;si&quot;:100}"
		crossorigin="anonymous"></script>
	<div id="draggable-live-region" aria-relevant="additions"
		aria-atomic="true" aria-live="assertive" role="log"
		style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>
</html>