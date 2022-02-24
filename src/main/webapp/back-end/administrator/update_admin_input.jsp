<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.administrator.model.*"%>

<%
  AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="./css/contact.css">
</head>
<body>
  <header class="header">
    <a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp" class="logo_img"><img src="./images/logo_img2.png"></a>
    <nav class="nav">
      <ul class="link_list">
        <li><a href="<%=request.getContextPath()%>/front-end/announcement/listAllAnnounce.jsp" class="-on">最新消息</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp">小農商城</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp">農場旅遊</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp">農產認養</a></li>
      </ul>
    </nav>
  </header>



  <div class="banner_bg"></div>

  <main class="main">
    <h1 class="title1">修改管理員資料</h1>
    <h2 class="title2">管理員編號:<%=administratorVO.getAdmin_id()%></h2>

    <form class="the_form" method="post" 
    action="<%=request.getContextPath()%>/back-end/administrator/administrator.do" 
    name="form1" enctype="multipart/form-data">

    <div class="item_block">
      <label>姓名：</label>
      <input type="text" name="admin_name" placeholder="請輸入 姓名"
      value="<%=administratorVO.getAdmin_name()%>" />
    </div>
    <div class="item_block">
      <label>帳號：</label>
      <input type="text" name="admin_acc" placeholder="請輸入 帳號" 
      value="<%=administratorVO.getAdmin_acc()%>" />
    </div>
<!--     <div class="item_block"> -->
<!--       <label>密碼：</label> -->
<!--       <input type="text" name="admin_pwd" placeholder="請輸入 密碼"  -->
<%--       value="<%=administratorVO.getAdmin_pwd()%>" /> --%>
<!--     </div> -->
    <div class="item_block">
      <label>手機：</label>
      <input type="text" name="admin_mobile" placeholder="請輸入 手機" 
      value="<%=administratorVO.getAdmin_mobile()%>" />
    </div>
    <div class="item_block">
      <label>Email：</label>
      <input type="text" name="admin_email" placeholder="請輸入 Email" 
      value="<%=administratorVO.getAdmin_email()%>" />   
    </div>
    <div class="item_block">
      <label>郵遞區號：</label>
      <input type="text" name="admin_zipcode" placeholder="請輸入 郵遞區號" 
      value="<%=administratorVO.getAdmin_zipcode()%>" />     
    </div>
    <div class="item_block">
      <label>縣市：</label>
      <input type="text" name="admin_city" placeholder="請輸入 縣市"  
      value="<%=administratorVO.getAdmin_city()%>" />   
    </div>
    <div class="item_block">
      <label>地區：</label>
      <input type="text" name="admin_dist" placeholder="請輸入 地區" 
      value="<%=administratorVO.getAdmin_dist()%>" />   
    </div>
    <div class="item_block">
      <label>地址：</label>
      <input type="text" name="admin_addr" placeholder="請輸入 地址" 
      value="<%=administratorVO.getAdmin_addr()%>" />     
    </div>

    <table class="table_p">
      <tr>
        <td>
         <img src="<%=request.getContextPath()%>/back-end/administrator/adminImgReader.do?id=${administratorVO.admin_id}">
         <span><strong>請上傳圖片</strong></span>
       </td>
     </tr>
     <tr>
      <td>
       <input class="input_p" type="file" name="admin_pic" value="" >
     </td>
   </tr>
 </table>

 <div class="item_block">
  <label>到職日：</label>
  <input name="admin_hiredate" id="f_date1" type="text" >
</div>

<div class="item_block">
  <label>離職日：</label>
  <input name="admin_leavedate" id="f_date2" type="text" >
</div>


<div class="item_block">

  <label>管理員類別：</label>
  <div class="reply_block">
    <div class="radio_block">
      <input type="radio" id="1" name="admin_type_id" value="1">
      <label for="1">全站管理員</label>
    </div>
    <div class="radio_block">
      <input type="radio" id="2" name="admin_type_id" value="2">
      <label for="2">會員管理員</label>
    </div>
    <div class="radio_block">
      <input type="radio" id="3" name="admin_type_id" value="3">
      <label for="3">檢舉管理員</label>
    </div>
    <div class="radio_block">
      <input type="radio" id="4" name="admin_type_id" value="4">
      <label for="4">前台網頁管理</label>
    </div>   
  </div>

  <div class="item_block">
    <label>狀態：</label>
    <div class="reply_block">
      <div class="radio_block">
        <input type="radio" id="on_the_job" name="admin_isdeleted" value="1" checked>
        <label for="on_the_job">在職</label>
      </div>
      <div class="radio_block">
        <input type="radio" id="leave" name="admin_isdeleted" value="0">
        <label for="leave">離職</label>
      </div>
    </div>
  </div>
</div>

<input type="hidden" name="action" value="update">
<input type="hidden" name="admin_id" value="<%=administratorVO.getAdmin_id()%>">
<input type="hidden" name="admin_pwd" value="<%=administratorVO.getAdmin_pwd()%>">
<input type="hidden" name="admin_leavedate" value="">
<div class="item_block">
  <label></label>
  <button type="submit" class="btn_submit">送出修改</button>
</div>
</form>

<%-- 錯誤表列 --%>
  <c:if test="${not empty errorMsgs}"> 
	<h1 class="title1" style="color:red">請修正以下錯誤:</h1>
		<c:forEach var="message" items="${errorMsgs}">
			<h2 class="title2" style="color:red">${message}</h2>
		</c:forEach>
  </c:if>


</main>

<footer class="footer">
  &copy; All Rights Reserved
</footer>

</body>

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
        value: '', // value:   new Date(),
     });


</script>
</html>
