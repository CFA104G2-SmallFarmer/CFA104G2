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
		<a href="./index.html" class="logo_img"><img
			src="./images/logo_img2.png"></a>
		<nav class="nav">
			<ul class="link_list">
				<li><a href="./index.html" class="-on">最新消息</a></li>
				<li><a href="./contact.html">小農商城</a></li>
				<li><a href="./contact.html">農場旅遊</a></li>
				<li><a href="./contact.html">農產認養</a></li>
			</ul>
		</nav>
	</header>
	<div class="banner_bg"></div>

	<main class="main">
		<h1 class="title1">變更密碼</h1>
		<h2 class="title2"><%=adminLoginVO.getAdmin_name()%>您好！請修改密碼：</h2>

		<form METHOD="post"
			ACTION="<%=request.getContextPath()%>/back-end/administrator/adminLogin.do" name="form1">

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
		<c:if test="${not empty errorMsgs}">
	    <ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	    </ul>
        </c:if>
	</main>





	<footer class="footer"> &copy; All Rights Reserved </footer>

</body>
</html>
