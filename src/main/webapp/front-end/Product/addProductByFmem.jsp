<%@ page import="com.shopProductType.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopProduct.model.*"%>


<%
	ShopProductVO shopProductVO = (ShopProductVO) request.getAttribute("shopProductVO");
%>


<!DOCTYPE html>


<html lang="zh-tw" >


<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="./addprod_files_css/index.f923077f35fa95f6d6ec.css" data-module="vendor" rel="stylesheet">
  <link href="./addprod_files_css/index.2b1612d1a8fda6896c22.css" data-module="framework" rel="stylesheet">
  <title>小農新增商品表單</title>
  <link href="./addprod_files_css/css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" media="all"
    href="./addprod_files_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">
    
<style >
            
.wrap {
    max-width: 960px;
    margin: 0 auto;
}

.header {
padding_top:10px;
    height: 78px;
 
    position: relative;
}

.logo {
    float: left;
    width: 250px;
    height: 76px;
    padding: 5px;
    /* background: #ffffff; */
    /* border: 3px solid rgb(255, 216, 157); */
}

.menu {
    float: right;
    font-size: 24px;

}

.menu li {
    list-style-type: none;
    float: left;
    display: inline-block;
    height: 60px;

}

.menu li a {
    display: block;
    color: #717d34;
    text-decoration: none;
    padding-left: 1em;
    padding-right: 0em;
    padding-top: 0.4em;

}

.menu li a:hover {
    /* background: #8ca27e; */
    color: #8ca27e;
}

/*在pc隱藏漢堡選單,showmenu右上角點擊按鈕*/

.showmenu {
    display: none;
    color: #FFCCCC;
}

/*在手機瀏覽漢堡選單*/
.div1 {
    width: 35px;
    height: 5px;
    background-color: #aaba8b;
    margin: 6px 0;
}

