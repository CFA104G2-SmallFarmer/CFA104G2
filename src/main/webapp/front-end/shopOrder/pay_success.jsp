<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>

<%-- <%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%> --%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>
<%Integer mem_id = MemVO.getMem_id();%>

<!DOCTYPE html>
<html lang="en" class="js no-touch mdl-js">

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# flyingv: http://ogp.me/ns/fb/flyingv#">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta name="viewport" content="width=device-width,
    initial-scale=1.0">

    <title>我家門前有塊地</title>

    <meta name="description"
        content="flyingV is a Crowdfunding platform in Asia. flyingV 是一個群眾募資平台。我們正在打造一個環境，讓不限領域的創意，能更容易地實踐。">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/shopOrder/addMemByMem_css/all-19a228fd40.css">
</head>
<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
<style>
.header-wrapper{
height:120px;
margin-bottom:0px;
margin-top:10px;
}
/* bookstrap */
.color-btn{
  /**定義一串顏色，8個顏色，1|2號顏色和最後的7|8號顏色要相同，才能銜接上，看不出迴圈間斷*/
  background: linear-gradient(to right, #5adeff, #2ff598, #FFE419, #A2FF00, #31FFEE, #297BFF, #DC5AFF, #7D4DFF);
  /**動畫的寬度，8個顏色，寬度就是8-1=7*100%，最後一個顏色用來迴圈迴歸的。*/
  background-size: 700% 100%;
  /**動畫使用，線性移動，速率20秒*/
  animation: mymove 20s linear infinite;
  /**適配不同瀏覽器*/
  -webkit-animation: mymove 20s linear infinite;
  -moz-animation: mymove 20s linear infinite;
}
/**定義過度動畫*/
@-webkit-keyframes mymove {
        0% {background-position: 0% 0%;}
        100% {background-position: 100% 0%;}
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
            <img src="<%=request.getContextPath()%>/front-end/shopOrder/images/logoword.png" style="max-width: 320px;margin-top: 10px;" alt="">
            <div class="projectTitle">
                <!-- <h1 style="color: #434217;" class="text-center">註冊</h1> -->
            </div>


            <div class="login-block" style="padding-top:10px;">
               <!--  <p style="color: #434217;" class="bluequote small">註冊</p> -->

                <div style="text-align: center"class="registerFormWrapper" id="registerFormWrapper">
                <br>
                <br>
                <h2 style="color: #717d34;">付款成功！</h2>
                <br>
                <h2 style="color: #717d34;">您的訂單已送出！</h2>
                <br>
                <h2 style="color: #717d34;">請等待小農確認！</h2>
                
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


<!--                 <div class="login-block flex-display space-between "> -->
<%--                     <a href="<%=request.getContextPath()%>/front-end/shopOrder/listAllOrderByMem.jsp?mem_id=<%=mem_id%>&action=getAllMemOrder" class="btn fGhostred"> --%>
<!--                     <font size="1" class="color-btn">查看訂單</font> -->
<!--                     </a> -->
<!--                 </div> -->
                
                <div onclick="location.href='<%=request.getContextPath()%>/front-end/shopOrder/listAllOrderByMem.jsp?mem_id=<%=mem_id%>&action=getAllMemOrder'"  style="text-align:center;">
				<button class="color-btn btn btn-sm ">查看訂單</button>
				</div>            
            </div>
        </div>
    </div>

<jsp:include page="/front-end/home/footer.jsp" flush="true"/>

</body>

</html>