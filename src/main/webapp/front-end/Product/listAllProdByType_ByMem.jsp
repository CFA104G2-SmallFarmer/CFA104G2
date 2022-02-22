<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%@ page import="com.shopCart.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%

     Set<ShopProductVO> list = (Set<ShopProductVO>) request.getAttribute("shopProductTypeVO");
     // Set<ShopProductVO> shopProductTypeVO = shopProductTypeSvc.getProductByTypeid(prod_type_id); controller
     pageContext.setAttribute("list",list);
   
%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城商品搜尋蔬果</title>

 <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  

    <!-- Template Stylesheet -->
    <link href="css/style1.css" rel="stylesheet">
    
    <!-- 這段給emoji的 -->
          <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous" />

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
/*     /////////////////購物車/////////// */
.shopcart{
    width: 80px;
    height: 80px;
    position: fixed;
    top: 85%;
    left: 90%;
    opacity: 0.5; /*透明度50%*/
}
.shopcart:hover{ /*滑鼠滑過*/
    opacity: 1; /*不透明*/
}
------
a{
  display: inline-block;
  text-decoration: none;
  &:hover{
    text-decoration: none;
  }
}
.position{
  &-relative{
    position:relative;
  }
  &-absolute{
    position:absolute;
  }
}
.cartQuantity{
  position:absolute;
  width: 25px;
  height: 25px;
  border-radius:50%;
  display: flex;
  justify-content: center;
  align-items: center;
  right:-9px;
  top:-8px;
}
/*     /////////////////購物車/////////// */
    </style>
    </head>
    
<header>
          <jsp:include page="/front-end/home/header2/header2.jsp" /> 
</header> 
<!-- 頁首完  -->
<body>
<!-- Header End -->
  <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-4"><br>
                <!-- Price Start -->
                <h5 class="section-title position-relative text-uppercase mb-3">類別搜尋</h5><br>
                
                <div class="bg-light p-4 mb-30">
                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/shop.jsp" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3 ">
                           <button style='font-size:20px' class="btn btn-outline-grey btn-square" type="submit"> 全部 <i class='fas fa-sync'></i></button>
                            <input type="hidden"  name="prod_id">
                             <input  type="hidden" name="action">
                        </div>
                    </FORM>
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                       <button style='font-size:20px' class="btn btn-outline-grey btn-square" type="submit"> 蔬菜 <i class='fas fa-carrot'></i></button>
                            <input type="hidden"  value="2"  name="prod_type_id">
                            <input type="hidden"  value="2"  name="prod_type_id">
                             <input type="hidden" name="action"	value="getAll_By_Type_For_DisplayByMem">
                        </div>
                    </FORM>
                    
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                       
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <button style='font-size:20px' class="btn btn-outline-grey btn-square"  type="submit"> 水果 <i class='fas fa-apple-alt'></i></button>
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
                            <input onClick="document.form3.submit()"  type="radio" id="color-1" name="price" >
                            <label for="color-1">$0 - $50</label>
                             <input type="hidden"  value="0"  name="price1">
                             <input type="hidden"  value="50"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form4" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div ><br>
                            <input  onClick="document.form4.submit()" type="radio" id="color-2" name="price" >
                            <label  for="color-2">$50 - $100</label>
                            <input type="hidden"  value="50"  name="price1">
                             <input type="hidden"  value="100"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                            
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form5" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form5.submit()" type="radio" id="color-3" name="price" >
                            <label  for="color-3">$100 - $200</label>
                            <input type="hidden"  value="100"  name="price1">
                             <input type="hidden"  value="200"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form6" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form6.submit()" type="radio"  id="color-4" name="price" >
                            <label  for="color-4">$200 - $300</label>
                            <input type="hidden"  value="200"  name="price1">
                             <input type="hidden"  value="300"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                        </form>
                        
                      <form METHOD="post" name="form7" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form7.submit()" type="radio"  id="color-5" name="price" >
                            <label  for="color-5">$300 - $500</label>
                            <input type="hidden"  value="300"  name="price1">
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
             <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do"  name="form1" >
              <div class="col-md-6"><br>
            		<div>
                		<input type="text"  name="prod_name" placeholder="關鍵字搜尋">
                		<input  type="submit"  value="搜尋" >
                		<input type="hidden" name="action" value="listEmps_ByCompositeQuery">	
            		</div>
        	 </FORM>
       </div>
  <!-- --------------------------------------------------------------------------------------- -->      	 
                <div class="row pb-3">
  <!--                   <div class="col-12 pb-1">
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
                    </div>  -->
                    
                    
  <!-- ---------------------------------------------------------------------------------------------------- --> 
  
    
  		<c:forEach var="shopProductVO" items="${list}">          
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="">
                                <div class="product-action">
                                
                                <!--              購物車     /////////////////////////////////////////////////////////////////////////////////////////// -->
<!--                   購物車小圖 -->
<div class="shopcart">
                  <div onclick="location.href='<%=request.getContextPath()%>/front-end/shopCart/shopCart.jsp?mem_id=77000&action=getOneList';" class="point point-flicker">
                   <img class="shopcart" 
            src="<%=request.getContextPath()%>/front-end/Product/images/shopcart.png" style="cursor: pointer;" width="50" height="50">
					<div class="container pt-5">
    					<span class="cartQuantity text-white bg-warning" >
    					<%ShopCartService sc = new  ShopCartService();
    					List<ShopCartVO> li = sc.getALL();	
    					int count = 0;
    					for(ShopCartVO a : li){
    						int b = a.getCart_qty();
    						count = b + count;
    					}
    					%>
    					<%=count %>
    					
    					</span>
<!--   				<a class="position-relative" href="#"> -->
<!--     			<i class="fas fa-shopping-cart fa-3x"></i> -->
<!--   							</a> -->
						</div>
					</div>
</div>
<!--                   購物車小圖 -->
					
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
 			   
            </div>
        </div>   
       
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->


    <!-- Footer Start -->
  <!-- 頁尾 -->
<footer class="pt5 pb6 f6 bt light-gray relative">
  <iframe src="<%= request.getContextPath() %>/front-end/footer/footer.jsp" width="100%" height="100%" style="display: block;"></iframe>
  </footer>
</body>
</html>