@media (max-width: 767px) {
    .menu {
        /*隱藏選單開始*/
        max-height: 0px;
        overflow: hidden;
        /*隱藏選單結束*/
        transition: max-height 2.3s;
        margin-top: 1px;
        /*絕對定位疊在網頁上*/
        position: absolute;
        z-index: 100;
        /*header 80px+1px boder 線條*/
        top: 81px;
        left: 0;
        right: 0;
        background: #d4e1bb;
    }

    .menu li {

        list-style-type: none;
        float: none;
        border-bottom: 1px dashed #919191;
        display: inline;
    }



    .menu li a {
        transition: all 0.2s;
        padding-left: 0em;
        padding-right: 0em;
        padding-top: 0.7em;
        padding-bottom: 0.7em;
    }

    .menu li a:hover {
        background: #8ca27e;
        color: #fff;
    }

    .showmenu {
        /* transition: all 0.2s; */
        display: block;
        float: right;
        padding: 20px;


    }

    /*jQ點擊後動態在 body 加上 class */
    .menu-show .menu {
        max-height: 500px
    }
    </style>
</head> 

<header>
         <jsp:include page="/front-end/home/header_for_Prod_Fmem.jsp" />
</header>


<!-- 頁首完  -->
<hr />
<body> 
  <div class="container"></div>
  <div class="container mv4">
    <div class="gutter3-l flex">
      <div class="w-100 ph3 mb4 mb0">
      <!--   form開始 -->
       <form class="js-previewable-sum"
          action="product.do" enctype="multipart/form-data" method="post" name="form1">
          <div class="flex mb5 f6 gutter3">
            <div class="w-30-ns w-20 fl ph3">
              <div class="cf">
                <img id="img1" class="w-60 mb3" src="<%=request.getContextPath()%>/front-end/Product/images/farmforUploadPic.png" alt="">
               
                <input class="w-100 border-box mv3" accept="image/*" type="file" name="prod_pic" id="upPic" onchange="pic1_change()" >
               </div>
 <script>
		var file1;
		var fileReader1;
		function pic1_change() {
			file1 = document.getElementById('upPic').files[0];
			if (file1) {
				fileReader1 = new FileReader();
				fileReader1.onload = openfile1;
				readFileContent1();
			}
		}
		function openfile1(event) {
			document.getElementById('img1').src = event.target.result;
		}
		function readFileContent1() {
			fileReader1.readAsDataURL(file1);
		}
	</script>
            </div>
            

            <div class="w-70-l w-150 ph2">
              <div class="dn-ns db pt2" id="details"></div>
              <div class="">  
                <label for="user_email">小農會員編號:</label><br>
                  <input required="required" class="w-30 mb3" type="text" value="<%= (shopProductVO==null)? "70000" : shopProductVO.getF_mem_id()%>" name="f_mem_id" /><br>
                <label for="user_name">商品名稱:</label><br>
                <input required="required" class="w-30 mb3" type="text" value="<%= (shopProductVO==null)? "草莓好吃" : shopProductVO.getProd_name()%>"  name="prod_name" /><br>
               
               
     		<jsp:useBean id="productTypeSvc" scope="page" class="com.shopProductType.model.ShopProductTypeService" />
           <label>商品類別:</label><br>
            <select required="required" class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30" size="1" name="prod_type_id"><br>
			<c:forEach var="shopProductTypeVO" items="${productTypeSvc.all}">
				<option value="${shopProductTypeVO.prod_type_id}" ${(shopProductVO.prod_type_id==shopProductTypeVO.prod_type_id)? 'selected':'' } >${shopProductTypeVO.prod_type_name}
			</c:forEach>
			</select> <br>
		      
                <label  for="prod_status">商品狀態:</label><br>
                <select required="required" class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30"
                  autocomplete="country-name" name="prod_status" id="prod_status">
                  
                  <option value="0" >
                  未上架
                </option>
                <option value="1">
                  已上架
                </option>
                
                </select><br>
                
                <div class="flex mt3">
                  <div class="flex-auto">
                    <label for="order_address">商品價格:</label><tr>$</tr><br>
                   <input required="required" class="mb3 w-50"  type="text" value="<%= (shopProductVO==null)? "888" : shopProductVO.getProd_price()%>" name="prod_price" />
                  </div>
                  <div class="flex-auto">
                    <label  for="order_postcode">商品單位:</label><br>
                    
                    <input required="required" class="mb3 w-50 js-postcode-field"  type="text" value="<%= (shopProductVO==null)? "台斤" : shopProductVO.getProd_unit()%>"  name="prod_unit" />
                  </div>
                  </div>
                </div>
                <div class="flex mt4">
                <div class="flex-auto">
                  <label  for="order_recipient">商品數量:</label><br>
                   <input required="required" class="mb3 w-55" type="text" value="<%= (shopProductVO==null)? "666" : shopProductVO.getProd_qty()%>"  name="prod_qty" />
                </div>
                
                <div class="flex-auto">
                  <label  for="order_postcode">商品上架日期:</label><br>
                  <input required="required" class="mb3 w-55 js-postcode-field" type="text" value="<%= (shopProductVO==null)? "2022-02-01" : shopProductVO.getProd_reg_date()%>" name="prod_reg_date" />
                </div>
              </div>
              <!-- <label class="mt3 b" for="order_country">熱門標籤:</label>
              <select required="required"
                class="mb3 js-shipping-cost js-country-select js-update-sum-for-postage w-30"
                autocomplete="country-name" name="order[country]" id="order_country">
                <option>虎年特惠</option><option>聖誕節</option>
              </select> -->
              <label for="order_note">商品介紹:<span class="gray mb3">特色說明</span></label><br>
                  <textarea placeholder="123"  class="w-100 height-100" type="text" value="" name="prod_intro" />
                  <%= (shopProductVO==null)?"": shopProductVO.getProd_intro()%>
                  </textarea>
                 
                <input type="hidden" name="action" value="insert">
				<input class="db js-submit-order button green mt3" type="submit" value="送出新增">
              </div>
            </div>
          </div>
          </form>
          <!-- form結束 -->
    </div>
  </div>
     <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
   <%-- 錯誤表列 --%>
 <footer class="pt5 pb6 f6 bt light-gray relative">
   <jsp:include page="/front-end/home/footer.jsp" flush="true"/>
  </footer>
 
  </body> 
</html>
  