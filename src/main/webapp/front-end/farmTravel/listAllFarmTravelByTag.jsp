<%@ page import="com.farmTravel.model.FarmTravelVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <title>List All Farm Travel.jsp</title>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <div id="searchBar">
            <button type="button" class="back btn btn-outline-light">
                <a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp"><img src="<%=request.getContextPath()%>/front-end/farmTravel/images/back.png"></a>
            </button>
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Search">
                <button class="search btn btn-outline-secondary" type="button" id="search">
                    <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/search.png" width="30px" height="30px">
                </button>
            </div>
        </div>
        <main>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">農遊行程編號</th>
                        <th scope="col">一般會員編號</th>
                        <th scope="col">小農編號</th>
                        <th scope="col">農遊標題</th>
                        <th scope="col">農遊封面圖</th>
                        <th scope="col">農遊資訊</th>
                        <th scope="col">農遊行程起</th>
                        <th scope="col">農遊行程迄</th>
                        <th scope="col">農遊費用</th>
                        <th scope="col">農遊報名開始</th>
                        <th scope="col">農遊報名截止</th>
                        <th scope="col">最少人數</th>
                        <th scope="col">最大人數</th>
                        <th scope="col">目前報名人數</th>
                        <th scope="col">農遊狀態</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="farmTravel" items="${farmTravelList}">
                        <tr>
                            <th scope="row">${farmTravel.farm_travel_ID}<br/></th>
                            <td>${farmTravel.mem_ID}</td>
                            <td>${farmTravel.f_mem_ID}</td>
                            <td>${farmTravel.farm_travel_title}</td>
                            <td>
                            <c:if test="${not empty farmTravel.farm_travel_img}">
                                <img src="<%=request.getContextPath()%>/getImage.do?farm_travel_ID=${farmTravel.farm_travel_ID}" width="200" height="150">
                            </c:if>
                            <c:if test="${empty farmTravel.farm_travel_img}" >
                                <img src="<%=request.getContextPath()%>/front-end/farmTravel/images/NoImage.png" width="200" height="150">
                            </c:if>
                            </td>
                            <td>${farmTravel.farm_travel_info}</td>
                            <td>${farmTravel.farm_travel_start}</td>
                            <td>${farmTravel.farm_travel_end}</td>
                            <td>${farmTravel.farm_travel_fee}</td>
                            <td>${farmTravel.farm_travel_min}</td>
                            <td>${farmTravel.farm_travel_max}</td>
                            <td>${farmTravel.farm_travel_now}</td>
                            <td>${farmTravel.farm_travel_state}</td>
                            <td>
                                <form method="post" action="<%=request.getContextPath()%>/farmTravel.do">
                                    <input type="hidden" name="action" value="getOne">
                                    <input type="hidden" name="farm_travel_ID" value="${farmTravel.farm_travel_ID}">
                                    <button type="submit" class="btn btn-outline-primary">查看詳情</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
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
    </body>
</html>
