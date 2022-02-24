<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.announcement.model.*"%>
<%@ page import="com.administrator.model.*"%>



<%
  AnnouncementService announcementService = new AnnouncementService();
  List<AnnouncementVO> list = announcementService.getAll();
    pageContext.setAttribute("list",list);
    String pageType = request.getParameter("pageType");
    Integer type = Integer.parseInt(pageType);
    pageContext.setAttribute("type",type);
    String h1 = "最新消息";
    String h2 = "活動訊息";
    String h3 = "平台公告";
    String head;
    if(type == 0){
      head = h1;
    }else if (type == 1){
      head = h2;
    }else{
      head = h3;
    }
    pageContext.setAttribute("head",head);
%>


  <!DOCTYPE html>
  <html lang="zh-Hant">
  <head>
    <meta charset="utf-8">

  <title></title>
  <link rel="stylesheet" href="./css/index.css">

  <link rel="stylesheet" href="./css/index_mobile.css">
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $("tr:even").css("background-color", "#E8E8E8");
      $("tr:odd").css("background-color", "white");
    });
  </script>
</head>
<body>




    <div class="main_container">
  <iframe src="<%= request.getContextPath() %>/front-end/announcement/header.jsp" width="1400px"  frameborder="0" style="display: block;position: relative;left:-350px;"></iframe>
      

      <main class="main">
        <br>

        <h1 class="title2">${head}</h1><hr>

        <table class="table3">
          <c:forEach var="announcementVO" items="${list}" >
            <c:if test="${announcementVO.announce_type == type}">
              <tr>
                <td width="110">${announcementVO.edit_time}</td>
                <td>${announcementVO.announce_title}</td>
                <td>${announcementVO.announce_content}</td>
                <td width="65">
                  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/announcement/announcement.do" style="margin-bottom: 0px;">
                   <input type="submit" value="詳情">
                   <input type="hidden" name="announce_id"  value="${announcementVO.announce_id}">
                   <input type="hidden" name="action" value="getOne_From_Front"></FORM>
                 </td>
            

               </tr>
             </c:if>
           </c:forEach>
         </table>

         <hr>

		    <div class="item_block">
   		 
    		  <button class="btn_submit"><a style="color:white;" href="<%=request.getContextPath()%>/front-end/announcement/listAllAnnounce.jsp">回公告列表</a></button>
   			 </div>
  	</main>
        
<%-- 錯誤表列 --%>
  <c:if test="${not empty errorMsgs}"> 
	<h1 class="title1" style="color:red">請修正以下錯誤:</h1>
		<c:forEach var="message" items="${errorMsgs}">
			<h2 class="title2" style="color:red">${message}</h2>
		</c:forEach>
  </c:if>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      </main>
    



  </body>
  </html>
