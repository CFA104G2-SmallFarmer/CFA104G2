<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	Integer f_mem_id=70000;
	ShopProductService prodServiceSvc = new ShopProductService();
    List<ShopProductVO> list = prodServiceSvc.getAllByFmem(f_mem_id);
    pageContext.setAttribute("list",list);
    
    request.setAttribute("prod__upload_arr", new String[]{"未上架","已上架"});
%>
<jsp:useBean id="productTypeSvc" scope="page" class="com.shopProductType.model.ShopProductTypeService" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小農商品列表</title>



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
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/header_css_for_Proj">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 這段給emoji的 -->
          <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous" />
            
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
    padding-left: 0.4em;
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


<!-- <header> -->
<%--            <jsp:include page="/front-end/home/header_for_Prod_Mem.jsp" /> --%>
<!-- </header> -->
<!-- 頁首完  -->
<body>

  
     <div class="head bg-white">
            <div class="container">
                <nav class="navbar navbar-expand-md bg-white navbar-white">
                
				 <script>
				    $(document).ready(function () {
				        $('.showmenu').on('click', function (e) {
				            e.preventDefault();
				            $('body').toggleClass('menu-show');
				          }
				
				        );
				      }
				
				    );
				  </script>
				
				   <div class="wrap">
				    <div class="head">
					      <div class="logo" ><img style="margin-top:10px;height:70px"src="<%=request.getContextPath()%>/front-end/home/images/farmerManage-Final.png">
					      </div>
					      <ul class="menu">
					        <li><a href="listAllProductByFmem.jsp">我的商品列表</a></li>
					
					        <li><a href="#">我的訂單管理</a></li>
					
					        <li><a href="shop.jsp">回到首頁 </a></li>
<!-- 					        <li><a href="#"><i class="material-icons" style="font-size:27px">mail_outline</i></a></li> -->
<!-- 					 		  <li><a href="#"><i class="material-icons" style="font-size:27px">person</i> </a></li> -->
					      </ul>
					      <div class="div0 showmenu">
					        <a href="#" >menu</a>
					        <div class="div1"></div>
					        <div class="div1"></div>
					        <div class="div1"></div>
					      </div>
					
					      <a href="#" class="showmenu">menu</a>
					    </div>
				     </div>      
                </nav>
            </div>
        </div> 
        <hr />
<!-- ----------------------------------------------------------------------- -->
      <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="navbar-brand " style="white-space: normal;">
                     <nav class="bg-light " style="white-space: normal;">
                     
                        <a  class="btn btn-outline-grey btn-square"  href="addProductByFmem.jsp"> <i class='fas fa-sync'></i>新增商品</a>
<!--                         <a  class="btn btn-outline-grey btn-square" href="listAllProductByFmem.jsp"><i class='fas fa-sync'></i>我的商品</a> -->
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
  <%-- 錯誤表列 --%>
        


        <!-- Cart Start -->
        <div class="container-fluid"><br>
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
                        <th>修改</th>
                        <th>刪除</th>
                    </tr>
                </thead>
           <tbody class="align-middle">
          <%@ include file="page1.file" %> 
             <c:forEach var="shopProductVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                    <tr>
                        <td>${shopProductVO.prod_id}</td>
                        <td>${shopProductVO.f_mem_id}</td>
                        <td><img class="img-fluid" style="width:100px" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" style="width:20px;height:20px;"></td>
                        <td>${shopProductVO.prod_name}</td>
                        
                        <td><c:forEach var="shopProductTypeVO" items="${productTypeSvc.all}">
                   			 	<c:if test="${shopProductVO.prod_type_id==shopProductTypeVO.prod_type_id}">
	                    			${shopProductTypeVO.prod_type_name}
                    			</c:if>
                			</c:forEach></td>
                        <td><c:set var="pay_num" scope="request" value="${shopProductVO.prod_status}"/>${prod__upload_arr[pay_num]}</td>
                        <td>${shopProductVO.prod_price}</td>
                        <td>${shopProductVO.prod_unit}</td>
                        <td>${shopProductVO.prod_qty}</td>
                        <td>${shopProductVO.prod_reg_date}</td>
                    <!-- <td class="align-middle">虎年特惠</td>  --> 
                   	 	<td style="white-space:nowrap; overflow:hidden;text-overflow:ellipsis; ">${shopProductVO.prod_intro}</td>
                   	 	
              <td class="align-middle">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
			  <button style='font-size:15px' class="btn btn-outline-grey btn-square" type="submit"> 修改 <i class='fas fa-sync'></i></button>
			   
			     <input type="hidden" name="prod_id"  value="${shopProductVO.prod_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			     </FORM>
			</td>
			<td class="align-middle">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0px;">
			  <button style='font-size:15px' class="btn btn-outline-grey btn-square" type="submit"> 刪除 <i class='fas fa-sync'></i></button>
			    
			     <input type="hidden" name="prod_id"  value="${shopProductVO.prod_id}">
			     <input type="hidden" name="action" value="delete">
			     </FORM>
			</td>
		</tr>
	</c:forEach>
	   
                </tbody>
            </table>
		<%@ include file="page2.file" %>
        </div>

    <!-- Cart End -->

    <!-- 頁尾 -->

</body>

<footer class="pt5 pb6 f6 bt light-gray relative">
  <iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;" scrolling="no"></iframe>
<%--   <jsp:include page="/front-end/home/footer.jsp" flush="true"/> --%>
  </footer>
</html>


