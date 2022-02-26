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
ShopProductVO list = (ShopProductVO)request.getAttribute("shopProductVO");
   pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>

 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>瀏覽商城商品</title>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("button").click(function() {
			$(this).next().toggle("slow");
		});
	});
		
</script>
<style type="text/css">

	div1 {
		
		background-color: #e5eecc;
		padding: 7px;
		border: solid 1px #c3c3c3;
	}
</style>



<style>
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
                            <img class="img-fluid w-100" style="width-auto;height-auto;" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30"><br><br>
                <div>
                  <h3 style="font-size:28px;">${shopProductVO.prod_name}</h3><br>
                   
                    <h3 class="font-weight-semi-bold mb-4" style="font-size:28px;"><a style="font-size:28px;">$</a><font color="red"><b>${shopProductVO.prod_price}</b></font><a style="font-size:28px;">元/</a>${shopProductVO.prod_unit}</h3>
                   
                    

<div ><button type="button" class="btn btn-danger" >常溫</button></div>
					<br>
<div><button type="button" class="btn btn-primary" >產地含運直送</button></div>
					<br>
					<div>
					<button type="button" class="btn btn-warning" >商品介紹</button><br>
                            <br><td><textarea  readonly="readonly"  style="font-size:20px;resize:none;width:600px;height:200px;border:1px white dashed;">${shopProductVO.prod_intro}</textarea></td>
                     </div>  
					<br>
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
					
<!--                                     <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> -->
                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopCart/shopCart.do" style="margin-bottom: 0px;">
<%-- 			    					<input type="hidden" name="mem_id" value="${shopProductVO.mem_id}"> --%>
			    					<input type="hidden" name="mem_id" value="<%=mem_id %>">
			    					<input type="hidden" name="f_mem_id" value="${shopProductVO.f_mem_id}">
			     					<input type="hidden" name="prod_id" value="${shopProductVO.prod_id}">	
			     					<input type="hidden" name="prod_price" value="${shopProductVO.prod_price}">	
			     					<input type="hidden" name="cart_qty" value=1>	
			     					
<!--                                     <a class="btn btn-outline-dark btn-square" > -->
                                    <input type="hidden" name="action" value="addShopCart" >
                                    <div id="btn1" >
                                    <button class="btn btn-outline-dark btn-square btn color-btn btn-lg" type="submit" value="加入購物車" id="btn1" >
                                    <i >加入購物車</i>
                                    </button>
                                    </div>
			    					
			    					</FORM>

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
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30"><br>
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-center" style="font-size:23px;">購買須知</a>
                     </div>
                   
                            <button class="btn btn-success" style="font-size:20px;" >購買流程</button>
					
					<div id="div1">
					<font style="font-size:20px;"><br>首次購物：歡迎加入！請於官網右上角點選「會員註冊」，註冊一個專屬於您的購物帳號<br>
						  再次購物：請於官網右上角點選「會員登入」，選擇先前註冊的電子郵件登入。
						  <br>
						  <br>  當您付款完成訂單成立時，註冊信箱會收到「訂單成立通知」、「付款成功通知」，通知您小農商城已經收到您的訂購需求。
						 <br> 我們會立即為您安排出貨，若想追蹤訂單處理進度，可於官網右上角點選「登入」→「訂單查詢」</font>
					</div>
					
                     <br>
                     <br>
                   
                      <button type="button" class="btn btn-success" style="font-size:20px;" >關於退貨</button>
<!-- 					<font>出貨說明</font> -->
				
					<div id="div1">
					<font style="font-size:20px;"><br>生鮮蔬菜、水果
					<br><br>若您發現收到商品時有損傷、撞傷，可能是因為運送過程中產生碰撞、或是在產地時已經遭蟲害。
					<br>因此要麻煩您一發現任何問題，請在收到商品後7天內，來信客服中心並且拍下商品破損部位照片(至少2-3張)寄至客服信箱(service@fruity.com.tw)，小農商城會派人為您專案處理。
					<br><br>小農商城的蔬菜和水果，都是收到訂單之後，才請農夫們為您採收，這些生鮮食品一旦寄出，恕不接受因個人主觀因素（香氣色澤、重量大小、甜度口感、不喜歡或覺得不好吃）辦理退換貨，或收到商品時意願降低、臨時取消。
					<br><br>只要是非商品本身的瑕疵，恕無法為您辦理退換貨，下單前消費者們請務必考慮。</font>
					</div>
                     <br>
                     <br>
                       
                     <button type="button" class="btn btn-success" style="font-size:20px;">出貨說明</button>
<!-- 					<font>出貨說明</font> -->
	
					<div id="div1">
					<font style="font-size:20px;"><br>當您的信用卡資料核對無誤後，該筆交易便完成付款程序，貨到付款則直接進行配送。
						<br>我們將會在付款完成後的 3-5個工作天內(不含週休及國定例假日)，將商品宅配送達您指定的收件地址。
<br>
						<br>台灣本島↔台灣本島(三天內到貨)
						訂單下單成立後將於隔日出貨，出貨時間為週一至週五，遇隔日為國定假日、例假日則暫停出貨。
						<br>台灣本島↔金門、澎湖、綠島、梨山地區(五天內到貨)
						<br>註：綠島地區請至全家朝日店交寄常溫貨件
<br>

						<br>國際配送(10~14個工作天)
						<br>訂單下單成立後將於隔日出貨，出貨時間為週一至週五，遇隔日為國定假日、例假日則暫停出貨。
						<br>中華郵政國際宅配:配送時間10~14個工作天。</font>
					</div>
                     <br>    
                
                   
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Products End -->



<!-- ////////////////購物車js////////////////////// -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<!-- ////////////////購物車js////////////////////// -->

    <!-- 頁尾 -->
 <jsp:include page="/front-end/home/footer.jsp" flush="true"/>
 
</body>

</html>