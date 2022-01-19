package com.shop_order.model;

//import java.io.Serializable;
import java.sql.Date;

public class ShopOrderVO implements java.io.Serializable{
	
	private Integer order_id;
	private Integer mem_id;
	private Date order_date;
	private Integer order_ship_fee;
	private String order_add;
	private Integer order_amount;
	private String order_memo;
	private Date order_ship_date;
	private Integer order_payment;
	private Integer order_state;
	
//建構子1.空的2.有帶參數的
	public ShopOrderVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShopOrderVO(Integer order_id, Integer mem_id, Date order_date, Integer order_ship_fee, String order_add,
			Integer order_amount, String order_memo, Date order_ship_date, Integer order_payment, Integer order_state) {
		super();
		this.order_id = order_id;
		this.mem_id = mem_id;
		this.order_date = order_date;
		this.order_ship_fee = order_ship_fee;
		this.order_add = order_add;
		this.order_amount = order_amount;
		this.order_memo = order_memo;
		this.order_ship_date = order_ship_date;
		this.order_payment = order_payment;
		this.order_state = order_state;
	}
	
//get、set
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

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public Integer getOrder_ship_fee() {
		return order_ship_fee;
	}

	public void setOrder_ship_fee(Integer order_ship_fee) {
		this.order_ship_fee = order_ship_fee;
	}

	public String getOrder_add() {
		return order_add;
	}

	public void setOrder_add(String order_add) {
		this.order_add = order_add;
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

	public Date getOrder_ship_date() {
		return order_ship_date;
	}

	public void setOrder_ship_date(Date order_ship_date) {
		this.order_ship_date = order_ship_date;
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

	@Override
	public String toString() {
		return "ShopOrderVO [order_id=" + order_id + ", mem_id=" + mem_id + ", order_date=" + order_date
				+ ", order_ship_fee=" + order_ship_fee + ", order_add=" + order_add + ", order_amount=" + order_amount
				+ ", order_memo=" + order_memo + ", order_ship_date=" + order_ship_date + ", order_payment="
				+ order_payment + ", order_state=" + order_state + "]";
	}
	

	
}
