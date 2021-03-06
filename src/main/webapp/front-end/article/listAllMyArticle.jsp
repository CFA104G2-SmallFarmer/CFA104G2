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
   // MemVO memVO = (MemVO)session.getAttribute("memVO");

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
<header>
    <jsp:include page="articleHeader2.jsp"></jsp:include>
</header>

<%--主內容--%>
<main class="main">
    <%--    <div class="post-container">--%>
    <div class="row">
        <div class="col-3" style="background: #efefef;">
            <div class="row">
                <div class="col-12">
                    <div class="aArticle row widged">
                    <%--會員照片--%>
                    <img src="<%=request.getContextPath()%>/front-end/article/images/people/1.jpg" style=" width: 150px;
                      border-radius: 50%; cursor: pointer ">
                    </div>
                </div>
                <div class="col-12">
                    <div class="aArticle row widged">

                        <p>會員帳號:${memVO.mem_id}</p>
                        <p>身分:
                            <c:if test="${sessionScope.memVO.mem_id_state eq 1}">
                                <img src="<%=request.getContextPath()%>/front-end/article/images/透明小小農.png" width="30px"
                                     height="30px">我是小農
                            </c:if>
                            <c:if test="${sessionScope.memVO.mem_id_state eq 0}">
                                <img src="<%=request.getContextPath()%>/front-end/article/images/user.png" width="30px"
                                     height="30px">一般會員
                            </c:if>
                        </p>
                        <a class="nav-link"
                           href="<%=request.getContextPath()%>/front-end/articleCollection/articleCollection.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">我的收藏</span>
                        </span>
                        </a>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-8" style="background: #efefef;">
            <%-- 文章 --%>
            <div class="margin-top-20">
                <div class="margin-top-20">
                    <c:forEach var="article" items="${list}">
                        <div class="aArticle row widged">
                            <div class="col-4 col-md-4 col-lg-4 col-xl-4">
                                <c:if test="${not empty article.article_img}">
                                    <img src='<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}'
                                         width='300' height='200'>
                                </c:if>
                                <c:if test="${empty article.article_img}">
                                    <img src='<%=request.getContextPath()%>/front-end/article/images/透明小小農.png'
                                         width='300'
                                         height='200'>
                                </c:if>

                                <form method="post" action="<%=request.getContextPath()%>/article.do">
                                    <input type="hidden" name="action" value="getOne">
                                    <input type="hidden" name="article_ID" value="${article.article_ID}">
                                    <button type="submit" class="btn btn-outline-secondary">
                                        <img src='<%=request.getContextPath()%>/front-end/article/images/eye.png'
                                             width='30px' height='30px'>
                                        查看詳情
                                    </button>
                                </form>

                                <button type='button' class='delete btn btn-outline-secondary'
                                        value='${article.article_ID}'>
                                    <img src='<%=request.getContextPath()%>/front-end/article/images/trash.png'
                                         width='30px' height='30px'>
                                    刪除
                                </button>
                                <form method="post" action="<%=request.getContextPath()%>/article.do">
                                    <input type="hidden" name="action" value="getOneForUpdate">
                                    <input type="hidden" name="article_ID" value="${article.article_ID}">
                                    <button type="submit" class="btn btn-outline-secondary">
                                        <img src='<%=request.getContextPath()%>/front-end/article/images/refresh.png'
                                             width='30px' height='30px'>
                                        修改文章
                                    </button>
                                </form>
                            </div>
                            <div class="col-8 col-md-8 col-lg-8 col-xl-8">
                                <h3>
                                <span style="vertical-align: inherit;">
                                    <span style="vertical-align: inherit;">
                                        <span style="vertical-align: inherit;">
                                            <span style="vertical-align: inherit;">
                                                    <%--                                                    ${article.article_ID}--%>
                                            </span>
                                        </span>
                                    </span>
                                    <span style="vertical-align: inherit;">
                                        <span style="vertical-align: inherit;">
                                            <span style="vertical-align: inherit;"><span>類別：
                                                <jsp:useBean id="articleTypeService" scope="page"
                                                             class="com.articleType.model.ArticleTypeService"/>
                                                <c:forEach items="${articleTypeService.allArticleType}"
                                                           var="article_type">
                                                    <c:if test="${article.article_type_ID == article_type.article_type_ID}">
                                                        ${article_type.article_type_text}
                                                    </c:if>
                                                </c:forEach>
                                                </span> ${article.article_title}
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
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-1" style="background: #efefef;"></div>
    </div>
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
                window.location.href = '<%=request.getContextPath()%>/front-end/article/listAllMyArticle.jsp';
            }
        );
    });
</script>

</body>

</html>








