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

 

    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/mem/addMemByMem_css/all-19a228fd40.css">
</head>
<header>
       <%--   <jsp:include page="/front-end/home/header.jsp" /> 這個會失敗--%>
       
          <jsp:include page="/front-end/home/header2/header2.jsp" /> 
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
                <!-- <h1 style="color: #434217;" class="text-center">註冊</h1> -->
            </div>


            <div class="login-block" style="padding-top:10px;">
                <p style="color: #434217;" class="bluequote small">註冊</p>

                <div class="registerFormWrapper" id="registerFormWrapper">
                    <!-- form開始 -->
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" >

                        <div style="margin-bottom: 16px;"class="form-group">
                        <span id="a4" style="line-height:32px;font-size:15px;"></span>
                            <input id="nickname" class="form-control" placeholder="暱稱 : 中文，英文字母和數字，2~15字之間" required="" maxlength="40" name="mem_nickname"
                                type="text">
                        </div>

                        <div style="margin-bottom: 16px;"class="form-group"><span id="a1" style="line-height:32px;font-size:15px;"></span>
                            <input id="username" class="form-control" placeholder="註冊信箱" required="" name="mem_acc" type="email">
                        </div>

                        <div style="margin-bottom: 16px;"class="form-group"><span id="a2" style="line-height:32px;font-size:15px;"></span>
                            <input id="password" class="form-control" placeholder="密碼 : 請輸入8-16個字，英文數字皆要有" required="" name="mem_pwd" type="password"
                                value="">
                        </div>

                        <div style="margin-bottom: 16px;"class="form-group"> <span>.<span id="a3" style="line-height:32px;font-size:15px;"></span></span>
                            <input id="check_password" class="form-control" placeholder="確認密碼" required="" name="password_confirmation"
                                type="password" value="">
                        </div>
<input type="hidden" name="action" value="register">
                        <button id="btn" class="btn btn-block fRed btn-submit"
                            style="margin-top: 20px; height: 40px;" type="submit">註冊</button>

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
                    <span class="dark">已經有 我家門前有塊地 帳號了？</span>
                    <a href="<%=request.getContextPath()%>/front-end/login/loginByMem.jsp" class="btn fGhostred">登入</a>
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
username1.addEventListener('blur',check);

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
password1.addEventListener('blur',check2);

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
password2.addEventListener('blur',check3);

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
nickname1.addEventListener('blur',check4);
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