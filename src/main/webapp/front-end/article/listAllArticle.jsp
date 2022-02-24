<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.article.model.*" %>
<%@ page import="com.mem.model.MemVO" %>
<%
    ArticleService articleService = new ArticleService();
    List<ArticleVO> list = articleService.getAllArticle();
    pageContext.setAttribute("list", list);

    MemVO memVO = new MemVO();
    memVO.setMem_id(77000);
    memVO.setMem_id_state(0);
    session.setAttribute("memVO", memVO);

%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no , user-scalable=yes">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>小農論壇</title>

    <link rel="icon" href="favicon.ico"/>
    <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/article/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
            crossorigin="anonymous"></script>

    <style>
        * {
            box-sizing: border-box;
        }

        :root {
            --header-height: 60px;
            /*--aside-width: 240px;*/
        }

        body {
            margin: 0;
        }

        img {
            max-width: 100%;
        }

        /* ==================== header 區域 ==================== */
        header.header {
            /*border: 1px solid black;*/
            width: 100%;
            position: sticky;
            top: 0;
            height: var(--header-height);
            background-color: rgb(238, 231, 231);
        }

        header.header button.btn_hamburger {
            display: none;
        }

        /* ==================== aside 區域 ==================== */
        /*aside.aside {*/
        /*    !*border: 1px solid blue;*!*/
        /*    position: fixed;*/
        /*    top: var(--header-height);*/
        /*    left: 0;*/
        /*    height: calc(100% - var(--header-height));*/
        /*    width: var(--aside-width);*/
        /*    background-color: #efefef;*/
        /*    overflow-y: auto;*/
        /*    padding: 20px 0;*/
        /*    transition: all 1s;*/
        /*}*/

        /*aside.aside button.btn_hamburger {*/
        /*    display: none;*/
        /*}*/

        /*@media screen and (max-width: 767px) {*/
        /*    aside.aside {*/
        /*        top: 0;*/
        /*        height: 100%;*/
        /*        transform: translateX(-100%);*/
        /*    }*/

        /*    aside.aside.-on {*/
        /*        transform: translateX(0%);*/
        /*    }*/

        /*    header.header button.btn_hamburger, aside.aside button.btn_hamburger {*/
        /*        display: inline-block;*/
        /*    }*/
        /*}*/

        /*aside.aside > nav.nav > ul.nav_list {*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*    list-style: none;*/
        /*}*/

        /*aside.aside > nav.nav > ul.nav_list > li > a {*/
        /*    display: inline-block;*/
        /*    !*border: 1px solid lightblue;*!*/
        /*    width: 100%;*/
        /*    padding: 3px 10px;*/
        /*}*/

        /* ==================== main 區域 ==================== */
        main.main {
            /*border: 1px solid red;*/
            margin-left: var(--aside-width);
            width: calc(100% - var(--aside-width));
            padding: 20px;
            background-color: hsl(0, 14%, 99%);
            min-height: calc(100vh - var(--header-height));
            transition: all 1s;
        }

        @media screen and (max-width: 767px) {
            main.main {
                width: 100%;
                margin-left: 0;
            }
        }

        main.main ul.item_list {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            flex-wrap: wrap;
        }

        main.main ul.item_list > li {
            width: calc((100% - 60px) / 4);
            margin-bottom: 20px;
            margin-right: 20px;
        }

        @media screen and (max-width: 767px) {
            main.main ul.item_list > li {
                width: calc((100% - 20px) / 2);
            }
        }

        main.main ul.item_list > li:nth-child(4n) {
            margin-right: 0;
        }

        @media screen and (max-width: 767px) {
            main.main ul.item_list > li:nth-child(2n) {
                margin-right: 0;
            }
        }

        main.main ul.item_list > li > a {
            display: inline-block;
            /*border: 1px solid red;*/
            text-decoration: none;
            width: 100%;
        }

        main.main ul.item_list > li > a div.img_block {
            /*border: 1px solid blue;*/
            font-size: 0;
        }

        main.main ul.item_list > li > a span.item_text {
            /*border: 1px solid blue;*/
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            width: 100%;
        }

        .lead {
            font-size: 10px;
            background: #dddddd;
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

        .row {
            --bs-gutter-x: 0rem;
            --bs-gutter-y: 0;
            display: flex;
            flex-wrap: wrap;
            margin-top: calc(var(--bs-gutter-y) * -1);
            margin-right: calc(var(--bs-gutter-x) / -2);
            margin-left: calc(var(--bs-gutter-x) / -2);
        }

        .bg-dark {
            background-color: #434217 !important;
        }

        img {
            max-width: 250%;
        }
    </style>

</head>

<body>
<%--Header--%>
<nav class="navbar navbar-expand-lg navbar-dark border border-dark bg-dark" style="font-size: x-large;">
    <div class="container">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp">
            <div class="logo"><img style="height:100px"
                                   src="<%=request.getContextPath()%>/front-end/article/images/調整後白小農logo.png"></div>
            <%--            <h4>小農論壇</h4>--%>
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
                <li class="nav-item active me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">回到首頁</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">小農商城</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravel.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">農場旅遊</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/front-end/articleCollection/articleCollection.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">農產認養</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">會員專區</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href='<%=request.getContextPath()%>/front-end/article/addArticle.jsp'>
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">註冊/登入</span>
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%--header2--%>
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-dark border border-dark bg-dark" style="color: #efefef">
        <h4>小農論壇</h4>
        <div class="container">
            <a class="navbar-brand" href="index.html">
                <%--首頁--%>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                    aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
                    <li class="nav-item active me-3">
                        <a class="nav-link" href='<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp'>
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">所有文章</span>
                        </span>
                        </a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href='<%=request.getContextPath()%>/front-end/article/addArticle.jsp'>
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">新增文章</span>
                        </span>
                        </a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href='<%=request.getContextPath()%>/front-end/article/listAllMyArticle.jsp'>
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">我的文章</span>
                        </span>
                        </a>
                    </li>

                    <li>
                        <div class="nav-right">

                            <div class="search-box">
                                <form class="d-flex" method="post" action="<%=request.getContextPath()%>/article.do">
                                    <input class="form-control me-2" type="search" placeholder="Search"
                                           aria-label="Search" name="searchArticle">
                                    <input type="hidden" name="action" value="search">
                                    <button type="submit"><img
                                            src="<%=request.getContextPath()%>/front-end/article/images/search.svg">Search
                                    </button>
                                </form>
                            </div>
                            <div class="nav-user-icon online">
                                <c:if test="${empty farmTravel.farm_travel_img}">
                                    <img src="<%=request.getContextPath()%>/front-end/article/images/dogcoco.png">
                                </c:if>
                            </div>
                        </div>
                    </li>

                    <%--                    收尋功能--%>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">${memVO.mem_id}</span>
                        </span><i class="fa fa-angle-down   "></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Profile</a>
                            <a class="dropdown-item" href="#">Account Settings</a>
                            <a class="dropdown-item" href="#">Newsletter</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Sign Out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <%--    <button type="button" class="btn_hamburger">按鈕</button>--%>
</header>
<%--左側邊欄--%>
<div class="left-sidebar">

</div>
<%--主內容--%>
<div class="main-content">
    <main class="main">
        <div class="post-container">
            <div class="row">
                <div class="col-3" style="background: #efefef;"></div>
                <div class="col-6 " style="background: #efefef;">
                    <c:forEach var="article" items="${list}">
                        <div class="aArticle row widged " style="background: #F5F5F7">
                            <div class="col-4">
                                <div class="row mb-2">
                                    <c:if test="${not empty article.article_img}">
                                        <img src="<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}"
                                             class="rounded mx-auto d-block" width='200' height='150'>
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
                                    <div class="col-4"></div>
                                </div>
                            </div>
                            <div class="col-8 row">
                                <div class="row mb-2">
                                    <h3>類別： #
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
                                <div class="row mb-2"></div>
                                    <%-- 第三行 --%>
                                <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
                                <div class="row mb-2">
                                    <div class="col-4">
                                            <%--按讚數：--%>
                                        <img src='<%=request.getContextPath()%>/front-end/article/images/thumbs-up.png'
                                             width='30px' height='30px'>
                                            ${article.article_like}</div>
                                    <div class="col-4">
                                            <%--留言數：--%>
                                        <img src='<%=request.getContextPath()%>/front-end/article/images/comment.png'
                                             width='30px' height='30px'>
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
                            </div>
                        </div>
                        <hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
                    </c:forEach>
                </div>
                <div class="col-3" style="background: #efefef;"></div>
            </div>
        </div>
    </main>
</div>
</body>
<script>
    $(function () {

        $("button.btn_hamburger").on("click", function () {
            $("aside.aside").toggleClass("-on");
        });

    });
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