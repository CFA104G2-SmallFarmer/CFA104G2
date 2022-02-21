<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projDiscussion.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>

<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
Integer proj_id = projectVO.getProj_id();
ProjDiscussionService projDiscSvc = new ProjDiscussionService();
List<ProjDiscussionVO> updateFirst=projDiscSvc.updateFirstLayerProjDiscussion(1003);
List<ProjDiscussionVO> list = projDiscSvc.getAllSameProjDiscussion(1003);
pageContext.setAttribute("list", list);
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

<jsp:useBean id="projectSvc" scope="page"
	class="com.project.model.ProjectService" />
<jsp:useBean id="fmemSvc" scope="page"
	class="com.fMem.model.FMemService" />

<!-- 核心在1173 -->
<!-- 704有圖要抽換 -->

<!DOCTYPE html>

<html lang="zh-Hant-TW">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# zeczec-com: http://ogp.me/ns/fb/zeczec-com#">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="csrf-param" content="authenticity_token">
<meta name="csrf-token"
	content="at7SKlt/ImyGEJPpThvpFsPrcCvpbVMKG6UvAClXNinGclBO6imi1c4uGjybebZDHocPtRijEbgglqNwWft0hA==">
<script
	src="<%=request.getContextPath()%>/front-end/projDiscussion/discussion1_files/sdk.js.下載"
	async="" crossorigin="anonymous"></script>

<!-- jQuery加入這段  -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<!-- 加入這段 -->

<!--   sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="zh_TW" property="og:locale">
<meta content="zh_TW" property="og:locale:alternate">
<!-- <link
	href="https://www.zeczec.com/assets/logo-square-04c45286e84ea49d07c97c86625fbf3a75f4f32dd02da3ad3ca70a9a68fd0395.png"
	rel="apple-touch-icon">
<link
	href="https://www.zeczec.com/assets/fav-69601a279a66f2e6e31e508900d4f057559d3affcae42730d045b17d281107a6.png"
	rel="shortcut icon" type="image/x-icon"> -->
<title>我家門前有塊地 | ${projectVO.proj_name} |</title>
<link
	href="<%=request.getContextPath()%>/front-end/projDiscussion/discussion1_files/css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" media="all"
	href="<%=request.getContextPath()%>/front-end/projDiscussion/discussion1_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

</style>
</head>
<!-- 核心 -->
<body class="intent-mouse">

	<header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
		<div class="cf container">
			<div class="f6 mv2 flex items-center justify-between">
				<!-- <a clsas="dib order-0" href="https://www.zeczec.com/"> -->

				<img style="width: 160px"
					src="<%=request.getContextPath()%>/projPerk/addPerk_css/farmer_management/farmer_management.png"
					alt="HTML tutorial" style="width:42px;height:42px;">



				<div
					class="mt0-ns mt3 pt2 ph2 nb1 nl3 nr3 tc tl-ns pa0-ns mh0-ns items-center db-ns bt bn-ns b--near-white flex-auto order-last order-1-ns w-100 w-auto-ns inline-flex">

					<div class="divider dib-ns dn">&nbsp;</div>
					<a style="color: #717d34; font-size: 19px;"
						class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="https://www.zeczec.com/categories">認養專案管理</a>
					<div class="divider dib-ns dn">&nbsp;</div>
					<a style="color: #717d34; font-size: 19px;"
						class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="https://www.zeczec.com/categories">認養訂單管理</a>
					<div class="divider dib-ns dn">&nbsp;</div>
					<a style="color: #717d34; font-size: 19px;"
						class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="https://www.zeczec.com/start_project">小農日誌管理</a>
					<div class="divider dib-ns dn">&nbsp;</div>
					<a style="color: #717d34; font-size: 19px;"
						class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="https://www.zeczec.com/start_project">回到首頁</a>
				</div>
				<div class="tr order-2">
					<a aria-label="站內訊息"
						class="near-black dib gray pa2 mr3 v-mid tooltip tooltip-b"
						href="#"> <i style="font-size: 24px"
						class="material-icons f5 v-mid"> mail </i>
					</a>

				</div>
			</div>
		</div>
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
					<span class="order-0 flex-auto black w-100 w-auto-l"
						href="https://www.zeczec.com/account/cancelled"> <i
						class="material-icons v-mid dark-gray f3">error</i> 查看回饋方案
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
				<div class="pv2 ph0-l ph3">
					<a href="https://www.zeczec.com/projects/ICHR">
						<h2 class="f5 mb0 dib mt1 f5 b">${projectVO.proj_name}</h2>
					</a>
					<div class="gray f7 mb3">
						<span>由</span> <a class="b" href="#">${fmemSvc.getOneFMem(projectSvc.getOneProject(projectVO.proj_id).f_mem_id).f_mem_fname}</a><span
							class="mh2">發起</span>
					</div>
					<span class="b">目前總認養金額 NT$${projectVO.proj_total_fund}</span> <span
						class="f7 dark-gray"> / 目標 NT$${projectVO.proj_goal} </span>
				</div>
			</div>
		</div>
	</div>
	<p>
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	</p>


	<!-- 	<div class="container"></div> -->
	<div class="container cf" style="height: 27px">
		<!--     <h2 style="display: inline-block;" class="flex mt0">查看回饋方案</h2> -->


		<FORM METHOD="post"
			ACTION="<%=request.getContextPath()%>/projPerk/projPerk.do"
			name="form9">
			<input
				style="margin-right: 10px; float: right; display: inline; font-size: 16px;"
				type="submit" name="commit" value="回到編輯專案詳情"
				class="button green b--green b mb3"> <input type="hidden"
				name="action" value="go_back_to_listOneProjByFmem"> <input
				type="hidden" name="proj_id" value="<%=projectVO.getProj_id()%>">

		</FORM>


	</div>



	<div class="container mv4">
		<div>
			<div>
				<c:set var="projectVO" value="${projectVO}" scope="request" />
				<jsp:include page="discussionByMem.jsp" />
			</div>
		</div>
	</div>


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

