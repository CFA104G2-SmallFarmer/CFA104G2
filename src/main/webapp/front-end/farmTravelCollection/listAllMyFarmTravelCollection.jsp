<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.farmTravelCollection.model.FarmTravelCollectionVO" %>
<%@ page import="com.farmTravelCollection.model.FarmTravelCollectionService" %>
<%@ page import="com.mem.model.MemVO" %>
<%@ page import="com.farmTravel.model.FarmTravelService" %>
<%@ page import="com.farmTravel.model.FarmTravelVO" %>
<%
    FarmTravelCollectionService farmTravelCollectionService = new FarmTravelCollectionService();
    List<FarmTravelCollectionVO> collectionList = farmTravelCollectionService.getAllFarmTravelCollection(((MemVO) session.getAttribute("mem")).getMem_id());
    FarmTravelService farmTravelService = new FarmTravelService();
    List<FarmTravelVO> list = farmTravelService.getAllFromCollection(collectionList);
    pageContext.setAttribute("list",list);
%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <title>瀏覽我的收藏</title>

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
        .getOne{
            border: none;
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
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<div class="container">
    <div class="row">
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Search..." aria-label="Recipient's username" aria-describedby="searchBar">
                <button class="btn btn-outline-success" type="button" id="searchBar">Search</button>
            </div>
        </div>
    </div>
    <div class="row tagRow">
        <c:forEach var="farmTravelTag" items="${farmTravelTagList}">
            <div class="col-auto tagItemArea">
                <a class="tagItem" href="<%=request.getContextPath()%>/farmTravelTag.do?tag_ID=${farmTravelTag.tag_ID}"># ${farmTravelTag.tag_name}</a>
            </div>
        </c:forEach>
    </div>
    <div class="row">
        <jsp:useBean id="travelTagDetailsService" scope="page" class="com.farmTravelTagDetails.model.FarmTravelTagDetailsService" />
        <jsp:useBean id="travelTagService" scope="page" class="com.farmTravelTag.model.FarmTravelTagService" />
        <c:forEach var="farmTravel" items="${list}">
            <div class="col col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-8 col-8">
                <a href="#" class="getOne card-link">
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
                                    <button type="button" class="btn btn-outline-light" value="${farmTravel.farm_travel_ID}">
                                        <img src="<%=request.getContextPath()%>/farmTravelCollection.do?action=collection&mem_ID=${mem.mem_id}&farm_travel_ID=${farmTravel.farm_travel_ID}" class="collection">
                                    </button>
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
                </a>
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
                   window.location.href="<%=request.getContextPath()%>/front-end/farmTravelCollection/listAllMyFarmTravelCollection.jsp"
                }
            }
        );
    });
</script>
</html>