package com.projOrder.model;

import java.sql.Date;

public class ProjOrderVO {
	
	private Integer order_ID;
    private Integer mem_ID;
    private Integer perk_ID;
    private Date  order_time;
    private String order_addr;
    private Integer  order_state;
    private Date  order_cancel_time;
    
	public Integer getOrder_ID() {
		return order_ID;
	}
	public void setOrder_ID(Integer order_ID) {
		this.order_ID = order_ID;
	}
	public Integer getMem_ID() {
		return mem_ID;
	}
	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
	}
	public Integer getPerk_ID() {
		return perk_ID;
	}
	public void setPerk_ID(Integer perk_ID) {
		this.perk_ID = perk_ID;
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
