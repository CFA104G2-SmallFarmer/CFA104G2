<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.administrator.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneAdmin.jsp</title>

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
		 <h3>ListOneAdmin.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

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
	</tr>
</table>

</body>
</html>