<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel="stylesheet" href="./css/contact.css">
</head>
<body>
	<header class="header">
		<a href="./index.html" class="logo_img"><img src="./images/logo_img2.png"></a>
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
		<h1 class="title1">管理員登入</h1>

		<form class="the_form" action="<%=request.getContextPath()%>/back-end/administrator/adminLogin.do" method="post">

			<div class="item_block">
				<label>帳號：</label> <input type="text" name="account" value="" placeholder="請輸入 帳號">
			</div>
			<div class="item_block">
				<label>密碼：</label> <input type="password" name="password" value="" placeholder="請輸入 密碼">
			</div>
			<input type="hidden" name="action" value="login">
			<div class="item_block">
				<label></label>
				<button type="submit" class="btn_submit" value="ok">資料送出</button>
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