<script>
	
	
									function insert(a,b,c,d,e)  {
										
										
										Swal.fire({
											  title: "回覆："+ e,
											  html:
									 			'<FORM METHOD="post" ACTION="'+
									 			a+
									 			'/projDiscussion/projDiscussion.do">'+
									 			'<input type="hidden" name="action" value="insertByMem" >'+
												'<input type="hidden" name="proj_id"  value="${projectVO.proj_id}" >'+
												'<input type="hidden" name="discussion_id"  value="'+
												c+
												'" >'+
												'<input type="hidden" name="f_mem_id"  value="${projectVO.f_mem_id}" >'+
												
												'<textarea placeholder="請輸入文字..." name="comment_content" maxlength="500" class="w-100" name="proj_abstract" id="proj_abstract"style="width: 250px; height: 250px;"></textarea><br>'+
												'<button type="submit" id="commit" class="swal2-confirm swal2-styled">送出</button>'+
											    '</FORM>',
											    confirmButtonText:"關閉視窗",
											    focusConfirm: false,
								 
								// 			先做小農的   '<input type="hidden" name="mem_id"  value="${projectVO.proj_id}" >'+ 
												
											    
											    
											  preConfirm: () => {
											    return [
											      document.getElementById('commit').value
											    ]
											  }
											})
										}
											
									
									
							function insertSideBar(a,b,c,d,e)  {
										
										
										Swal.fire({
											  title: "新增留言",
											  html:
									 			'<FORM METHOD="post" ACTION="'+
									 			a+
									 			'/projDiscussion/projDiscussion.do">'+
									 			'<input type="hidden" name="action" value="insertByMem" >'+
												'<input type="hidden" name="proj_id"  value="${projectVO.proj_id}" >'+
												'<input type="hidden" name="discussion_id"  value="-1" >'+
												'<input type="hidden" name="f_mem_id"  value="${projectVO.f_mem_id}" >'+
												
												'<textarea placeholder="請輸入文字..." name="comment_content" maxlength="500" class="w-100" name="proj_abstract" id="proj_abstract"style="width: 250px; height: 250px;"></textarea><br>'+
												'<button type="submit" id="commit" class="swal2-confirm swal2-styled">送出</button>'+
											    '</FORM>',
											    confirmButtonText:"關閉視窗",
											    focusConfirm: false,
								 
								// 			先做小農的   '<input type="hidden" name="mem_id"  value="${projectVO.proj_id}" >'+ 
												
											    
											    
											  preConfirm: () => {
											    return [
											      document.getElementById('commit').value
											    ]
											  }
											})
										}
									
									</script>
									<footer>

        <jsp:include page="/front-end/home/footer_for_Proj_Fmem.jsp" />
</footer>
</body>
</html>








