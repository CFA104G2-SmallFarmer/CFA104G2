<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.model.*"%>

<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <!-- <script src="./上傳多張圖片頁面_files/465239610292033" async=""></script>
  <script src="./上傳多張圖片頁面_files/sdk.js" async="" crossorigin="anonymous"></script>
  <script async="" src="./上傳多張圖片頁面_files/fbevents.js"></script>
  <script id="facebook-jssdk" src="./上傳多張圖片頁面_files/sdk(1).js"></script>
  <script async="" src="./上傳多張圖片頁面_files/analytics.js"></script> -->
  <!-- 這段jQuery一定要有 -->
  <script src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/jquery-3.6.0.min.js"></script>
  <!-- 這段jQuery一定要有 -->

  <link rel="stylesheet" media="all"
    href="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css">

</head>

<body class="intent-mouse">
  <header>
         <jsp:include page="/header/header_for_Proj_Fmem.jsp" />
</header>
  
  <div class="container"></div>
  <div class="bb b--near-white">
    <!-- <div class="container">
      <ul class="list pa0 cf mb0 mh3 mh0-l mv0 nowrap overflow-auto">
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/account">
            <i class="icon-ok"></i>
            認養訂單記錄
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib b black bb b--gray" href="https://www.zeczec.com/users/following">
            <i class="icon-forward"></i>
            認養收藏紀錄
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/users/projects">
            <i class="icon-lightbulb"></i>
            提案記錄(要刪)
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/settings">
            <i class="icon-user"></i>
            個人設定(要刪)
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/memberships">
            <i class="icon-user"></i>
            團隊設定
          </a>
        </li>
        <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/users/edit">
            <i class="icon-lock"></i>
            修改密碼
          </a>
        </li>
      </ul>
    </div> -->
  </div>
  <div class="container">

