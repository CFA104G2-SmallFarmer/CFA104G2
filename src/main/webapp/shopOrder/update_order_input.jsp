<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopOrder.model.*"%>

<%
  ShopOrderVO shopOrderVO = (ShopOrderVO) request.getAttribute("shopOrderVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>訂單資料修改</title>

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
	width: 1000px;
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
		 <h3>訂單資料修改</h3>
<%-- 		 <h4><a href="<%=request.getContextPath()%>/select_page.jsp"> --%>
		 <img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>訂單修改:</h3>

<%-- 錯誤表列 Start--%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<%-- 錯誤表列 End--%>
<!-- name -->
<FORM METHOD="post" ACTION="shopOrder.do" name="form1">
<table>
	<tr>
		<td>訂單編號:<font color=red><b>*</b></font></td>
		<td><%=shopOrderVO.getOrder_id()%></td>
	</tr>
	<tr>
		<td>訂單日期:<font color=red><b>*</b></font></td>
		<td><%=shopOrderVO.getOrder_date()%></td>
	</tr>
	<tr>
		<td>收件人姓名:</td>
		<td>
		<input type="TEXT" name="order_receiver" size="45" value="<%=shopOrderVO.getOrder_receiver()%>" /></td>
	</tr>
	<tr>
		<td>收件人電話:</td>
		<td><input type="TEXT" name="order_tel" size="45"	value="<%=shopOrderVO.getOrder_tel()%>" /></td>
	</tr>
	<tr>
		<td>收件人地址:</td>
		<td><input type="TEXT" name="order_add" size="45"	value="<%=shopOrderVO.getOrder_add()%>" /></td>
	</tr>
	<tr>
		<td>備註:</td>
		<td><input type="TEXT" name="order_add" size="45" value="<%=shopOrderVO.getOrder_memo()%>" /></td>
	</tr>

	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="order_id" value="<%=shopOrderVO.getOrder_id()%>">
<input type="submit" value="送出修改"></FORM>
<%=shopOrderVO.getOrder_id()%>
</body>



        
</html>