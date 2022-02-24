<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.announcement.model.*"%>
<%@ page import="com.administrator.model.*"%>

<%
    Object account = session.getAttribute("account");                  
    if (account == null) {                                             
      session.setAttribute("location", request.getRequestURI());       
      response.sendRedirect(request.getContextPath()+"/back-end/adminLogin/login.jsp");  
      return;
    }
    AdministratorVO adminLoginVO = (AdministratorVO) session.getAttribute("adminLoginVO");
    if (adminLoginVO.getAdmin_type_id()==2 || adminLoginVO.getAdmin_type_id()==3) {                                             
    	try {                                                        
            String location = (String) session.getAttribute("location");
            if (location != null) {
              session.removeAttribute("location");
              response.sendRedirect(location);            
              return;
            }
          }catch (Exception ignored) { }
    	response.sendRedirect(request.getContextPath()+"/back-end/administrator/listOneAdmin_s.jsp");
       }
%>

<%
  AnnouncementVO announcementVO = (AnnouncementVO) request.getAttribute("announcementVO");
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="./css/contact.css">
</head>
<body>
   <header class="header">
    <a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp" class="logo_img"><img src="./images/logo_img2.png"></a>
    <nav class="nav">
      <ul class="link_list">
        <li><a href="./index.html" class="-on">最新消息</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp">小農商城</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp">農場旅遊</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp">農產認養</a></li>
      </ul>
    </nav>
  </header>

  <div class="banner_bg"></div>

  <main class="main">
    <h1 class="title1">新增資訊</h1>
    <h2 class="title2">管理員編號:<%=adminLoginVO.getAdmin_id()%></h2>

    <form method="post" action="<%=request.getContextPath()%>/back-end/announcement/announcement.do" name="form1">

    

      <div class="item_block">
        <label>發布時間：</label>
        <input name="edit_time" id="f_date1" type="text" >
      </div>


      <div class="item_block">
        <label>公告種類：</label>
        <div class="reply_block">

          <div class="radio_block">
            <input type="radio" id="announce_0" name="announce_type" value="0">
            <label for="announce_0">最新消息</label>
          </div>

          <div class="radio_block">
            <input type="radio" id="announce_1" name="announce_type" value="1">
            <label for="announce_1">活動訊息</label>
          </div>

          <div class="radio_block">
            <input type="radio" id="announce_2" name="announce_type" value="2">
            <label for="announce_2">平台公告</label>
          </div>

        </div>
      </div>
      <div class="item_block">
        <label>標題：</label>
        <input type="TEXT" name="announce_title" size="45" 
        value="<%= (announcementVO==null)? "" : announcementVO.getAnnounce_title()%>" />
      </div>
    
        <div class="item_block">
          <label>內容：</label>
          <textarea class="notes" name="announce_content">
            <%= (announcementVO==null)? "" : announcementVO.getAnnounce_content()%>
          </textarea>
        </div>
        
        
        
        <input type="hidden" name="action" value="insert">
        <input type="hidden" name="admin_id" value="<%=adminLoginVO.getAdmin_id()%>">
        <div class="item_block">
          <label></label>
          <button type="submit" class="btn_submit">送出新增</button>
        </div>

      </form>
      <%-- 錯誤表列 --%>
  		<c:if test="${not empty errorMsgs}"> 
		<h1 class="title1" style="color:red">請修正以下錯誤:</h1>
		<c:forEach var="message" items="${errorMsgs}">
			<h2 class="title2" style="color:red">${message}</h2>
		</c:forEach>
 	    </c:if>

    </main>

    <footer class="footer">
      &copy; All Rights Reserved
    </footer>

  </body>

  <% 
    java.sql.Date editTime = null;
    try {
      editTime = announcementVO.getEdit_time();
    } catch (Exception e) {
     editTime = new java.sql.Date(System.currentTimeMillis());
   }
 %>

 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
 <script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
 <script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

 <style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
   width:  300px;   /* width:  300px; */
 }
 .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
   height: 151px;   /* height:  151px; */
 }
</style>

<script>
  $.datetimepicker.setLocale('zh');
  $('#f_date1').datetimepicker({
         theme: '',              //theme: 'dark',
         timepicker:false,       //timepicker:true,
         step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
         format:'Y-m-d',         //format:'Y-m-d H:i:s',
       value: '<%=editTime%>', // value:   new Date(),
     });

   </script>
   </html>