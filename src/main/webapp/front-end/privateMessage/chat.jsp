<%@page import="com.mem.model.MemVO"%>
<%@page import="com.mem.model.MemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 剩版型修改 -->
<html>
<head>
<!-- *****************************以下私訊用***************************** -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/privateMessage/css/friendchat.css" type="text/css" />
<link href="https://deo.shopeemobile.com/shopee/shopee-seller-live-tw/chateasy/styles.21833f8f.6faae855a24d979165aa.css" rel="stylesheet" type="text/css" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
$(document).ready(function() {
	$("#clickpri").click(function() {
		$("#showpri").toggle("slow");
	});
});
</script>
<!-- *****************************以上私訊用***************************** -->
</head>
<body onload="connect();" onunload="disconnect();">
<%-- 	<form action="<%=request.getContextPath() %>/front-end/privateMessage/privateMessage.do" method="POST"> --%>
<%-- 		<input id="userName" name="mem_name"  type="hidden" value="${memVO.mem_name}" />  --%>
<!-- 	</form> -->
<%
// 	request.setAttribute("mem_id", 70001); // 測試用，之後get方法要改成session.get...
%>
<%
	MemVO memVOChat = (MemVO) session.getAttribute("memVO");
	Integer mem_idChat = memVOChat.getMem_id();
	MemService memSvcChat = new MemService();
	memVOChat = memSvcChat.getOneMem(mem_idChat);
	String mem_name = memVOChat.getMem_name();
	pageContext.setAttribute("mem_name", mem_name);
%>
    <a id="clickpri" style="width:48px; height: 48px;cursor: pointer; z-index:999999; position:fixed; right:5%; top:20%;">
	<img src="<%=request.getContextPath() %>/front-end/privateMessage/images/comment.png" style=" font-size: 30px;color: #aaba8b; width:48px; height: 48px;">
<!--     <svg onclick="sendName();" class="svg-inline--fa fa-envelope fa-w-16" style=" font-size: 30px;color: #aaba8b;" aria-hidden="true" data-fa-processed="" data-prefix="far" data-icon="envelope" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path></svg> -->
    </a>


<div>	
	<div id="showpri"
		style=" display:none; position: fixed; right:5%; top:20%; z-index: 99999;">
		<div class="src-pages-ChatWindow-index__container--1qoj1">
			<div class="src-pages-ChatWindow-index__header--USXSl" style="background-color: #b9d4b3;">
				<div class="src-pages-ChatWindow-index__logo-wrapper--1rM8W">
					<i class="_3kEAcT1Mk5 src-pages-ChatWindow-index__logo--3ygfr">
					<img src="<%=request.getContextPath() %>/front-end/privateMessage/images/comment.png" style=" font-size: 30px;color: #aaba8b; width:20px; height: 20px;">
					</i>
				</div>
				<div class="src-pages-ChatWindow-index__operator-wrapper--Wcn9j">
					<div
						class="src-pages-ChatWindow-index__operator-item-wrapper--2_9Si">
						<div class="">
							<i
								class="_3kEAcT1Mk5 src-pages-ChatWindow-index__hide-dialog--1STCP src-pages-ChatWindow-index__operator-item--JM24S"><svg
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
									class="chat-icon">
									<path
										d="M14 1a1 1 0 011 1v12a1 1 0 01-1 1H9v-1h5V2H9V1h5zM2 13v1h1v1H2a1 1 0 01-.993-.883L1 14v-1h1zm6 1v1H4v-1h4zM2 3.999V12H1V3.999h1zm5.854 1.319l2.828 2.828a.5.5 0 010 .708l-2.828 2.828a.5.5 0 11-.708-.707L9.121 9H4.5a.5.5 0 010-1h4.621L7.146 6.025a.5.5 0 11.708-.707zM3 1v1H2v.999H1V2a1 1 0 01.883-.993L2 1h1zm5 0v1H4V1h4z"></path></svg></i>
						</div>
					</div>
					<div
						class="src-pages-ChatWindow-index__operator-item-wrapper--2_9Si">
						<div class="">
							<i
								class="_3kEAcT1Mk5 src-pages-ChatWindow-index__minimize--3dPxE src-pages-ChatWindow-index__operator-item--JM24S"><svg
									viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"
									class="chat-icon">
									<path
										d="M14 1a1 1 0 011 1v12a1 1 0 01-1 1H2a1 1 0 01-1-1V2a1 1 0 011-1h12zm0 1H2v12h12V2zm-2.904 5.268l-2.828 2.828a.5.5 0 01-.707 0L4.732 7.268a.5.5 0 11.707-.707l2.475 2.475L10.39 6.56a.5.5 0 11.707.707z"></path></svg></i>
						</div>
					</div>
				</div>
			</div>
			<div class="src-pages-ChatWindow-index__windows--3KL4n">
				<div class="src-pages-ChatWindow-index__details--3uIPO">
					<div class="src-pages-ChatWindow-index__blank--2pLm1">
					<!-- 對話接入點 -->
					<h3 id="statusOutput" class="statusOutput" style="margin: 0; height: 32px;"></h3>
					<div id="messagesArea" class="panel message-area" style="width:100%; height:350px;"></div>
					<div class="panel" style="width: 100%;">
		<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" style="display:inline-block; width: width:calc(100% - 10px);"/> 
		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" style="display:inline-block;"/> 
	</div>
					
					</div>
				</div>
				<div id="row" class="src-pages-ConversationLists-index__root--3_OYj">
				</div>
			</div>
		</div>
		<div class="ReactModalPortal"></div>
	</div>
