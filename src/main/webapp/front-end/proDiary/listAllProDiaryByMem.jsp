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
Map<Integer, List<ProDiaryVO>> list1 = proDiarySvc.getAll_groupingBy_dir_upload_state(projectVO.getProj_id());


Integer dir_upload_state =1;
List<ProDiaryVO> list2 =list1.get(dir_upload_state);
pageContext.setAttribute("list2", list2);


Map<Date, List<ProDiaryVO>>  list3 = proDiarySvc.getAll_groupingBy_date(projectVO.getProj_id());
pageContext.setAttribute("list3", list3);		

		
%>

 <jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />

<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />


<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<!-- 這段給emoji的 -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="csrf-param" content="authenticity_token">
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

<style>
.buya :hover{

background-color:#f7f6e4;

color:deepgray;

}


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
					<span class="mr2 b"style="font-size:16px"> <c:set var="prefix" value="剩餘時間" /> <c:set
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

											<c:forEach var="proDiaryVO" items="${list2}">

												<!-- 這裡是開始 -->
												<div class=" ph3 pv3 w-50-ns w-100">
													<div class="cf" style="border:solid 1px lightgray;padding:10px">


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
															
															


															<img width="100%" class="mb2 round-s"
																src="<%=request.getContextPath()%>/proDiary/ProDiaryDBGifReader4?id=${proDiaryVO.dir_id}"
																alt="">

														</div>


														<p
															style="font-size: 17px; margin-bottom: 4px; margin-top: 4px;">
															日期：${proDiaryVO.dir_upload_date}<br>
															<%-- 日誌發布狀態：${proDiaryVO.dir_upload_state}<br> --%>
															生產過程：${proDiaryVO.dir_procedure}<br>
															產品/種苗：${proDiaryVO.dir_product}<br>
															<%-- 心情：${proDiaryVO.dir_emoji}<br>  --%>
															心情筆記：
														<div
															style="font-size: 17px;  margin: 0; height: auto;padding:3px">
															${proDiaryVO.dir_notes}</div>


														</p>

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

			</div>
		</div>
	</div>

	
	    <footer>
         <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>
	<script
		src="<%=request.getContextPath()%>/project/listOneProj_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js.下載"
		type="text/javascript"></script>
	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0; height: 0;">
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