<!--   FORM 在這裡 -->

    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/projPic/projPic.do" name="form1" enctype="multipart/form-data">
      <div class="container ph3 ph0-l pv3 cf">
        <h2 style="display: inline-block;" class="flex mt0">上傳認養專案內容圖片</h2>


		<input type="hidden" name="proj_id"  value="<%=projectVO.getProj_id()%>">	
        <input type="hidden" name="action" value="insert">
        <input style="float: right;display: inline;" type="submit" value="上傳" class="button green b--green b mb3">

      </div>
      <div class="container pb5">

        <div class="flex gutter3-l">

          <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img1" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b">顯示圖片</label>
              <input id="upPic1" onchange="pic1_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="proj_pic">
            <script>
                var file1;
                var fileReader1;

                function pic1_change() {
                  file1 = document.getElementById('upPic1').files[0];
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

          </div>
          <!-- 這裡是結束 -->

           <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img2" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b" for="2">顯示圖片</label>
              <input id="upPic2" onchange="pic2_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="2">
              <script>
                var file2;
                var fileReader2;

                function pic2_change() {
                  file2 = document.getElementById('upPic2').files[0];
                  if (file2) {
                    fileReader2 = new FileReader();
                    fileReader2.onload = openfile2;
                    readFileContent2();
                  }
                }

                function openfile2(event) {
                  document.getElementById('img2').src = event.target.result;
                }

                function readFileContent2() {
                  fileReader2.readAsDataURL(file2);
                }
              </script>
            </div>

          </div>
          <!-- 這裡是結束 -->

          <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img3" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b" for="2">顯示圖片</label>
              <input id="upPic3" onchange="pic3_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="2">
              <script>
                var file3;
                var fileReader3;

                function pic3_change() {
                  file3 = document.getElementById('upPic3').files[0];
                  if (file3) {
                    fileReader3 = new FileReader();
                    fileReader3.onload = openfile3;
                    readFileContent3();
                  }
                }

                function openfile3(event) {
                  document.getElementById('img3').src = event.target.result;
                }

                function readFileContent3() {
                  fileReader3.readAsDataURL(file3);
                }
              </script>
            </div>

          </div>
          <!-- 這裡是結束 -->

          <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img4" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b" for="2">顯示圖片</label>
              <input id="upPic4" onchange="pic4_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="2">
              <script>
                var file4;
                var fileReader4;

                function pic4_change() {
                  file4 = document.getElementById('upPic4').files[0];
                  if (file4) {
                    fileReader4 = new FileReader();
                    fileReader4.onload = openfile4;
                    readFileContent4();
                  }
                }

                function openfile4(event) {
                  document.getElementById('img4').src = event.target.result;
                }

                function readFileContent4() {
                  fileReader4.readAsDataURL(file4);
                }
              </script>
            </div>

          </div>
          <!-- 這裡是結束 -->


        </div>




        <button  onclick='$("#div_id").show()'  type="button">繼續增加</button>
  

        <div id="div_id" class="flex gutter3-l add">

          <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img5" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b" for="2">顯示圖片</label>
              <input id="upPic5" onchange="pic5_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="2">
              <script>
                var file5;
                var fileReader5;

                function pic5_change() {
                  file5 = document.getElementById('upPic5').files[0];
                  if (file5) {
                    fileReader5 = new FileReader();
                    fileReader5.onload = openfile5;
                    readFileContent5();
                  }
                }

                function openfile5(event) {
                  document.getElementById('img5').src = event.target.result;
                }

                function readFileContent5() {
                  fileReader5.readAsDataURL(file5);
                }
              </script>
            </div>

          </div>
         <!--  這裡是結束 -->

          <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img6" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b" for="2">顯示圖片</label>
              <input id="upPic6" onchange="pic6_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="2">
              <script>
                var file6;
                var fileReader6;

                function pic6_change() {
                  file6 = document.getElementById('upPic6').files[0];
                  if (file6) {
                    fileReader6 = new FileReader();
                    fileReader6.onload = openfile6;
                    readFileContent6();
                  }
                }

                function openfile6(event) {
                  document.getElementById('img6').src = event.target.result;
                }

                function readFileContent6() {
                  fileReader6.readAsDataURL(file6);
                }
              </script>
            </div>

          </div>
          <!-- 這裡是結束 -->

          <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img7" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b" for="2">顯示圖片</label>
              <input id="upPic7" onchange="pic7_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="2">
              <script>
                var file7;
                var fileReader7;

                function pic7_change() {
                  file7 = document.getElementById('upPic7').files[0];
                  if (file7) {
                    fileReader7 = new FileReader();
                    fileReader7.onload = openfile7;
                    readFileContent7();
                  }
                }

                function openfile7(event) {
                  document.getElementById('img7').src = event.target.result;
                }

                function readFileContent7() {
                  fileReader7.readAsDataURL(file7);
                }
              </script>
            </div>

          </div>
          <!-- 這裡是結束 -->

          <!-- 這裡是開始 -->
          <div class="w-25-l ph3 pv3 w-50-ns w-100">
            <div class="cf">
              <div class="for_all_img">
                <img id="img8" class="w-100 mb3" src="<%=request.getContextPath()%>/front-end/projPic/addProjPic_css/farmforUploadPic.png" alt="">
              </div>
              <label class="b" for="2">顯示圖片</label>
              <input id="upPic8" onchange="pic8_change()" class="w-100 border-box mv3" accept="image/*" type="file"
                name="2">
              <script>
                var file8;
                var fileReader8;

                function pic8_change() {
                  file8 = document.getElementById('upPic8').files[0];
                  if (file8) {
                    fileReader8 = new FileReader();
                    fileReader8.onload = openfile8;
                    readFileContent8();
                  }
                }

                function openfile8(event) {
                  document.getElementById('img8').src = event.target.result;
                }

                function readFileContent8() {
                  fileReader8.readAsDataURL(file8);
                }
              </script>
            </div>

          </div>
          <!-- 這裡是結束  -->


        </div>
    </FORM>
  </div>


  <script>
    $("#div_id").hide();
  </script>




  <script type="text/javascript">
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
      (function () {
        function refreshCSS() {
          var sheets = [].slice.call(document.getElementsByTagName("link"));
          var head = document.getElementsByTagName("head")[0];
          for (var i = 0; i < sheets.length; ++i) {
            var elem = sheets[i];
            var parent = elem.parentElement || head;
            parent.removeChild(elem);
            var rel = elem.rel;
            if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
              var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
              elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
            }
            parent.appendChild(elem);
          }
        }
        var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
        var address = protocol + window.location.host + window.location.pathname + '/ws';
        var socket = new WebSocket(address);
        socket.onmessage = function (msg) {
          if (msg.data == 'reload') window.location.reload();
          else if (msg.data == 'refreshcss') refreshCSS();
        };
        if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
          console.log('Live reload enabled.');
          sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
        }
      })();
    } else {
      console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
  </script>
  </div>
  <div id="draggable-live-region" aria-relevant="additions" aria-atomic="true" aria-live="assertive" role="log"
    style="position: fixed; width: 1px; height: 1px; top: -1px; overflow: hidden;"></div>
  <script type="text/javascript">
    document.oncontextmenu = null;
    document.onselectstart = null;
    document.ondragstart = null;
    document.onmousedown = null;
    document.body.oncontextmenu = null;
    document.body.onselectstart = null;
    document.body.ondragstart = null;
    document.body.onmousedown = null;
    document.body.oncut = null;
    document.body.oncopy = null;
    document.body.onpaste = null;
  </script>
  
  <footer>
        <jsp:include page="/footer/footer_for_Proj_Fmem.jsp" />
</footer>
  
</body>

</html>