<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%-- <%-- <% --%>
<!-- // ProjPerkVO projPerkVO = (ProjPerkVO) request.getAttribute("projPerkVO"); //EmpServlet.java(Concroller), 存入req的empVO物件  -->
<!-- // ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO"); -->
<%-- <%-- %> --%>

<!DOCTYPE html>
<html lang="en" class="js no-touch mdl-js">

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# flyingv: http://ogp.me/ns/fb/flyingv#">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta name="viewport" content="width=device-width,
    initial-scale=1.0">

    <title>我家門前有塊地</title>

    <meta name="description"
        content="flyingV is a Crowdfunding platform in Asia. flyingV 是一個群眾募資平台。我們正在打造一個環境，讓不限領域的創意，能更容易地實踐。">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/mem/addMemByMem_css/all-19a228fd40.css">
</head>
 <jsp:include page="/front-end/home/header2/header2.jsp" />  
<style>
.header-wrapper{
height:120px;
margin-bottom:0px;
margin-top:10px;
}

</style>
<body>
<!--  style="position:relative" -->
<!-- <iframe src="./header.jsp" width="100%"  scrolling="no" frameborder="0" style="z-index:999;position:relative" >
  你的瀏覽器不支援 iframe
</iframe> -->


    <div class="authBlock greyTitleBox" style="min-height: 80vh; ">
        <div class="container"
            style="z-index:888; position:relative ;max-width: 390px;display: block;border:#dfdcb3 solid 3px;border-radius: 15px;padding:20px ; background-color: #fff;">
            <img src="<%=request.getContextPath()%>/front-end/mem//logo/透明LOGO有字無框.png" style="max-width: 320px;margin-top: 10px;" alt="">
            <div class="projectTitle">
                <!-- <h1 style="color: #434217;" class="text-center">註冊</h1> -->
            </div>


            <div class="login-block" style="padding-top:10px;">
               <!--  <p style="color: #434217;" class="bluequote small">註冊</p> -->

                <div style="text-align: center"class="registerFormWrapper" id="registerFormWrapper">
                <br>
                <br>
                <h2 style="color: #717d34;">信箱驗證成功！</h2>
                <br>
                <h2 style="color: #717d34;">帳號已啟用！</h2>
                
         
                </div>
            </div>

            <div class="login-block">
            <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<!-- <font style="color:red">請修正以下錯誤:</font> -->
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


                <div class="login-block flex-display space-between">
                    <span class="dark"></span>
                    <a href="<%=request.getContextPath()%>/front-end/login/loginByMem.jsp" class="btn fGhostred">馬上登入</a>
                </div>
            </div>
        </div>
    </div>



</body>

</html>