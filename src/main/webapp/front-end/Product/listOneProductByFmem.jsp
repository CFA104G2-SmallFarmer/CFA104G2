<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ShopProductVO shopProductVO = (ShopProductVO) request.getAttribute("shopProductVO");
	request.setAttribute("prod__upload_arr", new String[]{"未上架","已上架"});
	
%>
<jsp:useBean id="productTypeSvc" scope="page" class="com.shopProductType.model.ShopProductTypeService" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小農修改商品</title>


    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style1.css" rel="stylesheet">
    <style>
        .img-fluid {
            max-width: 100%;
            height: 200px;
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
        <!-- Header Start -->
   <!--      <div class="header bg-dark">
            <div class="container">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav m-auto">
                            <a href="index.html" class="nav-item nav-link active">Home</a>
                            <a href="addProductByFmem.jsp" class="nav-item nav-link">Products</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu">
                                    <a href="product-list.html" class="dropdown-item">Product</a>
                                    <a href="product-detail.html" class="dropdown-item">Product Detail</a>
                                    <a href="cart.html" class="dropdown-item">Cart</a>
                                    <a href="wishlist.html" class="dropdown-item">Wishlist</a>
                                    <a href="checkout.html" class="dropdown-item">Checkout</a>
                                    <a href="login.html" class="dropdown-item">Login & Register</a>
                                    <a href="my-account.html" class="dropdown-item">My Account</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contact Us</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div> -->
        <!-- Header End -->
        
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
<!-- Cart Start -->
<div class="container-fluid">
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

            <table class="table table-light table-border table-hover text-center mb-0">
                <thead class="thead-light">
                    <tr>
                        <th>商品編號</th>
                        <th>小農會員編號</th>
                        <th>商品圖片</th>
                        <th>商品名稱</th>
                      	<th>商品類別</th>
                        <th>商品狀態</th>
                        <th>商品價格</th>
                        <th>商品單位</th>
                        <th>商品數量</th>
                        <th>商品上架日期</th>
             <!--       <th>熱門標籤</th>  -->
              			<th>商品介紹</th>
                     
                    </tr>
                </thead>
                <tbody class="align-middle">
                    <tr>
                        <td><%=shopProductVO.getProd_id()%></td>
                        <td><%=shopProductVO.getF_mem_id()%></td>
                        <td><img style="width:100px" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" style="width:20px;height:20px;"></td>
                        <td><%=shopProductVO.getProd_name()%></td>
                        
                        <td><c:forEach var="shopProductTypeVO" items="${productTypeSvc.all}">
                   			 	<c:if test="${shopProductVO.prod_type_id==shopProductTypeVO.prod_type_id}">
	                    			${shopProductTypeVO.prod_type_name}
                    			</c:if>
                			</c:forEach></td>
                        <td><c:set var="pay_num" scope="request" value="${shopProductVO.prod_status}"/>${prod__upload_arr[pay_num]}</td>  
                        <td><%=shopProductVO.getProd_price()%></td>
                        <td><%=shopProductVO.getProd_unit()%></td>
                        <td><%=shopProductVO.getProd_qty()%></td>
                        <td><%=shopProductVO.getProd_reg_date()%></td>
                    <!-- <td class="align-middle">虎年特惠</td>  --> 
                   	 	<td style="white-space:nowrap; overflow:hidden;text-overflow:ellipsis; "><%=shopProductVO.getProd_intro()%></td>

				</tr>
	
	
            <!--     <tr>
                        <td class="align-middle">1</td>
                        <td class="align-middle">70000</td>
                        <td class="align-middle">梨山高麗菜</td>
                        <td class="align-middle">蔬菜</td>
                        <td class="align-middle">已上架</td>
                        <td class="align-middle">19</td>
                        <td class="align-middle">台斤</td>
                        <td class="align-middle">500</td>
                        <td class="align-middle">2022-02-02</td>
                        <td class="align-middle">虎年特惠</td>
                        <td class="align-middle"><button class="btn btn-sm btn-primary">修改</button></td>
                        <td class="align-middle"><button class="btn btn-sm btn-danger">刪除</button></td>
                    </tr> -->


                    <!-- <tr>
                            <td class="align-middle"><img src="img/product-5.jpg" alt="" style="width:100px;"><th>木瓜</th></td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-first border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></td>
                        </tr> -->
                </tbody>
            </table>
        </div>



    </div>
  
    <!-- Cart End -->

    <!-- 頁尾 -->
  
<footer class="pt5 pb6 f6 bt light-gray relative">
  <iframe src="<%= request.getContextPath() %>/front-end/footer/footer.jsp" width="100%" height="100%" style="display: block;"></iframe>
  </footer>
  
</body>

</html>


