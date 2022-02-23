<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderVO" %>
<%@ page import="com.mem.model.MemVO" %>
<%
    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
    List<FarmTravelOrderVO> farmTravelOrderList = farmTravelOrderService.getAllFarmTravelOrderByMem(((MemVO)session.getAttribute("mem")).getMem_id());
    pageContext.setAttribute("farmTravelOrderList",farmTravelOrderList);
%>
<jsp:useBean id="farmTravelService" scope="page" class="com.farmTravel.model.FarmTravelService"/>
<jsp:useBean id="farmTravelPartnerService" scope="page" class="com.farmTravelPartner.model.FarmTravelPartnerService"/>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <!-- 評價星星css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>我的訂單</title>

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
        .container{
            background-color: white;
            border-radius: 10px;
        }
        .orderTitle{
            border: 1px solid #dddddd;
            background-color: #eff8ec;
            padding:10px;
            border-radius: 5px;
        }
        .orderItem{
            border: 1px solid #dddddd;
            border-radius: 5px;
        }
        .orderNo{
            background-color: #eeeeee;
            padding-bottom: 3px;
        }
        button{
            background-color: #eff8ec;;
            border-radius: 5px;
            padding: 10px;
            color: #555555;
        }
        .nav-link{
            width: 100%;
            font-size: 20px;
            color: #606060;
        }
        .star-rating {
            line-height:32px;
            font-size:1.25em;
        }
        .star-rating .fa-star{
            color: orange;
        }
        .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
            color: #434217;
            background-color: #eff8ec;
        }
        .btn-outline-success:hover{
            color: #606060;
            background-color: #eff8ec;
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
        .nav{
            padding: 0;
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

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
                <button class="menu btn btn-toggle align-items-center rounded collapsed text-white" data-bs-toggle="collapse" data-bs-target="#farmTravel-collapse" aria-expanded="false">
                    農旅行程
                </button>
                <div class="collapse" id="farmTravel-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp" class="nav-link roundedwhite leftBarText">查看所有行程</a></li>
                        <li><a href="<%=request.getContextPath()%>/front-end/farmTravelCollection/listAllMyFarmTravelCollection.jsp" class="nav-link rounded leftBarText">我收藏的行程</a></li>
                        <li><a href="#" class="nav-link rounded leftBarText">我檢舉的行程(未完成)</a></li>
                        <li><a href="#" class="nav-link rounded leftBarText">已報名的行程(?)</a></li>
                        <li><a href="#" class="nav-link rounded leftBarText">曾參加過的行程(?)</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="menu btn btn-toggle align-items-center rounded collapsed text-white" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                    訂單管理
                </button>
                <div class="collapse" id="orders-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="<%=request.getContextPath()%>/front-end/farmTravelOrder/listAllFarmTravelOrderByMem.jsp" class="nav-link rounded leftBarText">查看所有訂單</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</div>

<%-- 訂單內容 --%>
<div class="container">
    <div class="row">
        <ul class="nav nav-pills mb-3" id="order-tab" role="tablist">
            <li class="nav-item col-3" role="presentation">
                <button class="nav-link active" id="order-tab-1" data-bs-toggle="pill" data-bs-target="#order-contact-1" type="button" role="tab" aria-controls="order-contact-1" aria-selected="true">全部</button>
            </li>
            <li class="nav-item col-3" role="presentation">
                <button class="nav-link" id="order-tab-2" data-bs-toggle="pill" data-bs-target="#order-contact-2" type="button" role="tab" aria-controls="order-contact-2" aria-selected="false">未付款</button>
            </li>
            <li class="nav-item col-3" role="presentation">
                <button class="nav-link" id="order-tab-3" data-bs-toggle="pill" data-bs-target="#order-contact-3" type="button" role="tab" aria-controls="order-contact-3" aria-selected="false">等待行程開始</button>
            </li>
            <li class="nav-item col-3" role="presentation">
                <button class="nav-link" id="order-tab-4" data-bs-toggle="pill" data-bs-target="#order-contact-4" type="button" role="tab" aria-controls="order-contact-4" aria-selected="false">行程已結束</button>
            </li>
        </ul>
    </div>
    <div class="row orderTitle mb-2">
        <div class="col-3">農遊名稱</div>
        <div class="col-2">
            <div class="row">行程開始日期</div>
        </div>
        <div class="col-1">
            <div class="row">人數</div>
        </div>
        <div class="col-2">金額</div>
        <div class="col-2">
            <div class="row">訂單狀態</div>
        </div>
        <div class="col-2">訂單時間</div>
    </div>
    <div class="row">
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="order-contact-1" role="tabpanel" aria-labelledby="order-tab1">
                <c:forEach var="farmTravelOrder" items="${farmTravelOrderList}">
                    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
                    <div class="row orderItem">
                        <div class="col-5 orderNo">訂單編號：${farmTravelOrder.order_ID}</div>
                        <div class="col-7 orderNo"></div>
                        <div class="row mb-3 mt-1">
                            <div class="col-3">
                                ${farmTravelService.getOneFarmTravel(farmTravelOrder.farm_travel_ID).farm_travel_title}
                            </div>
                            <div class="col-2">
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_start}" pattern="yyyy/MM/dd HH:mm"/></div>
                                <div class="row">　　　至</div>
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_end}" pattern="yyyy/MM/dd HH:mm"/></div>
                            </div>
                            <div class="col-1">
                                ${farmTravelOrder.people_num}人
                                <div class="row">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            名單
                                        </button>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="farmTravelPartner" items="${farmTravelPartnerService.getAllFarmTravelPartner(farmTravelOrder.order_ID)}">
                                                <li class="dropdown-item">${farmTravelPartner.partner_name}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                            <div class="col-2">
                                <div class="row">
                                    <div class="col-12 mb-2">
                                        <c:forEach var="farmTravelOrderState" items="${farmTravelOrderStatusByMem}">
                                            <c:if test="${farmTravelOrder.order_state == farmTravelOrderState.key}">
                                                ${farmTravelOrderState.value}
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="col-12">
                                        <c:if test="${farmTravelOrder.order_state eq 0}">
                                            <button type="button" class="pay btn btn-outline-success" value="${farmTravelOrder.order_ID}">前往付款</button>
                                        </c:if>
                                        <c:if test="${farmTravelOrder.order_state eq 2}">

                                            <!-- 評價按鈕 -->
                                            <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal_${farmTravelOrder.order_ID}">
                                                給予評價
                                            </button>

                                            <!-- 跳出視窗 -->
                                            <div class="modal fade" id="exampleModal_${farmTravelOrder.order_ID}" tabindex="-1" aria-labelledby="exampleModalLabel_${farmTravelOrder.order_ID}" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel_${farmTravelOrder.order_ID}">訂單評價</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="star-rating">
                                                                <span class="fa fa-star-o" data-rating="1"></span>
                                                                <span class="fa fa-star-o" data-rating="2"></span>
                                                                <span class="fa fa-star-o" data-rating="3"></span>
                                                                <span class="fa fa-star-o" data-rating="4"></span>
                                                                <span class="fa fa-star-o" data-rating="5"></span>
                                                                <input type="hidden" name="farm_travel_stars" class="rating-value">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                                            <button type="button" class="submitRating btn btn-primary" data-bs-dismiss="modal" value="${farmTravelOrder.order_ID}">完成</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.order_time}" pattern="yyyy/MM/dd HH:mm"/></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="tab-pane fade" id="order-contact-2" role="tabpanel" aria-labelledby="order-tab2">
                <c:forEach var="farmTravelOrder" items="${farmTravelOrderList}">
                    <c:if test="${farmTravelOrder.order_state eq 0}">
                        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
                    <div class="row orderItem">
                        <div class="col-5 orderNo">訂單編號：${farmTravelOrder.order_ID}</div>
                        <div class="col-7 orderNo"></div>
                        <div class="row mb-3 mt-1">
                            <div class="col-3">
                                    ${farmTravelService.getOneFarmTravel(farmTravelOrder.farm_travel_ID).farm_travel_title}
                            </div>
                            <div class="col-2">
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_start}" pattern="yyyy/MM/dd HH:mm"/></div>
                                <div class="row">　　　至</div>
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_end}" pattern="yyyy/MM/dd HH:mm"/></div>
                            </div>
                            <div class="col-1">
                                    ${farmTravelOrder.people_num}人
                                <div class="row">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            名單
                                        </button>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="farmTravelPartner" items="${farmTravelPartnerService.getAllFarmTravelPartner(farmTravelOrder.order_ID)}">
                                                <li class="dropdown-item">${farmTravelPartner.partner_name}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                            <div class="col-2">
                                <div class="row">
                                    <div class="col-12 mb-2">
                                        <c:forEach var="farmTravelOrderState" items="${farmTravelOrderStatusByMem}">
                                            <c:if test="${farmTravelOrder.order_state == farmTravelOrderState.key}">
                                                ${farmTravelOrderState.value}
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="col-12">
                                        <c:if test="${farmTravelOrder.order_state eq 0}">
                                            <button type="button" class="pay btn btn-outline-success" value="${farmTravelOrder.order_ID}">前往付款</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.order_time}" pattern="yyyy/MM/dd HH:mm"/></div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="tab-pane fade" id="order-contact-3" role="tabpanel" aria-labelledby="order-tab3">
                <c:forEach var="farmTravelOrder" items="${farmTravelOrderList}">
                    <c:if test="${farmTravelOrder.order_state eq 1}">
                        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
                        <div class="row orderItem">
                            <div class="col-5 orderNo">訂單編號：${farmTravelOrder.order_ID}</div>
                            <div class="col-7 orderNo"></div>
                        <div class="row mb-3 mt-1">
                            <div class="col-3">
                                    ${farmTravelService.getOneFarmTravel(farmTravelOrder.farm_travel_ID).farm_travel_title}
                            </div>
                            <div class="col-2">
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_start}" pattern="yyyy/MM/dd HH:mm"/></div>
                                <div class="row">　　　至</div>
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_end}" pattern="yyyy/MM/dd HH:mm"/></div>
                            </div>
                            <div class="col-1">
                                    ${farmTravelOrder.people_num}人
                                <div class="row">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            名單
                                        </button>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="farmTravelPartner" items="${farmTravelPartnerService.getAllFarmTravelPartner(farmTravelOrder.order_ID)}">
                                                <li class="dropdown-item">${farmTravelPartner.partner_name}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                            <div class="col-2">
                                <div class="row">
                                    <div class="col-12 mb-2">
                                        <c:forEach var="farmTravelOrderState" items="${farmTravelOrderStatusByMem}">
                                            <c:if test="${farmTravelOrder.order_state == farmTravelOrderState.key}">
                                                ${farmTravelOrderState.value}
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="row"><fmt:formatDate value="${farmTravelOrder.order_time}" pattern="yyyy/MM/dd HH:mm"/></div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="tab-pane fade" id="order-contact-4" role="tabpanel" aria-labelledby="order-tab4">
                <c:forEach var="farmTravelOrder" items="${farmTravelOrderList}">
                    <c:if test="${farmTravelOrder.order_state eq 2 || farmTravelOrder.order_state eq 3}">
                        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
                        <div class="row orderItem">
                            <div class="col-5 orderNo">訂單編號：${farmTravelOrder.order_ID}</div>
                            <div class="col-7 orderNo"></div>
                            <div class="row mb-3 mt-1">
                                <div class="col-3">
                                        ${farmTravelService.getOneFarmTravel(farmTravelOrder.farm_travel_ID).farm_travel_title}
                                </div>
                                <div class="col-2">
                                    <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_start}" pattern="yyyy/MM/dd HH:mm"/></div>
                                    <div class="row">　　　至</div>
                                    <div class="row"><fmt:formatDate value="${farmTravelOrder.farm_travel_end}" pattern="yyyy/MM/dd HH:mm"/></div>
                                </div>
                                <div class="col-1">
                                        ${farmTravelOrder.people_num}人
                                    <div class="row">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                名單
                                            </button>
                                            <ul class="dropdown-menu">
                                                <c:forEach var="farmTravelPartner" items="${farmTravelPartnerService.getAllFarmTravelPartner(farmTravelOrder.order_ID)}">
                                                    <li class="dropdown-item">${farmTravelPartner.partner_name}</li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                                <div class="col-2">
                                    <div class="row">
                                        <div class="col-12 mb-2">
                                            <c:forEach var="farmTravelOrderState" items="${farmTravelOrderStatusByMem}">
                                                <c:if test="${farmTravelOrder.order_state == farmTravelOrderState.key}">
                                                    ${farmTravelOrderState.value}
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="col-12">
                                            <c:if test="${farmTravelOrder.order_state eq 0}">
                                                <button type="button" class="pay btn btn-outline-success" value="${farmTravelOrder.order_ID}">前往付款</button>
                                            </c:if>
                                            <c:if test="${farmTravelOrder.order_state eq 2}">

                                                <!-- 評價按鈕 -->
                                                <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal__${farmTravelOrder.order_ID}">
                                                    給予評價
                                                </button>

                                                <!-- 跳出視窗 -->
                                                <div class="modal fade" id="exampleModal__${farmTravelOrder.order_ID}" tabindex="-1" aria-labelledby="exampleModalLabel__${farmTravelOrder.order_ID}" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel__${farmTravelOrder.order_ID}">訂單評價</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="star-rating">
                                                                    <span class="fa fa-star-o" data-rating="1"></span>
                                                                    <span class="fa fa-star-o" data-rating="2"></span>
                                                                    <span class="fa fa-star-o" data-rating="3"></span>
                                                                    <span class="fa fa-star-o" data-rating="4"></span>
                                                                    <span class="fa fa-star-o" data-rating="5"></span>
                                                                    <input type="hidden" name="farm_travel_stars" class="rating-value">
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                                                <button type="button" class="submitRating btn btn-primary" data-bs-dismiss="modal" value="${farmTravelOrder.order_ID}">完成</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="row"><fmt:formatDate value="${farmTravelOrder.order_time}" pattern="yyyy/MM/dd HH:mm"/></div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


