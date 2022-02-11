<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.message.model.*"%>

<%
MessageVO messageVO = (MessageVO) request.getAttribute("messageVO");
%>
<%= messageVO==null %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>update_msg_input.jsp</title>

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
		 <h3>update_msg_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/message/message.do" name="form1">
<table>
	<tr>
		<td>訊息編號:<font color=red><b>*</b></font></td>
		<td><%=messageVO.getMsg_no()%></td>
	</tr>

	<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="mem_id" size="45" value="<%=messageVO.getMem_id()%>" /></td>
	</tr>
	<tr>
		<td>發訊會員編號:</td>
		<td><input type="TEXT" name="mem_id_send" size="45" value="<%=messageVO.getMem_id_send()%>" /></td>
	</tr>
	<tr>
		<td>訊息內容:</td>
		<td><input type="TEXT" name="msg" size="45" value="<%=messageVO.getMsg()%>" /></td>
	</tr>
	<tr>
		<td>讀取狀態:</td>
		<td><input type="TEXT" name="read_state" size="45" value="<%=messageVO.getRead_state()%>" /></td>
	</tr>
	<tr>
		<td>通知時間:</td>
		<td><input name="msg_time" id="f_date1" type="text" ></td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="msg_no" value="<%=messageVO.getMsg_no()%>">
<input type="submit" value="送出修改"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
 		   value: '<%=messageVO.getMsg_time()%>', // value:   new Date(),
        });
        
      
   
</script>
</html>