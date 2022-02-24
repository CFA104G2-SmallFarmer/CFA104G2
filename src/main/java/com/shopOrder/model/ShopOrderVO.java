package com.shopOrder.model;

import java.io.Serializable;
import java.sql.Date;

public class ShopOrderVO implements java.io.Serializable{
	
	private Integer order_id;
	private Integer mem_id;
	private Integer f_mem_id;
	private String order_add;
	private String order_receiver;
	private String order_tel;
	private Integer order_amount;
	private String order_memo;
	private Integer order_payment;
	private Integer order_state;
	private Date order_date;
	private Date order_ship_date;
	private Date order_finish_date;
	private Date order_cancel_date;
	
	public ShopOrderVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShopOrderVO(Integer order_id, Integer mem_id, Integer f_mem_id, String order_add,
			String order_receiver, String order_tel, Integer order_amount, String order_memo, Integer order_payment,
			Integer order_state, Date order_date, Date order_ship_date, Date order_finish_date,
			Date order_cancel_date) {
		super();
		this.order_id = order_id;
		this.mem_id = mem_id;
		this.f_mem_id = f_mem_id;
		this.order_add = order_add;
		this.order_receiver = order_receiver;
		this.order_tel = order_tel;
		this.order_amount = order_amount;
		this.order_memo = order_memo;
		this.order_payment = order_payment;
		this.order_state = order_state;
		this.order_date = order_date;
		this.order_ship_date = order_ship_date;
		this.order_finish_date = order_finish_date;
		this.order_cancel_date = order_cancel_date;
	}

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

	public Integer getF_mem_id() {
		return f_mem_id;
	}

	public void setF_mem_id(Integer f_mem_id) {
		this.f_mem_id = f_mem_id;
	}

	public String getOrder_add() {
		return order_add;
	}

	public void setOrder_add(String order_add) {
		this.order_add = order_add;
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

	public Integer getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(Integer order_amount) {
		this.order_amount = order_amount;
	}

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}

	public Integer getOrder_payment() {
		return order_payment;
	}

	public void setOrder_payment(Integer order_payment) {
		this.order_payment = order_payment;
	}

	public Integer getOrder_state() {
		return order_state;
	}

	public void setOrder_state(Integer order_state) {
		this.order_state = order_state;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public Date getOrder_ship_date() {
		return order_ship_date;
	}

	public void setOrder_ship_date(Date order_ship_date) {
		this.order_ship_date = order_ship_date;
	}

	public Date getOrder_finish_date() {
		return order_finish_date;
	}

	public void setOrder_finish_date(Date order_finish_date) {
		this.order_finish_date = order_finish_date;
	}

	public Date getOrder_cancel_date() {
		return order_cancel_date;
	}

	public void setOrder_cancel_date(Date order_cancel_date) {
		this.order_cancel_date = order_cancel_date;
	}

	@Override
	public String toString() {
		return "ShopOrderVO [order_id=" + order_id + ", mem_id=" + mem_id + ", f_mem_id=" + f_mem_id + ", order_add="
				+ order_add + ", order_receiver=" + order_receiver + ", order_tel=" + order_tel + ", order_amount="
				+ order_amount + ", order_memo=" + order_memo + ", order_payment=" + order_payment + ", order_state="
				+ order_state + ", order_date=" + order_date + ", order_ship_date=" + order_ship_date
				+ ", order_finish_date=" + order_finish_date + ", order_cancel_date=" + order_cancel_date + "]";
	}
	
	
	
}
