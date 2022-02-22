<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.article.model.*" %>
<%@ page import="com.articlePic.model.ArticlePicService" %>
<%@ page import="com.mem.model.MemVO" %>
<%

    MemVO memVO = new MemVO();
    memVO.setMem_id(77004);
    memVO.setMem_id_state(0);
    session.setAttribute("memVO", memVO);

    ArticleService articleService = new ArticleService();
    List<ArticleVO> list = articleService.getAllArticleByMemID(memVO.getMem_id());
    pageContext.setAttribute("list", list);

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
            --aside-width: 240px;
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
        aside.aside {
            /*border: 1px solid blue;*/
            position: fixed;
            top: var(--header-height);
            left: 0;
            height: calc(100% - var(--header-height));
            width: var(--aside-width);
            /*background-color: #efefef;*/
            overflow-y: auto;
            padding: 20px 0;
            transition: all 1s;
        }

        aside.aside button.btn_hamburger {
            display: none;
        }

        @media screen and (max-width: 767px) {
            aside.aside {
                top: 0;
                height: 100%;
                transform: translateX(-100%);
            }

            aside.aside.-on {
                transform: translateX(0%);
            }

            header.header button.btn_hamburger, aside.aside button.btn_hamburger {
                display: inline-block;
            }
        }

        aside.aside > nav.nav > ul.nav_list {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        aside.aside > nav.nav > ul.nav_list > li > a {
            display: inline-block;
            /*border: 1px solid lightblue;*/
            width: 100%;
            padding: 3px 10px;
        }

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
            font-size: 14px;
            background: #dddddd;
        }

        .aArticle {
            border: 2px solid lightslategrey;
            border-radius: 5px;
        }
    </style>

</head>

<body>

<%--Header--%>
<nav class="navbar navbar-expand-lg navbar-dark border border-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.html">
            <%--            <img src="C:\Users\Tibame_T14\Desktop\mySql\透明小小農.png" alt="用戶界面套件"--%>
            <%--                 style="width: 100px;">--%>
            首頁
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
                <li class="nav-item active me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">首頁</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">商城</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">旅遊</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">認養</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">小農論壇</span>
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
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <img class="rounded-circle u-box-shadow-sm me-2" width="25"
                             height="25" src=" https://dummyimage.com/100/007bff/efefef"
                             alt="html流">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;"> 約翰·多伊 </span>
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

<%--header2--%>
<header class="header">

    <nav class="navbar navbar-expand-lg navbar-dark border border-dark bg-dark" style="color: #b9d4b3">
        <div class="container">
            <a class="navbar-brand" href="index.html">
                            <img src="C:\Users\Tibame_T14\Desktop\mySql\透明小小農.png" alt="用戶界面套件"
                                 style="width: 100px;">
                首頁
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
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <img class="rounded-circle u-box-shadow-sm me-2" width="25"
                                 height="25" src=" https://dummyimage.com/100/007bff/efefef"
                                 alt="html流">
                            <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;"> 約翰·多伊 </span>
                        </span><i class="fa fa-angle-down "></i>
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
    <button type="button" class="btn_hamburger">按鈕</button>
    這是 header
</header>

<%--側邊欄--%>
<aside class="aside">
<%--    <nav class="nav">--%>
<%--        <button type="button" class="btn_hamburger">按鈕</button>--%>
<%--        <div class="list-group">--%>
<%--            <a href="#" class="list-group-item active">--%>
<%--                <span style="vertical-align: inherit;">側邊欄一--%>
<%--                </span>--%>
<%--            </a>--%>
<%--            <a href="#" class="list-group-item">--%>
<%--                <span style="vertical-align: inherit;">--%>
<%--                    <span style="vertical-align: inherit;">--%>
<%--                        <span style="vertical-align: inherit;">--%>
<%--                            <span style="vertical-align: inherit;">Dapibus ac facilisis in</span>--%>
<%--                        </span>--%>
<%--                    </span>--%>
<%--                </span>--%>
<%--            </a>--%>
<%--            <a href="#" class="list-group-item">--%>
<%--                <span style="vertical-align: inherit;">--%>
<%--                    <span style="vertical-align: inherit;">--%>
<%--                        <span style="vertical-align: inherit;">--%>
<%--                            <span style="vertical-align: inherit;">Morbi leo risus</span>--%>
<%--                        </span>--%>
<%--                    </span>--%>
<%--                </span>--%>
<%--            </a>--%>
<%--            <a href="#" class="list-group-item">--%>
<%--                <span style="vertical-align: inherit;">--%>
<%--                    <span style="vertical-align: inherit;">--%>
<%--                        <span style="vertical-align: inherit;">--%>
<%--                            <span style="vertical-align: inherit;">Porta acconsectetur ac</span>--%>
<%--                        </span>--%>
<%--                    </span>--%>
<%--                </span>--%>
<%--            </a>--%>
<%--            <a href="#" class="list-group-item">--%>
<%--                <span style="vertical-align: inherit;">--%>
<%--                    <span style="vertical-align: inherit;">--%>
<%--                        <span style="vertical-align: inherit;">--%>
<%--                            <span style="vertical-align: inherit;">前庭</span>--%>
<%--                        </span>--%>
<%--                    </span>--%>
<%--                </span>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="card">--%>
<%--            <div class="card-body">--%>
<%--                <img class="img-fluid" src=" https://dummyimage.com/430x200/5fa9f8/efefef" alt="">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="card">--%>
<%--            <div class="card-body">--%>
<%--                <img class="img-fluid" src=" https://dummyimage.com/430x200/5fa9f8/efefef" alt="">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-12 col-md-8  ">--%>
<%--            <div id="carousel-726829" class="carousel slide mb-5">--%>
<%--                <ol class="carousel-indicators">--%>
<%--                    <li data-target="#carousel-726829" data-slide-to="0"--%>
<%--                        class="active"></li>--%>
<%--                    <li data-target="#carousel-726829" data-slide-to="1" class="">--%>
<%--                    </li>--%>
<%--                    <li data-target="#carousel-726829" data-slide-to="2" class="">--%>
<%--                    </li>--%>
<%--                </ol>--%>
<%--                <ul class="nav_list">--%>
<%--                    <li><a href="#">連結一</a></li>--%>
<%--                    <li><a href="#">連結二</a></li>--%>
<%--                    <li><a href="#">連結三</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
</aside>

