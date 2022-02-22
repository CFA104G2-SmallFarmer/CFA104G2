<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
//	ShopProductService prodServiceSvc = new ShopProductService();
//    List<ShopProductVO> list = prodServiceSvc.getAll();
//    pageContext.setAttribute("list",list);
  

ShopProductVO list = (ShopProductVO)request.getAttribute("shopProductVO");
//   ShopProductVO shopProductVO = shopProductSvc.getOneProduct(prod_id); 
   pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>瀏覽商城商品</title>




<style>
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

/*     /////////////////購物車/////////// */
</style>
</head>

<header>
         <jsp:include page="/front-end/home/header2/header2.jsp"/>  
</header>
  
 <!-- Breadcrumb Start -->
 <div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->
   


    <!-- Shop Detail Start -->
    <div class="container-fluid pb-5"><br>
        <div class="row px-xl-5"><br>
            <div class="col-lg-5 mb-30"><br>
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                        <div class="carousel-item active">
                            <img class="img-fluid w-100" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="">
                        </div>
                    </div>
 <!--                 <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>   -->  
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30"><br>
                <div>
                  <h3>${shopProductVO.prod_name}</h3><br>
                   
                    <h3 class="font-weight-semi-bold mb-4"><a>$</a>${shopProductVO.prod_price}<a>元/</a>${shopProductVO.prod_unit}</h3>
                   
                    
<!--                     <div class="d-flex align-items-center mb-4 pt-2"> -->
<!--                         <div class="input-group quantity mr-3" style="width: 130px;"> -->
<!--                             <div class="input-group-btn"> -->
<!--                                 <button class="btn btn-primary btn-minus"> -->
<!--                                     <i class="fa fa-minus"></i> -->
<!--                                 </button> -->
<!--                             </div> -->
<!--                             <input type="text" class="form-control bg-first border-0 text-center" value="1"> -->
<!--                             <div class="input-group-btn"> -->
<!--                                 <button class="btn btn-primary btn-plus"> -->
<!--                                     <i class="fa fa-plus"></i> -->
<!--                                 </button> -->
<!--                             </div> -->
<!--                         </div> -->

<div><button type="button" class="btn btn-primary" >常溫</button></div>
<!-- 					<div><font>常溫</font></div> -->
					<br>
<div><button type="button" class="btn btn-primary" >產地含運直送</button></div>
<!-- 					<div><font>產地含運直送</font></div> -->
					<br>
					<div>
<button type="button" class="btn btn-success" >出貨說明</button>
<!-- 					<font>出貨說明</font> -->
					</div>
					<br>
					<div>
					<font>當您的信用卡資料核對無誤後，該筆交易便完成付款程序，貨到付款則直接進行配送。
						我們將會在付款完成後的 3-5個工作天內(不含週休及國定例假日)，將商品宅配送達您指定的收件地址。
<br>
						台灣本島↔台灣本島(三天內到貨)
						訂單下單成立後將於隔日出貨，出貨時間為週一至週五，遇隔日為國定假日、例假日則暫停出貨。
						台灣本島↔金門、澎湖、綠島、梨山地區(五天內到貨)
						註：綠島地區請至全家朝日店交寄常溫貨件
<br>

						國際配送(10~14個工作天)
						訂單下單成立後將於隔日出貨，出貨時間為週一至週五，遇隔日為國定假日、例假日則暫停出貨。
						中華郵政國際宅配:配送時間10~14個工作天。</font>
					</div>
                     <br>   
<!--              購物車     /////////////////////////////////////////////////////////////////////////////////////////// -->
<!--                   購物車小圖 -->
                  <div onclick="location.href='<%=request.getContextPath()%>/front-end/shopCart/shopCart.jsp?mem_id=77000&action=getOneList';">
                   <img class="shopcart" 
            src="<%=request.getContextPath()%>/front-end/Product/images/shopcart.png" style="cursor: pointer;" width="50" height="50">
					</div>
					
					
<!--                                     <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> -->
                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopCart/shopCart.do" style="margin-bottom: 0px;">
<%-- 			    					<input type="hidden" name="mem_id" value="${shopProductVO.mem_id}"> --%>
			    					<input type="hidden" name="f_mem_id" value="${shopProductVO.f_mem_id}">
			     					<input type="hidden" name="prod_id" value="${shopProductVO.prod_id}">	
			     					<input type="hidden" name="prod_price" value="${shopProductVO.prod_price}">	
			     					<input type="hidden" name="cart_qty" value=1>	
			     					
<!--                                     <a class="btn btn-outline-dark btn-square" > -->
                                    <input type="hidden" name="action" value="addShopCart" >
                                    <div id="btn1" >
                                    <button class="btn btn-outline-dark btn-square btn btn-warning" type="submit" value="加入購物車" id="btn1" >
                                    <i >加入購物車</i>
                                    </button>
                                    </div>
			     					
<!-- 			     					原本按鈕 -->
<!--                                     <a class="btn btn-outline-dark btn-square" type="submit"> -->
<!--                                      <input type="submit" value="加入購物車" > -->
                                    
<!-- 			     					<i class="fa fa-shopping-cart"><input type="submit"></i> -->
			    					
			    					</FORM>

                    </div>
<!--                     <div><br> -->
<!--                         <button class="btn btn-primary px-3"> -->
<!--                         <i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button> -->
<!--                             </div> -->
                                    
<!--                 /////////////////////////////////////////////////////////////////////////////////////////// -->
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30"><br>
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-center active" data-toggle="tab" href="#tab-pane-1">商品介紹</a>
                        <a class="nav-item nav-link text-center" data-toggle="tab" href="#tab-pane-2">購買須知</a>
                     </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">商品介紹</h4>
                            <td>${shopProductVO.prod_intro}</td>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <h4 class="mb-3">Additional Information</h4>
                            <td>${shopProductVO.prod_intro}</td>
                           </div>
                      </div>
                   
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Products End -->

                                

 <!-- ////////////////購物車js////////////////////// -->

 <script>
   
    var btn1 = document.getElementById('btn1');

    btn1.addEventListener('click', function() {
        swal('干得漂亮！', '你点击了按钮！', 'success');
        alter('干得漂亮！', '你点击了按钮！', 'success');
    });
    $('#sweetBtnPreview').click(function (e) {
        e.preventDefault(); //will stop the link href to call the blog page

        setTimeout(function () {
            window.location.href = "http://localhost:8081/CFA104G3/front_end/activity/appearActPage.jsp"; //will redirect to your blog page (an ex: blog.html)
        }, 200000); //will call the function after 2 secs.

    });
	</script>
<!-- ////////////////購物車js////////////////////// -->


    <!-- 頁尾 -->
 <jsp:include page="/front-end/home/footer.jsp" flush="true"/>
 
</body>

</html>