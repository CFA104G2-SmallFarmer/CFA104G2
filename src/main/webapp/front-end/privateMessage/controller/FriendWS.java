package com.privateMessage.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.privateMessage.jedis.JedisHandleMessage;
import com.privateMessage.model.ChatMessage;
import com.privateMessage.model.State;

@ServerEndpoint("/FriendWS/{mem_name}")
public class FriendWS {
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>(); //Concurrent(並行)
	Gson gson = new Gson();

	@OnOpen
	public void onOpen(@PathParam("mem_name") String mem_name, Session memSession) throws IOException {
		/* save the new user in the map */
		sessionsMap.put(mem_name, memSession);
		/* Sends all the connected users to the new user */
		Set<String> memNames = sessionsMap.keySet();
		State stateMessage = new State("open", mem_name, memNames);
		String stateMessageJson = gson.toJson(stateMessage);
		Collection<Session> sessions = sessionsMap.values();
		for (Session session : sessions) {
			if (session.isOpen()) {
				session.getAsyncRemote().sendText(stateMessageJson);
			}
		}

		String text = String.format("Session ID = %s, connected; mem_name = %s%nmems: %s", memSession.getId(),
				mem_name, memNames);
		System.out.println(text);
	}

	@OnMessage
	public void onMessage(Session memSession, String message) {
		ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
		String sender_mem = chatMessage.getSender_mem();
		String receiver_mem = chatMessage.getReceiver_mem();
		
		if ("history".equals(chatMessage.getType())) {
			List<String> historyData = JedisHandleMessage.getHistoryMsg(sender_mem, receiver_mem);
			String historyMsg = gson.toJson(historyData);
			ChatMessage cmHistory = new ChatMessage("history", sender_mem, receiver_mem, historyMsg);
			if (memSession != null && memSession.isOpen()) {
				memSession.getAsyncRemote().sendText(gson.toJson(cmHistory));
				System.out.println("history = " + gson.toJson(cmHistory));
				return;
			}
		}
		
		System.out.println("MSG = " + message);
		
		Session receiverSession = sessionsMap.get(receiver_mem);
		if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(message);
			memSession.getAsyncRemote().sendText(message);
			JedisHandleMessage.saveChatMessage(sender_mem, receiver_mem, message);
		}
		System.out.println("Message received: " + message);
	}

//	@OnError
//	public void onError(Session memSession, Throwable e) {
//		System.out.println("Error: " + e.toString());
//	}

	@OnClose
	public void onClose(Session memSession, CloseReason reason) {
		String memNameClose = null;
		Set<String> memNames = sessionsMap.keySet();
		for (String memName : memNames) {
			if (sessionsMap.get(memName).equals(memSession)) {
				memNameClose = memName;
				sessionsMap.remove(memName);
				break;
			}
		}

		if (memNameClose != null) {
			State stateMessage = new State("close", memNameClose, memNames);
			String stateMessageJson = gson.toJson(stateMessage);
			Collection<Session> sessions = sessionsMap.values();
			for (Session session : sessions) {
				session.getAsyncRemote().sendText(stateMessageJson);
			}
		}

		String text = String.format("session ID = %s, disconnected; close code = %d%nmems: %s", memSession.getId(),
				reason.getCloseCode().getCode(), memNames);
		System.out.println(text);
	}
}
