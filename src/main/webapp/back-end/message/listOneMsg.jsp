<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.message.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MessageVO messageVO = (MessageVO) request.getAttribute("messageVO");
%>

<html>
<head>
<title>員工資料 - listOneMsg.jsp</title>

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


<table id="table-1">
	<tr><td>
		 <h3>listOneMsg.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>訊息編號</th>
		<th>會員標號</th>
		<th>發訊會員編號</th>
		<th>通知時間</th>
		<th>訊息內容</th>
		<th>讀取狀態</th>
	
	</tr>
	<tr>
	

		<td>${messageVO.msg_no}</td>
		<td>${messageVO.mem_id}</td>
		<td>${messageVO.mem_id_send}</td>
		<td>${messageVO.msg_time}</td>
		<td>${messageVO.msg}</td>
		<td>${messageVO.read_state}</td>
		
	</tr>
</table>

</body>
</html>