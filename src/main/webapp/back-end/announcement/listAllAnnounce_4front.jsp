<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.announcement.model.*"%>


<%
  AnnouncementService announcementService = new AnnouncementService();
  List<AnnouncementVO> list = announcementService.getAll();
    pageContext.setAttribute("list",list);
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
<iframe src="<%= request.getContextPath() %>/front-end/home/header.jsp" width="1400px"  frameborder="0" style="display: block;position: relative;left:-3500px;"></iframe>


    <main class="main">





      <br>

      <h1 class="title2">公告資訊</h1>

      <div class="item_block">
        <button class="btn_submit3"><a style="color:white;" href="listAllAnnounce_byType.jsp?pageType=0">最新消息列表</a></button>
      </div>
      <hr>

      <table class="table3">
        
        <c:forEach var="announcementVO" items="${list}" begin="0" end="8">
          <c:if test="${announcementVO.announce_type == 0}">

            <tr>

              <td width="110">${announcementVO.edit_time}</td>
              <td>${announcementVO.announce_title}</td>
              <td>${announcementVO.announce_content}</td>
              <td width="65">
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/announcement/announcement.do" style="margin-bottom: 0px;">
                 <input type="submit" value="詳情">
                 <input type="hidden" name="announce_id"  value="${announcementVO.announce_id}">
                 <input type="hidden" name="action" value="getOne_For_Display"></FORM>
               </td>
             </tr>
           </c:if>
         </c:forEach>
         
       </table>
       

       <hr>



       <div class="item_block">
        <button class="btn_submit3"><a style="color:white;" href="listAllAnnounce_byType.jsp?pageType=1">活動資訊列表</a></button>
      </div>

      <hr>

      

      <table class="table3">
        
        <c:forEach var="announcementVO" items="${list}" begin="0" end="8">
          <c:if test="${announcementVO.announce_type == 1}">

            <tr>

              <td width="110">${announcementVO.edit_time}</td>
              <td>${announcementVO.announce_title}</td>
              <td>${announcementVO.announce_content}</td>
              <td width="65">
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/announcement/announcement.do" style="margin-bottom: 0px;">
                 <input type="submit" value="詳情">
                 <input type="hidden" name="announce_id"  value="${announcementVO.announce_id}">
                 <input type="hidden" name="action" value="getOne_For_Display"></FORM>
               </td>
             </tr>
           </c:if>
         </c:forEach>
         
       </table>
       

      <hr>


      <div class="item_block">
        <button class="btn_submit3"><a style="color:white;" href="listAllAnnounce_byType.jsp?pageType=2">平台公告列表</a></button>
      </div>


      <hr>

      

      <table class="table3">
      
       
        
        <c:forEach var="announcementVO" items="${list}" begin="0" end="8">
          <c:if test="${announcementVO.announce_type == 2}">

            <tr>

              <td width="110">${announcementVO.edit_time}</td>
              <td>${announcementVO.announce_title}</td>
              <td>${announcementVO.announce_content}</td>
              <td width="65">
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/announcement/announcement.do" style="margin-bottom: 0px;">
                 <input type="submit" value="詳情">
                 <input type="hidden" name="announce_id"  value="${announcementVO.announce_id}">
                 <input type="hidden" name="action" value="getOne_For_Display"></FORM>
               </td>
             </tr>
           </c:if>
         </c:forEach>
         
       </table>
       

      <hr>

      
      
<%-- 錯誤表列 --%>
  <c:if test="${not empty errorMsgs}"> 
	<h1 class="title1" style="color:red">請修正以下錯誤:</h1>
		<c:forEach var="message" items="${errorMsgs}">
			<h2 class="title2" style="color:red">${message}</h2>
		</c:forEach>
  </c:if>






      
      <br><br><br><br><br><br><br>

    </main>
  </div>


<iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" frameborder="0" style="display: block;"></iframe>


</body>
</html>
