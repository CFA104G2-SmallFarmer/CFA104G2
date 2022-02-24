<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.farmTravel.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
    FarmTravelVO farmTravel = (FarmTravelVO)request.getAttribute("farmTravel");
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

    <%-- date & time picker --%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

    <title>瀏覽我的行程</title>

    <%-- date & time picker --%>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

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
        main{
            width: 100%;
            display: block;
        }
        h3{
            text-align: center;
        }
        #imgPreview{
            width: 100%;
            height: 300px;
        }
        #addBtn:hover{
            background-color: #b9d4b3;
        }
        #tagArea{
            margin-bottom: 10px;
        }
        .tags{
            border: 2px solid;
        }
        .tags:hover {
            background-color: #b9d4b3;
            border: 2px solid #b9d4b3;
        }
        .removePNG{
            width: 30px;
            height: 30px;
            margin: 0 -6px 0 6px;
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

    <%-- date & time picker 設定 --%>
    <script>
        $(function(){
            $("#farm_travel_start").datepicker({
                dateFormat:"yy-mm-dd",
                minDate: 0,
                onClose: travelStartDate=>{
                    $("#farm_travel_end").datepicker("option", "minDate", travelStartDate);
                    $("#travel_apply_start").datepicker("option", "maxDate", travelStartDate);
                    $("#travel_apply_end").datepicker("option", "maxDate", travelStartDate);
                }
            });
            $("#farm_travel_end").datepicker({
                dateFormat:"yy-mm-dd",
                minDate: 0,
                onClose: endDate=>$("#farm_travel_start").datepicker("option", "maxDate", endDate)
            });
            $(".timepicker").timepicker({
                timeFormat: "HH:mm:ss",
                interval: 30,
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
            $("#travel_apply_start").datepicker({
                dateFormat:"yy-mm-dd",
                minDate: 0,
                onClose: startDate=>$("#travel_apply_end").datepicker("option", "minDate", startDate)
            });
            $("#travel_apply_end").datepicker({
                dateFormat:"yy-mm-dd",
                minDate: 0,
                onClose: endDate=>$("#travel_apply_start").datepicker("option", "maxDate", endDate)
            });
        });
    </script>
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
    <h3>新增農遊行程</h3>
    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
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
            <form method="post" action="<%=request.getContextPath()%>/farmTravel.do" enctype="multipart/form-data" name="addForm">
                <div class="row">
                    <div class="col-5">
                        <div class="row">
                            <figure class="figure">
                                <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/NoImage.png" class="figure-img img-fluid rounded" id="imgPreview">
                                <figcaption class="figure-caption text-end">封面預覽</figcaption>
                            </figure>
                        </div>
                        <%-- Tag Add--%>
                        <div class="row">
                            <label for="insertTag" class="form-label">農遊標籤</label>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="請輸入標籤" aria-describedby="addBtn" id="insertTag" maxlength="20" autocomplete="off">
                                <button id="addBtn" class="btn btn-outline-secondary" type="button">
                                    <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/addTag.png" width="30px" height="30px">
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div id="tagArea"></div>
                        </div>
                        <%-- Error Message --%>
                        <div class="row">
                            <c:if test="${not empty errorMsgs}">
                                <span style="color:red;font-size:20px;">Error:</span>
                                <ul>
                                    <c:forEach var="message" items="${errorMsgs}">
                                        <li style="color:red">${message}</li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="mb-3">
                            <label for="farm_travel_img" class="form-label">農遊封面</label>
                            <input type="file" class="form-control" id="farm_travel_img" accept="image/*" name="farm_travel_img">
                        </div>
                        <div class="mb-3">
                            <label for="farm_travel_title" class="form-label">農遊標題</label>
                            <input type="text" class="form-control" id="farm_travel_title" placeholder="Ex：草莓醬的由來~" autocomplete="off" name="farm_travel_title" value="<%=(farmTravel == null) ? "" : farmTravel.getFarm_travel_title()%>">
                        </div>
                        <label for="farm_travel_start">行程起日</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control datepicker_start" id="farm_travel_start" placeholder="行程起日" autocomplete="off" name="farm_travel_start_date" value="<%=(farmTravel == null) ? "" : (farmTravel.getFarm_travel_start() == null) ? "" : new SimpleDateFormat("yyyy-MM-dd").format(farmTravel.getFarm_travel_start())%>">
                            <input type="text" class="form-control timepicker" placeholder="開始時間" autocomplete="off" name="farm_travel_start_time" value="<%=(farmTravel == null) ? "" : (farmTravel.getFarm_travel_start() == null) ? "" : new SimpleDateFormat("HH:mm:ss").format(farmTravel.getFarm_travel_start())%>">
                        </div>
                        <label for="farm_travel_end">行程迄日</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control datepicker_end" id="farm_travel_end" placeholder="行程迄日" autocomplete="off" name="farm_travel_end_date" value="<%=(farmTravel == null) ? "" : (farmTravel.getFarm_travel_end() == null) ? "" : new SimpleDateFormat("yyyy-MM-dd").format(farmTravel.getFarm_travel_end())%>">
                            <input type="text" class="form-control timepicker" placeholder="結束時間" autocomplete="off" name="farm_travel_end_time" value="<%=(farmTravel == null) ? "" : (farmTravel.getFarm_travel_end() == null) ? "" : new SimpleDateFormat("HH:mm:ss").format(farmTravel.getFarm_travel_end())%>">
                        </div>
                        <label for="farm_travel_fee" class="form-label">農遊報名費用</label>
                        <div class="input-group mb-3">
                            <input type="number" class="form-control" id="farm_travel_fee" min="0" autocomplete="off" name="farm_travel_fee" value="<%=(farmTravel == null) ? "" : farmTravel.getFarm_travel_fee()%>">
                            <span class="input-group-text">元</span>
                        </div>
                        <div class="mb-3">
                            <label for="travel_apply_start" class="form-label">報名起日</label>
                            <input type="text" class="form-control" id="travel_apply_start" autocomplete="off" name="travel_apply_start" value="<%=(farmTravel == null) ? "" : (farmTravel.getTravel_apply_start() == null) ? "" : new SimpleDateFormat("yyyy-MM-dd").format(farmTravel.getTravel_apply_start())%>">
                        </div>
                        <div class="mb-3">
                            <label for="travel_apply_end" class="form-label">報名迄日</label>
                            <input type="text" class="form-control" id="travel_apply_end" autocomplete="off" name="travel_apply_end" value="<%=(farmTravel == null) ? "" : (farmTravel.getTravel_apply_end() == null) ? "" : new SimpleDateFormat("yyyy-MM-dd").format(farmTravel.getTravel_apply_end())%>">
                        </div>
                        <label for="farm_travel_min" class="form-label">最少成團人數</label>
                        <div class="input-group mb-3">
                            <input type="number" class="form-control" id="farm_travel_min" min="2" max="25" autocomplete="off" name="farm_travel_min" value="<%=(farmTravel == null) ? "" : farmTravel.getFarm_travel_min()%>">
                            <span class="input-group-text">人</span>
                        </div>
                        <label for="farm_travel_max" class="form-label">最大額滿人數</label>
                        <div class="input-group mb-3">
                            <input type="number" class="form-control" id="farm_travel_max" min="2" max="25" autocomplete="off" name="farm_travel_max" value="<%=(farmTravel == null) ? "" : farmTravel.getFarm_travel_max()%>">
                            <span class="input-group-text">人</span>
                        </div>
                        <div class="mb-3">
                            <label for="farm_travel_info" class="form-label">行程資訊</label>
                            <textarea class="form-control" id="farm_travel_info" rows="3" autocomplete="off" name="farm_travel_info" placeholder="Ex：從採草莓開始，一步一步開始製作草莓醬吧~"><%=(farmTravel == null) ? "" : farmTravel.getFarm_travel_info()%></textarea>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="checkAgree form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">已詳讀並同意遵守<a href="#">農遊行程相關規定</a></label>
                        </div>
                        <input type="hidden" name="mem_ID" value="77005">
                        <input type="hidden" name="f_mem_ID" value="70000">
                        <input type="hidden" name="action" value="insert">
                        <button type="submit" class="submit btn btn-primary" disabled="disabled">送出</button>
                        <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/LittleFammer.jpg" height="30" width="30" onClick="autoAdd(this)">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
<!-- JavaScript 寫在這 -->
<script>
    let inputImg = document.getElementById("farm_travel_img");
    inputImg.addEventListener("change",()=> document.querySelector("#imgPreview").setAttribute("src",URL.createObjectURL(inputImg.files[0] )) );

    $(".checkAgree").click(function (){
        if ($(".checkAgree").prop("checked")){
            $(".submit").attr("disabled",false);
        }else {
            $(".submit").prop("disabled", true);
        }
    });

    const set = new Set();
    $("#addBtn").click(function () {
        if ($("#insertTag").val().trim() != "" && set.size < 5){
            if (set.has($("#insertTag").val())){
                alert("重複標籤");
            }else {
                set.add($("#insertTag").val());
                let input = document.createElement("input");
                input.type="hidden";
                input.value = $("#insertTag").val();
                input.setAttribute("name", "tag_name");
                let btn = document.createElement("button");
                btn.type = "button";
                btn.className = "tags btn btn-outline-secondary";
                btn.setAttribute("onclick", "removeTags(this)");
                btn.textContent = "# "+$("#insertTag").val();
                let img = document.createElement("img");
                img.src = "<%=request.getContextPath()%>/front-end/farmTravel/images/removeTag.png";
                img.className ="removePNG";
                btn.append(img);
                $("#insertTag").val("");
                $("#tagArea").append(input, btn);
            }
        } else if ($("#insertTag").val().trim() == ""){ alert("請輸入標籤名稱");
        } else { alert("標籤已達最大上限"); }
    });

    function removeTags(e){
        let tags = e;
        let input = tags.previousElementSibling;
        tags.remove();
        input.remove();
        set.delete(input.value);
    };

    function autoAdd(){
        addForm.farm_travel_title.value="草莓醬的誕生";
        addForm.farm_travel_info.value="從採草莓開始，一步一步製作成草莓醬吧~";
        addForm.farm_travel_start_date.value="2022-03-08";
        addForm.farm_travel_start_time.value="08:30:00";
        addForm.farm_travel_end_date.value="2022-03-09";
        addForm.farm_travel_end_time.value="15:00:00";
        addForm.farm_travel_fee.value="3000";
        addForm.travel_apply_start.value="2022-02-08";
        addForm.travel_apply_end.value="2022-02-28";
        addForm.farm_travel_min.value="3";
        addForm.farm_travel_max.value="10";
    };
</script>

</script>
</html>