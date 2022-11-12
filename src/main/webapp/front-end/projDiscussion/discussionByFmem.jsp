<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.project.model.*" %>
<%@ page import="com.projDiscussion.model.*" %>
<%@ page
        import="java.time.LocalDate,java.sql.Timestamp,java.util.Vector" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
    Integer proj_id = projectVO.getProj_id();
    ProjDiscussionService projDiscSvc = new ProjDiscussionService();
    List<ProjDiscussionVO> list = projDiscSvc.getAllSameProjDiscussion(proj_id);
    pageContext.setAttribute("list", list);
%>

<jsp:useBean id="fmemSvc" scope="page"
             class="com.fMem.model.FMemService"/>
<jsp:useBean id="memSvc" scope="page"
             class="com.mem.model.MemService"/>


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
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/font-awesome.min.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/scrolltabs.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/jquery-ui.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/theme_21.1.css"
          rel="stylesheet"
          type="text/css">
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/theme_qa_toolbar.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/propose.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/extra_21.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/printable.1.css" type="text/css" -->
    <!-- 	rel="stylesheet" media="print"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/jquery-ui.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/select2-4.1.min.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/slick.css" rel="stylesheet" -->
    <!-- 	type="text/css"> -->
    <!-- <link href="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/all.css" rel="stylesheet" -->
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

            <!-- RWD設計，所以有兩塊重複 -->
            <div class="script_on_visible" style="display: block;">
                <%--			<div class="fixed-btn-d">--%>
                <%--				<button class="fixed-btn-box">--%>
                <%--					<span style="writing-mode: vertical-lr;"--%>
                <%--						onclick='insertSideBar("<%= request.getContextPath() %>","${projectVO.proj_id}","${projDiscussionVO.comment_id}","${projectVO.f_mem_id}","${projDiscussionVO.comment_content}")'>新增留言</span>--%>
                <%--				</button>--%>
                <%--			</div>--%>
                <div class="fixed-btn-m width-auto"
                     style="display: flex;  align-items: center; justify-content: right;">
                    <button class="fixed-btn-box" style="background-color: #2e7d32;color: white ; alignment: center">
					<span style="color: white"
                          onclick='insertSideBar("<%= request.getContextPath() %>","${projectVO.proj_id}","${projDiscussionVO.comment_id}","${projectVO.f_mem_id}","${projDiscussionVO.comment_content}")'>
						新增留言</span>
                    </button>
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

                                            <c:choose>
                                                <c:when test="${projDiscussionVO.f_mem_id==0}">
                                                    <img class="message-user-image mr-2 j-lazyload"
                                                         style="height:50px;width: 50px;border: #0a0a0a; border-radius: 10px"
                                                         src="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/mem_icon.png"
                                                         alt=""
                                                         data-original="/images/lecture_detail_03.jpg"
                                                         data-bind="attr:{src:checkAuthorPicture($element)}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="message-user-image mr-2 j-lazyload"
                                                         style="height:50px;width: 50px;border: #0a0a0a; border-radius: 10px"
                                                         src="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/fmem_icon.png"
                                                         alt=""
                                                         data-original="/images/lecture_detail_03.jpg"
                                                         data-bind="attr:{src:checkAuthorPicture($element)}">
                                                </c:otherwise>
                                            </c:choose>


                                            <div class="seconded-message-list"
                                                 style="border:2px; border-radius: 10px;background-color:#eee;">

                                                <div class="seconded-message-card mb-4">
                                                    <div class="flex-between">
                                                        <span class="text-gray message-date" style="margin: 5px">${memSvc.getOneMem(projDiscussionVO.mem_id).mem_nickname}${fmemSvc.getOneFMem(projDiscussionVO.f_mem_id).f_mem_fname}</span>
                                                        <span class="text-gray message-date" style="margin: 5px"> <!--ko text:beforeNow-->${projDiscussionVO.comment_date}
                                                            <!--/ko-->
															</span>
                                                    </div>

                                                    <div class="flex-start message-image-size-sm">
                                                        <!-- ko foreach: {data: images, as: 'rdqImage'} -->
                                                        <!-- /ko -->
                                                    </div>
                                                    <div class="message-paragraph" aria-expanded="false" style="text-align: left;margin: 5px"
                                                         style="text-align: left"
                                                         data-bind="attr:{id: &#39;mcb_&#39;+msgUid()}"
                                                         id="mcb_1643435860632">
															<span data-bind="html:content4Html">${projDiscussionVO.comment_content}
                                                            </span>
                                                    </div>

                                                    <div class="flex-between">
                                                        <span class="text-gray message-date"></span>
                                                        <a title="回覆留言" style="color: black; margin: 5px"
                                                           data-bind="visible:boardViewModel.isEnabled, click:toggleReplyBox,text:replyBtnText"
                                                           onclick='insert("<%= request.getContextPath() %>","${projectVO.proj_id}","${projDiscussionVO.comment_id}","${projectVO.f_mem_id}","${fn:escapeXml(projDiscussionVO.comment_content)}")'>
                                                            <button class="fixed-btn-box"
                                                                    style="background-color:white; alignment: center">
                                                        <span class="text-gray message-date" >
                                                        回覆
                                                          </span>
                                                            </button></a>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- 迭代內容區end -->

                                <c:set var="list" value="${list}" scope="request"/>
                                <c:set var="parentComment_id"
                                       value="${projDiscussionVO.comment_id}" scope="request"/>
                                <jsp:include page="UnitByFmem.jsp"/>
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


</div>
</div>
<!--?xml version="1.0" encoding="UTF-8" ?-->

</body>
</html>