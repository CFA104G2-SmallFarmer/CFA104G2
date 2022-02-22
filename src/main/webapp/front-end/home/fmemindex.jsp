<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

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

#touch1:checked + #slide1 {height: 300px;} 
#touch2:checked + #slide2 {height: 300px;} 
#touch3:checked + #slide3 {height: 300px;} 
#touch4:checked + #slide4 {height: 300px;} 
</style>
</head>
<body>
<aside style="float:left;">

  <label for="touch1"><span class="asidesp">titre</span></label>               
  <input type="checkbox" id="touch1" class="touch"> 

  <ul class="show" id="slide1">
    <li><a href="#">小農專區</a></li> 
    <li><a href="#">小農資料</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
  </ul>
  
  <label for="touch2"><span class="asidesp">titre</span></label>               
  <input type="checkbox" id="touch2" class="touch"> 

  <ul class="show" id="slide2">
    <li><a href="#">小農資料管理</a></li> 
    <li><a href="#">Lorem Ipsum</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
  </ul>
  
  <label for="touch3"><span class="asidesp">titre</span></label>               
  <input type="checkbox" id="touch3" class="touch"> 

  <ul class="show" id="slide3" >
    <li><a href="#">小農資料管理</a></li> 
    <li><a href="#">Lorem Ipsum</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
  </ul>
  
  <label for="touch4"><span class="asidesp">titre</span></label>               
  <input type="checkbox" id="touch4" class="touch"> 

  <ul class="show" id="slide4">
    <li><a href="#">小農資料管理</a></li> 
    <li><a href="#">Lorem Ipsum</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
    <li><a href="#">Lorem Ipsum</a></li>
  </ul>
</aside>
</body>
</html>