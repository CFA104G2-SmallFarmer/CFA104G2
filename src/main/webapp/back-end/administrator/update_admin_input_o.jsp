<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.administrator.model.*"%>

<%
  AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<%= administratorVO==null %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>update_admin_input.jsp</title>

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
		 <h3>update_admin_input.jsp</h3>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/administrator/administrator.do" 
	  name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>管理員編號:<font color=red><b>*</b></font></td>
		<td><%=administratorVO.getAdmin_id()%></td>
	</tr>

	<tr>
		<td>帳號:</td>
		<td><input type="TEXT" name="admin_acc" size="45" value="<%=administratorVO.getAdmin_acc()%>" /></td>
	</tr>
	<tr>
		<td>密碼:</td>
		<td><input type="TEXT" name="admin_pwd" size="45" value="<%=administratorVO.getAdmin_pwd()%>" /></td>
	</tr>
	<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="admin_isdeleted" size="45" value="<%=administratorVO.getAdmin_isdeleted()%>" /></td>
	</tr>
	<tr>
		<td>姓名:</td>
		<td><input type="TEXT" name="admin_name" size="45" value="<%=administratorVO.getAdmin_name()%>" /></td>
	</tr>
	<tr>
		<td>信箱:</td>
		<td><input type="TEXT" name="admin_email" size="45" value="<%=administratorVO.getAdmin_email()%>" /></td>
	</tr>
	<tr>
		<td>手機:</td>
		<td><input type="TEXT" name="admin_mobile" size="45" value="<%=administratorVO.getAdmin_mobile()%>" /></td>
	</tr>
	<tr>
		<td>郵遞區號:</td>
		<td><input type="TEXT" name="admin_zipcode" size="45"	value="<%=administratorVO.getAdmin_zipcode()%>" /></td>
	</tr>
	<tr>
		<td>城市:</td>
		<td><input type="TEXT" name="admin_city" size="45"	value="<%=administratorVO.getAdmin_city()%>" /></td>
	</tr>
	<tr>
		<td>地區:</td>
		<td><input type="TEXT" name="admin_dist" size="45" value="<%=administratorVO.getAdmin_dist()%>" /></td>
	</tr>
	<tr>
		<td>地區:</td>
		<td><input type="TEXT" name="admin_addr" size="45" value="<%=administratorVO.getAdmin_addr()%>" /></td>
	</tr>
	<tr>
		<td>圖片重傳:</td>
		<td><input type="file" name="admin_pic" size="45" value="" /></td>
	</tr>
	<tr>
		<td>到職日:</td>
		<td><input name="admin_hiredate" id="f_date1" type="text" ></td>
	</tr>
	<tr>
		<td>離職日:</td>
		<td><input name="admin_leavedate" id="f_date2" type="text" ></td>
	</tr>

	<jsp:useBean id="adminTypeService" scope="page" class="com.adminType.model.AdminTypeService" />
	<tr>
		<td>類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="admin_type_id">
			<c:forEach var="adminTypeVO" items="${adminTypeService.all}">
				<option value="${adminTypeVO.admin_type_id}" ${(administratorVO.admin_type_id==adminTypeVO.admin_type_id)?'selected':'' } >${adminTypeVO.admin_type_name}
			</c:forEach>
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="admin_id" value="<%=administratorVO.getAdmin_id()%>">
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
 		   value: '<%=administratorVO.getAdmin_hiredate()%>', // value:   new Date(),
        });
        
        $('#f_date2').datetimepicker({
            theme: '',              //theme: 'dark',
  	       timepicker:false,       //timepicker:true,
  	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
  		   value: '<%=administratorVO.getAdmin_leavedate()%>', // value:   new Date(),
         });
        
   
</script>
</html>