<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.announcement.model.*"%>
<%@ page import="com.administrator.model.*"%>



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
  
<iframe src="<%= request.getContextPath() %>/front-end/announcement/header.jsp" width="1400px"  frameborder="0" style="display: block;position: relative;left:-150px;"></iframe>

  <main class="main">
    <h1 class="title1">資訊詳情</h1>

    <table class="table_p">

      <tr>
        <td>公告種類</td>
        <td>${announce_type}</td>
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
      <button class="btn_submit"><a style="color:white;" href="<%=request.getContextPath()%>/front-end/announcement/listAllAnnounce.jsp">回公告列表</a></button>
    </div>
  </main>




</body>
</html>