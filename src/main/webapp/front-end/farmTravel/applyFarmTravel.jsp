<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <title>行程報名表</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
        #submitBtn{
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

<form method="post" action="<%=request.getContextPath()%>/farmTravelOrder.do" id="applyForm">
    <div class="container">

        <div class="row">
            <div class="col mb-2"><h2>${farmTravel.farm_travel_title}</h2></div>
        </div>

        <div class="row">
            <div class="col-auto"><span class="tag">#為王的誕生獻上禮炮1</span></div>
            <div class="col-auto"><span class="tag">#為王的誕生獻上禮炮2</span></div>
            <div class="col-auto"><span class="tag">#為王的誕生獻上禮炮3</span></div>
            <div class="col-auto"><span class="tag">#為王的誕生獻上禮炮4</span></div>
            <div class="col-auto"><span class="tag">#為王的誕生獻上禮炮5</span></div>
        </div>
        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

        <div class="row">
            <div class="col">其他說明</div>
        </div>

        <div id="containArea" class="row">
            <!-- 選擇報名人數-->
            <div class="row">
                <div>
                    <div>選擇報名人數</div>
                    <input type="radio" class="people_num btn-check" name="people_num" id="people_num_1" autocomplete="off"
                           value="1" checked><label class="btn btn-outline-success" for="people_num_1">1</label>
                    <c:forEach begin="2" end="${farmTravel.farm_travel_max - farmTravel.farm_travel_now}" var="people_num">
                        <input type="radio" class="people_num btn-check" name="people_num" id="people_num_${people_num}"
                               autocomplete="off" value="${people_num}">
                        <label class="btn btn-outline-success" for="people_num_${people_num}">${people_num}</label>
                    </c:forEach>
                </div>
            </div>
            <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

            <%-- 小夥伴清單 --%>
            <div class="row" id="farm_travel_partner_list">
                <div class="col-12 mb-2"><h4>▏小夥伴清單</h4></div>
                <div class="col-12 farm_travel_partner input-group mb-3">
                    <span class="partner_nums input-group-text" id="basic-addon1">1</span>
                    <input type="text" class="partner_name form-control" name="partner_name" placeholder="參加人姓名" maxlength="20" autocomplete="off">
                    <input type="number" class="partner_phone form-control" name="partner_phone" placeholder="參加人電話" maxlength="20" autocomplete="off">
                    <input type="text" class="guardian_name form-control" name="guardian_name" placeholder="緊急連絡人姓名" maxlength="20" autocomplete="off">
                    <input type="number" class="guardian_phone form-control" name="guardian_phone" placeholder="緊急連絡人電話" maxlength="20" autocomplete="off">
                </div>
            </div>
            <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

            <%-- 報名費用 --%>
            <div class="row">
                <div class="col-12 mb-2"><h4>▏報名費用</h4></div>
                <div class="col-12">
                    每人　NT$${farmTravel.farm_travel_fee}
                </div>
            </div>
            <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

            <%-- 訂單備註 --%>
            <div class="row">
                <div class="col-12 mb-2"><h4>▏備註事項</h4></div>
                <div class="col-12">
                    <input type="text" class="form-control" name="order_memo" maxlength="250" autocomplete="off">
                </div>
            </div>
            <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
        </div>
        <input type="hidden" class="form-control" id="total_fee" name="order_fee" value="${farmTravel.farm_travel_fee}">
        <input type="hidden" name="farm_travel_ID" value="${farmTravel.farm_travel_ID}">
        <input type="hidden" name="action" value="insert">
        <div class="row">
            <div class="col-12">
                <button type="button" id="submitBtn" class="submitBtn btn btn-outline-secondary">結帳</button>
            </div>
        </div>
    </div>
</form>


</body>
<script>
    $(".people_num").click(function () {
        let people_num = this.value;
        let total_fee = people_num * ${farmTravel.farm_travel_fee};
        $("#total_fee").val(total_fee);
        $(".farm_travel_partner").remove();
        for (let nums = 1; nums <= people_num; nums++) {
            $("#farm_travel_partner_list").append(
                `<div class="farm_travel_partner input-group mb-3">
                    <span class="partner_nums input-group-text">` + nums + `</span>
                    <input type="text" class="partner_name form-control" name="partner_name" placeholder="參加人姓名" maxlength="20" autocomplete="off">
                    <input type="number" class="partner_phone form-control" name="partner_phone" placeholder="參加人電話" maxlength="20" autocomplete="off">
                    <input type="text" class="guardian_name form-control" name="guardian_name" placeholder="緊急連絡人姓名" maxlength="20" autocomplete="off">
                    <input type="number" class="guardian_phone form-control" name="guardian_phone" placeholder="緊急連絡人電話" maxlength="20" autocomplete="off">
                 </div>`
            )
        }
    });

    $("#submitBtn").click(function (){
        let submitForm = true;
        let people_num = $(":radio:checked").val();
        let partner_name_list = $('.partner_name');
        let partner_phone_list = $('.partner_phone');
        let guardian_name_list = $('.guardian_name');
        let guardian_phone_list = $('.guardian_phone');
        for (let i = 0 ; i < people_num ; i++){
            if (partner_name_list[i].value == ""){
                alert("請填寫參加人姓名");
                partner_name_list[i].focus();
                submitForm = false;
                break;
            }
            if (partner_phone_list[i].value == ""){
                alert("請填寫參加人電話");
                partner_phone_list[i].focus();
                submitForm = false;
                break;
            }
            if (guardian_name_list[i].value == ""){
                alert("請填寫緊急聯絡人姓名");
                guardian_name_list[i].focus();
                submitForm = false;
                break;
            }
            if (guardian_phone_list[i].value == ""){
                alert("請填寫緊急聯絡人電話");
                guardian_phone_list[i].focus();
                submitForm = false;
                break;
            }
        };
        if (submitForm  == false){
            return;
        }else {
            $('#applyForm').submit();
        }
    });
</script>
</html>