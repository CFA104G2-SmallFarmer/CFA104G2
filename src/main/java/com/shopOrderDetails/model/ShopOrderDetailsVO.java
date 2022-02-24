package com.shopOrderDetails.model;


public class ShopOrderDetailsVO implements java.io.Serializable{

	private Integer order_id;
	private Integer prod_id;
	private String prod_unit;
	private Integer order_qty;
	private Integer order_unit_price;
	private Integer order_unit_amount;
	
	public ShopOrderDetailsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShopOrderDetailsVO(Integer order_id, Integer prod_id, String prod_unit, Integer order_qty,
			Integer order_unit_price, Integer order_unit_amount) {
		super();
		this.order_id = order_id;
		this.prod_id = prod_id;
		this.prod_unit = prod_unit;
		this.order_qty = order_qty;
		this.order_unit_price = order_unit_price;
		this.order_unit_amount = order_unit_amount;
	}

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public Integer getProd_id() {
		return prod_id;
	}

	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}

	public String getProd_unit() {
		return prod_unit;
	}

	public void setProd_unit(String prod_unit) {
		this.prod_unit = prod_unit;
	}

	public Integer getOrder_qty() {
		return order_qty;
	}

	public void setOrder_qty(Integer order_qty) {
		this.order_qty = order_qty;
	}

	public Integer getOrder_unit_price() {
		return order_unit_price;
	}

	public void setOrder_unit_price(Integer order_unit_price) {
		this.order_unit_price = order_unit_price;
	}

	public Integer getOrder_unit_amount() {
		return order_unit_amount;
	}

	public void setOrder_unit_amount(Integer order_unit_amount) {
		this.order_unit_amount = order_unit_amount;
	}

	

	@Override
	public String toString() {
		return "ShopOrderDetailsVO [order_id=" + order_id + ", prod_id=" + prod_id + ", prod_unit=" + prod_unit
				+ ", order_qty=" + order_qty + ", order_unit_price=" + order_unit_price + ", order_unit_amount="
				+ order_unit_amount +  "]";
	}
	
	
	
	
}
