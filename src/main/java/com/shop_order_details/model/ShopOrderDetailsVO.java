package com.shop_order_details.model;


public class ShopOrderDetailsVO implements java.io.Serializable{

	private Integer order_id;
	private Integer prod_id;
	private Integer order_qty;
	private Integer order_unit_price;
	private Integer prod_id_stars;
	private Integer mem_id_stars;
	
	//建構子1.空的2.有待參數的
	public ShopOrderDetailsVO() {
		super();
		
	}


	public ShopOrderDetailsVO(Integer order_id, Integer prod_id, Integer order_qty, Integer order_unit_price,
			Integer prod_id_stars, Integer mem_id_stars) {
		super();
		this.order_id = order_id;
		this.prod_id = prod_id;
		this.order_qty = order_qty;
		this.order_unit_price = order_unit_price;
		this.prod_id_stars = prod_id_stars;
		this.mem_id_stars = mem_id_stars;
	}

	//get、set
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


	public Integer getProd_id_stars() {
		return prod_id_stars;
	}


	public void setProd_id_stars(Integer prod_id_stars) {
		this.prod_id_stars = prod_id_stars;
	}


	public Integer getMem_id_stars() {
		return mem_id_stars;
	}


	public void setMem_id_stars(Integer mem_id_stars) {
		this.mem_id_stars = mem_id_stars;
	}


	@Override
	public String toString() {
		return "ShopOrderDetailsVO [order_id=" + order_id + ", prod_id=" + prod_id + ", order_qty=" + order_qty
				+ ", order_unit_price=" + order_unit_price + ", prod_id_stars=" + prod_id_stars + ", mem_id_stars="
				+ mem_id_stars + "]";
	}
	
	
	
}
