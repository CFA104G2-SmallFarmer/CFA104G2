<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderVO" %>
<%@ page import="com.mem.model.MemVO" %>
<%
    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
    List<FarmTravelOrderVO> farmTravelOrderList = farmTravelOrderService.getAllFarmTravelOrderByMem(((MemVO)session.getAttribute("mem")).getMem_id());
    pageContext.setAttribute("farmTravelOrderList",farmTravelOrderList);
%>
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
        .orderState{
            text-align: center;
            padding: 15px;
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
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

<!-- 標籤分頁未完成 -->
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
                <button class="nav-link" id="order-tab-3" data-bs-toggle="pill" data-bs-target="#order-contact-3" type="button" role="tab" aria-controls="order-contact-3" aria-selected="false">等待活動開始</button>
            </li>

            <li class="nav-item col-3" role="presentation">
                <button class="nav-link" id="order-tab-4" data-bs-toggle="pill" data-bs-target="#order-contact-4" type="button" role="tab" aria-controls="order-contact-4" aria-selected="false">活動已結束</button>
            </li>
        </ul>
    </div>
    <div class="row orderTitle mb-2">
        <div class="col-3">農遊名稱</div>
        <div class="col-2">人數</div>
        <div class="col-2">金額</div>
        <div class="col-3">訂單狀態</div>
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
                            <div class="col-3">來去鄉下農場住一晚兩晚三晚四晚五晚-${farmTravelOrder.farm_travel_ID}</div>
                            <div class="col-2">${farmTravelOrder.people_num}人</div>
                            <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                            <div class="col-3">
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
                                <div class="row">${farmTravelOrder.order_time}</div>
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
                            <div class="col-3">來去鄉下農場住一晚兩晚三晚四晚五晚-${farmTravelOrder.farm_travel_ID}</div>
                            <div class="col-2">${farmTravelOrder.people_num}人</div>
                            <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                            <div class="col-3">
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
                                <div class="row">${farmTravelOrder.order_time}</div>
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
                            <div class="col-3">來去鄉下農場住一晚兩晚三晚四晚五晚-${farmTravelOrder.farm_travel_ID}</div>
                            <div class="col-2">${farmTravelOrder.people_num}人</div>
                            <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                            <div class="col-3">
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
                                <div class="row">${farmTravelOrder.order_time}</div>
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
                                <div class="col-3">來去鄉下農場住一晚兩晚三晚四晚五晚-${farmTravelOrder.farm_travel_ID}</div>
                                <div class="col-2">${farmTravelOrder.people_num}人</div>
                                <div class="col-2">NT$：${farmTravelOrder.order_fee}</div>
                                <div class="col-3">
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
                                    <div class="row">${farmTravelOrder.order_time}</div>
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