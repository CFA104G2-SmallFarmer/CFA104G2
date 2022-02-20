<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>

<%
 	ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO"); 
  	Integer proj_id  = projectVO.getProj_id(); 
  	ProjPerkService projPerkSvc = new ProjPerkService(); 
 	List<ProjPerkVO> list = projPerkSvc.getAll(proj_id);
    pageContext.setAttribute("list",list); 
%>
<%-- <jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />
<jsp:useBean id="projPerkSvc1" scope="page" class="com.projPerk.model.ProjPerkService" /> --%>
<%-- <jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FmemService" /> --%>
<%-- <%=projectVO.getProj_id()%> --%>


<%-- <%
ProjectService projectSvc2 = new ProjectService(); 
ProjectVO projectVO=projectSvc2.getOneProject(1001);
 /* 	Integer proj_id  = projectVO.getProj_id(); */ 
  ProjPerkService projPerkSvc = new ProjPerkService();  
	List<ProjPerkVO> list = projPerkSvc.getAll(1001);  
   pageContext.setAttribute("list",list); 
%> --%>

<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" /> 
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />

<!-- 核心在1173 -->
<!-- 704有圖要抽換 -->

<!DOCTYPE html>

<html lang="zh-Hant-TW">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="csrf-param" content="authenticity_token">

	  <!-- jQuery加入這段  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
 
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <!-- 加入這段 -->
  

<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="zh_TW" property="og:locale">
<meta content="zh_TW" property="og:locale:alternate">

<title>我家門前有塊地 | ${projectVO.proj_name}</title>
<link href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/css" rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

</style>
</head>


<!-- 核心 -->
<body class="intent-mouse">	
<header>
         <jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" />
</header>




  <div class="container"></div>
  <div class="bt b--light-gray bb">
    <div class="container cf">

      <div class="container ph3 ph0-l pt3 cf">
        <h2 class="flex mt0">
          <!-- <a class="order-1 f6 ml4-l black w-100 w-auto-l" href="https://www.zeczec.com/account"><i
              class="material-icons v-mid dark-gray f4">check</i>
            成功贊助記錄
          </a> -->
          <span class="order-0 flex-auto black w-100 w-auto-l" href="https://www.zeczec.com/account/cancelled">
            <i class="material-icons v-mid dark-gray f3">error</i>
            查看回饋方案
          </span>
          <!-- <span class="order-3 f6 ml4-l black w-100 w-auto-l" href="https://www.zeczec.com/account/atm"><i
              class="material-icons v-mid dark-gray f4">timer</i>
            等待付款記錄
          </span> -->
        </h2>

      </div>

    </div>
  </div>
<div class="container"></div>
<div class="bt b--light-gray bb">
		<div class="container cf">
			<div class="w-100">
				<div class="w5-l dib fl-l mr3-l w-100">
					<div class="aspect-ratio-project-cover bg-near-white"
						style="background-image: url(&#39;data:image/jpg;base64,${projectVO.base64Image}&#39;)"></div>
				<!-- 圖片待抽換 -->
				</div>
				<div class="pv2 ph0-l ph3">					<a href="https://www.zeczec.com/projects/ICHR">
						<h2 class="f5 mb0 dib mt1 f5 b">${projectVO.proj_name}</h2>
					</a>
					<div class="gray f7 mb3">
						<span>由</span> <a class="b"
							href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a><span
							class="mh2">發起</span>
					</div>
					<span class="b">目前總認養金額 NT$${projectVO.proj_total_fund}</span> <span class="f7 dark-gray">
						/ 目標 NT$${projectVO.proj_goal} </span>				</div>
			</div>
		</div>
	</div>
	<p><%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if></p>
	
	
