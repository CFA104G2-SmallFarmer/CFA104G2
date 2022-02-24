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

<!DOCTYPE html>
<html>
<head>
    <title>小農論壇</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css ">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
            crossorigin="anonymous"></script>
<style>
    .bg-dark {
        background-color: #434217!important;
    }

    .navbar-expand-lg {
        font-size: x-large;
        flex-wrap: nowrap;
        justify-content: flex-start;
        /*margin-top: auto;*/
    }

</style>
</head>
<body>
<%--Header--%>
<%--<header>--%>
    <nav class="navbar navbar-expand-lg navbar-dark border border-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp">
                    <%-- 首頁--%>
                    <div class="logo" ><img style="margin-top:1px;height:100px"src="<%=request.getContextPath()%>/front-end/article/images/調整後白小農logo.png"></div>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                    aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
                    <li class="nav-item active me-3">
                        <a class="nav-link" href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">小農論壇</span>
                        </span>
                        </a>

                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link"  href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">所有文章</span>
                        </span>
                        </a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="<%=request.getContextPath()%>/front-end/articleCollection/articleCollection.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">收藏</span>
                        </span>
                        </a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="<%=request.getContextPath()%>/front-end/article/listAllMyArticle.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">文章管理</span>
                        </span>
                        </a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="<%=request.getContextPath()%>/front-end/article/addArticle.jsp">
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">新增文章</span>
                        </span>
                        </a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href='<%=request.getContextPath()%>/front-end/article/addArticle.jsp'>
                        <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;">會員管理</span>
                        </span>
                        </a>

                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <img class="rounded-circle u-box-shadow-sm me-2" width="30"
                                 height="30"  src="<%=request.getContextPath()%>/front-end/article/images/dogcoco.png">
                            <span style="vertical-align: inherit;">
                            <span style="vertical-align: inherit;"> 冬瓜 </span>
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
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
        crossorigin="anonymous"></script>

</body>
</html>
