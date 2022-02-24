<%@ page import="com.article.model.ArticleService" %>
<%@ page import="com.article.model.ArticleVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<ArticleVO> list = (List<ArticleVO>)request.getAttribute("articleList");
    pageContext.setAttribute("list", list);
%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Google spans -->
    <link rel="preconnect" href="https://spans.googleapis.com">
    <link rel="preconnect" href="https://spans.gstatic.com" crossorigin>
    <link href="https://spans.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <title>小農論壇首頁</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        body {
            span-family: 'Noto Sans TC', sans-serif;
            span-size: 17px;
            color: #606060;
        }

        h2, h4, h5 {
            span-weight: normal;
        }

        .tag {
            background-color: #eeeeee;
            padding: 5px;
            border-radius: 5px;
            color: #606060;
        }

        .submitBtn {
            width: 100%;
            height: 50px;
            background-color: #4a7246;
            color: white;
            span-weight: bolder;
            span-size: 18px;
        }

        #containArea {
            background-color: #eeeeee;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 16px;
        }

        /* ==================== header 區域 ==================== */
        header.header {
            /*border: 1px solid black;*/
            width: 100%;
            position: sticky;
            top: 0;
            height: var(--header-height);

            /*background-color: rgb(238, 231, 231);*/
        }

        header.header button.btn_hamburger {
            display: none;
        }

        .btn-outline-secondary:hover {
            color: #FFF;
            background-color: #6C753F;
            border-color: #6c757d;
        }

        .post-container {
            width: 100%;
            background: #fff;
            border-radius: 6px;
            padding: 20px;
            color: #626262;
            margin: 20px 0;
        }

        .row {
            --bs-gutter-x: -0.5rem;
            --bs-gutter-y: 0;
        }

        .aArticle {
            border: 2px solid lightslategrey;
            border-radius: 24px;
        }

        .widged {
            background: #fff;
            padding: 10px;
            border: 1px solid #eee;
            -webkit-box-shadow: 0 1px 1px rgb(0 0 0 / 10%);
            box-shadow: 0 1px 1px rgb(0 0 0 / 10%);
        }

    </style>
</head>
<body>
<%--Header--%>

<header class="header">
    <jsp:include page="articleHeader2.jsp"></jsp:include>

    <%--header2--%>
    <div class="row">
        <div class="col-3" style="background: #efefef"></div>
        <div class="col-6">
            <header class="header" style="background-color:  rgb(200, 200, 200);">

                <%--                <nav class="navbar navbar-light bg-light widged row">--%>
                <%--                    <form class="container-fluid justify-content-start">--%>
                <%--                        <button class="btn btn-sm btn-outline-secondary" type="button">收藏文章</button>--%>
                <%--                        <button class="btn btn-sm btn-outline-secondary" type="button">熱門話題</button>--%>
                <%--                    </form>--%>

                <%--                </nav>--%>
                <nav class="navbar navbar-light bg-light">
                    <div class="container-fluid">
                        <form class="justify-content-start">
                            <button class="btn btn-sm btn-outline-secondary" type="button">收藏文章</button>
                            <button class="btn btn-sm btn-outline-secondary" type="button">熱門話題</button>
                        </form>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>

                <%--                <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>--%>

                <%--                <button type="button" class="btn_hamburger">按鈕</button>--%>

            </header>
        </div>
        <div class="col-3" style="background: #efefef;"></div>
    </div>
    <%--header2--%>

