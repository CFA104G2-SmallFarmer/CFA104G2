<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.farmTravel.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
    FarmTravelVO farmTravel = (FarmTravelVO)request.getAttribute("farmTravel");
%>
<html>
<head>
    <title>Update Farm Travel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        main{
            width: 100%;
            display: block;
        }
        h3{
            text-align: center;
        }
        #left{
            margin: 0 0 0 8%;
            padding: 10px 0 0 10%;
            float: left;
            width: 40%;
        }
        #imgPreview{
            width: 600px;
            height: 450px;
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
        #right{
            margin: 0 8% 0 0;
            float: right;
            width: 40%;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<button type="button" class="back btn btn-outline-light">
    <a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravel.jsp"><img src="<%=request.getContextPath()%>/front-end/farmTravel/images/back.png"></a>
</button>
<main>
    <h3>編輯農遊行程</h3>
    <div id="left">
        <figure class="figure">
            <c:if test="${not empty farmTravel.farm_travel_img}">
                <img src="<%=request.getContextPath()%>/farmTravel.do?farm_travel_ID=${farmTravel.farm_travel_ID}" class="figure-img img-fluid rounded" id="imgPreview">
            </c:if>
            <c:if test="${empty farmTravel.farm_travel_img}" >
                <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/NoImage.png" class="figure-img img-fluid rounded" id="imgPreview">
            </c:if>
            <figcaption class="figure-caption text-end">封面預覽</figcaption>
        </figure>
        <%-- Tag Add--%>
        <label for="insertTag" class="form-label">農遊標籤</label>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="請輸入標籤" aria-describedby="addBtn" id="insertTag" maxlength="20" autocomplete="off">
            <button id="addBtn" class="btn btn-outline-secondary" type="button">
                <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/addTag.png" width="30px" height="30px">
            </button>
        </div>
        <div id="tagArea">
            <c:forEach var="farmTravelTag" items="${tagList}">
                <button type="button" class="tags btn btn-outline-secondary" onclick="removeTags(this)" value="${farmTravelTag.tag_name}"># ${farmTravelTag.tag_name}<img src="<%=request.getContextPath()%>/front-end/farmTravel/images/removeTag.png" class="removePNG"></button>
            </c:forEach>
        </div>
        <%--Error Message --%>
        <c:if test="${not empty errorMsgs}">
            <span style="color:red;font-size:20px;">Error:</span>
            <ul>
                <c:forEach var="message" items="${errorMsgs}">
                    <li style="color:red">${message}</li>
                </c:forEach>
            </ul>
        </c:if>
    </div>
    <div id="right">
        <form method="post" action="<%=request.getContextPath()%>/farmTravel.do" enctype="multipart/form-data" name="addForm">
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
            <input type="hidden" name="farm_travel_ID" value="${farmTravel.farm_travel_ID}">
            <input type="hidden" name="action" value="update">
            <button type="submit" class="submit btn btn-primary" disabled="disabled">送出</button>
            <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/LittleFammer.jpg" height="30" width="30" onClick="autoAdd(this)">
        </form>
    </div>
</main>
<script>
    let inputImg = document.getElementById("farm_travel_img");
    inputImg.addEventListener("change",()=>{ document.querySelector("#imgPreview").setAttribute("src",URL.createObjectURL(inputImg.files[0])); });

    $(".checkAgree").click(function (){
        if ($(".checkAgree").prop("checked")){
            $(".submit").attr("disabled",false);
        }else {
            $(".submit").prop("disabled", true);
        }
    });

    let set = new Set();
    <c:forEach var="farmTravelTag" items="${tagList}">
        set.add("${farmTravelTag.tag_name}");
    </c:forEach>

    $("#addBtn").click(function () {
        if ($("#insertTag").val().trim() != "" && set.size < 5){
            if (set.has($("#insertTag").val())){
                alert("重複標籤");
            }else {
                set.add($("#insertTag").val());
                let btn = document.createElement("button");
                btn.type = "button";
                btn.className = "tags btn btn-outline-secondary";
                btn.setAttribute("onclick", "removeTags(this)");
                btn.textContent = "# "+$("#insertTag").val();
                btn.value = $("#insertTag").val();
                let img = document.createElement("img");
                img.src = "<%=request.getContextPath()%>/front-end/farmTravel/images/removeTag.png";
                img.className ="removePNG";
                btn.append(img);
                $("#tagArea").append(btn);
                $.post(
                    "<%=request.getContextPath()%>/farmTravelTag.do",
                    { action:"insert", tag_name:$("#insertTag").val()},
                    ()=>{
                        $.post(
                            "<%=request.getContextPath()%>/farmTravelTagDetails.do",
                            { action:"insert", farm_travel_ID:"${farmTravel.farm_travel_ID}", tag_name:$("#insertTag").val()},
                            ()=>$("#insertTag").val("")
                        )
                    }
                );
            }
        } else if ($("#insertTag").val().trim() == ""){ alert("請輸入標籤名稱");
        } else { alert("標籤已達最大上限"); }
    });

    function removeTags(e){
        let tags = e;
        tags.remove();
        set.delete(tags.value);
        $.post(
            "<%=request.getContextPath()%>/farmTravelTagDetails.do",
            { action:"delete", farm_travel_ID:"${farmTravel.farm_travel_ID}", tag_name:tags.value},
            ()=>{}
        );
    };

    function autoAdd(){
        addForm.farm_travel_title.value="藍莓醬的誕生";
        addForm.farm_travel_info.value="從採藍莓開始，一步一步製作成藍莓醬吧~";
        addForm.farm_travel_start_date.value="2022-03-08";
        addForm.farm_travel_start_time.value="08:00:00";
        addForm.farm_travel_end_date.value="2022-03-09";
        addForm.farm_travel_end_time.value="15:30:00";
        addForm.farm_travel_fee.value="2500";
        addForm.travel_apply_start.value="2022-02-09";
        addForm.travel_apply_end.value="2022-02-28";
        addForm.farm_travel_min.value="5";
        addForm.farm_travel_max.value="15";
    }
</script>
</body>
</html>