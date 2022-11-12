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
    List<ProjDiscussionVO> list = (List<ProjDiscussionVO>) request.getAttribute("list");
    Integer parentComment_id = (Integer) request.getAttribute("parentComment_id");
    pageContext.setAttribute("list", list);
    pageContext.setAttribute("parentComment_id", parentComment_id);
%>


<jsp:useBean id="fmemSvc" scope="page"
             class="com.fMem.model.FMemService"/>
<jsp:useBean id="memSvc" scope="page"
             class="com.mem.model.MemService"/>

<%--
<ul>
	<c:forEach var="projDiscussionVO" items="${list}">
		<c:choose>
			<c:when test="${parentComment_id==projDiscussionVO.discussion_id && projDiscussionVO.comment_id!=projDiscussionVO.discussion_id}">
				<li>${projDiscussionVO.comment_content} ${projDiscussionVO.comment_id}
				<c:set var="list"
						value="${list}" scope="request" /> 
				<c:set var="parentComment_id"
						value="${projDiscussionVO.comment_id}" scope="request" /> 								
				<jsp:include page="UnitByFmem.jsp" />
				</li>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ul>
--%>


<div class="reply_box">
    <div class="message_show reply_item message-board-child-wrap"
    "data-bind="template:{name:templateToUse, afterRender: afterRenderMessageShowTemplate}">
    <div>
        <c:forEach var="projDiscussionVO" items="${list}">
            <c:choose>
                <c:when
                        test="${parentComment_id==projDiscussionVO.discussion_id && projDiscussionVO.comment_id!=projDiscussionVO.discussion_id}">

                    <div class="flex-center align-baseline message-text-wrap" >

                        <c:choose>
                            <c:when test="${projDiscussionVO.f_mem_id==0}">
                                <img class="message-user-image mr-2 j-lazyload" style="height:50px;width: 50px;border: #0a0a0a; border-radius: 10px"
                                     src="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/mem_icon.png"
                                     alt=""
                                     data-original="/images/lecture_detail_03.jpg"
                                     data-bind="attr:{src:checkAuthorPicture($element)}">
                            </c:when>
                            <c:otherwise>
                                <img class="message-user-image mr-2 j-lazyload" style="height:50px;width: 50px;border: #0a0a0a; border-radius: 10px"
                                     src="<%= request.getContextPath() %>/front-end/projDiscussion/discussion1_files/fmem_icon.png"
                                     alt=""
                                     data-original="/images/lecture_detail_03.jpg"
                                     data-bind="attr:{src:checkAuthorPicture($element)}">
                            </c:otherwise>
                        </c:choose>
                        <div class="seconded-message-list" style="border:2px; border-radius: 10px;background-color:#eee;">
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
                                     data-bind="attr:{id: &#39;mcb_&#39;+msgUid()}"
                                     id="mcb_1643456420198">
                                    <p data-bind="html:content4Html">
                                            ${projDiscussionVO.comment_content}</p>
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


                    <c:set var="list" value="${list}" scope="request"/>
                    <c:set var="parentComment_id"
                           value="${projDiscussionVO.comment_id}" scope="request"/>
                    <jsp:include page="UnitByFmem.jsp"/>

                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>
        </c:forEach>

    </div>
</div>
</div>



