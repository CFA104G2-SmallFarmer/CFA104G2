<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/header_css_for_Proj">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 這段給emoji的 -->
          <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous" />
</head>
<!-- <body> -->
<header>
<script>
    $(document).ready(function () {
        $('.showmenu').on('click', function (e) {
            e.preventDefault();
            $('body').toggleClass('menu-show');
          }

        );
      }

    );
  </script>
  <div class="wrap">
    <div class="header">
      <div class="logo" ><img style="margin-top:5px;height:75px"src="<%=request.getContextPath()%>/front-end/home/images/透明LOGO有字有框.png">
      </div>
      <ul class="menu">
        <li><a href="#">瀏覽認養專案</a></li>

        <li><a href="#">我的認養訂單</a></li>

        <li><a href="#">回到首頁 </a></li>
        <li><a href="#"><i class="material-icons" style="font-size:27px">mail_outline</i></a></li>
 		  <li><a href="#"><i class="material-icons" style="font-size:27px">person</i> </a></li>
      </ul>
      <div class="div0 showmenu">
        <!-- <a href="#" >menu</a> -->
        <div class="div1"></div>
        <div class="div1"></div>
        <div class="div1"></div>
      </div>

      <!-- <a href="#" class="showmenu">menu</a> -->
    </div>
     </div>
</header>

<!-- </body> -->
</html>