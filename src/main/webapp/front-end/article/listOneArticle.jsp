<%@ page import="com.comments.model.CommentsService" %>
<%@ page import="com.article.model.ArticleVO" %>
<%@ page import="com.comments.model.CommentsVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ArticleVO article = (ArticleVO) request.getAttribute("article");
    CommentsService commentsService = new CommentsService();
    List<CommentsVO> list = commentsService.getAllComments(article.getArticle_ID());
    Integer comments_num = 0;
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

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <title>這是標題</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- CSS 寫在這 -->

    <style>
        body {
            /* Google Fonts */
            font-family: 'Noto Sans TC', sans-serif;
        }


        .container {
            /*display: flex;*/
            /*justify-content: space-between;*/
            padding: 13px 5%;
        }

        .post-input-container {
            padding-left: 55px;
            padding-top: 20px;
        }

        .post-input-container textarea {
            width: 100%;
            border: 0;
            outline: 0;
            border-bottom: 1px solid #ccc;
            background: transparent;
            resize: none;
        }

        .post-container {
            width: 100%;
            background: #fff;
            border-radius: 6px;
            padding: 20px;
            color: #626262;
            margin: 20px 0;
        }

        .post-container a {
            width: 20px;
            margin-right: 10px;
        }

        .imp-links a img {
            width: 25px;
            margin-right: 15px;
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
<header>
    <jsp:include page="articleHeader2.jsp"></jsp:include>
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>


<jsp:useBean id="articleTypeService" scope="page" class="com.articleType.model.ArticleTypeService"/>

<div class="post-container">
    <!-- 內容 -->
    <div class="container">
        <div class="row">
            <div class="col-3">
                <%--會員照片--%>
                <img src="<%=request.getContextPath()%>/front-end/article/images/people/1.jpg" style=" width: 150px;
                      border-radius: 50%; cursor: pointer ">
            </div>
            <div class="col-7 User-profile" style="color: #516560">
                <h3> 文章標題:${article.article_title}</h3>
                <%--文章封面照片--%>
                <img src="<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}"
                     class="rounded mx-auto d-block" width='400' height='300'>
                <%--                <img src="<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}" class="img-fluid" alt="...">--%>
                <%--                <img src='<%=request.getContextPath()%>/article.do?article_ID=${article.article_ID}' width='200'--%>
                <%--                     height='150'>--%>
            </div>
            <div class="col-2">天氣</div>
        </div>

        <%--第二排--%>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-7">

            </div>
            <div class="col-2"></div>
        </div>

        <%-- 第三排--%>
        <div class="row">
            <div class="col-3">
                <h6>文章類別
                    <c:forEach items="${articleTypeService.allArticleType}" var="article_type">
                        <c:if test="${article.article_type_ID == article_type.article_type_ID}">
                            ${article_type.article_type_text}
                        </c:if>
                    </c:forEach>
                </h6>
                <p>作者:${article.mem_id}
                    <c:if test="${sessionScope.memVO.mem_id_state eq 1}">
                        <img src="<%=request.getContextPath()%>/front-end/article/images/透明小小農.png" width="30px"
                             height="30px">
                    </c:if>
                    <c:if test="${sessionScope.memVO.mem_id_state eq 0}">
                        <img src="<%=request.getContextPath()%>/front-end/article/images/user.png" width="30px"
                             height="30px">
                    </c:if>
                </p>
            </div>
            <div class="col-7">
                <p class="post-text">文章內容 歡迎分享跟小農購買的心得${article.article_content}
                    <span>@冬瓜</span>
                    <a href="#">
                        #
                        <c:forEach items="${articleTypeService.allArticleType}" var="article_type">
                        <c:if test="${article.article_type_ID == article_type.article_type_ID}">
                            ${article_type.article_type_text}
                        </c:if>
                    </c:forEach>
                    </a>

                </p>
                <p>文章發表時間:${article.article_time}</p>
                <div class="row mb-2">
                    <div class="col-3">
                        <img src='<%=request.getContextPath()%>/front-end/article/images/comment.png' width='30px'
                             height='30px'>
                        ${article.comments_num}
                    </div>
                    <div class="col-3">
                        <p scope="row">
                            <%--讚:--%>
                            <%--                            <img src='<%=request.getContextPath()%>/front-end/article/images/thumbs-up.png' width='30px' height='30px'>--%>
                            <button type="button" id="addOneLike" class="btn btn-outline-light"
                                    value="${article.article_ID}">
                                <img src='<%=request.getContextPath()%>/front-end/article/images/thumbs-up.png'
                                     width='30px' height='30px'>
                            </button>
                            <span id="article_like">${article.article_like}</span>
                        </p>
                    </div>
                    <div class="col-3">
                        文章狀態:公開
                    </div>
                    <div class="col-3">
                        <c:if test="${article.article_update_time != null}">
                            <span>最後更新時間：${article.article_update_time}</span>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="col-2"></div>

        </div>
    </div>
</div>
<!-- 這是分隔線 --><!-- 這是分隔線 --><!-- 這是分隔線 --><!-- 這是分隔線 -->
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
<!-- 這是分隔線 --><!-- 這是分隔線 --><!-- 這是分隔線 --><!-- 這是分隔線 -->
<%-------------------------------------開始顯示留言---------------------------------------%>

<div class="container">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10 row aArticle widged">
            <table class="table ">
                <thead>
                <tr>
                    <th>NO.</th>
                    <th>IMG</th>
                    <th>COMMENTS</th>
                    <th>USER</th>
                    <th>LIKE</th>
                    <%--                    <th>留言狀態</th>--%>
                    <th>TIME</th>
                    <th>UPDATE</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="comments" items="${list}">
                    <tr>
                        <td><%=comments_num += 1%>
                        </td>
                        <td>
                            <c:if test="${ not empty comments.comments_img }">
                                <img src='<%=request.getContextPath()%>/comments.do?comments_ID=${comments.comments_ID}'
                                     width='200'
                                     height='150'>
                            </c:if>

                        </td>
                        <td>${comments.comments_content}</td>
                        <td>${comments.mem_id}

                            <c:if test="${sessionScope.memVO.mem_id_state eq 1}">
                                <img src="<%=request.getContextPath()%>/front-end/article/images/透明小小農.png" width="30px"
                                     height="30px">
                            </c:if>
                            <c:if test="${sessionScope.memVO.mem_id_state eq 0}">
                                <img src="<%=request.getContextPath()%>/front-end/article/images/user.png" width="30px"
                                     height="30px">
                            </c:if>

                        </td>
                        <td>

                            <p scope="row">
                                <span class="comments_like">${comments.comments_like}</span>
                                <button type="button" class=" addOneCommentsLike btn btn-outline-light"
                                        value="${comments.comments_ID}">
                                    <img src='<%=request.getContextPath()%>/front-end/article/images/thumbs-up.png'
                                         width='30px' height='30px'>
                                </button>
                            </p>

                        </td>
                            <%--                        <td>${comments.comments_state}</td>--%>
                        <td>${comments.comments_time}</td>
                        <td>${comments.comments_update_time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-1"></div>
    </div>
</div>

<%-------------------------------------結束顯示留言---------------------------------------%>
<!-- 這是分隔線 -->
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)"/>
<%------------------------------------開始留言輸入框 ------------------------------------%>

<div class="row">
    <div class="col-3"></div>

    <div class="col-7">
        <div class="post-input-container">
            <form METHOD="POST" ACTION="<%=request.getContextPath()%>/comments.do" enctype="multipart/form-data"
                  name="addForm">

                <textarea id="comments" rows="3" name="comments_content" placeholder="你在想什麼?"></textarea>

                <input type="file" name="comments_img">

                <input type="hidden" name="action" value="insert">
                <input type="hidden" name="article_ID" value="${article.article_ID}">
                <button type="submit" class="btn btn-primary">送出</button>
                <img src='<%=request.getContextPath()%>/front-end/farmTravel/images/LittleFammer.jpg'
                     height='30'
                     width='30' onClick='autoAdd(this)'>
            </form>
            <%--Error Message --%>
            <c:if test="${not empty errorMsgs}">
                <span style='color:red;font-size:20px;'>Error:</span>
                <ul>
                    <c:forEach var="message" items="${errorMsgs}">
                        <li style='color:red'>${message}</li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>
    <div class="col-2"></div>
</div>


</body>

<script>
    <!-- JavaScript 寫在這 -->
</script>


<script>
    let article_like = ${article.article_like}
        $('#addOneLike').click(function () {
            // console.log(this);
            $.post(
                "<%=request.getContextPath()%>/article.do",
                {action: "addOneLike", article_ID: $(this).val()},
                function () {
                    article_like += 1;
                    // console.log(article_like)
                    $('#article_like').text(article_like);
                }
            )
        });
</script>


<script>
    let comments_like;
    $('.addOneCommentsLike').click(function () {
        comments_like = this.previousElementSibling.textContent;
        comments_like++;
        this.previousElementSibling.innerText = comments_like;

        $.post("<%=request.getContextPath()%>/comments.do",
            {action: "addOneCommentsLike", comments_ID: $(this).val()},
            function () {
                // comments_like += 1;
                // console.log(comments_like);
                // $('.addOneCommentsLike').text(comments_like);
                // likes = comments_like;
            }
        )

    });
</script>

<script>
    <%-- 圖片預覽 --%>
    let inputImg = document.getElementById('inputImg');
    inputImg.addEventListener('change', () => document.querySelector('#imgPreview').setAttribute('src', URL.createObjectURL(inputImg.files[0])));


    <!-- 自動輸入資料按鈕 -->
    function autoAdd() {
        addForm.comments.value = '我也要去玩';
    }
</script>

<script>
    function numPlus() {
        var p = document.getElementById('num');
        p.innerHTML++;
    }
</script>

</html>