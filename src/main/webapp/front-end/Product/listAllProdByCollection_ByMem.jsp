<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductCollection.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%

	ShopProductCollectionService prodServiceSvc = new ShopProductCollectionService();
    List<ShopProductCollectionVO> list = prodServiceSvc.getAll();
    pageContext.setAttribute("list",list);
    
    
    
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>收藏商品列表</title>



    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style1.css" rel="stylesheet">
    <style>
        .img-fluid {
            max-width: 100px;
            height: 100px;
            object-fit: cover;
        }
       table{  
       		table-layout:fixed;/* 只有定義了表格的佈局算法爲fixed，下面td的定義才能起作用。 */
       		}  
		
    </style>
</head>

<header>
          <jsp:include page="/front-end/home/header2/header2.jsp" /> 
</header> 
<!-- 頁首完  -->
<body>

        
 <!-- Breadcrumb Start -->
      <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="navbar-brand " style="white-space: normal;">
                     <nav class="bg-light " style="white-space: normal;">
                        <a  class="bg-light" href="addProductByFmem.jsp">新增商品</a>
                        <a  class="bg-light" href="listAllProductByFmem.jsp">我的商品</a>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- 頁首完 -->
  
  <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
        


        <!-- Cart Start -->
        <div class="container-fluid"><br>
            <table class="table table-light table-border table-hover text-center mb-0">
                <thead class="thead-light">
                    <tr>
                        
                        <th>一般會員編號</th>
                        <th>商品編號</th>
                        <th>商品收藏日期</th>
                        <th>刪除</th>
                    </tr>
                </thead>
                <tbody class="align-middle">
                <%@ include file="page1.file" %> <br>
             <c:forEach var="shopProductVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                    <tr>
                        <td>${shopProductVO.mem_id}</td>
                        <td>${shopProductVO.prod_id}</td>
                        <td>${shopProductVO.prod_fav_date}</td>
                    <!-- <td class="align-middle">虎年特惠</td>  --> 
                   	 	
                   	 	
            
			<td class="align-middle">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
			     <input class="btn btn-sm btn-danger" type="submit" value="刪除">
			     <input type="hidden" name="prod_id"  value="${shopProductVO.prod_id}">
			     <input type="hidden" name="action" value="deleteByCollection">
			     </FORM>
			</td>
		</tr>
	</c:forEach>
                </tbody>
            </table>
        <%@ include file="page2.file" %>    
        </div>



    </div>
  
    <!-- Cart End -->

    <!-- 頁尾 -->
<footer class="pt5 pb6 f6 bt light-gray relative">
  <iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;"></iframe>
  </footer>
</body>

</html>


