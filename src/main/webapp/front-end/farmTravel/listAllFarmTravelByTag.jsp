<%@ page import="com.farmTravelTag.model.FarmTravelTagService" %>
<%@ page import="com.farmTravelTag.model.FarmTravelTagVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    FarmTravelTagService farmTravelTagService = new FarmTravelTagService();
    List<FarmTravelTagVO> farmTravelTagList = farmTravelTagService.getTopFiveFarmTravelTag();
    pageContext.setAttribute("farmTravelTagList", farmTravelTagList);
%>
<html>
<header>
    <jsp:include page="farmHeader.jsp"/>
</header>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <title>瀏覽農遊行程</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        body{
            font-family: 'Noto Sans TC', sans-serif;
            font-size: 16px;
            color: #606060;
        }
        .collection{
            width: 25px;
            height: 25px;
        }
        a{
            text-decoration: none;
        }
        .card-body{
            color: black;
        }
        .card-body:hover{
            color: black;
        }
        .col{
            margin-top: 15px;
        }
        .tagRow{
            margin-left: 3px;
        }
        .tagItemArea{
            padding: 3px;
            border: 1px solid #888888;
            border-radius: 5px;
            margin-right: 10px;
        }
        .tagItemArea:hover{
            background-color: #e2f2d5;
        }
        .tagItem{
            color: #888888;
        }
        .tagItem:hover{
            color: #888888;
        }
        .card-title{
            font-weight: bolder;
            color: #666666;
        }
        .card-text{
            text-align: right;
            color: #666666;
            font-size: 20px;
        }
        .card-body{
        }
        .getOneDiv{
            margin: 0;
        }
        .submitBtn{
            float: right;
        }
        .btn-toggle{
            font-size: 22px;
            width: 100%;
            margin-bottom: 10px;
        }
        .nav-link{
            font-size: 18px;
            width: 100%;
            background-color: #b9d4b3;
        }
        .text-white:hover{
            background-color: #aaba8b;
        }
        .menu{
            background-color: #b9d4b3;
        }
        .menuBtn{
            position: sticky;
            top: 0;
        }
        .menuBtn:hover{
            background-color: #b9d4b3;
        }
        .leftBarText{
            color: #434217;
            font-weight: bolder;
            font-size: 20px;
        }
        .offcanvas-body, .offcanvas-header{
            background-color: #eeeeee;
        }
        .offcanvas-title{
            font-weight: bolder;
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<c:if test="${not empty memVO}">
    <%-- Menu按鈕 --%>
    <button class="menuBtn btn btn-outline-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuBtn" aria-controls="offcanvasWithBothOptions">
        <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/menuBtn.png">
    </button>
    <%-- Menu內容 --%>
    <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="menuBtn" aria-labelledby="menuLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="menuLabel">功能導航</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="mb-1">
                    <button class="menu btn btn-toggle align-items-center rounded collapsed text-white" data-bs-toggle="collapse" data-bs-target="#farmTravel-collapse" aria-expanded="true">
                        農旅行程
                    </button>
                    <div class="collapse show" id="farmTravel-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp" class="nav-link roundedwhite leftBarText">查看所有行程</a></li>
                            <li><a href="<%=request.getContextPath()%>/front-end/farmTravelCollection/listAllMyFarmTravelCollection.jsp" class="nav-link rounded leftBarText">我收藏的行程</a></li>
                                <%--                            <li><a href="#" class="nav-link rounded leftBarText">我檢舉的行程(未完成)</a></li>--%>
                                <%--                            <li><a href="#" class="nav-link rounded leftBarText">已報名的行程(?)</a></li>--%>
                                <%--                            <li><a href="#" class="nav-link rounded leftBarText">曾參加過的行程(?)</a></li>--%>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">
                    <button class="menu btn btn-toggle align-items-center rounded collapsed text-white" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="true">
                        訂單管理
                    </button>
                    <div class="collapse show" id="orders-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="<%=request.getContextPath()%>/front-end/farmTravelOrder/listAllFarmTravelOrderByMem.jsp" class="nav-link rounded leftBarText">查看所有訂單</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</c:if>

<div class="container">
    <div class="row">
        <form method="post" action="<%=request.getContextPath()%>/farmTravel.do">
            <div class="input-group mb-1">
                <input type="text" class="form-control" placeholder="Search..." aria-describedby="searchBar" name="searchFarmTravel">
                <input type="hidden" name="action" value="search">
                <button class="btn btn-outline-success" type="submit" id="searchBar">Search</button>
            </div>
        </form>
    </div>
    <div class="row tagRow mb-2">
        <c:forEach var="farmTravelTag" items="${farmTravelTagList}">
            <div class="col-auto tagItemArea">
                <a class="tagItem" href="<%=request.getContextPath()%>/farmTravelTag.do?tag_ID=${farmTravelTag.tag_ID}"># ${farmTravelTag.tag_name}</a>
            </div>
        </c:forEach>
    </div>
    <div class="row">
        <jsp:useBean id="travelTagDetailsService" scope="page" class="com.farmTravelTagDetails.model.FarmTravelTagDetailsService" />
        <jsp:useBean id="travelTagService" scope="page" class="com.farmTravelTag.model.FarmTravelTagService" />
        <c:forEach var="farmTravel" items="${farmTravelList}">
            <div class="col col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-8 col-8">
                <div class="card">
                    <c:if test="${not empty farmTravel.farm_travel_img}">
                        <img src="<%=request.getContextPath()%>/getImage.do?farm_travel_ID=${farmTravel.farm_travel_ID}" class="card-img-top" style="width: 100%; height: 200px">
                    </c:if>
                    <c:if test="${empty farmTravel.farm_travel_img}">
                        <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/NoImage.png" class="card-img-top" style="width: 100%; height: 200px">
                    </c:if>

                    <div class="card-body">
                        <h5 class="card-title">${farmTravel.farm_travel_title}</h5>
                        <h6 class="card-subtitle mb-3 text-muted">
                            <c:forEach var="farmTagDetailsList" items="${travelTagDetailsService.getTagByFarmTravelID(farmTravel.farm_travel_ID)}">
                                <span style="color: #aaaaaa; margin-right:10px;">#${travelTagService.getOneFarmTravelTag(farmTagDetailsList.tag_ID).tag_name}</span>
                            </c:forEach>
                        </h6>
                        <div class="row">
                            <div class="col-6">
                                <c:if test="${farmTravel.farm_travel_state eq 1}">
                                    距離成團還差<strong>${farmTravel.farm_travel_min-farmTravel.farm_travel_now}</strong>人
                                </c:if>
                                <c:if test="${farmTravel.farm_travel_state eq 2}">
                                    <span style='border:3px solid #a8dba8;border-radius:10px;padding: 1px'>已成團</span>
                                </c:if>
                            </div>
                            <div class="col-6">
                                <p class="card-text">NT$：${farmTravel.farm_travel_fee}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                <c:if test="${not empty memVO}">
                                    <button type="button" class="btn btn-outline-light" value="${farmTravel.farm_travel_ID}">
                                        <img src="<%=request.getContextPath()%>/farmTravelCollection.do?action=collection&mem_ID=${mem.mem_id}&farm_travel_ID=${farmTravel.farm_travel_ID}" class="collection">
                                    </button>
                                </c:if>
                            </div>
                            <div class="col-4"></div>
                            <div class="col-5 getOneDiv">
                                <form method="post" action="<%=request.getContextPath()%>/farmTravel.do">
                                    <input type="hidden" name="action" value="getOne">
                                    <input type="hidden" name="farm_travel_ID" value="${farmTravel.farm_travel_ID}">
                                    <button type="submit" class="submitBtn btn btn-outline-primary">查看詳情</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
<script>
    $(".collection").click(function() {
        $.post(
            "<%=request.getContextPath()%>/farmTravelCollection.do",
            { action:"collection", farm_travel_ID:$(this).parent().val() },
            data=>{
                if (data == 0){
                    alert("移除收藏");
                    $(this).attr("src", "<%=request.getContextPath()%>/front-end/farmTravel/images/Heart.png");
                }else if (data == 1){
                    alert("收藏成功");
                    $(this).attr("src", "<%=request.getContextPath()%>/front-end/farmTravel/images/Hearted.png");
                }
            }
        );
    });
</script>
</html>