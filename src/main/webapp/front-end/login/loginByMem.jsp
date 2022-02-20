<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>



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
<header>
       <%--   <jsp:include page="/front-end/home/header.jsp" /> 這個會失敗--%>
       
<%--           <jsp:include page="<%=request.getContextPath()%>/front-end/home/header2.jsp"/>  --%>
</header>
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
            <img src="<%=request.getContextPath()%>/front-end/mem/logo/透明LOGO有字無框.png" style="max-width: 320px;margin-top: 10px;" alt="">
            <div class="projectTitle">
                <!-- <h1 style="color: #434217;" class="text-center">小農登入</h1> -->
            </div>


            <div class="login-block" style="padding-top:10px;">
                <p style="color: #434217;" class="bluequote small">會員登入</p>

                <div class="registerFormWrapper" id="registerFormWrapper">
                    <!-- form開始 -->
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/login/LoginHandler.do" name="form1" >
			
<%-- 			<input id="preURL" name="preURL" type="hidden" value="<%=request.getHeader("Referer")%>"> --%>

                        <div style="margin-bottom: 16px;"class="form-group"><span id="a1" style="line-height:32px;font-size:15px;"></span>
                            <input id="username" class="form-control" placeholder="請輸入帳號 ( 信箱 ) " required="" name="mem_acc" type="email">
                        </div>

                        <div style="margin-bottom: 16px;"class="form-group"><span id="a2" style="line-height:32px;font-size:15px;"></span>
                            <input id="password" class="form-control" placeholder="請輸入密碼" required="" name="mem_pwd" type="password"
                                value="">
                        </div>

<input type="hidden" name="action" value="mem_login">
                        <button id="btn" class="btn btn-block fRed btn-submit"
                            style="margin-top: 20px; height: 40px;" type="submit">登入</button>

                    </FORM>
                </div>
            </div>

           <!--  <div class="login-block"> -->
            <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<!-- <font style="color:red">請修正以下錯誤:</font> -->
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

                <div style="padding:5px"class="login-block flex-display space-between">
                    <span class="dark">還沒有帳號? 請前往</span>
                    <a href="<%=request.getContextPath()%>/front-end/mem/addMemByMem.jsp" class="btn fGhostred">成為會員</a>
                </div>
                <div style="padding:5px"class="login-block flex-display space-between">
                    <span class="dark">你是小農嗎？ 請前往</span>
                    <a href="<%=request.getContextPath()%>/front-end/login/loginByFmem.jsp" class="btn fGhostred">小農登入</a>
                </div>
                <div style="padding:5px" class="login-block  flex-display space-between">
                    <span class="dark">忘記密碼/重設密碼？ 請前往</span>
                    <a href="<%=request.getContextPath()%>/front-end/mem/go_to_send_resetPWD_mail_ByMem.jsp" class="btn fGhostred">重設密碼</a>
                </div>
        <!--     </div> -->
        </div>
    </div>

<script>
const username1=document.getElementById('username');

//input用.value 取值
var c_email = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
//使用「正規表達式」檢驗格式
username1.addEventListener('change',check);

function check(){
  if (c_email.test(username1.value)) {
      const c = document.getElementById('a1');
      c.textContent='正確的E-mail格式';
      c.style.color = 'green';
  }else{
      const c = document.getElementById('a1');
      c.textContent='不正確的E-mail格式，請重新輸入';
      c.style.color = 'red';
  }

}
const password1=document.getElementById('password');

//input用.value 取值
var c_password = /[0-9A-Za-z]{8,16}/;
//使用「正規表達式」檢驗格式
password1.addEventListener('change',check2);

function check2(){
  if (c_password.test(password1.value)) {
      const e = document.getElementById('a2');
      e.textContent='格式正確';
      e.style.color = 'green';
  }
  else{
      const e = document.getElementById('a2');
      e.textContent='不正確，請重新輸入';
      e.style.color = 'red';
  }

}

const password2=document.getElementById('check_password');

//input用.value 取值

//使用「正規表達式」檢驗格式
password2.addEventListener('change',check3);

function check3(){
  if(password2.value===""){
      const e = document.getElementById('a3');
      e.textContent='不得為空白，請填寫';
      e.style.color = 'red';
  }else if(password1.value===(password2.value)) {
      const e = document.getElementById('a3');
      e.textContent='正確';
      e.style.color = 'green';
  }
  else{
      const e = document.getElementById('a3');
      e.textContent='輸入密碼不一樣，請重新輸入';
      e.style.color = 'red';
  }

}


const nickname1=document.getElementById('nickname');

//input用.value 取值
var c_nickname = /[\u4e00-\u9fa5_a-zA-Z0-9_]{2,}/;
//使用「正規表達式」檢驗格式


/* nickname1.addEventListener('click',check5);

function check5(){
  if(password2.value===""){        
      const e = document.getElementById('a3');
      e.textContent='不得為空白，請填寫';
      e.style.color = 'red';

  }
} */
nickname1.addEventListener('change',check4);
function check4(){
  if(c_nickname.test(nickname1.value)) {
      const e = document.getElementById('a4');
      e.textContent='正確';
      e.style.color = 'green';
  }else{
      const e = document.getElementById('a4');
      e.textContent='不正確，請重新輸入';
      e.style.color = 'red';
  }

} 
////
const btn1=document.getElementById('btn');


//使用「正規表達式」檢驗格式
btn1.addEventListener('click',CheckForm);

function CheckForm(e){
if(confirm("確認要送出本表單嗎？")==true){
    if(username1.value==""||nickname1.value==""||password2.value==""||password1.value==""){
      e.preventDefault();
      /* alert('資料有誤！') */
      if(username1.value==""){
          const e = document.getElementById('a1');
      e.textContent='使用者名稱為必填欄位';
      e.style.color = 'red';
      }
      if(password2.value==""){
          const e = document.getElementById('a3');
      e.textContent='確認密碼為必填欄位';
      e.style.color = 'red';
      }
      if(password1.value==""){
          const e = document.getElementById('a4');
      e.textContent='暱稱為必填欄位';
      e.style.color = 'red';
      }
      if(nickname1.value==""){
          const e = document.getElementById('a2');
      e.textContent='密碼為必填欄位';
      e.style.color = 'red';
      }
  return false;

    }else{
      
  return true;
    }
  
}else{ 
    e.preventDefault();
  return false;}
}   
</script>


</body>

</html>