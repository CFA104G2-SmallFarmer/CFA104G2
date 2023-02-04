<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.model.*"%>
<%@ page import="com.projPic.model.*"%>

<%
ProjectVO projectVO = (ProjectVO) request.getAttribute("projectVO");
%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />



<%--   <script src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/465239610292033" async=""></script> --%>
<%--   <script src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/sdk.js" async="" crossorigin="anonymous"></script> --%>
<%--   <script async="" src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/fbevents.js"></script> --%>
<%--   <script id="facebook-jssdk" src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/sdk(1).js"></script> --%>
<%--   <script async="" src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/analytics.js"></script> --%>
<!--   <!-- 這段jQuery一定要有 -->

<%--   <script src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/jquery-3.6.0.min.js"></script> --%>
<!--   <!-- 這段jQuery一定要有 -->

<link rel="stylesheet" media="all"
   href="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/zeczec-e9e0ba9825d4b970fff398209948a791b4d18185e43b929ef4ffa0e7e5346248.css"> 

<!--   <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/util.js"></script> -->
<!--   <script src="chrome-extension://jhffgcfmcckgmioipfnmbannkpncfipo/pagejs.js"></script> -->

<!-- </head> -->
<body class="intent-mouse">
	<header class="relative z-2 bb pv2 ph3 ph0-l b--near-white">
		<div class="cf container">
			<div class="f6 mv2 flex items-center justify-between">
				<a clsas="dib order-0" href="#">
					<h1 class="gray text-mono hover-logo ma0">
						<!-- <img style="display:inline-box" src="/logo/透明LOGO有字有框.png" alt="ok" width=13% height=10%> -->
						<div class="dib logo-safari-fix">

							<!-- <img style="display:inline-box" src="/logo/透明LOGO有字有框.png" alt="ok" width=13% height=10%> -->
						</div>
						<svg class="v-mid ml2" style="height: 20px; width: 0;"
							viewBox="0 0 64.08 28.95" xmlns="http://www.w3.org/2000/svg">
              <title>我家門前有塊地</title>
              <!-- <path
                d="M10.44 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41h-1.67a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.34a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .43.54zm14.04 1.73a.42.42 0 0 0-.42-.41H11.33a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.47 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.44-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42H2.74a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64z">
              </path> -->
              <!-- <path
                d="M16.307 23.2l.808 1.057-5.972 4.57a.59.59 0 0 1-.827-.11l-.456-.596a.59.59 0 0 1 .11-.824l5.504-4.21a.59.59 0 0 1 .827.11zM49.01 11.74h14.2a.6.6 0 0 0 .4-.75.61.61 0 0 0-.4-.44h-5.48a.42.42 0 0 1-.42-.42v-1.6a.42.42 0 0 1 .42-.42h5a.58.58 0 0 0 .42-.64.59.59 0 0 0-.42-.52h-5a.42.42 0 0 1-.42-.42V5.16a.42.42 0 0 1 .42-.42h5.72a.68.68 0 0 0 .42-.69.57.57 0 0 0-.42-.52h-5.72a.42.42 0 0 1-.42-.42V.47a.42.42 0 0 0-.34-.41H55.3a.42.42 0 0 0-.5.43l.1 2.61a.42.42 0 0 1-.42.43h-5.32a.56.56 0 0 0-.42.55.69.69 0 0 0 .42.67h5.33a.42.42 0 0 1 .42.42v1.36a.42.42 0 0 1-.42.42h-4.74a.58.58 0 0 0-.43.57v.05a.59.59 0 0 0 .42.59h4.75a.42.42 0 0 1 .42.42v1.61a.42.42 0 0 1-.42.42h-5.47a.58.58 0 0 0-.42.59.63.63 0 0 0 .41.54zm14.04 1.73a.42.42 0 0 0-.42-.41H49.9a.7.7 0 0 0-.74.63v9.9a.75.75 0 0 0 .77.75l1.65-.05h10.81a.75.75 0 0 0 .76-.77c0-1.19-.08-3.67-.08-6.7V14.5zm-11.48 1.29a.42.42 0 0 1 .42-.42h8a.75.75 0 0 1 .75.75v7a.75.75 0 0 1-.75.75h-8a.42.42 0 0 1-.42-.42m-5.41-1.53a.42.42 0 0 0 .39-.43c0-1.37-.14-13.17-.14-13.17a.42.42 0 0 0-.42-.42h-7a.42.42 0 0 0-.42.43v13.16a.42.42 0 0 0 .47.42h7.12zm-2-2.41a.42.42 0 0 1-.42.42h-2.41a.42.42 0 0 1-.42-.42V8.84a.42.42 0 0 1 .42-.42h2.41a.42.42 0 0 1 .42.42v9.64zm-25.984 5.764l.754-.985a.59.59 0 0 1 .827-.11l5.504 4.21a.59.59 0 0 1 .11.825l-.453.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.02-.126z">
              </path>
              <path
                d="M54.943 23.217l.808 1.056-5.97 4.57a.59.59 0 0 1-.826-.11l-.45-.588a.59.59 0 0 1 .11-.827l5.504-4.21a.59.59 0 0 1 .827.11zm1.857 1.037l.753-.985a.59.59 0 0 1 .828-.11l5.506 4.21a.59.59 0 0 1 .11.825l-.455.596a.59.59 0 0 1-.827.11l-5.9-4.514a.09.09 0 0 1-.012-.134zm-5.87-7.534l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.34 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.37.28zm-38.53 0l.11.63a.3.3 0 0 0 .28.29l3.32.16a.3.3 0 0 1 .27.36l-.39 1.23a.3.3 0 0 0 .27.36l6.32.28a.3.3 0 0 0 .31-.3v-.67a.3.3 0 0 0-.29-.29h-3.77a.3.3 0 0 1-.28-.36l.32-1.32a.3.3 0 0 0-.28-.36l-5.87-.29a.3.3 0 0 0-.32.28z">
              </path> -->
            </svg>
					</h1>
				</a>
				<div
					class="mt0-ns mt3 pt2 ph2 nb1 nl3 nr3 tc tl-ns pa0-ns mh0-ns items-center db-ns bt bn-ns b--near-white flex-auto order-last order-1-ns w-100 w-auto-ns inline-flex">
					<img style="display: inline-box"
						src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/透明LOGO有字有框.png"
						alt="ok" width="140px" height="100%">
					<div class="divider dib-ns dn">&nbsp;</div>
					<a class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="#">探索</a> <a
						class="mr3-ns hover-fg-blue dark-gray flex-auto flex-none-ns"
						href="#">提案</a>
				</div>
				<div class="tr order-2">
					<a aria-label="站內訊息"
						class="near-black dib gray pa2 mr3 v-mid tooltip tooltip-b"
						href="#"> <i
						class="material-icons f5 v-mid"> mail </i>
					</a>
					<div class="js-activatable relative dib" data-userid="2046860">
						<button aria-label="個人選單"
							class="js-activatable-trigger button-text" type="button">
							<div
								class="button button-s button-avatar round w2 h2 b--light-gray">
								<img class="w-100 h-100"
									src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/fallback.jpg"
									alt="Fallback">
							</div>
							<i class="material-icons f4 v-mid">arrow_drop_down</i>
						</button>
						<div class="dropdown r f6 tc w4">
							<a class="near-black db ph3 pv2 hover-blue db dn-l"
								href="#">探索</a> <a
								class="near-black db ph3 pv2 hover-blue db dn-l"
								href="#">提案</a>
							<div class="bt db dn-l mv2 b--light-gray"></div>
							<a class="near-black db ph3 pv2 hover-blue bb b--light-gray"
								href="#"> 個人頁面 </a> <a
								class="near-black db ph3 pv2 hover-blue"
								href="#"> 贊助記錄 </a> <a
								class="near-black db ph3 pv2 hover-blue"
								href="#"> 追蹤計畫 </a>

							<form class="db ma3" id="edit_user_2046860"
								action="#"
								accept-charset="UTF-8" method="post">
								<input name="utf8" type="hidden" value="✓"> <input
									type="hidden" name="_method" value="delete"> <input
									type="hidden" name="authenticity_token"
									value="Y3OBUu6ZEkGR7POSS7czsA3MMl85mzy1804Wl+Mo7W/XhsFWyxq3Yf1odH629jxts2nc1mtUam2+jCOYCehMVQ==">
								<button name="button" type="submit"
									class="button red button-s w-100">登出</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container"></div>
	<div class="bb b--near-white">
		<div class="container">
			<ul class="list pa0 cf mb0 mh3 mh0-l mv0 nowrap overflow-auto">
				<li class="dib"><a
					class="pv3 mr4 dib grow hover-black dark-gray"
					href="https://www.zeczec.com/account"> <i class="icon-ok"></i>
						認養訂單記錄
				</a></li>
				<li class="dib"><a class="pv3 mr4 dib b black bb b--gray"
					href="https://www.zeczec.com/users/following"> <i
						class="icon-forward"></i> 認養收藏紀錄
				</a></li>
				<!-- <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/users/projects">
            <i class="icon-lightbulb"></i>
            提案記錄(要刪)
          </a>
        </li> -->
				<!-- <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/settings">
            <i class="icon-user"></i>
            個人設定(要刪)
          </a>
        </li> -->
				<!-- <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/memberships">
            <i class="icon-user"></i>
            團隊設定
          </a>
        </li> -->
				<!-- <li class="dib">
          <a class="pv3 mr4 dib grow hover-black dark-gray" href="https://www.zeczec.com/users/edit">
            <i class="icon-lock"></i>
            修改密碼
          </a>
        </li> -->
			</ul>
		</div>
	</div>
	<div class="container"></div>

	<form action="<%=request.getContextPath()%>/projPic/projPic.do"
		enctype="multipart/form-data" method="post" name="form2">

		<!--   <input type="hidden" name="action" value="insert">  -->

		<input class="w-100" placeholder="認養專案編號" type="text"
			value="${projectVO.proj_id}" name="proj_id">


		<div class="container ph3 ph0-l pv3 cf">
			<h2 style="display: inline-block;" class="flex mt0">上傳文案圖檔(至多8張，每張檔案大小不得超過16MB)</h2>


			<input style="float: right; display: inline;" type="submit"
				name="commit" value="上傳" class="button green b--green b mb3">


			<%--    ${projectVO.proj_id} --%>

		</div>
		<div class="container pb5">
			<div class="flex gutter3-l">

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img1" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic1">顯示圖片</label> <input id="upPic1"
							onchange="pic1_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic1">
					</div>

				</div>
				<!-- 這裡是結束 -->

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img2" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic2">顯示圖片</label> <input id="upPic2"
							onchange="pic2_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic2">
					</div>

				</div>
				<!-- 這裡是結束 -->

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img3" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic3">顯示圖片</label> <input id="upPic3"
							onchange="pic3_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic3">
					</div>

				</div>
				<!-- 這裡是結束 -->

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img4" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic4">顯示圖片</label> <input id="upPic4"
							onchange="pic4_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic4">
					</div>

				</div>
				<!-- 這裡是結束 -->


			</div>



			<button type="button" onclick='$("#div_id").show()'>繼續增加</button>

			<!-- <button>繼續增加</button> -->

			<div id="div_id" class="flex gutter3-l add">

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img5" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic5">顯示圖片</label> <input id="upPic5"
							onchange="pic5_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic5">
					</div>

				</div>
				<!-- 這裡是結束 -->

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img6" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic6">顯示圖片</label> <input id="upPic6"
							onchange="pic6_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic6">
					</div>

				</div>
				<!-- 這裡是結束 -->

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img7" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic7">顯示圖片</label> <input id="upPic7"
							onchange="pic7_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic7">
					</div>

				</div>
				<!-- 這裡是結束 -->

				<!-- 這裡是開始 -->
				<div class="w-25-l ph3 pv3 w-50-ns w-100">
					<div class="cf">
						<div class="for_all_img">
							<img id="img8" class="w-100 mb3"
								src="<%=request.getContextPath()%>/front-end/projPic/addProj2_files/farmforUploadPic.png"
								alt="">
						</div>
						<label class="b" for="proj_pic8">顯示圖片</label> <input id="upPic8"
							onchange="pic8_change()" class="w-100 border-box mv3"
							accept="image/*" type="file" name="proj_pic8">
					</div>

				</div>
				<!-- 這裡是結束 -->


			</div>

		</div>


	</form>

	<!--   <script> -->
	// $("#div_id").hide();
	<!--   </script> -->



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

</body>

</html>