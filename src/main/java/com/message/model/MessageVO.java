package com.message.model;

import java.io.Serializable;
import java.sql.Date;

public class MessageVO implements Serializable {
	
	private Integer msg_no;
	private Integer mem_id;
	private Integer mem_id_send;
	private Date msg_time;
	private String msg;
	private Integer read_state;
	
	public Integer getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(Integer msg_no) {
		this.msg_no = msg_no;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getMem_id_send() {
		return mem_id_send;
	}
	public void setMem_id_send(Integer mem_id_send) {
		this.mem_id_send = mem_id_send;
	}
	public Date getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Date msg_time) {
		this.msg_time = msg_time;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getRead_state() {
		return read_state;
	}
	public void setRead_state(Integer read_state) {
		this.read_state = read_state;
	}
	@Override
	public String toString() {
		return "MessageVO [msg_no=" + msg_no + ", mem_id=" + mem_id + ", mem_id_send=" + mem_id_send + ", msg_time="
				+ msg_time + ", msg=" + msg + ", read_state=" + read_state + "]";
	}
	
	
	

}
