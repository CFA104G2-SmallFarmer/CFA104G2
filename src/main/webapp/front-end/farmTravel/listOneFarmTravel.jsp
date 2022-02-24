<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

    <title>查看行程詳情</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        body{
            font-family: 'Noto Sans TC', sans-serif;
            font-size: 17px;
            color: #606060;
        }
        h2,h4,h5{
            font-weight: normal;
        }
        .tag{
            background-color: #eeeeee;
            padding: 5px;
            border-radius: 5px;
            color: #606060;
        }
        .submitBtn{
            width: 100%;
            height: 50px;
            background-color: #4a7246;
            color: white;
            font-weight: bolder;
            font-size: 18px;
        }
        #containArea{
            background-color: #eeeeee;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 16px;
        }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<div class="container">
    <div class="row">
        <div class="col mb-2"><h2>${farmTravel.farm_travel_title}</h2></div>
    </div>
    <div class="row">
        <c:forEach var="tag" items="${tagList}">
            <div class="col-auto"><span class="tag">#${tag.tag_name}</span></div>
        </c:forEach>
    </div>
    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
    <div class="row">
        <div class="col">其他說明</div>
    </div>
    <br>

    <div class="row">
        <div class="col-12">
            <c:if test="${not empty farmTravel.farm_travel_img}">
                <img src="<%=request.getContextPath()%>/getImage.do?farm_travel_ID=${farmTravel.farm_travel_ID}" width="100%" height="760px">
            </c:if>
            <c:if test="${empty farmTravel.farm_travel_img}" >
                <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/NoImage.png" width="100%" height="760px">
            </c:if>
        </div>
    </div>
    <br>
    <div id="containArea">
        <div class="row">
            <div class="col-12 mb-2"><h4>▏農場說明</h4></div>
            <div class="col-12">農場說明</div>
        </div>
        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

        <div class="row">
            <div class="col-12 mb-2"><h4>▏行程資訊</h4></div>
            <div class="col-12 mb-4">${farmTravel.farm_travel_info}</div>
            <div class="col-6">行程時間：
                <fmt:formatDate value="${farmTravel.farm_travel_start}" pattern="yyyy/MM/dd HH:mm"/> ～
                <fmt:formatDate value="${farmTravel.farm_travel_end}" pattern="yyyy/MM/dd HH:mm"/>
            </div>
            <div class="col-4">${farmTravel.farm_travel_min}人成團　　目前：${farmTravel.farm_travel_now}／${farmTravel.farm_travel_max}</div>
            <div class="col-2">NT$：${farmTravel.farm_travel_fee}</div>
        </div>
        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

        <div class="row">
            <div class="col-12 mb-2"><h4>▏注意事項</h4></div>
            <div class="col-12">注意事項說明1</div>
            <div class="col-12">注意事項說明2</div>
            <div class="col-12">注意事項說明3</div>
        </div>
        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

        <div class="row">
            <div class="col-12 mb-2"><h4>▏取消政策</h4></div>
            <div class="col-12">距離出發日天數/取消費用</div>
            <div class="col-12">所選日期前 8 天以上取消，全額退款</div>
            <div class="col-12">所選日期 0～7 天之間取消，無法退款</div>
        </div>
        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

        <div class="row">
            <div class="col-12 mb-2"><h4>▏地點</h4></div>
            <div class="col-12"><h5>目的地資訊</h5></div>
            <div class="col-12 mb-4">google地圖...</div>
            <div class="col-12"><h5>電話</h5></div>
            <div class="col-12 mb-4">0123456789</div>
            <div class="col-12"><h5>營業時間</h5></div>
            <div>星期1　09:00~17:00</div>
            <div>星期2　09:00~17:00</div>
            <div>星期3　09:00~17:00</div>
            <div>星期4　09:00~17:00</div>
            <div>星期5　09:00~17:00</div>
            <div>星期6　08:00~18:00</div>
            <div>星期7　08:00~18:00</div>
        </div>
    </div>
    <c:if test="${farmTravel.farm_travel_state eq 1 || farmTravel.farm_travel_state eq 2}">
        <div class="row">
            <div class="col-12">
                <form method="post" action="/CFA104G2/farmTravel.do">
                    <input type="hidden" name="action" value="getOneForApply">
                    <input type="hidden" name="farm_travel_ID" value="${farmTravel.farm_travel_ID}">
                    <button type="submit" class="submitBtn btn">手　刀　報　名</button>
                </form>
            </div>
        </div>
    </c:if>
</div>

</body>
<script>
    $(".back").click( ()=> history.back() );
</script>
</html>