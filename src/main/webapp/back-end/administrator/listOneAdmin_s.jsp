<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.adminTypeFuncList.model.AdminTypeFuncListService"%>
<%@ page import="com.administrator.model.*"%>
<%@ page import="com.adminFunction.model.*"%>
<%@ page import="com.adminType.model.*"%>
<%@page import="java.util.List"%>

<%
    Object account = session.getAttribute("account");                  
    if (account == null) {                                             
      session.setAttribute("location", request.getRequestURI());       
      response.sendRedirect(request.getContextPath()+"/back-end/adminLogin/login.jsp");  
      return;
    }
    AdministratorVO adminLoginVO = (AdministratorVO) session.getAttribute("adminLoginVO");
    AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO");

    AdminTypeFuncListService adminTypeFuncListService = new AdminTypeFuncListService();
    List<AdminFunctionVO> list = adminTypeFuncListService.getOneTypeFuncList(adminLoginVO.getAdmin_type_id());
    pageContext.setAttribute("list", list);
%>



<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="./css/index.css">
  <link rel="stylesheet" href="./css/index_mobile.css">
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $("th").css("background-color", "#EDEDED"); 
    });
  </script>
</head>
<body>
  <header class="header">
    <a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp" class="logo_img"><img src="./images/logo_img2.png"></a>
    <nav class="nav">
      <ul class="link_list">
        <li><a href="<%=request.getContextPath()%>/front-end/announcement/listAllAnnounce.jsp" class="-on">最新消息</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp">小農商城</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp">農場旅遊</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp">農產認養</a></li>
      </ul>
    </nav>
  </header>

  <div class="banner_bg"></div>

  <div class="main_container">
    <aside class="aside">
      <div class="avatar_block">
        <div class="sidelink">
          <div class="img_block">
            <img src="<%=request.getContextPath()%>/back-end/administrator/adminImgReader.do?id=${adminLoginVO.admin_id}">
          </div>
          <div>
            <span class="name_span"></span>
          </div><br><br>
          <div class="sidelink_a"><h3>後台管理員</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/administrator/listAllAdmin.jsp">帳號資料管理</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp">個人資料</a></h4></div>
          <div class="sidelink_a"><h3>會員管理</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/fMem/listAllFMem.jsp">小農會員管理</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/mem/listAllMem.jsp">一般會員管理</a></h4></div>
          <div class="sidelink_a"><h3>前台網頁管理</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/announcement/listAllAnnounce.jsp">公告資訊管理</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/homeSlideShow/listAllHss.jsp">首頁幻燈片管理</a></h4></div>
          <div class="sidelink_a"><h3>檢舉管理</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp">商品檢舉管理</a></h4></div> 
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp">旅遊檢舉管理</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp">認養檢舉管理</a></h4></div> 
          <div>
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/adminLogin/changePwd.jsp" >
     	      <input type="submit" value="更改密碼">
   		    </FORM>
          </div>
          <br>
          <div>
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/administrator/administrator.do" >
     	      <input type="hidden" name="action" value="logout">
     	      <input type="submit" value="登出">
   		    </FORM>
          </div>       
        </div>
      </div>
    </aside>

    <main class="main">



      <h1 class="title1">管理員照片</h1>
      <img src="<%=request.getContextPath()%>/back-end/administrator/adminImgReader.do?id=${adminLoginVO.admin_id}">
      <h1 class="title1">管理員資料</h1>
      <table class="table">
        <tr>
          <th>編號</th>
          <th>姓名</th>
          <th>帳號</th>
          <th>手機</th>
          <th>管理員類別</th>
          <th>到 職 日</th>         
        </tr>
        <tr>
          <td>
          ${adminLoginVO.admin_id}
          </td>
          <td>
          ${adminLoginVO.admin_name}
          </td>
          <td>
          ${adminLoginVO.admin_acc}
          </td>
          <td>
          ${adminLoginVO.admin_mobile}
          </td>
          <td>
		  	<jsp:useBean id="adminTypeService" scope="page" class="com.adminType.model.AdminTypeService" />
			<c:forEach var="adminTypeVO" items="${adminTypeService.all}">
			<c:if test="${(adminLoginVO.admin_type_id==adminTypeVO.admin_type_id)}">  
				${adminTypeVO.admin_type_name}
			</c:if>
			</c:forEach>
          </td>
          <td>
          ${adminLoginVO.admin_hiredate}
          </td>
        </tr>
        <tr>
          <td colspan="3">
            <span>
            ${adminLoginVO.admin_city}
            </span>
            <span>
            ${adminLoginVO.admin_dist}
            </span>
            <span>
            ${adminLoginVO.admin_addr}
            </span>
          </td>
          <td colspan="2">
          	${adminLoginVO.admin_email}
          </td>
          <td>
          <c:choose>
			<c:when test="${adminLoginVO.admin_isdeleted==0}">離職</c:when>
			<c:otherwise>在職</c:otherwise>						
		  </c:choose>
          </td>

        </table>

		<h1 class="title1">管理權限</h1>  <!-- 待處理 -->

        <ul class="expirence_list">
          <c:forEach var="adminFunctionVO" items="${list}">

          <li>${adminFunctionVO.admin_func_name}：${adminFunctionVO.admin_func_des}</li>
   
		  </c:forEach>
        </ul>      
        

        
     
      </main>
    </div>



    <footer class="footer">
      &copy; All Rights Reserved
    </footer>

  </body>
  </html>
