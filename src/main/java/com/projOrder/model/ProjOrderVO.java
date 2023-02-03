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
//ORDER_CANCEL_REASON
	
	private Integer order_id;
    private Integer mem_id;
    private Integer perk_id;
    private Date  order_time;
    private String order_addr;
    private Integer  order_state;
	//	DEFAULT '0'
	//0 : 待付款
	//1 : 待出貨
	//2 : 運送中
	//3 : 訂單已完成
	//4 : 不成立(未處理)
	//5：不成立(已解決)-逾期未繳款

    private Date  order_cancel_time;
    /*0128增加7個欄位*/
    private Integer order_zipcode;
    private String order_receiver;
    private String order_tel;
    private Integer order_pay;
    private Date order_ship_time;
    private Date order_completion_time;
    private Integer order_cancel_reason;

    private String order_number;

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
	public Integer getOrder_zipcode() {
		return order_zipcode;
	}
	public void setOrder_zipcode(Integer order_zipcode) {
		this.order_zipcode = order_zipcode;
	}
	public String getOrder_receiver() {
		return order_receiver;
	}
	public void setOrder_receiver(String order_receiver) {
		this.order_receiver = order_receiver;
	}
	public String getOrder_tel() {
		return order_tel;
	}
	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}
	public Integer getOrder_pay() {
		return order_pay;
	}
	public void setOrder_pay(Integer order_pay) {
		this.order_pay = order_pay;
	}
	public Date getOrder_ship_time() {
		return order_ship_time;
	}
	public void setOrder_ship_time(Date order_ship_time) {
		this.order_ship_time = order_ship_time;
	}
	public Date getOrder_completion_time() {
		return order_completion_time;
	}
	public void setOrder_completion_time(Date order_completion_time) {
		this.order_completion_time = order_completion_time;
	}
	public Integer getOrder_cancel_reason() {
		return order_cancel_reason;
	}
	public void setOrder_cancel_reason(Integer order_cancel_reason) {
		this.order_cancel_reason = order_cancel_reason;
	}

	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
}