</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
<!-- 文章區塊 -->
<div class="row">
    <div class="col-3" style="background: #efefef;"></div>
    <div class="col-6 " style="background: #efefef;">
        <c:forEach var="article" items="${list}">
            <%--            <div class="aArticle"></div>--%>
            <div class="aArticle row widged " style="background: #F5F5F7">
                <div class="col-4">
                    <div class="row mb-2">
                        <c:if test="${not empty article.article_img}">
                            <img src="<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}"
                                 class="rounded mx-auto d-block" width='200' height='150'>
                            <%--                            <img src='<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}'--%>
                            <%--                                 width='100%' height='150px'>--%>
                        </c:if>
                        <c:if test="${empty article.article_img}">
                            <img src='<%=request.getContextPath()%>/front-end/article/images/透明小小農.png'
                                 width='100%'
                                 height='150px'>
                        </c:if>
                    </div>
                    <div class="row mb-2">
                            <%-- 收藏 --%>
                        <div class="col-8">
                            <button type="button" class="btn btn-outline-light"
                                    value="${article.article_ID}">
                                <img src="<%=request.getContextPath()%>/articleCollection.do?action=collection&mem_id=${memVO.mem_id}&article_ID=${article.article_ID}"
                                     class="collection" width="25px" height="25px">
                            </button>
                        </div>
                        <!-- 查看詳情 -->
                        <div class="col-4">

                        </div>
                    </div>
                </div>

                <div class="col-8 row">
                    <div class="row mb-2">
                        <h3>
                                <%--                                    ${article.article_ID}--%>
                            類別： #
                            <jsp:useBean id="articleTypeService" scope="page"
                                         class="com.articleType.model.ArticleTypeService"/>
                            <c:forEach items="${articleTypeService.allArticleType}" var="article_type">
                                <c:if test="${article.article_type_ID == article_type.article_type_ID}">
                                    ${article_type.article_type_text}
                                </c:if>
                            </c:forEach>
                                ${article.article_title}--<p>${article.mem_id}</p>
                        </h3>
                        發文時間：${article.article_time}<br>
                        <c:if test="${not empty article.article_update_time}">
                            最後修改時間：${article.article_update_time}<br/>
                        </c:if>
                    </div>
                        <%-- 第二行 --%>

                    <div class="row mb-2">
                            <%--                        文章內文:${article.article_content}--%>
                    </div>
                        <%-- 第三行 --%>
                    <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
                    <div class="row mb-2">
                        <div class="col-4">
                                <%--按讚數：--%>
                            <img src='<%=request.getContextPath()%>/front-end/article/images/thumbs-up.png' width='30px'
                                 height='30px'>
                                ${article.article_like}</div>
                        <div class="col-4">
                                <%--留言數：--%>
                            <img src='<%=request.getContextPath()%>/front-end/article/images/comment.png' width='30px'
                                 height='30px'>
                                ${article.comments_num}</div>
                        <div class="col-4">
                                <%-- 狀態碼：${article.article_state}--%>
                                <%--查詳情--%>
                            <form method="post" action="<%=request.getContextPath()%>/article.do">
                                <input type="hidden" name="action" value="getOne">
                                <input type="hidden" name="article_ID"
                                       value="${article.article_ID}">
                                <button type="submit" class="btn btn-outline-primary">查看詳情</button>
                            </form>
                        </div>
                    </div>
                        <%--                    <div class="row mb-2">--%>
                        <%--                        <div class="col-6"></div>--%>
                        <%--                        <div class="col-6"></div>--%>
                        <%--                        <div class="col-6">--%>
                        <%--                            <form method="post" action="<%=request.getContextPath()%>/article.do">--%>
                        <%--                                <input type="hidden" name="action" value="getOneForUpdate">--%>
                        <%--                                <input type="hidden" name="article_ID"--%>
                        <%--                                       value="${article.article_ID}">--%>
                        <%--                                    &lt;%&ndash;<button type="submit" class="btn btn-outline-secondary">修改</button>&ndash;%&gt;--%>
                        <%--                            </form>--%>
                        <%--                        </div>--%>
                        <%--                        <div class="col-6">--%>
                        <%--                                &lt;%&ndash;                                <button type='button' class='delete btn btn-outline-danger'&ndash;%&gt;--%>
                        <%--                                &lt;%&ndash;                                        value='${article.article_ID}'>&ndash;%&gt;--%>
                        <%--                                &lt;%&ndash;                                    刪除&ndash;%&gt;--%>
                        <%--                                &lt;%&ndash;                                </button>&ndash;%&gt;--%>
                        <%--                        </div>--%>
                        <%--                    </div>--%>
                </div>
            </div>
            <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>

        </c:forEach>

    </div>
    <div class="col-3" style="background: #efefef;"></div>
</div>
</div>

<!-- 輪播播標題 -->

<section class="pt-5 pb-5">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <h3 class="mb-3">
                    <span style="vertical-align: inherit;">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">
                                <span style="vertical-align: inherit;">活動花絮照片 </span>
                            </span>
                        </span>
                    </span>
                </h3>
            </div>
            <div class="col-6 text-md-end">
                <a class="btn btn-primary mb-3 me-1"
                   href="#carouselExampleIndicators2" role="button"
                   data-slide="prev">
                    <i class="fa fa-arrow-left"></i>
                </a>
                <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2"
                   role="button" data-slide="next">
                    <i class="fa fa-arrow-right"></i>
                </a>
            </div>
            <div class="col-12">
                <div id="carouselExampleIndicators2" class="carousel slide"
                     data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img alt="100%x280"
                                             src='<%=request.getContextPath()%>/front-end/article/images/damoPhoto/salad-g8bdb7f991_1920.jpg'>
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">農場拍到月亮
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">墾丁椰子園
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1532712938310-34cb3982ef74?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3d2e8a2039c06dd26db977fe6ac6186a">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">特殊職稱處理
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1532771098148-525cefe10c23?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3f317c1f7a16116dec454fbc267dd8e4">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">特殊職稱處理
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1532715088550-62f09305f765?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ebadb044b374504ef8e81bdec4d0e840">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">特殊職稱處理
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=0754ab085804ae8a3b562548e6b4aa2e">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">特殊職稱處理
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ee8417f0ea2a50d53a12665820b54e23">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">特殊職稱處理
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1532777946373-b6783242f211?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=8ac55cf3a68785643998730839663129">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">特殊職稱處理
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280"
                                             src="https://images.unsplash.com/photo-1532763303805-529d595877c5?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=5ee4fd5d19b40f93eadb21871757eda6">
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">特殊職稱處理
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </h4>
                                            <p class="card-text">
                                                <span style="vertical-align: inherit;">
                                                    <span style="vertical-align: inherit;">
                                                        <span style="vertical-align: inherit;">
                                                            <span style="vertical-align: inherit;">
                                                                閱讀文章..</span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


</body>
<script>

    $('.delete').click(function () {
        $.post(
            '<%=request.getContextPath()%>/article.do',
            {action: 'delete', article_ID: $(this).val()},
            () => {
                alert('刪除成功');
                window.location.href = '<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp';
            }
        );
    });
    $(".collection").click(function () {
        console.log(this);
        console.log($(this).parent().val());
        $.post(
            "<%=request.getContextPath()%>/articleCollection.do",
            {action: "collection", article_ID: $(this).parent().val()},
            data => {
                if (data == 0) {
                    alert("移除收藏");
                    $(this).attr("src", "<%=request.getContextPath()%>/front-end/article/images/bookmark.png");
                } else if (data == 1) {
                    alert("收藏成功");
                    $(this).attr("src", "<%=request.getContextPath()%>/front-end/article/images/bookmarked.png");
                }
            }
        );
    });
</script>
</html>