</div>	
</body>
<script>
	var MyPoint = "/FriendWS/${mem_name}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${mem_name}';
	var webSocket;

	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			document.getElementById('sendMessage').disabled = false;
// 			document.getElementById('connect').disabled = true;
// 			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("open" === jsonObj.type) {
				refreshFriendList(jsonObj);
			} else if ("history" === jsonObj.type) {
				messagesArea.innerHTML = '';
				var ul = document.createElement('ul');
				ul.setAttribute('class','ulchat');
				ul.id = "area";
				messagesArea.appendChild(ul);
				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					var showMsg = historyData.message;
					var li = document.createElement('li');
					// 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
					historyData.sender_mem === self ? li.className += 'me' : li.className += 'friend';
					li.innerHTML = showMsg;
					ul.appendChild(li);
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("chat" === jsonObj.type) {
				var li = document.createElement('li');
				jsonObj.sender_mem === self ? li.className += 'me' : li.className += 'friend';
				li.innerHTML = jsonObj.message;
				console.log(li);
				document.getElementById("area").appendChild(li);
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("close" === jsonObj.type) {
				refreshFriendList(jsonObj);
			}
			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else if (friend === "") {
			alert("Choose a friend");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender_mem" : self,
				"receiver_mem" : friend,
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	// 有好友上線或離線就更新列表
	function refreshFriendList(jsonObj) {
		var friends = jsonObj.mems;
		var row = document.getElementById("row");
		row.innerHTML = '';
		for (var i = 0; i < friends.length; i++) {
			if (friends[i] === self) { continue; }
			row.innerHTML +='<div id=' + i + ' class="column" name="friendName" value=' + friends[i] + ' ><h2 class="h2Chat">' + friends[i] + '</h2></div>';
		}
		addListener();
	}
	// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
	function addListener() {
		var container = document.getElementById("row");
		container.addEventListener("click", function(e) {
			var friend = e.srcElement.textContent;
			updateFriendName(friend);
			var jsonObj = {
					"type" : "history",
					"sender_mem" : self,
					"receiver_mem" : friend,
					"message" : "" //是否這邊有問題
				};
			webSocket.send(JSON.stringify(jsonObj));
		});
	}
	
	function disconnect() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
	
</script>
</html>