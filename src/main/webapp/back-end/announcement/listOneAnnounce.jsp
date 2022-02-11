<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.announcement.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  AnnouncementVO announcementVO = (AnnouncementVO) request.getAttribute("announcementVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneAnnounce.jsp</title>

<style>
  table#table-1 {
	background-color: white;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>listOneAnnounce.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>公告編號</th>
		<th>公告類別</th>
		<th>管理員編號</th>
		<th>公告時間</th>
		<th>公告標題</th>
		<th>公告內容</th>
	
	</tr>
	<tr>

		<td>${announcementVO.announce_id}</td>
		<td>${announcementVO.announce_type}</td>
		<td>${announcementVO.admin_id}</td>
		<td>${announcementVO.edit_time}</td>
		<td>${announcementVO.announce_title}</td>
		<td>${announcementVO.announce_content}</td>
		
	</tr>
</table>

</body>
</html>