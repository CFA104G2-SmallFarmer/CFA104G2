package com.carlist.model;

public class ShopCartlistVO implements java.io.Serializable{

	private Integer mem_id;
	private Integer prod_id;
	private Integer cartlist_qty;
	private Integer cartlist_unit_price;
	
	//建構子1.空的2.有待參數的
	public ShopCartlistVO() {
		super();
		
	}
	public ShopCartlistVO(Integer mem_id, Integer prod_id, Integer cartlist_qty, Integer cartlist_unit_price) {
		super();
		this.mem_id = mem_id;
		this.prod_id = prod_id;
		this.cartlist_qty = cartlist_qty;
		this.cartlist_unit_price = cartlist_unit_price;
	}
	
	//get、set
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getProd_id() {
		return prod_id;
	}
	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}
	public Integer getCartlist_qty() {
		return cartlist_qty;
	}
	public void setCartlist_qty(Integer cartlist_qty) {
		this.cartlist_qty = cartlist_qty;
	}
	@Override
	public String toString() {
		return "ShopCartlistVO [mem_id=" + mem_id + ", prod_id=" + prod_id + ", cartlist_qty=" + cartlist_qty
				+ ", cartlist_unit_price=" + cartlist_unit_price + "]";
	}
	public Integer getCartlist_unit_price() {
		return cartlist_unit_price;
	}
	public void setCartlist_unit_price(Integer cartlist_unit_price) {
		this.cartlist_unit_price = cartlist_unit_price;
	}
	
	
}
