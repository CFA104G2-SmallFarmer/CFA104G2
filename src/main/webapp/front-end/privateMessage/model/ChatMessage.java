package com.privateMessage.model;

public class ChatMessage {
	private String type;
	private String sender_mem;
	private String receiver_mem;
	private String message;

	public ChatMessage(String type, String sender_mem, String receiver_mem, String message) {
		this.type = type;
		this.sender_mem = sender_mem;
		this.receiver_mem = receiver_mem;
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSender_mem() {
		return sender_mem;
	}

	public void setSender_mem(String sender_mem) {
		this.sender_mem = sender_mem;
	}

	public String getReceiver_mem() {
		return receiver_mem;
	}

	public void setReceiver_mem(String receiver_mem) {
		this.receiver_mem = receiver_mem;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
