<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopOrder.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
  ShopOrderVO shopOrderVO = (ShopOrderVO) request.getAttribute("shopOrderVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>訂單資料修改</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
/* 	width: 1000px; */
/* 	background-color: white; */
/* 	margin-top: 1px; */
/* 	margin-bottom: 1px; */
  }
  table, th, td {
/*     border: 0px solid #CCCCFF; */
  }
  th, td {
    padding: 1px;
  }
  .updateform{
  	border:10px solid #b9d4b3 ;
  	box-shadow:3px 3px 5px 6px #cccccc;
  	border-radius:60px"
	vertical-align: top;
	text-align: center; 
	background-color:#dfdcb3; 
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

</head>
<body bgcolor='tan'>
<header>
<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
</header>

<!-- join要用的usebean -->
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<br>
<div class="updateform">
<img alt="" src="<%=request.getContextPath()%>/front-end/shopCart/images/透明小小農.png " width="50" height="50">
<h3>訂單修改:</h3>
<br>
<%-- 錯誤表列 Start--%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<%-- 錯誤表列 End--%>
<!-- name -->
<FORM METHOD="post" ACTION="shopOrder.do" name="form1" >
<table align="center" valign="center">
	<tr>
		<td>訂單編號:<font color=red><b>*</b></font></td>
		<td><%=shopOrderVO.getOrder_id()%></td>
	</tr>
	<tr>
<!-- 		<td>會員名稱:<font color=red><b>*</b></font></td> -->
<%-- 		<td>${shopOrderVO.mem_id}</td> --%>
<%-- 		<td>${memSvc.getOneMem(shopOrderVO.mem_id).mem_name}</td> --%>
		<td>
	</tr>
	<tr>
		<td>收件人姓名:</td>
		<td>
		<input type="TEXT" name="order_receiver" size="45" value="<%=shopOrderVO.getOrder_receiver()%>" /></td>
	</tr>
	<tr>
		<td>收件人電話:</td>
		<td><input type="TEXT" name="order_tel" size="45"	value="<%=shopOrderVO.getOrder_tel()%>" /></td>
	</tr>
	<tr>
		<td>收件人地址:</td>
		<td><input type="TEXT" name="order_add" size="45"	value="<%=shopOrderVO.getOrder_add()%>" /></td>
	</tr>
	<tr>
		<td>備註:</td>
		<td><input type="TEXT" name="order_memo" size="45" value="<%=shopOrderVO.getOrder_memo()%>" /></td>
	</tr>

</table>

<br>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="order_id" value="<%=shopOrderVO.getOrder_id()%>">
<input type="hidden" name="order_state" value="<%=shopOrderVO.getOrder_state()%>">
<!-- <input type="submit" value="送出修改"> -->
<button class="btn  color-btn" type="submit" value="送出修改">送出修改</button>
</FORM>
</div>
<br>
<br>

<jsp:include page="/front-end/home/footer.jsp" flush="true"/>
</body>



        
</html>