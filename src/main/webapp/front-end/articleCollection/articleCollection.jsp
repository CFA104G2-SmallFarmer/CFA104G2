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
    MemVO memVO = (MemVO) session.getAttribute("memVO");
    Integer mem_ID = memVO.getMem_id();
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
    <title>收藏文章</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/article/style.css">
    <link rel="icon" href="favicon.ico"/>
    <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
            crossorigin="anonymous"></script>
    <style>
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

<body style="background: #efefef">

<header>
    <jsp:include page="/front-end/article/articleHeader2.jsp"></jsp:include>
</header>

<%-------------------------------------收藏標題---------------------------------------%>

<div class="post-container" style="background: #efefef" >
    <!-- 內容 -->
    <h2>我的收藏</h2>

    <div class="row">

        <div class="col-2"></div>
        <div class="col-8">
            <div class="aArticle row  widged" style="background: #F5F5F7">
                <table class="table">
                    <caption>收藏文章</caption>
                    <thead>
                    <tr>
                        <th>文章圖片</th>
                        <th>文章標題</th>
                        <th>作者</th>
                        <th>收藏</th>
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
                            <td>${article.article_title}</td>
                            <td>${article.mem_id}</td>
                            <td>
                                    <%-- 收藏 --%>
                                <div class="col-8">
                                    <button type="button" class="btn btn-outline-light"
                                            value="${article.article_ID}">
                                        <img src="<%=request.getContextPath()%>/articleCollection.do?action=collection&mem_id=${memVO.mem_id}&article_ID=${article.article_ID}"
                                             class="collection" width="25px" height="25px">
                                    </button>
                                </div>
                                <div >
                                        <%--查詳情--%>
                                    <form method="post" action="<%=request.getContextPath()%>/article.do">
                                        <input type="hidden" name="action" value="getOne">
                                        <input type="hidden" name="article_ID"
                                               value="${article.article_ID}">
                                        <button type="submit" class="btn btn-outline-primary">查看詳情</button>
                                    </form>
                                </div>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%-------------------------------------收藏內容---------------------------------------%>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</div>

<!-- 這是分隔線 -->


</body>
<script>
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
