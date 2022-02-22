a
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.article.model.*" %>
<%@ page import="com.articleCollection.model.ArticleCollectionVO" %>
<%@ page import="com.articleCollection.model.ArticleCollectionService" %>
<%@ page import="com.mem.model.MemVO" %>
<%@ page import="com.article.model.ArticleService" %>
<%@ page import="com.article.model.ArticleVO" %>
<%
    ArticleCollectionService articleCollectionService = new ArticleCollectionService();
    MemVO memvo = (MemVO) session.getAttribute("memVO");
    Integer mem_ID = memvo.getMem_id();
    List<ArticleCollectionVO> articleCollectionList = articleCollectionService.getAllArticleCollection(mem_ID);
    ArticleService articleService = new ArticleService();
    List<ArticleVO> articleList = articleService.getAllArticleCollection(articleCollectionList);
    pageContext.setAttribute("articleList", articleList);
%>
<html>
<head>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=yes">
    <title>文章收藏</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/article/style.css">

    <link rel="icon" href="favicon.ico"/>
    <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
            crossorigin="anonymous"></script>
</head>

<body>

<header>
    <jsp:include page="/front-end/article/articleHeader.jsp"></jsp:include>
</header>

<%-------------------------------------收藏標題---------------------------------------%>

<div class="post-container">
    <!-- 內容 -->
    <h2>收藏</h2>

    <div class="row">

        <div class="col-1"></div>
        <div class="col-10">
            <table class="table">
                <caption>收藏文章</caption>
                <thead>
                <tr>
                    <th>文章圖片</th>
                    <th>文章標題</th>
                    <th>作著</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="article" items="${articleList}">
                    <tr>
                        <td>
                            <c:if test="${ not empty article.article_img }">
                                <img src='<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}'
                                     width='200'
                                     height='150'>
                            </c:if>
                        </td>
                        <td>${article.article_ID}</td>
                        <td>${article.mem_id}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%-------------------------------------收藏內容---------------------------------------%>
        </div>
        <div class="col-1"></div>
    </div>
</div>

<!-- 這是分隔線 -->


</body>

</html>
