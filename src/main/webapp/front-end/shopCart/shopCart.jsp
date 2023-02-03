<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopCart.model.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>

<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>


<%
ShopCartService shopCartSvc = new ShopCartService();
Integer mem_id = Integer.valueOf(MemVO.getMem_id());

//  Integer mem_id = Integer.valueOf(request.getParameter("mem_id"));
// Integer mem_id = 77003;
// session.getAttribute("mem_id",77003);

List<ShopCartVO> list = shopCartSvc.getOneList(mem_id);
pageContext.setAttribute("list", list);
%>

<% List<Integer> list2 = shopCartSvc.getF_mem(mem_id);
pageContext.setAttribute("list2", list2);
%>

<%
ShopCartVO shopCartVO = (ShopCartVO) request.getAttribute("shopCartVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<jsp:useBean id="shopProductSvc" scope="page" class="com.shopProduct.model.ShopProductService" />
<jsp:useBean id="fmemSvc" scope="page" class="com.fMem.model.FMemService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Bootstrap Ecommerce Template" name="keywords">
<meta content="Bootstrap Ecommerce Template Free Download" name="description">
<title>購物車</title>

 <link rel="stylesheet" 
  href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css ">
  <link rel="stylesheet" 
  href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<style>

    .skin {
      background-color: rgb(245, 216, 178);
      /* display-5 mb-2; */
    }

    .black {
      background-color: black;
    }

    .totalprice{
      size: 200px;
    }

    .all {
      display: flex;
      height: 100%;
    }
     
    .red{
  	  color: red;
  	  font-size: large;  
    }
    .border{
      border-top:5px black solid;
    }
 .main .overlay{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background-color: hsla(0, 0%, 0%, .5);

    display: none;
}
/* 文字 */
  .bubbles {
            display: inline-block;
            font-family: arial;
            position: relative;
        }

        .bubbles span {
            position: relative;
            margin: 1em 0 0;
            font-family: 'Luckiest Guy', cursive;
            color: green;
            z-index: 2;
            font-size: 40px;
        }
        .individual-bubble {
            position: absolute;
            border-radius: 100%;
            bottom: 10px;
            background-color: blue;
            z-index: 2;
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
        0% {background-position: 0 0;}
        100% {background-position: 100% 0;}
}
	
.border-img{
       -moz-border-image: -moz-linear-gradient(top left, #3acfd5 0%, #3a4ed5 100%);
	  -webkit-border-image: -webkit-linear-gradient(top left, #3acfd5 0%, #3a4ed5 100%);
	          border-image: linear-gradient(to bottom right, #3acfd5 0%, #3a4ed5 100%);
	  border-image-slice: 1;
}

  </style>
  
  
<!--   頁首 -->

<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
<%-- <jsp:include page="/front-end/home/header.jsp" flush="true"/> --%>
<%-- <iframe src="<%= request.getContextPath() %>/front-end/home/header.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>

<%-- <jsp:include page="/front-end/home/header_for_Proj_Mem.jsp" flush="true"/> --%>
<%-- <jsp:include page="/front-end/home/header_for_Proj_Fmem.jsp" flush="true"/> --%>

<!-- <div style="border:solid 1px lightgray"></div> -->
<!--   頁首 -->	

 <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
        </script>

</head>
<body>

<!-- 的購物車-->
<%-- ${shopCartVO1 == null} --%>
<!-- <div> -->
<div style="border: 100px solid  white; border-radius:100px;" class="overlay">
<%-- <h3>${shopCartVO.mem_id}  --%>
<%-- ${memSvc.getOneMem(shopCartVO.mem_id).mem_name} --%>
<!-- </h3> -->
        <img src="<%=request.getContextPath()%>/front-end/shopCart//images/透明小小農.png " width="50" height="50">
        <img src="<%=request.getContextPath()%>/front-end/shopCart//images/字體.png " width="150" height="50">
		<br>
		<br>
<!-- 的購物車-->

<!-- 第一層迴圈 -->
<c:forEach var="shopCartVO1" items="${list2}">
<%-- ${shopCartVO1}  --%>

    <!-- secion = 最底背景 -->
    <div id="background"  style="background-color: white; border-radius:100px;">
<!--     <div id="background" class="pt-5 pb-5" style="background-color: white; border-radius:100px;"> -->
    
    <!-- 購物車明細背景 -->
    <div class="container border-img" style="border:10px solid #b9d4b3 ;box-shadow:3px 3px 5px 6px #cccccc;border-radius:60px">
      <!-- <div class="col-lg-12 col-md-12 col-12" style="background-color: rgb(247, 239, 239);"> -->
<br>
      <div class="bubbles"><span>
		${fmemSvc.getOneFMem(shopCartVO1).f_mem_fname}
      </span></div>
<br>
      
      <div class="table-responsive">
        <table style="text-align:center" class="table table-striped table-hover text-start">
          <thead class="">
            <tr id="tablehender" style="background-color: #dfdcb3;">
              
              <th>照片</th>
              <th>商品</th>
              <th>價格</th>
              <th>數量</th>
              <th>小記</th>
              <th>刪除</th>
            </tr>
          </thead>
          <tbody style="background-color: #ffffff;">
          
          <c:set value="0" var="sum"/>
          
          
          
<!--  foreach 取出資料 Start-->
 		<c:forEach var="shopCartVO" items="${list}">
    <c:choose>
    <c:when test="${shopCartVO1 == shopCartVO.f_mem_id}">
<!--        有。 -->
    
            <tr>
              <td>
<%--               ${shopCartVO.f_mem_id} --%>
<%--               ${fmemSvc.getOneFMem(shopCartVO.f_mem_id).f_mem_fname} --%>
<!--               <div class="carousel-item active"> -->
               <img  src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopCartVO.prod_id}" alt="" width="100" height="100">
<!--                         </div> -->
              </td>
<!--             	商品名稱 -->
              <td>
<%--               ${shopCartVO.prod_id} --%>
              ${shopProductSvc.getOneProduct(shopCartVO.prod_id).prod_name}
              </td>
<!--               單價 -->
              <td>${shopCartVO.cart_unit_price}</td>

<!--               減號鍵 -->
              <td class="up">
 			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopCart/shopCart.do" style="margin-bottom: 0;">
                <button class="btn btn-sm color-btn  btn-minus" type="submit" style="background-color:#dfdcb3">
                  <i class="fa fa-minus"></i>
                </button>
                 <input type="hidden" name="mem_id"  value="<%=mem_id%>">
			     <input type="hidden" name="prod_id"  value="${shopCartVO.prod_id}">
			     <input type="hidden" name="cart_qty"  value="${shopCartVO.cart_qty}">
			     <input type="hidden" name="cart_unit_price"  value="${shopCartVO.cart_unit_price}">
			     <input type="hidden" name="action" value="minus">
   		    </FORM>
			    
<!--                 數量 -->
                <input type="text" size="2" disabled="disabled" value="${shopCartVO.cart_qty}">
<%-- 				<span>${shopCartVO.cart_qty}</span> --%>
                
<!--                 加號鍵 -->
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopCart/shopCart.do" style="width:10px;">	
                <button class="btn btn-sm  btn-plus color-btn" style="background-color:#dfdcb3">
                  <i class="fa fa-plus"></i>
                </button>
                <input type="hidden" name="mem_id"  value="${shopCartVO.mem_id}">
			     <input type="hidden" name="prod_id"  value="${shopCartVO.prod_id}">
			     <input type="hidden" name="cart_qty"  value="${shopCartVO.cart_qty}">
			     <input type="hidden" name="cart_unit_price"  value="${shopCartVO.cart_unit_price}">
			     <input type="hidden" name="action" value="plus">
   		    </FORM>
                
              </td>
              
<!--               小記 -->
              <td>${shopCartVO.cart_unit_price * shopCartVO.cart_qty}</td>
				<c:set value="${sum+shopCartVO.cart_unit_price*shopCartVO.cart_qty}" var="sum"/>
<!--               刪除鍵 -->
              <td>
               <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopCart/shopCart.do" style="width:10px; ">
<!-- 			     <input type="submit" value="刪除"> -->
               	 <button class="btn btn-sm btn-danger" type="submit">
                          <i class="fa fa-times"></i>
              	 </button>
			     <input type="hidden" name="mem_id"  value="${shopCartVO.mem_id}">
			     <input type="hidden" name="prod_id"  value="${shopCartVO.prod_id}">
			     <input type="hidden" name="action" value="delete">
			    </FORM>
              </td>
            </tr>
            </c:when>
    <c:otherwise>
<!--         没有。 -->
    </c:otherwise>
</c:choose>
            </c:forEach>
<!--  foreach 取出資料 End-->

<!-- 			總金額 -->
			<tbody>
			<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><font class="red"><b>Totoal:${sum}</b></font></td>
			</tr>
			
			<tr>
			<td></td>
			<td></td>
			<td></td>
<!-- 			上一頁 -->
			<td>
			<button class="btn btn-warning" type="button"type="button"name="back" class="gree" value="上一頁"onClick="location.href='<%=request.getContextPath()%>/front-end/Product/shop.jsp';">繼續購物</button>
<!-- 			<button class="btn btn-warning" type="button"type="button"name="back" class="gree" value="上一頁"onClick="location.href='javascript:history.back()';">上一頁</button> -->
			</td>
			<td>
			
<!-- 			結帳按鈕 -->
<!-- 			結帳start -->
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopCart/shopCart.do" style="width:10px; ">
			
			     <input type="hidden" name="mem_id"  value="<%=mem_id%>">
<%-- 			     <input type="hidden" name="prod_id"  value="${shopCartVO.prod_id}"> --%>
			     <input type="hidden" name="f_mem_id"  value="${shopCartVO1}">
<%-- 			     <input type="hidden" name="cart_qty"  value="${shopCartVO.cart_qty}"> --%>
<%-- 			     <input type="hidden" name="cart_unit_price"  value="${shopCartVO.cart_unit_price}"> --%>
			     <input type="hidden" name="sum"  value="${sum}">
			<button class="btn btn-success" type="submit" value="checkout">結帳</button>
			     <input type="hidden" name="action" value="checkout">
			    </FORM>
<!-- 			結帳end -->

			</td>
			</tr>
			</tbody>
			
          </tbody>
        </table>
      </div>
    </div>
  </div>
</c:forEach>

</div>
<!-- 防止購物車是空的 -->
<div  align="center" valign="center" onclick="location.href='<%=request.getContextPath()%>/front-end/Product/shop.jsp';">
<img alt="" src="<%=request.getContextPath()%>/front-end/shopCart/images/透明小小農.png " width="50" height="50">
<button class="btn btn-info" type="button"name="back" class="gree" style="background-color:#98afe5;">
還有許多優惠產品，再去逛逛吧~~</button>
</div>
<br>
<!-- 頁尾 -->
<jsp:include page="/front-end/home/footer.jsp" flush="true"/>
<%-- <iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
<!-- 頁尾 -->
<script>

jQuery(document).ready(function ($) {

    // Define a blank array for the effect positions. This will be populated based on width of the title.
    var bArray = [];
    // Define a size array, this will be used to vary bubble sizes
    var sArray = [4, 6, 8, 10];

    // Push the header width values to bArray
    for (var i = 0; i < $('.bubbles').width(); i++) {
        bArray.push(i);
    }

    // Function to select random array element
    // Used within the setInterval a few times
    function randomValue(arr) {
        return arr[Math.floor(Math.random() * arr.length)];
    }

    // setInterval function used to create new bubble every 350 milliseconds
    setInterval(function () {

        // Get a random size, defined as variable so it can be used for both width and height
        var size = randomValue(sArray);
        // New bubble appeneded to div with it's size and left position being set inline
        // Left value is set through getting a random value from bArray
        $('.bubbles').append('<div class="individual-bubble" style="left: ' + randomValue(bArray) + 'px; width: ' + size + 'px; height:' + size + 'px;"></div>');

        // Animate each bubble to the top (bottom 100%) and reduce opacity as it moves
        // Callback function used to remove finsihed animations from the page
        $('.individual-bubble').animate({
            'bottom': '100%',
            'opacity': '-=0.7'
        }, 2000, function () {
            $(this).remove()
        }
        );


    }, 350);

});
</script>
</body>
</html>
