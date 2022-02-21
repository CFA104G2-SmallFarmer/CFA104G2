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
                <h2 style="color: #717d34;">註冊成功！</h2>
                <br>
                <h2 style="color: #717d34;">信箱驗證郵件已發出！</h2>
                <br>
                <h2 style="color: #717d34;">請至您的信箱收信！</h2>
                
                  <%--   <!-- form開始 -->
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" >

                        <div class="form-group"><span id="a4" style="line-height:32px;font-size:15px;"></span>
                            <input id="nickname" class="form-control" placeholder="暱稱 : 中文，英文字母和數字，2~15字之間" required="" maxlength="40" name="mem_nickname"
                                type="text">
                        </div>

                        <div class="form-group"><span id="a1" style="line-height:32px;font-size:15px;"></span>
                            <input id="username" class="form-control" placeholder="註冊信箱" required="" name="mem_acc" type="email">
                        </div>

                        <div class="form-group"><span id="a2" style="line-height:32px;font-size:15px;"></span>
                            <input id="password" class="form-control" placeholder="密碼 : 請輸入8-16個字，英文數字皆要有" required="" name="mem_pwd" type="password"
                                value="">
                        </div>

                        <div class="form-group"><span id="a3" style="line-height:32px;font-size:15px;"></span>
                            <input id="check_password" class="form-control" placeholder="確認密碼" required="" name="password_confirmation"
                                type="password" value="">
                        </div>
<input type="hidden" name="action" value="register">
                        <button id="btn" class="btn btn-block fRed btn-submit"
                            style="margin-top: 20px; height: 40px;" type="submit">註冊</button>

                    </FORM> --%>
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