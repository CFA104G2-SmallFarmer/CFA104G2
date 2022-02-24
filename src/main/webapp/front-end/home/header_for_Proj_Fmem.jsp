<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/header_css_for_Proj">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 這段給Header emoji的 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
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
      <div class="logo"><img style="width:230px"style="margin-top:5px"src="<%=request.getContextPath()%>/front-end/home/images/farmerManage-Final.png">
      </div>
      <ul class="menu">
        <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByFmem.jsp">認養專案管理&nbsp;</a></li>

        <li><a href="<%=request.getContextPath()%>/front-end/projOrder/listAllOrderByFmem.jsp">小農認養訂單管理&nbsp;</a></li>

       <li><a href="<%=request.getContextPath()%>/front-end/home/home.jsp"">回到首頁 &nbsp;</a></li>
        <li><a href="#"><span class="material-icons" style="font-size:27px">mail_outline</span> &nbsp;</a></li>
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