<%--主內容--%>
<main class="main">
    <div class="post-container">

        <%-- 文章 --%>
        <div class="margin-top-20">
            <div class="margin-top-20">
                <c:forEach var="article" items="${list}">
                    <div class="aArticle row">
                        <div class="col-4 col-md-4 col-lg-4 col-xl-4">
                            <c:if test="${not empty article.article_img}">
                                <img src='<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}'
                                     width='200' height='150'>
                            </c:if>
                            <c:if test="${empty article.article_img}">
                                <img src='<%=request.getContextPath()%>/front-end/article/images/透明小小農.png' width='200'
                                     height='150'>
                            </c:if>

                            <form method="post" action="<%=request.getContextPath()%>/article.do">
                                <input type="hidden" name="action" value="getOne">
                                <input type="hidden" name="article_ID" value="${article.article_ID}">
                                <button type="submit" class="btn btn-outline-primary">查看詳情</button>
                            </form>
                        </div>
                        <div class="col-8 col-md-8 col-lg-8 col-xl-8">
                            <h3>
                                <span style="vertical-align: inherit;">
                                    <span style="vertical-align: inherit;">
                                        <span style="vertical-align: inherit;">
                                            <span style="vertical-align: inherit;">
                                                    ${article.article_ID}
                                            </span>
                                        </span>
                                    </span>
                                    <span style="vertical-align: inherit;">
                                        <span style="vertical-align: inherit;">
                                            <span style="vertical-align: inherit;"><span>[類別：
                                                <jsp:useBean id="articleTypeService" scope="page"
                                                             class="com.articleType.model.ArticleTypeService"/>
                                                <c:forEach items="${articleTypeService.allArticleType}"
                                                           var="article_type">
                                                    <c:if test="${article.article_type_ID == article_type.article_type_ID}">
                                                        ${article_type.article_type_text}
                                                    </c:if>
                                                </c:forEach>
                                                ]</span> ${article.article_title}--<sub>${article.mem_id}</sub>
                                            </span>
                                        </span>
                                    </span>
                                </span>
                            </h3>
                            <p class="lead">
                                <span style="vertical-align: inherit;">
                                    <span style="vertical-align: inherit;">
                                        <span style="vertical-align: inherit;">
                                            <span style="vertical-align: inherit;">${article.article_content}</span>
                                        </span>
                                    </span>
    <%--                        第二行      --%>
                                    <span style="vertical-align: inherit;">
                                        <span style="vertical-align: inherit;">
                                            <span style="vertical-align: inherit;">
                                                按讚數：${article.article_like}<br/>
                                                留言數：${article.comments_num}<br/>
                                                狀態碼：${article.article_state}<br/>
                                                發文時間：${article.article_time}<br/>
                                                <c:if test="${not empty article.article_update_time}">
                                                    最後修改時間：${article.article_update_time}<br/>
                                                </c:if>
                                            </span>
                                        </span>
                                    </span>
                                </span>
                            </p>
                            <button type='button' class='delete btn btn-outline-danger' value='${article.article_ID}'>
                                刪除
                            </button>

                            <form method="post" action="<%=request.getContextPath()%>/article.do">
                                <input type="hidden" name="action" value="getOneForUpdate">
                                <input type="hidden" name="article_ID" value="${article.article_ID}">
                                <button type="submit" class="btn btn-outline-secondary">修改</button>
                            </form>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
</main>

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
</script>

</body>

</html>








