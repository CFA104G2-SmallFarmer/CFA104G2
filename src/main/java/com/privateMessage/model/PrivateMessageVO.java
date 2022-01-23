package com.privateMessage.model;

import java.sql.Timestamp;

public class PrivateMessageVO {
	private Integer p_msg_id;
	private Integer mem_id;
	private Integer f_mem_id;
	private Integer p_msg_direct;
	private Timestamp p_msg_time;
	private String p_msg_context;
	private byte[] p_msg_img;
	
	public Integer getP_msg_id() {
		return p_msg_id;
	}
	public void setP_msg_id(Integer p_msg_id) {
		this.p_msg_id = p_msg_id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getF_mem_id() {
		return f_mem_id;
	}
	public void setF_mem_id(Integer f_mem_id) {
		this.f_mem_id = f_mem_id;
	}
	public Integer getP_msg_direct() {
		return p_msg_direct;
	}
	public void setP_msg_direct(Integer p_msg_direct) {
		this.p_msg_direct = p_msg_direct;
	}
	public Timestamp getP_msg_time() {
		return p_msg_time;
	}
	public void setP_msg_time(Timestamp p_msg_time) {
		this.p_msg_time = p_msg_time;
	}
	public String getP_msg_context() {
		return p_msg_context;
	}
	public void setP_msg_context(String p_msg_context) {
		this.p_msg_context = p_msg_context;
	}
	public byte[] getP_msg_img() {
		return p_msg_img;
	}
	public void setP_msg_img(byte[] p_msg_img) {
		this.p_msg_img = p_msg_img;
	} 
	
	
}
