<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.announcement.model.*"%>

<%
  AnnouncementVO announcementVO = (AnnouncementVO) request.getAttribute("announcementVO");
%>
<%= announcementVO==null %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>addAnnounce.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>addAnnounce.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announcement/announcement.do" name="form1">
<table>

	
	<tr>
		<td>公告類別:</td>
		<td><input type="TEXT" name="announce_type" size="45" 
		value="<%= (announcementVO==null)? "" : announcementVO.getAnnounce_type()%>" /></td>
	</tr>
	<tr>
		<td>管理員編號:</td>
		<td><input type="TEXT" name="admin_id" size="45" 
		value="<%= (announcementVO==null)? "" : announcementVO.getAdmin_id()%>" /></td>
	</tr>
	
	<tr>
		<td>公告標題:</td>
		<td><input type="TEXT" name="announce_title" size="45" 
		value="<%= (announcementVO==null)? "" : announcementVO.getAnnounce_title()%>" /></td>
	</tr>
	<tr>
		<td>公告內容:</td>
		<td><input type="TEXT" name="announce_content" size="45" 
		value="<%= (announcementVO==null)? "" : announcementVO.getAnnounce_content()%>" /></td>
	</tr>
	
	<tr>
		<td>公告時間:</td>
		<td><input name="edit_time" id="f_date1" type="text" ></td>
	</tr>
	




	


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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