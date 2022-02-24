<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="./css_h&f/contact.css">
</head>
<body>
  <header class="header">
    <a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp" class="logo_img" target="_top"><img src="./images/logo_img2.png"></a>
    <nav class="nav">
      <ul class="link_list">
        <li>
            <div class="social_block">
              後台管理員
              <ul class="social_list">
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/administrator/listAllAdmin.jsp" target="_top">帳號資料管理</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/administrator/listOneAdmin_s.jsp" target="_top">個人資料</a>
                </li>
                
              </ul>
            </div>
          </li>
          <li>
            <div class="social_block">
              會員管理
              <ul class="social_list">
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/fMem/listAllFMem.jsp" target="_top">小農會員管理</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/mem/listAllMem.jsp" target="_top">一般會員管理</a>
                </li>
                
              </ul>
            </div>
          </li>
        <li>
            <div class="social_block">
              前台網頁管理
              <ul class="social_list">
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/announcement/listAllAnnounce.jsp" target="_top">公告資訊管理</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/homeSlideShow/listAllHss.jsp" target="_top">首頁幻燈片管理</a>
                </li>
                
              </ul>
            </div>
          </li>
          <li>
            <div class="social_block">
              檢舉管理
              <ul class="social_list">
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp" target="_top">商品檢舉管理</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp" target="_top">旅遊檢舉管理</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/back-end/back-end_H&F/report.jsp" target="_top">認養檢舉管理</a>
                </li>
                
              </ul>
            </div>
          </li>
      </ul>
    </nav>
  </header>
  <div class="banner_bg"></div>
</body>

</html>