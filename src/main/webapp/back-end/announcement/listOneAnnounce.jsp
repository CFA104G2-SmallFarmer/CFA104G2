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

<%
    String t0 = "最新消息";
    String t1 = "活動訊息";
    String t2 = "平台公告";
    String announce_type;
    if(announcementVO.getAnnounce_type() == 0){
    	announce_type = t0;
    }else if (announcementVO.getAnnounce_type() == 1){
    	announce_type = t1;
    }else{
    	announce_type = t2;
    }
    pageContext.setAttribute("announce_type",announce_type);
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="./css/contact.css">
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $("tr:even").css("background-color", "#E8E8E8");
      $("tr:odd").css("background-color", "white");
    });
  </script>
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
    <h1 class="title1">資訊詳情</h1>

    <table class="table_p">
      <tr>
        <td width="120">公告編號</td>
        <td>${announcementVO.announce_id}</td>
      </tr>
      <tr>
        <td>公告種類</td>
        <td>${announce_type}</td>
      </tr>
      <tr>
        <td>管理員編號</td>
        <td>${announcementVO.admin_id}</td>
      </tr>
      <tr>
        <td>發布時間</td>
        <td>${announcementVO.edit_time}</td>
      </tr>
      <tr>
        <td>公告標題</td>
        <td>${announcementVO.announce_title}</td>
      </tr>
      <tr>
        <td colspan="2" height="150">公告內容:${announcementVO.announce_content}</td>
      </tr>
    </table>

    <div class="item_block">
      <label></label>
      <button class="btn_submit"><a style="color:white;" href="listAllAnnounce.jsp">回公告列表</a></button>
    </div>
  </main>



  <footer class="footer">
    &copy; All Rights Reserved
  </footer>

</body>
</html>