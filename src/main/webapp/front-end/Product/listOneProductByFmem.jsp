<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopProduct.model.*"%>
<%@ page import="com.shopProductType.model.*"%>
<%@ page import="com.fMem.model.*"%>
<%@ page import="com.mem.model.*"%>
<%FMemVO fMemVO = (FMemVO) session.getAttribute("fMemVO");%>
<%MemVO MemVO = (MemVO) session.getAttribute("memVO");%>

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
    
 <!-- 這段給emoji的 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <style>

    </style>
</head>
<!-- <header> -->
<%-- <iframe src="<%= request.getContextPath() %>/front-end/home/header2/header2.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
<!-- </header>  -->
<!-- 頁首完  -->
<body>
        <!-- Header Start -->
   
        <!-- Header End -->
        
 <!-- Breadcrumb Start -->
       <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="navbar-brand " style="white-space: normal;">
                     <nav class="bg-light " style="white-space: normal;">
                         <a  class="btn btn-sm btn-success"  href="addProductByFmem.jsp" style="font-size:20px"> <i class="material-icons" style="font-size:20px;color:white">add</i>新增商品</a>
<!--                         <a  class="bg-light" href="listAllProductByFmem.jsp">我的商品</a> -->
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->        
<!-- Cart Start -->
<div class="container-fluid">


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
                        <td><img class="img-fluid" style="width:100px" src="<%=request.getContextPath()%>/front-end/Product/ShopProductDBGifReader4?id=${shopProductVO.prod_id}" style="width:20px;height:20px"></td>
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
	
	
        
                </tbody>
            </table>
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


  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <div valign="center" align="center">
  <input type="button" class="btn-info btn-lg" onclick="location.href='<%=request.getContextPath()%>/front-end/Product/listAllProductByFmem.jsp';" value="商城商品管理" />
  </div>
  <br>
  <br>
  <br>
  <br>
  <br>
    <!-- Cart End -->

    <!-- 頁尾 -->
  
  
</body>
<footer class="pt5 pb6 f6 bt light-gray relative">
<%--   <iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;"></iframe> --%>
 <jsp:include page="/front-end/home/footer.jsp" flush="true"/>
 </footer>

</html>


