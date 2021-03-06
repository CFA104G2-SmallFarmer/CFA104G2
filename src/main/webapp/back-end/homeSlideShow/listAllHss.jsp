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
        <li><a href="<%=request.getContextPath()%>/front-end/announcement/listAllAnnounce.jsp" class="-on">????????????</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/Product/shop.jsp">????????????</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/farmTravel/listAllFarmTravelByMem.jsp">????????????</a></li>
        <li><a href="<%=request.getContextPath()%>/front-end/project/listAllProjByMem.jsp">????????????</a></li>
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
            <div class="sidelink_a"><h3>???????????????</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/administrator/listAllAdmin.jsp">??????????????????</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp">????????????</a></h4></div>
          <div class="sidelink_a"><h3>????????????</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/fMem/listAllFMem.jsp">??????????????????</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/mem/listAllMem.jsp">??????????????????</a></h4></div>
          <div class="sidelink_a"><h3>??????????????????</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/announcement/listAllAnnounce.jsp">??????????????????</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/homeSlideShow/listAllHss.jsp">?????????????????????</a></h4></div>
          <div class="sidelink_a"><h3>????????????</h3></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp">??????????????????</a></h4></div> 
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp">??????????????????</a></h4></div>
          <div class="sidelink_a"><h4><a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp">??????????????????</a></h4></div> 
          <div>
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/adminLogin/changePwd.jsp" >
     	      <input type="submit" value="????????????">
   		    </FORM>
          </div>
          <br>
          <div>
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/administrator/administrator.do" >
     	      <input type="hidden" name="action" value="logout">
     	      <input type="submit" value="??????">
   		    </FORM>
          </div>        
        </div>
      </div>
    </aside>

      <main class="main">

        <br>

        <h1 class="title2">???????????????</h1>

        <%@ include file="page1.file" %> 
        <c:forEach var="homeSlideShowVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

          <a href="<%=request.getContextPath()%>/back-end/homeSlideShow/hssImgReader.do?id=${homeSlideShowVO.hss_id}" Target="external" 
            onclick="window.open('<%=request.getContextPath()%>/back-end/homeSlideShow/hssImgReader.do?id=${homeSlideShowVO.hss_id}', 'external', 'width=1405,height=535')">
            <div class="item_block">
              <button type="submit" class="btn_submit3">?????????:${homeSlideShowVO.hss_id}</button>
            </div>
          </a>

          <div class="img_block2">
            <img src="<%=request.getContextPath()%>/back-end/homeSlideShow/hssImgReader.do?id=${homeSlideShowVO.hss_id}">
          </div>

          <table class="table3">
            <tr>
              <td width="70">?????????<br>???${homeSlideShowVO.hss_id}</td>
              <td colspan="2">?????????${homeSlideShowVO.hss_text}</td>
              <td colspan="2">???????????????<br>${homeSlideShowVO.hss_time}</td>
            </tr>
            <tr>
              <td>?????????<br>???${homeSlideShowVO.admin_id}</td>
              <td>???????????????${homeSlideShowVO.hss_on_shelf}</td>
              <td>???????????????${homeSlideShowVO.hss_off_shelf}</td>
              <td width="60">
                <form method="post" action="<%=request.getContextPath()%>/back-end/homeSlideShow/homeSlideShow.do" style="margin-bottom: 0px;">
                  <input type="submit" value="??????">
                  <input type="hidden" name="hss_id"  value="${homeSlideShowVO.hss_id}">
                  <input type="hidden" name="action" value="getOne_For_Update">
                </form>
              </td>
              <td width="60">
                <form method="post" action="<%=request.getContextPath()%>/back-end/homeSlideShow/homeSlideShow.do" style="margin-bottom: 0px;">
			     <input type="submit" value="??????">
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
		    <button type="button" class="btn_submit2">???????????????</button>
		  </a>
		</div>
		
		
		<%-- ???????????? --%>
  		<c:if test="${not empty errorMsgs}"> 
		<h1 class="title1" style="color:red">?????????????????????:</h1>
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