<!-- 	<div class="container"></div> -->
<div class="container cf" style="height:27px">
<!--     <h2 style="display: inline-block;" class="flex mt0">查看回饋方案</h2> -->
    
    
          <FORM  METHOD="post" ACTION="<%=request.getContextPath()%>/projPerk/projPerk.do" name="form9">
    <input style="margin-right:10px;float: right;display: inline;font-size: 16px;" type="submit" name="commit" value="回到編輯專案詳情"
      class="button green b--green b mb3">
      <input type="hidden" name="action" value="go_back_to_listOneProjByFmem">
      <input type="hidden" name="proj_id" value="<%=projectVO.getProj_id()%>"> 
     
      </FORM>
      <FORM  METHOD="post" ACTION="<%=request.getContextPath()%>/projPerk/projPerk.do" name="form9">
    <input style="margin-right:10px;float: right;display: inline;font-size: 16px;" type="submit" name="commit" value="新增回饋方案"
      class="button green b--green b mb3">
      <input type="hidden" name="action" value="insert_from_listAllPerkByFmem">
      <input type="hidden" name="proj_id" value="<%=projectVO.getProj_id()%>"> 
     
      </FORM>

 </div> 
	

	<div class="container mv4">
		<div class="gutter3-l flex">
			<div class="w-100 ph3 mb4 mb0">
			
				<div style="background-color:#eff8ec;" class="tc f7 br2 bg-near-white pa2 b tracked dn db-ns">
					<i class="material-icons f6 v-mid">arrow_back</i> 左右捲動٩(●˙▿˙●)۶ฺ <i
						class="material-icons f6 v-mid">arrow_forward</i>
				</div>
				<div
					class="flex flex-wrap-ns flex-wrap-reverse flex-nowrap-ns nowrap-ns overflow-auto-ns scrollbar-top">						

						
					<!-- @TODO -->
					<c:forEach var="projPerkVO" items="${list}">
					
						<div style="border: solid lightgray 2px;padding: 15px;margin: 7px;"
							class="w-100 w-50-ns flex-none-ns ws-normal mr3-ns pt3-ns w-30-l">
							
							perk_id=${projPerkVO.perk_id}
							
							<FORM style="display: inline-block" METHOD="post" ACTION="<%=request.getContextPath()%>/projPerk/projPerk.do" name="form5">
			<button type="submit" style="margin-bottom: 10px;" class="button-s b-ns ph2 ph3-ns button dark-gray bg-near-white bn ml1"
              rel="nofollow" href="#">修改</button>
            	 	 <input type="hidden" name="perk_id"  value="${projPerkVO.perk_id}">
            	 	  <input type="hidden" name="proj_id" value="${projectVO.proj_id}"> 
			    	 <input type="hidden" name="action"	value="getOnePerk_For_Update">
             				 </FORM>
             				 
             				 <FORM style="display: inline-block" METHOD="post" ACTION="<%=request.getContextPath()%>/projPerk/projPerk.do" name="form6">
            <button  type="submit" style="margin-bottom: 10px;" class="button-s b-ns ph2 ph3-ns button dark-gray bg-near-white bn ml1"
              rel="nofollow" href="#">刪除</button>
               		 <input type="hidden" name="proj_id" value="${projectVO.proj_id}"> 
                     <input type="hidden" name="perk_id"  value="${projPerkVO.perk_id}">
			    	 <input type="hidden" name="action"	value="delete">
                           </FORM>
              
			<!-- 這塊超連結目前不需要 -->				
			<%-- 				<a
								class="pa3 ba bw1 b--inherit round-s light-gray mb4 db border-rainbow "
								href="https://www.zeczec.com/projects/ICHR/orders/back_project?selected_reward=72641#details"> --%>
								<img width="100%" class="mb2 round-s"
								src="<%=request.getContextPath()%>/projPerk/ProjPerkDBGifReader4?id=${projPerkVO.perk_id}" alt="${projPerkVO.perk_intro}"> 
					<!-- 圖片呈現成功 -->
								
								<div class="black b f4">NT$${projPerkVO.perk_fund}</div>
<%-- 								<div class="black b f4">${projPerkVO.perk_intro}</div> --%>
								<div class="f7 mv2">
									<span style="background-color:#717d34 ;" class="f7 white ph2 bg-red b dib"> 剩餘 ${projPerkVO.perk_limited - projPerkVO.perk_total_count} 份 </span><span
										class="black ph2 bg-near-white dib"> 已被贊助 <span
										class="b">${projPerkVO.perk_total_count}</span> / ${projPerkVO.perk_limited} 次
									</span>
								</div>
								<div
									class="black f6 mv-child-0 maxh5 maxh-none-ns overflow-auto">
									<p>
										【${projPerkVO.perk_abbr_name}】 <br>${projPerkVO.perk_intro}
										<%-- 【${projPerkVO.perk_abbr_name}】 <br>NT$${projPerkVO.perk_fund} --%>
									</p>
									<br>
									<p>
											寄送地區：${projPerkVO.perk_ship_area}
									</p>
								</div>
								<div class="mt3 gray tc ph2 f7 ba">預計於${projPerkVO.perk_ship_date}實現</div> 
<!-- 								</a> -->
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div>
	<!-- <script
		src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js.下載"
		type="text/javascript"></script> -->
	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>
	
	<!-- 設定專案開始募資後，不能修改 -->
	
	<!-- ０２０６專案開始日期還沒抓到 -->
	
            <script type="text/javascript">
              $(function () {
                var projectStartDay = new Date('2022-05-22 00:00:00').getDate(); /*募資開始日*/
                var thisDay = new Date().getDate(); /*今天*/
                if (thisDay >= projectStartDay) {
                  $(".button-s").attr("disabled", true);

                  $(".b--green").attr("disabled", true);
                

                  printAlert();
                } else {
                  $(".button-s").attr("disabled", false);
                  $(".b--green").attr("disabled", false); 
                }
              });

              function printAlert() {
                window.alert('專案募資已經開始，不能修改或刪除回饋方案');
              }
            </script>
	
	
<!-- 	<script type="text/javascript"> -->
<!-- //   !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod? -->
<!-- //   n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n; -->
<!-- //   n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0; -->
<!-- //   t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window, -->
<!-- //   document,'script','//connect.facebook.net/en_US/fbevents.js'); -->
<!-- </script> -->
<!-- 	<script type="text/javascript"> -->
<!-- //   fbq('init', '465239610292033'); -->
<!-- //   fbq('track', 'PageView'); -->
</script>
<!-- 	<noscript> -->
<!-- 		<img height='1' width='1' alt='' class='pixel' -->
<!-- 			style='visibility: hidden' -->
<!-- 			src='https://www.facebook.com/tr?id=465239610292033&amp;ev=PageView&amp;noscript=1&amp;cd[value]=0&amp;cd[currency]=TWD' /> -->
<!-- 	</noscript> -->
<!-- 	<script defer="" -->
<%-- 		src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/v652eace1692a40cfa3763df669d7439c1639079717194" --%>
<!-- 		integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" -->
<!-- 		data-cf-beacon="{&quot;rayId&quot;:&quot;6d631de9aa976a96&quot;,&quot;token&quot;:&quot;e0311a1880d54b88ab9f48eac7540091&quot;,&quot;version&quot;:&quot;2021.12.0&quot;,&quot;si&quot;:100}" -->
<!-- 		crossorigin="anonymous"></script> -->
<!-- 	<div id="draggable-live-region" aria-relevant="additions" -->
<!-- 		aria-atomic="true" aria-live="assertive" role="log" -->
<!-- 		style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div> -->

    <footer>
         <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>

</body>


</html>