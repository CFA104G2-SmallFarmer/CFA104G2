<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--               本網站由緯育(Tibame)Java雲端服務開發技術養成班-第93期-第二組製作， -->
<!--               非營利用途，僅為學習交流使用。如有不當使用之內容,請向https://www.tibame.com/聯繋。 -->
<!-- 參考網站https://shopee.tw/  https://www.zeczec.com/  https://www.buydirectlyfromfarmers.tw/ -->
<!-- saved from url=(0038)https://shopee.tw/user/account/profile -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我家門前有塊地</title>

<style>


.show li a {text-decoration : none; color : #ffffff;}


aside {
  width : 300px; 
  height: 1200px;
  background: #b9d4b3;
  margin : 0px;
  position: relative;
  float:left;
}

.asidesp {
  padding : 30px;
  background : #b9d4b3; 
  color : white;
  font-size : 1.2em;
  font-variant : small-caps;
  cursor : pointer;
  display: block;
}

.asidesp::after {
  float: right;
  right: 10%;
  content: "+";
}

#slide1 {
  clear:both;
  width:100%;
  height:0px;
  overflow: hidden;
  text-align: center;
  transition: height .4s ease;
}
#slide2 {
  clear:both;
  width:100%;
  height:0px;
  overflow: hidden;
  text-align: center;
  transition: height .4s ease;
}
#slide3 {
  clear:both;
  width:100%;
  height:0px;
  overflow: hidden;
  text-align: center;
  transition: height .4s ease;
}
#slide4 {
  clear:both;
  width:100%;
  height:0px;
  overflow: hidden;
  text-align: center;
  transition: height .4s ease;
}

.show li {padding : 10px; list-style-type: none;}

.touch {position: absolute; opacity: 0; height: 0px;}    

#touch1:checked + #slide1 {height: 100px;} 
#touch2:checked + #slide2 {height: 100px;} 
#touch3:checked + #slide3 {height: 100px;} 
#touch4:checked + #slide4 {height: 100px;} 
</style>
</head>
<body>
<aside style="float:left;">

  <label for="touch1"><span class="asidesp">會員專區</span></label>               
  <input type="checkbox" id="touch1" class="touch"> 

  <ul class="show" id="slide1">
    <li><a href="<%= request.getContextPath() %>/front-end/mem/memberInfom.jsp">會員資料</a></li> 
    <li><a href="<%= request.getContextPath() %>/front-end/mem/update_mem_input.jsp">會員資料修改</a></li>
    <li><a href="<%= request.getContextPath() %>/front-end/fMem/addFMem.jsp">註冊成為小農</a></li>
  </ul>
  
  <label for="touch4"><span class="asidesp">訂單管理</span></label>               
  <input type="checkbox" id="touch4" class="touch"> 

  <ul class="show" id="slide4">
    <li><a href="<%=request.getContextPath()%>/front-end/shopOrder/listAllOrderByMem.jsp">商城訂單管理</a></li> 
    <li><a href="<%=request.getContextPath()%>/front-end/projOrder/listAllOrderByMem.jsp">認養訂單管理</a></li>
    <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp">旅遊行程訂單</a></li>
  </ul>
</aside>
</body>
</html>