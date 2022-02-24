<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article.model.*" %>


<%
    ArticleVO article = (ArticleVO) request.getAttribute("article");
%>

<html>
<head>
    <title>Update article</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3' crossorigin='anonymous'>
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
        #left img{
            width: 600px;
            height: 450px;
        }
        #right{
            margin: 0 8% 0 0;
            float: right;
            width: 40%;
        }
        /* CKEditor 高度設置 */
        .ck-editor__editable_inline {
            min-height: 200px;
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
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css'>
    <link rel='stylesheet' href='/resources/demos/style.css'>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css'>
    <script src='https://code.jquery.com/jquery-3.6.0.js'></script>
    <script src='https://code.jquery.com/ui/1.13.1/jquery-ui.js'></script>
    <script src='//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js'></script>
    <!-- 引入 CKEditor的script -->
    <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
</head>
<body style="background: #dfdcb3">
<%--Header--%>
<header>
    <jsp:include page="articleHeader2.jsp"></jsp:include>
</header>
<main>
    <h3>修改文章</h3>
    <div id='left'>
        <figure class='figure'>
            <img src='<%=request.getContextPath()%>/front-end/farmTravel/images/NoImage.png' class='figure-img img-fluid rounded' id='imgPreview'>
            <figcaption class='figure-caption text-end'>封面預覽</figcaption>
        </figure>
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
    <div id="right" class="row aArticle widged">                <!-- java請求 -->
        <form METHOD="POST" ACTION="<%=request.getContextPath()%>/article.do" enctype="multipart/form-data" name="addForm">

            <div class="mb-3">
                <label for="article_img" class="form-label">修改文章封面</label>     <!-- 收照片資料 -->
                <input type="file" class="form-control" id="article_img" accept="image/*" name="article_img">
            </div>
            <div class="mb-3">
                <label for="article_title" class="form-label">修改文章標題</label>        <!-- 資料 -->
                <input type="text" class="form-control" id="article_title" placeholder="Ex：第一次種稻米~ 農家生活體驗~"
                       name="article_title">
            </div>
            <div class="mb-3">
                <label for="article_type_ID" class="form-label">修改文章類別</label>

                <div class="col-md-10">
                    <select class="form-control"id="article_type_ID" placeholder="Ex：第一次種稻米~ 農家生活體驗~"
                            name="article_type_ID">
                        <option value="1">農遊心得 </option>
                        <option value="2">小農好菜 </option>
                        <option value="3">好物分享 </option>
                    </select>
                </div>
            </div>

            <!--文字框1 -->
<%--            <div class="mb-3">--%>
<%--                <label for="article_content" class="form-label">內文</label>--%>
<%--                <textarea class="form-control" id="article_content" rows="3" name="article_content"--%>
<%--                          placeholder="Ex：參加了一個很特別的活動我們在農遊超市看到飛牛牧場有個農村廚房的體驗會有專業的主廚帶著你更深入當地的文化~"></textarea>--%>
<%--            </div>--%>
            <!--文字框1 -->

            <!--文字框2 -->
            <h6>修改文章內容</h6>
            <textarea name="article_content" id="editor" rows="5"  placeholder="Ex：參加了一個很特別的活動我們在農遊超市看到飛牛牧場有個農村廚房的體驗會有專業的主廚帶著你更深入當地的文化~"></textarea>
            <!--文字框2end -->



            <script>
                DecoupledEditor
                    .create( document.querySelector( '#editor' ) )
                    .then( editor => {
                        const toolbarContainer = document.querySelector( '#toolbar-container' );

                        toolbarContainer.appendChild( editor.ui.view.toolbar.element );
                    } )
                    .catch( error => {
                        console.error( error );
                    } );
            </script>

            <div class="mb-3 form-check">
                <input type="checkbox" class="checkAgree form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">已詳讀並同意遵守<a>發文相關規定</a></label>
            </div>
            <!-- 需確認輸入資料按鈕 -->
            <input type="hidden" name="article_ID" value='${article.article_ID}'>
            <input type='hidden' name='action' value='update'>
            <button type="submit" class="submit btn btn-primary" disabled='disabled'>修改文章</button>
            <img src='<%=request.getContextPath()%>/front-end/farmTravel/images/LittleFammer.jpg' height='30' width='30' onClick='autoAdd(this)'>
        </form>
    </div>
</main>
<script>
    <!-- 自動輸入資料按鈕 -->
    let inputImg = document.getElementById('article_img');
    inputImg.addEventListener('change',()=> document.querySelector('#imgPreview').setAttribute('src',URL.createObjectURL(inputImg.files[0] )) );

    $(".checkAgree").click(function (){
        if ($(".checkAgree").prop("checked")){
            $(".submit").attr("disabled",false);
        }else {
            $(".submit").prop("disabled", true);
        }
    });

    function autoAdd(){
        addForm.article_title.value='第五次種稻米 農家生活體驗超棒der~';
        addForm.article_content.value='參加了一個很特別的活動我們每天吃的稻米 可以帶著小朋友們一同體驗種植過程是很棒的經驗 謝謝農場主熱心款待';

    }
</script>
<!-- CK Editor 初始化 -->
<script>
    ClassicEditor
        .create(document.querySelector('#editor'))
        .catch(error => {
            console.error(error);
        });
</script>
</body>
</html>