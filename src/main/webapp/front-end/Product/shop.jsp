<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ShopProductService prodServiceSvc = new ShopProductService();
    List<ShopProductVO> list = prodServiceSvc.getAll();
    pageContext.setAttribute("list",list);
    
    
   
%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>瀏覽商城商品</title>

 <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  

    <!-- Template Stylesheet -->
    <link href="css/style1.css" rel="stylesheet">

    <!-- product img -->
    <!-- .img-fluid w-100{
        height:100%;
    object-fit:cover;
    } -->
    <style>

    .img-fluid{
        max-width: 100%;
        height: 200px;
        object-fit:cover;
    }

    </style>
</head>
<body class="intent-mouse">
	<header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
 	<iframe src="<%= request.getContextPath() %>/front-end/header/header.jsp" width="100%" height="100%" style="display: block;"></iframe>
 	</header>
</body>
<!-- 頁首完  -->
<body>

<!-- Header End -->
<!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-4"><br>
                <!-- Price Start -->
                <h5 class="section-title position-relative text-uppercase mb-3">類別搜尋</h5><br>
                
                <div class="bg-light p-4 mb-30">
                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/shop.jsp" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <input class="btn btn-sm btn-primary" type="submit"  value="全部"  >
                            <input type="hidden"  name="prod_id">
                             <input type="hidden" name="action">
                        </div>
                    </FORM>
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <input class="btn btn-sm btn-primary" type="submit"  value="蔬菜"  >
                            <input type="hidden"  value="2"  name="prod_type_id">
                            <input type="hidden"  value="2"  name="prod_type_id">
                             <input type="hidden" name="action"	value="getAll_By_Type_For_DisplayByMem">
                        </div>
                    </FORM>
                    
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                       
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <input class="btn btn-sm btn-primary" type="submit"  value="水果"  >
                            <input type="hidden"  value="1"  name="prod_type_id">
                             <input type="hidden" name="action"	value="getAll_By_Type_For_DisplayByMem">
                           
                        </div>
                    </FORM>
                </div><br>
                <!-- Price End -->            

                <!-- Color Start -->
                <h5 class="section-title position-relative text-uppercase mb-3">價格搜尋</h5><br>
                <div class="bg-light p-4 mb-30">
                    <form METHOD="post" name="form3" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                        <div ><br>
                            <input onClick="document.form3.submit()"  type="radio" id="color-1" value="color-1"  checked>
                            <label for="color-1">$0 - $100</label>
                             <input type="hidden"  value="0"  name="price1">
                             <input type="hidden"  value="100"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form4" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div ><br>
                            <input  onClick="document.form4.submit()" type="radio" id="color-2" value="color-2" >
                            <label  for="color-2">$100 - $200</label>
                            <input type="hidden"  value="100"  name="price1">
                             <input type="hidden"  value="200"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                            
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form5" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form5.submit()" type="radio" id="color-3" value="color-3" >
                            <label  for="color-3">$200 - $300</label>
                            <input type="hidden"  value="200"  name="price1">
                             <input type="hidden"  value="300"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form6" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form6.submit()" type="radio"  id="color-4" value="color-4" >
                            <label  for="color-4">$300 - $400</label>
                            <input type="hidden"  value="300"  name="price1">
                             <input type="hidden"  value="400"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                        </form>
                        
                      <form METHOD="post" name="form7" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form7.submit()" type="radio"  id="color-5" value="color-5" >
                            <label  for="color-5">$400 - $500</label>
                            <input type="hidden"  value="400"  name="price1">
                             <input type="hidden"  value="500"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                    </form>
                </div>  
                <!-- Color End -->
            </div>
            <!-- Shop Sidebar End -->
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

            <!-- Shop Product Start -->
        <div class="col-lg-9  col-md-8 ">
             <FORM METHOD="post" ACTION="product.do" >
              <div class="col-md-6"><br>
            		<div class="fa fa-search">
                		<input type="text"  name="prod_id" placeholder="商品編號搜尋">
                		<input type="hidden" name="action" value="listEmps_ByCompositeQuery">
        				<input  type="submit"  value="搜尋" >
            		</div>
        	 </FORM>
       </div>
 <jsp:useBean id="shopProductSvc" scope="page" class="com.shopProduct.model.ShopProductService" />
  <!-- --------------------------------------------------------------------------------------- -->      	 
             <div class="row pb-3">
                     <!--   <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">  
                            <div class="ml-2">       
                            </div>
                        </div>
                   </div>
                   <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="images/product-1.jpg" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">大湖草莓</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="images/product-2.jpg" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">梨山高麗菜</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="images/product-3.jpg" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">甜柿</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>$123.00</h5><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                               
                            </div>
                        </div>
                    </div>   -->  
                    
                    
  <!-- ---------------------------------------------------------------------------------------------------- --> 
  
    <%@ include file="page3.file" %> 
  		<c:forEach var="shopProductVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">               
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1"><br>
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="<%=request.getContextPath()%>/front-end/Product/product.do?prod_id=${shopProductVO.prod_id}&action=getOne_list_For_DisplayByMem"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="">${shopProductVO.prod_name}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5><a>$</a>${shopProductVO.prod_price}<a>元/</a></h5>
                                     <h5>${shopProductVO.prod_unit}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
          </c:forEach>
			    <div class="col-12">
			     	<nav>
			          <ul class="pagination justify-content-center">
			 			<li  class="page-item disabled">
			               <%@ include file="page4.file" %> 
			             </li> 
			         	</ul> 
			          </nav>
                </div>
            </div>
        </div>
       
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->
 <!-- 頁尾 -->
<footer class="pt5 pb6 f6 bt light-gray relative">
  <iframe src="<%= request.getContextPath() %>/front-end/footer/footer.jsp" width="100%" height="100%" style="display: block;"></iframe>
  </footer>


   
</body>
</html>