<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.farmTravelOrder.model.FarmTravelOrderVO" %>
<%@ page import="com.mem.model.MemVO" %>
<%
    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
    List<FarmTravelOrderVO> farmTravelOrderList = farmTravelOrderService.getAllFarmTravelOrderByMem(((MemVO)session.getAttribute("memVO")).getMem_id());
    pageContext.setAttribute("farmTravelOrderList",farmTravelOrderList);
%>
<html>
<head>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>

    <title>我的訂單</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .star-rating {
            line-height:32px;
            font-size:1.25em;
        }
        .star-rating .fa-star{color: orange;}
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">訂單編號</th>
        <th scope="col">農遊行程編號</th>
        <th scope="col">訂單日期</th>
        <th scope="col">報名人數</th>
        <th scope="col">訂單金額</th>
        <th scope="col">訂單狀態</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="farmTravelOrder" items="${farmTravelOrderList}">
        <tr>
            <th scope="row">${farmTravelOrder.order_ID}<br/></th>
            <td>${farmTravelOrder.farm_travel_ID}</td>
            <td>${farmTravelOrder.order_time}</td>
            <td>${farmTravelOrder.people_num}</td>
            <td>${farmTravelOrder.order_fee}</td>
            <td>
                <c:forEach var="farmTravelOrderState" items="${farmTravelOrderStatusByMem}">
                    <c:if test="${farmTravelOrder.order_state == farmTravelOrderState.key}">
                        ${farmTravelOrderState.value}
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <c:if test="${farmTravelOrder.order_state eq 0}">
                    <button type="button" class="pay btn btn-outline-primary" value="${farmTravelOrder.order_ID}">前往付款</button>
                </c:if>
                <c:if test="${farmTravelOrder.order_state eq 2}">

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal_${farmTravelOrder.order_ID}">
                        給予評價
                    </button>

                    <!-- Modal -->
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
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
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
</body>
</html>
