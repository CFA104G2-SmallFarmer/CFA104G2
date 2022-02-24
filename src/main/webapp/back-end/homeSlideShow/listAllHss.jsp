<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.homeSlideShow.model.*"%>
<%@ page import="com.administrator.model.*"%>

<%
    Object account = session.getAttribute("account");                  
    if (account == null) {                                             
      session.setAttribute("location", request.getRequestURI());       
      response.sendRedirect(request.getContextPath()+"/back-end/adminLogin/login.jsp");  
      return;
    }
    AdministratorVO adminLoginVO = (AdministratorVO) session.getAttribute("adminLoginVO");
    if (adminLoginVO.getAdmin_type_id()==2 || adminLoginVO.getAdmin_type_id()==3) {                                             
    	try {                                                        
            String location = (String) session.getAttribute("location");
            if (location != null) {
              session.removeAttribute("location");
              response.sendRedirect(location);            
              return;
            }
          }catch (Exception ignored) { }
    	response.sendRedirect(request.getContextPath()+"/back-end/administrator/listOneAdmin_s.jsp");
       }
%>

<%
  HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
  List<HomeSlideShowVO> list = homeSlideShowService.getAll();
    pageContext.setAttribute("list",list);
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
        $("tr:even").css("background-color", "#E8E8E8");
        $("tr:odd").css("background-color", "#E8E8E8");
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

        <br>

        <h1 class="title2">幻燈片管理</h1>

        <%@ include file="page1.file" %> 
        <c:forEach var="homeSlideShowVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

          <a href="<%=request.getContextPath()%>/back-end/homeSlideShow/hssImgReader.do?id=${homeSlideShowVO.hss_id}" Target="external" 
            onclick="window.open('<%=request.getContextPath()%>/back-end/homeSlideShow/hssImgReader.do?id=${homeSlideShowVO.hss_id}', 'external', 'width=1405,height=535')">
            <div class="item_block">
              <button type="submit" class="btn_submit3">幻燈片:${homeSlideShowVO.hss_id}</button>
            </div>
          </a>

          <div class="img_block2">
            <img src="<%=request.getContextPath()%>/back-end/homeSlideShow/hssImgReader.do?id=${homeSlideShowVO.hss_id}">
          </div>

          <table class="table3">
            <tr>
              <td width="70">幻燈片<br>：${homeSlideShowVO.hss_id}</td>
              <td colspan="2">主題：${homeSlideShowVO.hss_text}</td>
              <td colspan="2">發布時間：<br>${homeSlideShowVO.hss_time}</td>
            </tr>
            <tr>
              <td>管理員<br>：${homeSlideShowVO.admin_id}</td>
              <td>上架時間：${homeSlideShowVO.hss_on_shelf}</td>
              <td>下架時間：${homeSlideShowVO.hss_off_shelf}</td>
              <td width="60">
                <form method="post" action="<%=request.getContextPath()%>/back-end/homeSlideShow/homeSlideShow.do" style="margin-bottom: 0px;">
                  <input type="submit" value="修改">
                  <input type="hidden" name="hss_id"  value="${homeSlideShowVO.hss_id}">
                  <input type="hidden" name="action" value="getOne_For_Update">
                </form>
              </td>
              <td width="60">
                <form method="post" action="<%=request.getContextPath()%>/back-end/homeSlideShow/homeSlideShow.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="hss_id"  value="${homeSlideShowVO.hss_id}">
			     <input type="hidden" name="action" value="delete"></form>
              </td>
            </tr>
          </table>
          
          <hr>
        </c:forEach>
        <%@ include file="page2.file" %>


		<div class="item_block">
		  <label></label> 
		  <a href='addHss.jsp'>
		    <button type="button" class="btn_submit2">新增幻燈片</button>
		  </a>
		</div>
		
		
		<%-- 錯誤表列 --%>
  		<c:if test="${not empty errorMsgs}"> 
		<h1 class="title1" style="color:red">請修正以下錯誤:</h1>
		<c:forEach var="message" items="${errorMsgs}">
			<h2 class="title2" style="color:red">${message}</h2>
		</c:forEach>
 	    </c:if>


        <br><br><br><br><br><br><br>

      </main>
    </div>



    <footer class="footer">
      &copy; All Rights Reserved
    </footer>

  </body>
  </html>
