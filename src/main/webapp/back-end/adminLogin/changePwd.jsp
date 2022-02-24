<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.administrator.model.*"%>


<%
Object account = session.getAttribute("account");
if (account == null) {
	session.setAttribute("location", request.getRequestURI());
	response.sendRedirect(request.getContextPath() + "/back-end/adminLogin/login.jsp");
	return;
}
AdministratorVO adminLoginVO = (AdministratorVO) session.getAttribute("adminLoginVO");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel="stylesheet" href="./css/contact.css">
</head>
<body>
	<header class="header">
    <a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp" class="logo_img"><img src="./images/logo_img2.png"></a>
    <nav class="nav">
      <ul class="link_list">
        <li><a href="./index.html" class="-on">最新消息</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp">小農商城</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp">農場旅遊</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp">農產認養</a></li>
      </ul>
    </nav>
  </header>
	<div class="banner_bg"></div>

	<main class="main">
		<h1 class="title1">變更密碼</h1>
		<h2 class="title2"><%=adminLoginVO.getAdmin_name()%>您好！請修改密碼：</h2>
		
		

		<form METHOD="post"
			ACTION="<%=request.getContextPath()%>/back-end/administrator/adminLogin.do" name="form1">
			<div>
			<label></label>
			
			</div>
			<div class="item_block">
				<label>新密碼：</label> <input type="password" name="password1" 
				value="" placeholder="請輸入 新密碼">
			</div>
			<div class="item_block">
				<label>確認密碼：</label> <input type="password" name="password2"
					value="" placeholder="確認 新密碼">
			</div>
			<input type="hidden" name="action" value="change_pwd">
			<div class="item_block">
				<label></label>
				<button type="submit" class="btn_submit">修改密碼</button>
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





	<footer class="footer"> &copy; All Rights Reserved </footer>

</body>
</html>
