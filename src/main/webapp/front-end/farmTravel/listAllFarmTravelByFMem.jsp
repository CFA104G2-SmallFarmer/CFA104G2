<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.farmTravel.model.FarmTravelService" %>
<%@ page import="com.farmTravel.model.FarmTravelVO" %>
<%@ page import="com.fMem.model.FMemVO" %>
<%@ page import="java.util.List" %>
<%
    FarmTravelService farmTravelService = new FarmTravelService();
    List<FarmTravelVO> list = farmTravelService.getAllFarmTravelFromFMem(((FMemVO) session.getAttribute("fMemVO")).getF_mem_id());
    pageContext.setAttribute("list", list);
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <%--  --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>瀏覽我的行程</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- CSS 寫在這 -->
    <style>
        body {
            /* Google Fonts */
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #eeeeee;
            color: #434217;
            font-size: 17px;
            font-weight: bolder;
        }
        .farmTravelItem {
            width: 100%;
            padding: 0px;
        }
        .itemTitle{
            text-align: left;
        }
        .showFarmTravelBtn {
            width: 100%;
            border: none;
            background-color: white;
            padding: 10px;
        }
        .showFarmTravelBtn:hover {
            background-color: #eff8ec;
        }
        .farmTravelInfo{
            background-color: #f4f0e6;
            padding: 0px;
        }
        .btnRow{
            width: 100%;
        }
        .formBtn{
            margin: 5px 0;
            padding: 0px;
        }
        .orderNo{
            background-color: #eeeeee;
            padding-bottom: 3px;
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
        .leftBarText{
            color: #434217;
            font-weight: bolder;
            font-size: 20px;
        }
        .text-white:hover{
            background-color: #aaba8b;
        }
        .menu{
            background-color: #b9d4b3;
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

<!-- 內容 -->
<div class="container">
    <div class="row mb-4">
        <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/Geese-farm.jpg" alt="" height="480px">
    </div>

    <div class="row">
        <!-- 左邊 -->
        <div class="col-3">
            <div class="d-flex flex-column flex-shrink-0 p-3 leftBarText" style="width: 100%; height: 100%">
                <span class="fs-4">功能導航</span>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="mb-1">
                        <button class="menu btn btn-toggle align-items-center rounded collapsed text-white" data-bs-toggle="collapse" data-bs-target="#farmTravel-collapse" aria-expanded="false">
                            行程管理
                        </button>
                        <div class="collapse" id="farmTravel-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/addFarmTravel.jsp" class="nav-link rounded leftBarText">新增行程</a></li>
                                <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByFMem.jsp" class="nav-link rounded leftBarText">我建立的行程</a></li>
                                <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listMyFarmTravelSetUp.jsp" class="nav-link rounded leftBarText">我已成團的行程</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mb-1">
                        <button class="menu btn btn-toggle align-items-center rounded collapsed text-white" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                            訂單管理
                        </button>
                        <div class="collapse" id="orders-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="<%=request.getContextPath()%>/front-end/farmTravelOrder/listAllFarmTravelOrderByFMem.jsp" class="nav-link rounded leftBarText">查看所有訂單</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 右邊 -->
        <div class="col-9">
            <!-- 第一行標題 -->
            <div class="row" style="text-align: center">
                <div class="col-2"></div>
                <div class="col-3">標 題</div>
                <div class="col-3">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-10">行 程 日 期</div>
                    </div>
                </div>
                <div class="col-2">人 數</div>
                <div class="col-2">
                    <a href="<%=request.getContextPath()%>/front-end/farmTravel/addFarmTravel.jsp">
                        <button type="button" class="btn btn-outline-success">新增行程</button>
                    </a>
                </div>
            </div>

            <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

            <div class="row accordion accordion-flush farmTravelList" id="accordionFlushExample">

                <c:forEach var="farmTravel" items="${list}">
                    <c:if test="${farmTravel.farm_travel_state ne 9}">
                        <div class="row accordion-item farmTravelItem">
                            <div class="col-12 orderNo">農遊編號：${farmTravel.farm_travel_ID}</div>
                            <button class="showFarmTravelBtn" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapse_${farmTravel.farm_travel_ID}">

                                <div class="row">
                                    <div class="col-3">
                                        <c:if test="${not empty farmTravel.farm_travel_img}">
                                            <img src="<%=request.getContextPath()%>/getImage.do?farm_travel_ID=${farmTravel.farm_travel_ID}"
                                                 width="100%" height="150">
                                        </c:if>
                                        <c:if test="${empty farmTravel.farm_travel_img}">
                                            <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/NoImage.png"
                                                 width="100%" height="150">
                                        </c:if>
                                    </div>
                                    <div class="itemTitle col-3">
                                            ${farmTravel.farm_travel_title}
                                    </div>
                                    <div class="col-2">
                                        <div class="row">
                                            <span style="text-align: center">
                                                <fmt:formatDate value="${farmTravel.farm_travel_start}" pattern="yyyy/MM/dd HH:mm"/>
                                            </span>
                                        </div>
                                        <div class="row"><span style="text-align: center">｜</span></div>
                                        <div class="row">
                                            <span style="text-align: center">
                                                <fmt:formatDate value="${farmTravel.farm_travel_end}" pattern="yyyy/MM/dd HH:mm"/>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-2">${farmTravel.farm_travel_now}/${farmTravel.farm_travel_max}</div>
                                    <div class="col-2">
                                        <div class="row">
                                            <div class="col-2"></div>
                                            <c:forEach var="farmTravelState" items="${farmTravelStatus}">
                                                <c:if test="${farmTravel.farm_travel_state == farmTravelState.key}">
                                                    ${farmTravelState.value}
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </button>
                            <div id="flush-collapse_${farmTravel.farm_travel_ID}" class="farmTravelInfo collapse"
                                 aria-labelledby="flush-heading_${farmTravel.farm_travel_ID}" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="row">行程資訊：</div>
                                            <div class="row">${farmTravel.farm_travel_info}</div>
                                        </div>
                                        <div class="col-2">
                                            <div class="row">可報名日期：</div>
                                            <div class="row">
                                            <span style="text-align: center">
                                                <fmt:formatDate value="${farmTravel.travel_apply_start}" pattern="yyyy/MM/dd HH:mm"/>
                                            </span>
                                            </div>
                                            <div class="row"><span style="text-align: center">｜</span></div>
                                            <div class="row">
                                            <span style="text-align: center">
                                                <fmt:formatDate value="${farmTravel.travel_apply_end}" pattern="yyyy/MM/dd HH:mm"/>
                                            </span>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="row">
                                                <div class="col-4"></div>
                                                <div class="col-8">NT$：</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4"></div>
                                                <div class="col-8">${farmTravel.farm_travel_fee}</div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="row">
                                                <c:if test="${farmTravel.farm_travel_now eq 0}">
                                                    <form method="post"
                                                          action="<%=request.getContextPath()%>/farmTravel.do" class="formBtn">
                                                        <input type="hidden" name="action" value="getOneForUpdate">
                                                        <input type="hidden" name="farm_travel_ID"
                                                               value="${farmTravel.farm_travel_ID}">
                                                        <button type="submit" class="btnRow btn btn-outline-secondary">修改</button>
                                                    </form>
                                                </c:if>
                                            </div>
                                            <div class="row">
                                                <c:if test="${farmTravel.farm_travel_now eq 0}">
                                                    <button type="button" class="btnRow delete btn btn-outline-danger"
                                                            value="${farmTravel.farm_travel_ID}">刪除
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- 這是分隔線 -->
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

</body>
<!-- JavaScript 寫在這 -->
<script>
    $(".delete").click(function () {
        $.post(
            "<%=request.getContextPath()%>/farmTravel.do",
            {action: "delete", farm_travel_ID: $(this).val()},
            () => {
                alert("刪除成功");
                window.location.href = "<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByFMem.jsp";
            }
        );
    });
</script>
</html>