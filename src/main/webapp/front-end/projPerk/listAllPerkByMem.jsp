<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPerk.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>
<%-- <%
	ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%> --%>


<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO"); 
Integer proj_id  = projectVO.getProj_id();
ProjPerkService projPerkSvc = new ProjPerkService();
List<ProjPerkVO> list = projPerkSvc.getAll(proj_id);
pageContext.setAttribute("list",list);
%>
<jsp:useBean id="projectSvc" scope="page" class="com.project.model.ProjectService" />
<jsp:useBean id="projPerkSvc1" scope="page" class="com.projPerk.model.ProjPerkService" />
<%-- <jsp:useBean id="fMemSvc" scope="page" class="com.fMem.model.FMemService" /> --%>
<!-- 衧配有改 -->
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />

<!-- 核心在1173 -->
<!-- 704有圖要抽換 -->

<!DOCTYPE html>
<!-- saved from url=(0056)https://www.zeczec.com/projects/ICHR/orders/back_project -->
<html lang="zh-Hant-TW">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
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
<link href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/css" rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
  <!-- jQuery加入這段  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
 
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <!-- 加入這段 -->
<style>
.buya :hover {
	background-color: #f7f6e4;
	color: deepgray;
	cursor: pointer;
}

</style>
</head>


<!-- 核心 -->
<body class="intent-mouse">	
<header>
         <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp" />
</header>


  <div class="container"></div>
  <div class="bt b--light-gray bb">
    <div class="container cf">


      <div class="container ph3 ph0-l pt3 cf">
        <h2 class="flex mt0">
         
          <span class="order-0 flex-auto black w-100 w-auto-l" href="#">
            
            查看回饋方案
          </span>
          
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
				<div class="pv2 ph0-l ph3">					<a href="#">
						<h2 class="f5 mb0 dib mt1 f5 b">${projectVO.proj_name}</h2>
					</a>
					<div class="gray f7 mb3">
						<span></span> <a class="b"
							href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a><span
							class="mh2"></span>
					</div>
					<span class="b">目前總認養金額NT$${projectVO.proj_total_fund}</span> <span class="f7 dark-gray">
						/ 目標 NT$${projectVO.proj_goal} </span>				</div>
			</div>
		</div>
	</div>
	<div class="container"></div>
	<div class="container mv4">
		<div class="gutter3-l flex">
			<div class="w-100 ph3 mb4 mb0">
				<div class="tc f7 br2 bg-near-white pa2 b tracked dn db-ns">
					<i class="material-icons f6 v-mid">arrow_back</i> 左右捲動看看更多選項 <i
						class="material-icons f6 v-mid">arrow_forward</i>
				</div>
				<div
					class="flex flex-wrap-ns flex-wrap-reverse flex-nowrap-ns nowrap-ns overflow-auto-ns scrollbar-top">						
<%-- 						<%
						
						Integer proj_id  = projectVO.getProj_id();
						ProjPerkService projSvc = new ProjPerkService();
 						List<ProjPerkVO> list = projSvc.getAll(proj_id);
 						pageContext.setAttribute("list", list);
						%> --%>
						
					<!-- @TODO -->
					<c:forEach var="projPerkVO" items="${list}" >
					<div style="border: solid lightgray 2px;padding: 15px;margin: 7px;"
							class="w-100 w-50-ns flex-none-ns ws-normal mr3-ns pt3-ns w-30-l">
						
							<!-- <a
								class="pa3 ba bw1 b--inherit round-s light-gray mb4 db border-rainbow "
								href="https://www.zeczec.com/projects/ICHR/orders/back_project?selected_reward=72641#details"> -->
								<img
								width="100%" class="mb2 round-s"
								src="<%=request.getContextPath()%>/projPerk/ProjPerkDBGifReader4?id=${projPerkVO.perk_id}" alt="${projPerkVO.perk_intro}">
							<div class="black b f4">NT$${projPerkVO.perk_fund}</div>
<%-- 								<div class="black b f4">${projPerkVO.perk_intro}</div> --%>
								<div class="f7 mv2">
									<span style="background-color:#b35900 ;" class="f7 white ph2 bg-red b dib"> 剩餘 ${projPerkVO.perk_limited - projPerkVO.perk_total_count} 份 </span><span
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
									 <p style="margin-block-start:0px">
                    寄送地區：${projPerkVO.perk_ship_area}
                  </p>
								</div>
								<div class="mt3 gray tc ph2 f7 ba">預計於${projPerkVO.perk_ship_date}實現</div> 
															<div style="margin-top: 10px; margin-bottom: 20px; height: 17px;"
								class="w-100-l w-50-ns ph3 ph0-l flex-none self-start">
								
							<%-- 	<a class="buya"
									href="${pageContext.request.contextPath}/projPerk/projPerk.do?proj_id=${projectVO.proj_id}&perk_id=${projPerkVO.perk_id}&action=go_to_addOrderByMem">
									<div
										style="color: #8f7e5d; font-size: 16px; border-radius: 0px; text-align: center; border: solid #aaba8b 1.5px; padding: 4px;"
										class="w-100 ph3 ph0-l flex-none self-start buyy">
										<strong>認購此專案</strong>
									</div>
								</a> --%>
								
								
<!-- 								/*0224新增*/ -->
								<FORM id="search_form6" METHOD="post" ACTION="<%=request.getContextPath()%>/projPerk/projPerk.do">	
							
									<div onClick="document.forms['search_form6'].submit();" style="color: #8f7e5d; font-size: 16px; border-radius: 0px; text-align: center; border: solid #aaba8b 1.5px; padding: 4px;"
										class="w-100 ph3 ph0-l flex-none self-start buyy buya">
										<strong>認購此專案</strong>
									</div>
							
								<input type="hidden" name="proj_id"  value="${projectVO.proj_id}">
 								<input type="hidden" name="perk_id"  value="${projPerkVO.perk_id}">
                      		    <input type="hidden" name="action" value="go_to_addOrderByMem">	 
								   </FORM>
								   
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/front-end/projPerk/perkoverview_files/zeczec-75aefb6b17bb84ace5c7e76b106774304d1830945ab570527f3cb44045f686b1.js.下載"
		type="text/javascript"></script>
		
		<script type="text/javascript">
              $(function () {
                var projectexpected_end_date = new Date('${projectVO.expected_end_date}'); /*募資結束日*/
       
                var thisDay = new Date(); /*今天*/
                if ( (Date.parse(thisDay)).valueOf() > (Date.parse(projectexpected_end_date)).valueOf())  {
                  $(".buyy").hide();

                 /*  printAlert(); */
                } else {
                  $(".buyy").show();            
                }
              });

              function printAlert() {
                window.alert('專案募資已經結束');
              }
</script>
		
		
		
		
		
		
		
		
		
	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>


			
    <footer>
         <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>
		
</body>
</html>