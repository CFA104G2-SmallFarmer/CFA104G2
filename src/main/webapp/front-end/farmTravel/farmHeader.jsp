<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- CSS 寫在這 -->
    <style>
        body {
            /* Google Fonts */
            font-family: 'Noto Sans TC', sans-serif;
        }
        .headerBgColor{
            background-color: #434217;
        }
        .headerImg{
            width: 100%;
            margin: 10px;
        }
        .headerTextBox{
            color: #d9d9d9;
            font-size: 22px;
            line-height: 100px;
            margin: auto;
        }
        .headerBtn{
            text-decoration:none;
            color: #aaba8b;
            padding: 15px 20px;
            width: 100%;
        }
        .headerBtn:hover{
            background-color: #aaba8b;
            color: black;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

<!-- 內容 -->
<div class="row headerBgColor mb-2">
    <div class="col-1"></div>
    <div class="col-2">
        <a href="<%=request.getContextPath()%>/front-end/home/home.jsp">
            <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/調整後白小農logo.png" alt="" class="headerImg">
        </a>
    </div>
    <div class="col-1"></div>
    <div class="col-6 headerTextBox">
        <div class="row">
            <div class="col-2">
                <a href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp" class="headerBtn">小農論壇</a>
            </div>
            <div class="col-2">
                <a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp" class="headerBtn">小農商城</a>
            </div>
            <div class="col-2">
                <a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp" class="headerBtn">農場旅遊</a>
            </div>
            <div class="col-2">
                <a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp" class="headerBtn">農產認養</a>
            </div>
            <div class="col-2">
                <a href="<%=request.getContextPath()%>/front-end/fMem/fMemberInfom.jsp" class="headerBtn">小農專區</a>
            </div>
            <div class="col-2">
                <a href="<%=request.getContextPath()%>/front-end/mem/memberInfom.jsp" class="headerBtn">會員專區</a>
            </div>
        </div>
    </div>
    <div class="col-1"></div>
    <div class="col-1 headerTextBox">
        <!--        <div class="row">-->
        <!--            張三李四-->
        <!--        </div>-->
        <!--        <div class="row">-->
        <!--            logout-->
        <!--        </div>-->
    </div>
</div>
</body>
</html>