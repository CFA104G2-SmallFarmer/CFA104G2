<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.homeSlideShow.model.*"%>
<%@ page import="com.administrator.model.*"%>

<%
    Object account = session.getAttribute("account");                  
    if (account == null) {                                             
      session.setAttribute("location", request.getRequestURI());       
      response.sendRedirect(request.getContextPath()+"/back-end/adminLogin/login.jsp");  
      return;
    }
    AdministratorVO adminLoginVO = (AdministratorVO) session.getAttribute("adminLoginVO");
    if (adminLoginVO.getAdmin_type_id()==2 || adminLoginVO.getAdmin_type_id()==3) {                                             
    	try {                                                        
            String location = (String) session.getAttribute("location");
            if (location != null) {
              session.removeAttribute("location");
              response.sendRedirect(location);            
              return;
            }
          }catch (Exception ignored) { }
    	response.sendRedirect(request.getContextPath()+"/back-end/administrator/listOneAdmin_s.jsp");
       }
%>

<%
  HomeSlideShowVO homeSlideShowVO = (HomeSlideShowVO) request.getAttribute("homeSlideShowVO");
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
    <h1 class="title1">新增幻燈片</h1>
    <h2 class="title2">管理員編號:<%=adminLoginVO.getAdmin_id()%></h2>

      <FORM METHOD="post"
      ACTION="<%=request.getContextPath()%>/back-end/homeSlideShow/homeSlideShow.do"
      name="form1" enctype="multipart/form-data">

      

<!--       <div class="item_block"> -->
<!--         <label>圖片狀態:</label> -->
<!--         <input type="TEXT" name="hss_state" size="45" -->
<%-- 		value="<%=(homeSlideShowVO == null) ? "" : homeSlideShowVO.getHss_state()%>" /> --%>
<!--       </div> -->

      <div class="item_block">
        <label>圖片描述:</label>
        <input type="TEXT" name="hss_text" size="45"
					value="<%=(homeSlideShowVO == null) ? "" : homeSlideShowVO.getHss_text()%>" />
      </div>

      <div class="item_block">
        <label>發布時間：</label>
        <input name="hss_time" id="f_date1" type="text" >
      </div>

      <div class="item_block">
        <label>上架時間：</label>
        <input name="hss_on_shelf" id="f_date2" type="text" >
      </div>

      <div class="item_block">
        <label>下架時間：</label>
        <input name="hss_off_shelf" id="f_date3" type="text" >
      </div>

      <table class="table_p">
        <tr>
          <td>
           <img src=""
           style="width:625px;">
           <span><strong>請上傳圖片</strong></span>
         </td>
       </tr>
       <tr>
        <td>
         <input class="input_p" type="file" name="hss_img" value="" >
       </td>
     </tr>
   </table>




   <input type="hidden" name="action" value="insert"> 
   <input type="hidden" name="admin_id" value="<%=adminLoginVO.getAdmin_id()%>">
   <input type="hidden" name="hss_state" value="1">
   <div class="item_block">
   <label></label>
    <button type="submit" class="btn_submit">送出新增</button>
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

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
<%
java.sql.Date hss_time = null;
java.sql.Date hss_on_shelf = null;
java.sql.Date hss_off_shelf = null;
try {
	hss_time = homeSlideShowVO.getHss_time();
	hss_on_shelf = homeSlideShowVO.getHss_on_shelf();
	hss_off_shelf = homeSlideShowVO.getHss_off_shelf();
} catch (Exception e) {
	hss_time = new java.sql.Date(System.currentTimeMillis());
	hss_on_shelf = new java.sql.Date(System.currentTimeMillis());
	hss_off_shelf = new java.sql.Date(System.currentTimeMillis());
}
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
  src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
  width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
  height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              
         timepicker:false,      
         step: 1,                
         format:'Y-m-d',         
       value: '<%=hss_time%>'
  });
        $('#f_date2').datetimepicker({
            theme: '',              
           timepicker:false,      
           step: 1,                
           format:'Y-m-d',         
         value: '<%=hss_on_shelf%>'
  });
        $('#f_date3').datetimepicker({
            theme: '',              
           timepicker:false,      
           step: 1,                
           format:'Y-m-d',         
         value: '<%=hss_off_shelf%>'
  });
</script>
   </html>