</body>
<!-- JavaScript 寫在這 -->
<script>
    $('.pay').click(function (){
        $.post(
            "<%=request.getContextPath()%>/farmTravelOrder.do",
            { action:'pay', order_ID: $(this).val()},
            (data)=>{
                alert(data);
                window.location.href="<%=request.getContextPath()%>/front-end/farmTravelOrder/listAllFarmTravelOrderByMem.jsp"
            }
        )
    });

    var $star_rating = $('.star-rating .fa');

    var SetRatingStar = function() {
        return $star_rating.each(function() {
            if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
                return $(this).removeClass('fa-star-o').addClass('fa-star');
            } else {
                return $(this).removeClass('fa-star').addClass('fa-star-o');
            }
        });
    };

    $star_rating.on('click', function() {

        $star_rating.siblings('input.rating-value').val($(this).data('rating'));
        return SetRatingStar();
    });
    SetRatingStar();

    $('.submitRating').click(function (){
        $.post(
            '<%=request.getContextPath()%>/farmTravelOrder.do',
            { action: 'mem_rating', order_ID: this.value, farm_travel_stars: $('.rating-value').val()},
            (date)=>{
                alert(date);
                window.location.href="<%=request.getContextPath()%>/front-end/farmTravelOrder/listAllFarmTravelOrderByMem.jsp";
            }
        );
        $('.fa-star').removeClass('fa-star').addClass('fa-star-o');
    });
</script>
</html>