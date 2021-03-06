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

Map<Date, List<ProDiaryVO>> list3 = proDiarySvc.getAll_groupingBy_date(projectVO.getProj_id());
pageContext.setAttribute("list3", list3);
%>
<%-- ${list3.key[0]} --%>

 <jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />

<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />
<%-- <% --%>
<!-- // ProjectService projectSvc = new ProjectService(); -->
<!-- // ProjectVO projectVO = projectSvc.getOneProject(1001);  -->
<%-- %> --%>


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
<!-- <link
	href="https://www.zeczec.com/assets/logo-square-04c45286e84ea49d07c97c86625fbf3a75f4f32dd02da3ad3ca70a9a68fd0395.png"
	rel="apple-touch-icon">
<link
	href="https://www.zeczec.com/assets/fav-69601a279a66f2e6e31e508900d4f057559d3affcae42730d045b17d281107a6.png"
	rel="shortcut icon" type="image/x-icon"> -->
<title>我家門前有塊地 | ${projectVO.proj_name}</title>
<link
	href="<%=request.getContextPath()%>/front-end/project/listOneProj_files/css"
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

	<header class="relative z-2 bb ph3 ph0-l b--near-white"> </header>
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
					href="#"><h2
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
				<div class="mb1 f7" style="font-size: 16px">
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
				<div class="mb1 f7" style="font-size: 16px" id="dayleft">
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
				<div class="mb2 f7" style="font-size: 16px">
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
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--transparent"
						href="${pageContext.request.contextPath}/projPerk/projPerk.do?proj_id=${projectVO.proj_id}&action=go_back_to_listOneProjByFmem">
						<div style="font-size: 16px" class="f7 b ml3 gray">專案內容</div>
					</a> <a
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--drak-gray b"
						href="${pageContext.request.contextPath}/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&action=go_to_listAll_ProDiary_from_listOneProjByFmem">
						<div style="font-size: 18px; color: #717d34;" class="dib pv1">管理
							小農日誌</div> <span class="dib pv1"><i class='fas fa-seedling'
							style='font-size: 19px; color: #717d34;'></i></span>
					</a> <a
						class="near-black dib pv3 mr4 mt1 hover-b--dark-gray bb-l b--transparent"
						href="${pageContext.request.contextPath}/projDiscussion/projDiscussion.do?proj_id=${projectVO.proj_id}&action=getAllDisc_For_Display_By_Fmem">
						<div style="font-size: 16px" class="dib pv1">留言</div> <span
						class="f7 b gray"><i class="material-icons"
							style="font-size: 19px">sms</i></span>
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
				<div style="float: ri;"
					class="mh3 mh0-ns ph0 ph3-ns w-65-l overflow-auto nowrap flex flex-nowrap">
					<div class=" pv3 ph3 tc w-100">
						<div style="float: right; font-size: 17px;"
							class="w-33-l pv3 ph3 tc w-100">
							<div class="nt3 dn-l"></div>
							<a class="bg-white button w-100 green hover-green focus grow"
								href="${pageContext.request.contextPath}/projPerk/projPerk.do?proj_id=${projectVO.proj_id}&f_mem_id=70000&action=getAllPerk_For_Display_ByFmem">
								編輯回饋方案</a>
						</div>
						<div style="float: right; font-size: 17px;"
							class="w-33-l pv3 ph3 tc w-100">
							<div class="nt3 dn-l"></div>
							<a class="bg-white button w-100 green hover-green focus grow"
								href="${pageContext.request.contextPath}/projPic/projPic.do?proj_id=${projectVO.proj_id}&f_mem_id=70000&action=getAllPic_For_Display_ByFmem">
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

										<div class="flex gutter3-l">

											<c:forEach var="proDiaryVO" items="${list2}">

												<!-- 這裡是開始 -->
												<div class=" ph3 pv3 w-50-ns w-100">
													<div class="cf"
														style="border: solid 1px lightgray; padding: 10px">
														<FORM style="display: inline-block" METHOD="post"
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
																	<button type="submit"
																		style="background-color: #f7ffd4; margin-bottom: 10px;"
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
															<%--  <c:otherwise>
        什么都没有。
    </c:otherwise> --%>
														</c:choose>


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
															style="font-size: 17px;  margin: 0px; height: auto">
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
				<div style="margin-bottom: 20px;"
					class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
					<a
						href="${pageContext.request.contextPath}/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&action=insert_ProDiary_from_listOneProjByFmem">
						<div
							style="font-size: 20px; color: #3f3f3f; text-align: center; border-radius: 10px; background-color: #f7ffd4; border: solid white 2px; padding: 15px; padding: 10px;"
							class="w-100-l ph3 ph0-l flex-none self-start">
							<strong>新增日誌</strong>
						</div>
					</a>
				</div>
				<div style="margin-bottom: 20px;"
					class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
					<a
						href="${pageContext.request.contextPath}/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&action=go_to_listAll_ProDiary_from_listOneProjByFmem">
						<div
							style="font-size: 20px; color: #3f3f3f; text-align: center; border-radius: 10px; background-color: #e0ffd8; border: solid white 2px; padding: 15px; padding: 10px;"
							class="w-100-l ph3 ph0-l flex-none self-start">
							<strong>查看全部日誌</strong>
						</div>
					</a>
				</div>
				<c:if test="${!empty list3}">
					<c:forEach var="list3" items="${list3}">
						<div style="margin-bottom: 30px; height: 28px;"
							class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
							<a href="<%=request.getContextPath()%>/proDiary/proDiary.do?proj_id=${projectVO.proj_id}&dir_upload_date=${list3.key}&action=go_to_listAll_ProDiary_ByDate_from_listOneProjByFmem">
								<div
									style="color: #aaba8b; font-size: 20px; border-radius: 10px; text-align: center; border: solid #aaba8b 2px; padding: 15px; padding: 10px;"
									class="w-60 ph3 ph0-l flex-none self-start">${list3.key}</div>
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