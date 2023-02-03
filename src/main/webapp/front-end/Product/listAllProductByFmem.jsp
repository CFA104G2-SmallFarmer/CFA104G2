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
	
	ShopProductService prodServiceSvc = new ShopProductService();
    List<ShopProductVO> list = prodServiceSvc.getAllByFmem(fMemVO.getF_mem_id());
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
    
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- jquery-confirm -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script>
function del() { 
	var msg = "您真的確定要刪除嗎？"; 
	if (confirm(msg)==true){ 
	return true; 
	}else{ 
	return false; 
	} 
} 
</script>

    <!-- Template Stylesheet -->
    <link href="css/style1.css" rel="stylesheet">
    
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/home/header_css_for_Proj"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 這段給emoji的 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style >
.img-fluid {
    max-width: 100px;
    height: 100px;
    object-fit: cover;
        }
table{  
  	table-layout:fixed;/* 只有定義了表格的佈局算法爲fixed，下面td的定義才能起作用。 */
  		}  
		  
    </style>

</head>
<body>
<%-- <iframe src="<%= request.getContextPath() %>/front-end/home/header2/header2.jsp" width="100%" height="100%" style="display: block;" Target="_top"></iframe> --%>
<jsp:include page="/front-end/home/header2/header2.jsp" flush="true"/>
  
<!-- ----------------------------------------------------------------------- -->
      <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="navbar-brand " style="white-space: normal;">
                     <nav class="bg-light " style="white-space: normal;">
                     
                        <a  class="btn btn-sm btn-success"  href="addProductByFmem.jsp" style="font-size:20px"> <i class="material-icons" style="font-size:20px;color:white">add</i>新增商品</a>
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
              			<th>商品介紹</th>
                        <th>修改</th>
                        <th>刪除</th>
                    </tr>
                </thead>
           <tbody >
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
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" >
			  <button style='font-size:15px' class="btn-sm btn-primary" type="submit" style="font-size:16px"><i class="material-icons" style="font-size:16px">create</i> 修改 </button>
			   
			     <input type="hidden" name="prod_id"  value="${shopProductVO.prod_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			     </FORM>
			</td>
			<td class="align-middle">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/Product/product.do" style="margin-bottom: 0;">
			  <button  class="btn-sm btn-danger" type="submit" style="font-size:16px"  onclick="javascript:return del()"><i class="material-icons" style="font-size:16px">clear</i> 刪除 </button>
			    
   					 <p id="demo"></p>
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
<%--   <iframe src="<%= request.getContextPath() %>/front-end/home/footer.jsp" width="100%" height="100%" style="display: block;" scrolling="no"></iframe> --%>
  <jsp:include page="/front-end/home/footer.jsp" flush="true"/>
  </footer>
</html>


