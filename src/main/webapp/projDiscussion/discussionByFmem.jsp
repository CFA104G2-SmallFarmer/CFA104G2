<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projDiscussion.model.*"%>
<%@ page
	import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector"%>


<%
Integer proj_id = (Integer) request.getAttribute("proj_id");
ProjDiscussionService projDiscSvc = new ProjDiscussionService();
List<ProjDiscussionVO> list = projDiscSvc.getAllSameProjDiscussion(1003);
pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<!-- saved from url=(0072)https://join.gov.tw/policies/detail/960fce5c-823f-4398-bf3c-ed74f36375aa -->
<html lang="zh-Hant">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:image"
	content="https://join.gov.tw/attachments/09863bff-d947-11e5-8a04-b8ac6f2d65c0">
<link rel="icon" href="https://join.gov.tw/images/favicon.ico"
	type="image/x-icon">
<!-- <link href="./discussion1_files/font-awesome.min.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/scrolltabs.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/jquery-ui.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<link href="./discussion1_files/theme_21.1.css" rel="stylesheet"
	type="text/css">
<!-- <link href="./discussion1_files/theme_qa_toolbar.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/propose.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/extra_21.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/printable.1.css" type="text/css" -->
<!-- 	rel="stylesheet" media="print"> -->
<!-- <link href="./discussion1_files/jquery-ui.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/select2-4.1.min.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/slick.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!-- <link href="./discussion1_files/all.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->

</head>

<body>
	<div id="koBindMainContainer">
		<div id="cPageNewBox2021"
			class=" index_bg container1 m-auto policy-detail script_on_visible"
			style="display: block;">


			<a id="rdqBoardTop" class="moveableAnchor" style="display: none;">&nbsp;</a>
			<noscript>沒有 Javascript 無法參與討論</noscript>

			<%--
			<!-- prototype -->
			<ul>
				<c:forEach var="projDiscussionVO" items="${list}">
					<c:choose>
						<c:when
							test="${projDiscussionVO.comment_id==projDiscussionVO.discussion_id}">
							<li>${projDiscussionVO.comment_content} ${projDiscussionVO.comment_id}
							<c:set var="list" value="${list}" scope="request" /> 
							<c:set var="parentComment_id" value="${projDiscussionVO.comment_id}" scope="request" /> 
							<jsp:include page="UnitByFmem.jsp" />
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		--%>


			<!-- 核心 -->
			<div id="boardContainer" data-bind="with:boardViewModel">
				<div data-bind="visible: boardViewModel.isEnabled">
					<div class="flex-center">
						<p class="mb-0"></p>

					</div>
				</div>
				<div>
					<div class="item clearfix">
						<!-- 迭代區 -->
						<c:forEach var="projDiscussionVO" items="${list}">
							<c:choose>
								<c:when
									test="${projDiscussionVO.comment_id==projDiscussionVO.discussion_id}">

									<!-- 迭代內容區start -->

									<div class="message_show">
										<div>
											<div class="flex-center align-baseline message-text-wrap">
												<img class="message-user-image mr-2 j-lazyload"
													src="./discussion1_files/lecture_detail_03.jpg" alt=""
													data-original="/images/lecture_detail_03.jpg"
													data-bind="attr:{src:checkAuthorPicture($element)}">
												<div class="seconded-message-list">
													<div class="seconded-message-card mb-4">
														<div class="flex-between">
															<span class="text-gray message-date"> <!--ko text:beforeNow-->${projDiscussionVO.comment_date}
																<!--/ko-->
															</span>
														</div>

														<div class="flex-start message-image-size-sm">
															<!-- ko foreach: {data: images, as: 'rdqImage'} -->
															<!-- /ko -->
														</div>
														<div class="message-paragraph" aria-expanded="false"
															data-bind="attr:{id: &#39;mcb_&#39;+msgUid()}"
															id="mcb_1643435860632">
															<span data-bind="html:content4Html">${projDiscussionVO.comment_content}
															</span>
														</div>


														<div class="flex-between message-tool-wrapper">
															<div class="flex-start flex-wrap">
																<div>
																	<a class="report-btn text-gray" role="button"
																		title="編輯留言"
																		data-bind="visible:canOpenModifyBox, click:toggleEditBox"
																		style="display: none;">編輯</a> <a
																		class="report-btn text-gray" role="button"
																		title="刪除留言"
																		data-bind="visible:canOpenModifyBox, click:removeAction"
																		style="display: none;">刪除</a> <a
																		class="report-btn text-gray" role="button"
																		title="回覆留言"
																		data-bind="visible:boardViewModel.isEnabled, click:toggleReplyBox,text:replyBtnText"
																		onclick='insert("<%= request.getContextPath() %>","${projectVO.proj_id}","${projDiscussionVO.comment_id}","${projectVO.f_mem_id}","${projDiscussionVO.comment_content}")'>回覆</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>




									<!-- 迭代內容區end -->

									<c:set var="list" value="${list}" scope="request" />
									<c:set var="parentComment_id"
										value="${projDiscussionVO.comment_id}" scope="request" />
									<jsp:include page="UnitByFmem.jsp" />
								</c:when>
							</c:choose>


						</c:forEach>
						<!-- 迭代區 -->
					</div>
				</div>
				<!-- 					<div class="flex-center w-1001"> -->
				<!-- 						<button id="moreMsgBtn" class="mt-3 btn-primary-outline m-auto" -->
				<!-- 							data-bind="click: boardViewModel.moreMessage">查看更多留言</button> -->
				<!-- 					</div> -->
			</div>
		</div>
		<!-- /ko -->


		<!-- RWD設計，所以有兩塊重複 -->
		<div class="script_on_visible" style="display: block;">
			<div class="fixed-btn-d">
				<button class="fixed-btn-box">
					<span style="writing-mode: vertical-lr;"
						onclick='insertSideBar("<%= request.getContextPath() %>","${projectVO.proj_id}","${projDiscussionVO.comment_id}","${projectVO.f_mem_id}","${projDiscussionVO.comment_content}")'>新增留言</span>
				</button>
			</div>
			<div class="fixed-btn-m width-auto">
				<button class="fixed-btn-box">
					<span
						onclick='insertSideBar("<%= request.getContextPath() %>","${projectVO.proj_id}","${projDiscussionVO.comment_id}","${projectVO.f_mem_id}","${projDiscussionVO.comment_content}")'>
						新增留言</span>
				</button>
			</div>
		</div>
	</div>
	</div>
	<!--?xml version="1.0" encoding="UTF-8" ?-->

</body>
</html>