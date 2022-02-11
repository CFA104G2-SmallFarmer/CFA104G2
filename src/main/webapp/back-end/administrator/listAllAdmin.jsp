
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.administrator.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    AdministratorService administratorService = new AdministratorService();
    List<AdministratorVO> list = administratorService.getAll();
    pageContext.setAttribute("list",list);
%>

<!-- List<EmpVO> list = dao.getAll();也可以動 -->

<html>
<head>
<title>listAllAdmin.jsp</title>

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
	width: 1200px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid black;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>listAllAdmin.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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
		<th>管理員編號</th>
		<th>類別編號</th>
		<th>帳號</th>
		<th>密碼</th>
		<th>狀態</th>
		<th>姓名</th>
		<th>信箱</th>
		<th>手機</th>
		<th>郵遞區號</th>
		<th>城市</th>
		<th>地區</th>
		<th>地址</th>
		<th>到職日</th>
		<th>離職日</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="administratorVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${administratorVO.admin_id}</td>
			<td>${administratorVO.admin_type_id}</td>
			<td>${administratorVO.admin_acc}</td>
			<td>${administratorVO.admin_pwd}</td>
			<td>${administratorVO.admin_isdeleted}</td>
			<td>${administratorVO.admin_name}</td>
			<td>${administratorVO.admin_email}</td>
			<td>${administratorVO.admin_mobile}</td>
			<td>${administratorVO.admin_zipcode}</td>
			<td>${administratorVO.admin_city}</td>
			<td>${administratorVO.admin_dist}</td>
			<td>${administratorVO.admin_addr}</td>
			<td>${administratorVO.admin_hiredate}</td>
			<td>${administratorVO.admin_leavedate}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/administrator/administrator.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="admin_id"  value="${administratorVO.admin_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/administrator/administrator.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="admin_id"  value="${administratorVO.admin_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>