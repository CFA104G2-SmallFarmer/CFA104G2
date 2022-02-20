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
<html lang="en">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查看商品詳情</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
   
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
                   
                    
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control bg-first border-0 text-center" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        
                    </div>
                    <div><br>
                        <button class="btn btn-primary px-3">
                        <i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
                            </div>
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
    <!-- Shop Detail End -->


    <!-- Products Start -->

        
    <!-- Products End -->


    <!-- Footer Start -->
    <!-- 頁尾 -->
 
<footer class="pt5 pb6 f6 bt light-gray relative">
  <iframe src="<%= request.getContextPath() %>/front-end/footer/footer.jsp" width="100%" height="100%" style="display: block;"></iframe>
  </footer>
</body>

</html>