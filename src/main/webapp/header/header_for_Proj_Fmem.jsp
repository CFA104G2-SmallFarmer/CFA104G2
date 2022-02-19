<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/header/header_css_for_Proj_Fmem">

</head>
<body>
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
      <div class="logo"><img src="<%=request.getContextPath()%>/header/images/farmerManage-Final.png">
      </div>
      <ul class="menu">
        <li><a href="#">認養專案管理&nbsp;&nbsp;</a></li>

        <li><a href="#">認養訂單管理&nbsp;&nbsp;</a></li>

        <li><a href="#">回到首頁 &nbsp;&nbsp;</a></li>
        <li><a href="#"><i class="material-icons" style="font-size:27px">mail_outline</i> &nbsp;&nbsp;</a></li>
      </ul>
      <div class="div0 showmenu">
        <!-- <a href="#" >menu</a> -->
        <div class="div1"></div>
        <div class="div1"></div>
        <div class="div1"></div>
      </div>

      <!-- <a href="#" class="showmenu">menu</a> -->
    </div>
</header>

</body>
</html>