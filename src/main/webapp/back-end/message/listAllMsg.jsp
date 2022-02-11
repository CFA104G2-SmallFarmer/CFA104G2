<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.message.model.*"%>

<%
    MessageService messageService = new MessageService();
	List<MessageVO> list = messageService.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listAllMessage</title>
<style>
table#table-1 {
	background-color: #CCCCFF;
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
	width: 800px;
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
<body>

<body bgcolor='white'>


<table id="table-1">
	<tr><td>
		 <h3>listAllMsg.jsp</h3>
		 <h4><a href="select_page.jsp">回select_page</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>訊息編號</th>
		<th>會員編號</th>
		<th>發訊會員編號</th>
		<th>通知時間</th>
		<th>訊息內容</th>
		<th>讀取狀態</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="MessageVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
		<td>${MessageVO.msg_no}</td>
		<td>${MessageVO.mem_id}</td>
		<td>${MessageVO.mem_id_send}</td>
		<td>${MessageVO.msg_time}</td>
		<td>${MessageVO.msg}</td>
		<td>${MessageVO.read_state}</td>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/message/message.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="msg_no"  value="${MessageVO.msg_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/message/message.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="msg_no"  value="${MessageVO.msg_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
			
		</tr>
	</c:forEach>
</table>

<%@ include file="page2.file" %>
</body>

</body>
</html>

