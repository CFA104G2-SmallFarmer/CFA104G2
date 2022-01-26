package com.projOrder.model;

import java.sql.Date;

public class ProjOrderVO {
	
//	TODO 新增欄位
//	ORDER_ZIPCODE 
//	ORDER_RECEIVER
//	ORDER_TEL
//	ORDER_PAY
//	ORDER_SHIP_TIME
//	ORDER_COMPLETION_TIME
	
	private Integer order_id;
    private Integer mem_id;
    private Integer perk_id;
    private Date  order_time;
    private String order_addr;
    private Integer  order_state;
    private Date  order_cancel_time;
    
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getPerk_id() {
		return perk_id;
	}
	public void setPerk_id(Integer perk_id) {
		this.perk_id = perk_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public String getOrder_addr() {
		return order_addr;
	}
	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}
	public Integer getOrder_state() {
		return order_state;
	}
	public void setOrder_state(Integer order_state) {
		this.order_state = order_state;
	}
	public Date getOrder_cancel_time() {
		return order_cancel_time;
	}
	public void setOrder_cancel_time(Date order_cancel_time) {
		this.order_cancel_time = order_cancel_time;
	}

}
