<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 剩版型修改 -->
<html>
<head>
<!-- 以下私訊用 -->
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
<!-- 以上私訊用 -->
</head>
<body onload="connect();" onunload="disconnect();">
<% %>
<%-- 	<form action="<%=request.getContextPath() %>/front-end/privateMessage/privateMessage.do" method="POST"> --%>
<%-- 		<input id="userName" name="mem_name"  type="hidden" value="${memVO.mem_name}" />  --%>
<!-- 	</form> -->
<%
request.setAttribute("mem_name", "王小名"); // 測試用，之後get方法要改成session.get...
%>
    <a id="clickpri" style="width:48px; height: 48px;cursor: pointer; z-index:999999; position:fixed; right:5%; top:85%;">
	<img src="<%=request.getContextPath() %>/front-end/privateMessage/images/comment.png" style=" font-size: 30px;color: #aaba8b; width:48px; height: 48px;">
<!--     <svg onclick="sendName();" class="svg-inline--fa fa-envelope fa-w-16" style=" font-size: 30px;color: #aaba8b;" aria-hidden="true" data-fa-processed="" data-prefix="far" data-icon="envelope" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path></svg> -->
    </a>


<div>	
	<div id="showpri"
		style=" display:none; position: fixed; right:5%; top:35%; z-index: 99999;">
		<div class="src-pages-ChatWindow-index__container--1qoj1">
			<div class="src-pages-ChatWindow-index__header--USXSl" style="background-color: #b9d4b3;">
				<div class="src-pages-ChatWindow-index__logo-wrapper--1rM8W">
					<i class="_3kEAcT1Mk5 src-pages-ChatWindow-index__logo--3ygfr"><svg
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 44 22"
							class="chat-icon">
							<path
								d="M4.236 3.314h.016l.052.005h3.29l.05-.005.068.005h1.03c.365 0 .664.3.664.665 0 .332-.247.609-.566.657l-.098.007h-.408v8.837l1.04-.252.353 1.28-1.393.338v4.66H6.972v-4.33l-3.961.959a.666.666 0 01-.817-.464.667.667 0 01.371-.784l.092-.033.907-.22-.001-.012v-9.98h-.408a.666.666 0 01-.664-.663c0-.333.247-.61.567-.658l.097-.007h1.03l.05-.005zm20.7 0h.016l.05.005h3.291l.067-.005.052.005h1.03c.365 0 .664.3.664.665 0 .332-.248.609-.567.657l-.098.007h-.407v8.837l1.039-.252.354 1.28-1.393.338v4.66H27.67v-4.33l-3.96.959a.666.666 0 01-.818-.464.667.667 0 01.371-.784l.093-.033.906-.22-.001-.012v-9.98h-.407a.666.666 0 01-.665-.663c0-.333.247-.61.567-.658l.098-.007h1.03l.05-.005zm-5.142 0c.685 0 1.254.524 1.322 1.19l.007.135v8.27a2.662 2.662 0 01-2.474 2.643l-.185.007h-.231v-1.325h.231l.136-.007a1.333 1.333 0 001.187-1.183l.007-.135V5.301a.656.656 0 00-.566-.655l-.1-.007h-1.706v14.866h-1.33V4.109c0-.404.306-.74.698-.789l.1-.006h2.904zm20.699 0c.686 0 1.254.524 1.323 1.19l.007.135v8.27a2.662 2.662 0 01-2.475 2.643l-.184.007h-.232v-1.325h.232l.135-.007a1.333 1.333 0 001.187-1.183l.007-.135V5.302a.656.656 0 00-.565-.656l-.1-.007h-1.707v14.866h-1.33V4.109c0-.404.306-.74.699-.789l.1-.006h2.903zM14.566 2.48c.365 0 .664.3.664.664 0 .333-.247.61-.566.657l-.098.008-3.035.69v8.15l2.348-.575.014-.438c.005-.22.007-.392.007-.485V5.994a.665.665 0 011.323-.099l.007.1v5.429c-.04 2.16-.385 3.988-1.05 5.3-.608 1.125-1.657 1.95-2.994 2.605l-.29.138-.678-1.1c1.356-.65 2.313-1.51 2.871-2.57a8.875 8.875 0 00.518-1.612l.084-.38.04-.327-2.686.659a.666.666 0 01-.803-.487l-.015-.097-.015-9.57c0-.331.247-.609.567-.657l.098-.007 3.69-.839zm20.7 0c.365 0 .664.3.664.664 0 .333-.247.61-.567.657l-.098.008-3.035.69.001 8.15 2.347-.575.012-.348c.006-.216.008-.394.01-.51V5.994a.665.665 0 011.322-.099l.008.1v5.429c-.04 2.16-.386 3.988-1.05 5.3-.609 1.125-1.657 1.95-2.994 2.605l-.291.138-.678-1.1c1.356-.65 2.313-1.51 2.872-2.57a8.875 8.875 0 00.517-1.612l.084-.38.04-.327-2.686.659a.666.666 0 01-.803-.487l-.015-.097-.014-9.57c0-.331.247-.609.566-.657l.098-.007 3.69-.839zM6.971 11.569H4.926v2.741l2.046-.495v-2.246zm20.699 0h-2.046v2.741l2.046-.495v-2.246zm-20.7-3.46H4.927v2.131h2.046V8.108zm20.7 0h-2.046v2.131h2.046V8.108zM6.97 4.647H4.927V6.78h2.046V4.648zm20.7 0h-2.046V6.78h2.046V4.648z"></path></svg></i>
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
			row.innerHTML +='<div id=' + i + ' class="column" name="friendName" value=' + friends[i] + ' ><h2>' + friends[i] + '</h2></div>';
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