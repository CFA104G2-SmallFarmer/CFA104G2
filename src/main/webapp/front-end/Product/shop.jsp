<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%@ page import="com.shopCart.model.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>

<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>
<%Integer mem_id = MemVO.getMem_id();%>

<%
Integer prod_status =(Integer)request.getAttribute("prod_status");
ShopProductService prodServiceSvc = new ShopProductService();
Map<Integer, List<ShopProductVO>> list2 =prodServiceSvc.getAll_groupingBy_Prod_stataus();
List<ShopProductVO> list =list2.get(1);
pageContext.setAttribute("list", list);
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
    
  <!-- 這段給emoji的 -->
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

            
    
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
/* bookstrap */
.color-btn{
  /**定義一串顏色，8個顏色，1|2號顏色和最後的7|8號顏色要相同，才能銜接上，看不出迴圈間斷*/
  background: linear-gradient(to right, #5adeff, #2ff598, #FFE419, #A2FF00, #31FFEE, #297BFF, #DC5AFF, #7D4DFF);
  /**動畫的寬度，8個顏色，寬度就是8-1=7*100%，最後一個顏色用來迴圈迴歸的。*/
  background-size: 700% 100%;
  /**動畫使用，線性移動，速率20秒*/
  animation: mymove 20s linear infinite;
  /**適配不同瀏覽器*/
  -webkit-animation: mymove 20s linear infinite;
  -moz-animation: mymove 20s linear infinite;
}
/**定義過度動畫*/
@-webkit-keyframes mymove {
        0% {background-position: 0% 0%;}
        100% {background-position: 100% 0%;}
}

/*     /////////////////購物車/////////// */
    
    </style>
 
</head>
<header>
         <jsp:include page="/front-end/home/header2/header2.jsp"/>  
</header>
<!-- 頁首完  -->

<body>

<!-- Header End -->
<!-- Shop Start -->
    <div class="container-fluid">
  
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-4"><br>
                <!-- Price Start -->
                <h5 class="col-lg-7 h-auto mb-40"><font size="5">類別搜尋</font></h5><br>
                
                <div class="bg-light p-4 mb-30">
                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/shop.jsp" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3 ">
                           <button style='font-size:20px' class="btn-sm btn-warning" type="submit"><i class='fas fa-leaf'></i> 全部 </button>
                            <input type="hidden"  name="prod_id">
                             <input  type="hidden" name="action">
                        </div>
                    </FORM>
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                       <button style='font-size:20px' class="btn-sm btn-success" type="submit"><i class='fas fa-leaf'></i> 蔬菜 </button>
                            <input type="hidden"  value="2"  name="prod_type_id">
                            <input type="hidden"  value="2"  name="prod_type_id">
                             <input type="hidden" name="action"	value="getAll_By_Type_For_DisplayByMem">
                        </div>
                    </FORM>
                    
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                       
                        <div class="custom-control  d-flex align-items-center justify-content-between mb-3">
                            <button style='font-size:20px' class="btn-sm btn-danger"  type="submit"><i class='fas fa-leaf'></i> 水果 </button>
                            <input type="hidden"  value="1"  name="prod_type_id">
                             <input type="hidden" name="action"	value="getAll_By_Type_For_DisplayByMem">
                           
                        </div>
                    </FORM>
                </div><br>
                <!-- Price End -->            
                <!-- Color Start -->
                <h5 class="section-title position-relative text-uppercase mb-3" ><font size="5">價格搜尋</font></h5><br>
                <div class="bg-light p-4 mb-30">
                    <form METHOD="post" name="form3" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
                        <div ><br>
                            <input onClick="document.form3.submit()"  type="radio" id="color-1" name="price" checked >
                            <label for="color-1"><font size="4">$0 - $50</font></label>
                             <input type="hidden"  value="0"  name="price1">
                             <input type="hidden"  value="50"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form4" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div ><br>
                            <input  onClick="document.form4.submit()" type="radio" id="color-2" name="price" >
                            <label  for="color-2"><font size="4">$50 - $100</font></label>
                            <input type="hidden"  value="50"  name="price1">
                             <input type="hidden"  value="100"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                            
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form5" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form5.submit()" type="radio" id="color-3" name="price" >
                            <label  for="color-3"><font size="4">$100 - $200</font></label>
                            <input type="hidden"  value="100"  name="price1">
                             <input type="hidden"  value="200"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                         </form>
                         
                      <form METHOD="post" name="form6" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form6.submit()" type="radio"  id="color-4" name="price" >
                            <label  for="color-4"><font size="4">$200 - $300</font></label>
                            <input type="hidden"  value="200"  name="price1">
                             <input type="hidden"  value="300"  name="price2">
                             <input type="hidden" name="action"	value="getAll_ByPrice_For_DisplayByMem">
                        </div>
                        </form>
                        
                      <form METHOD="post" name="form7" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">  
                        <div><br>
                            <input onClick="document.form7.submit()" type="radio"  id="color-5" name="price" >
                            <label  for="color-5"><font size="4">$300 - $500</font></label>
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
        <div class="col-lg-9  col-md-8 "><br>
             <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do"  >
              <div class="col-md-6"><br>
            		<div>
                		<input type="text"  name="prod_name" placeholder="關鍵字搜尋">
                		<input type="hidden" name="action" value="listEmps_ByCompositeQuery">
        				<input  type="submit"  value="搜尋" >
            		</div>
        	 </FORM>
       </div>

  <!-- --------------------------------------------------------------------------------------- -->      	 
             <div class="row pb-3">
       
  <!-- ---------------------------------------------------------------------------------------------------- --> 
  
    <%@ include file="page3.file" %> 
  		<c:forEach var="shopProductVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">               
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1"><br>
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" style="width:250px;height:250px;" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="">
                                <div class="product-action">
        <!--              購物車     /////////////////////////////////////////////////////////////////////////////////////////// -->
<!--                   購物車小圖 -->
<div class="shopcart">
                  <div onclick="location.href='<%=request.getContextPath()%>/front-end/shopCart/shopCart.jsp?mem_id=<%=mem_id%>&action=getOneList';" class="point point-flicker">
                   <img class="shopcart" 
            src="<%=request.getContextPath()%>/front-end/Product/images/shopcart.png" style="cursor: pointer;" width="50" height="50">
					<div class="container pt-5">
    					<span class="cartQuantity text-white bg-warning" >
    					<%ShopCartService sc = new  ShopCartService();
    					List<ShopCartVO> li = sc.getOneList(mem_id);	
    					int count = 0;
    					for(ShopCartVO a : li){
    						int b = a.getCart_qty();
    						count = b + count;
    					}
    					%>
    					<%=count %>
    					
    					</span>
						</div>
					</div>
</div>
<!--                   購物車小圖 -->
                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopCart/shopCart.do" style="margin-bottom: 0px;">
			    					<input type="hidden" name="mem_id" value="<%=mem_id %>">
			    					<input type="hidden" name="f_mem_id" value="${shopProductVO.f_mem_id}">
			     					<input type="hidden" name="prod_id" value="${shopProductVO.prod_id}">	
			     					<input type="hidden" name="prod_price" value="${shopProductVO.prod_price}">	
			     					<input type="hidden" name="cart_qty" value=1>	
			     					
                                    <input type="hidden" name="action" value="addShopCart" >
                                    <button class="btn btn-outline-dark btn-square color-btn"  style="background-color:white;" type="button" value="加入購物車" id="btn${shopProductVO.prod_id}">
                                    <i style="color:black;" class="fa fa-shopping-cart"></i>
                                    </button>
			     					
			    					
                                    <a class="btn btn-outline-dark btn-square" href="<%=request.getContextPath()%>/front-end/Product/product.do?prod_id=${shopProductVO.prod_id}&action=getOne_list_For_DisplayByMem"><i class="fa fa-search"></i></a>
                                 </FORM>
                                </div>
                            </div>
			    			 <script>
   var btn${shopProductVO.prod_id} = document.getElementById('btn${shopProductVO.prod_id}');
		btn${shopProductVO.prod_id}.addEventListener('click', function(e) {
		e.preventDefault(); // 阻擋瀏覽器預設行為
	            swal("完成!", "成功加入購物車~~ ", "success")
	            	.then(function(result1){
	            		btn${shopProductVO.prod_id}.parentElement.submit(); // 返回當前節點的父元素節點 ,也就是上一層的form
	            	}).catch(swal.noop);
								});
							</script>
			    					

                                    
<!--                 /////////////////////////////////////////////////////////////////////////////////////////// -->
                                

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
       
        </div>
    
       <!-- ////////////////購物車js////////////////////// -->


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<!-- ////////////////購物車js////////////////////// -->
 <!-- 頁尾 -->
<footer class="pt5 pb6 f6 bt light-gray relative">
<%--   <iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
  <jsp:include page="/front-end/home/footer.jsp" flush="true"/>
  </footer>


   
</body>
</html>