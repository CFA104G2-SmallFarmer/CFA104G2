<%--
  Created by IntelliJ IDEA.
  User: kwz50
  Date: 2023/2/2
  Time: 上午 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 50px;
        }

        .logo-div {
            text-align: center;
            margin-bottom: 50px;
        }

        .logo-image {

            width: 50%;
            height: 20%;
        }

        .notification {
            padding: 20px;
            background-color: #f0f3e6;
            color: black;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #f0f3e6;
            width: 50%;
            margin: 20px auto;
        }

        .return-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #717d34;
            color: white;
            border-radius: 10px;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="logo-div">
    <img class="logo-image" src="<%=basePath%>/front-end/home/header_files/透明LOGO有字有框.png">
</div>

<div id="notification" class="notification" style="display: none;">
    訂單建立成功! 感謝您的支持!
</div>

<br>

<a href="<%=basePath%>/front-end/project/listAllProjByMem.jsp" class="return-button">回認養首頁</a>

<script>
    window.onload = function() {
        document.getElementById("notification").style.display = "block";
    };
</script>
</body>

</html>
