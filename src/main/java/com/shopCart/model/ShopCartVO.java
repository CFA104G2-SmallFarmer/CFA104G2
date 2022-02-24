package com.shopCart.model;

import java.util.Objects;

public class ShopCartVO implements java.io.Serializable{

	private Integer mem_id;
	private Integer prod_id;
	private Integer f_mem_id;
	private Integer cart_qty;
	private Integer cart_unit_price;
	
	public ShopCartVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShopCartVO(Integer mem_id, Integer prod_id, Integer f_mem_id, Integer cart_qty, Integer cart_unit_price) {
		super();
		this.mem_id = mem_id;
		this.prod_id = prod_id;
		this.f_mem_id = f_mem_id;
		this.cart_qty = cart_qty;
		this.cart_unit_price = cart_unit_price;
	}

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

	public Integer getF_mem_id() {
		return f_mem_id;
	}

	public void setF_mem_id(Integer f_mem_id) {
		this.f_mem_id = f_mem_id;
	}

	public Integer getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(Integer cart_qty) {
		this.cart_qty = cart_qty;
	}

	public Integer getCart_unit_price() {
		return cart_unit_price;
	}

	public void setCart_unit_price(Integer cart_unit_price) {
		this.cart_unit_price = cart_unit_price;
	}

	@Override
	public String toString() {
		return "ShopCartVO [mem_id=" + mem_id + ", prod_id=" + prod_id + ", f_mem_id=" + f_mem_id + ", cart_qty="
				+ cart_qty + ", cart_unit_price=" + cart_unit_price + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cart_qty, cart_unit_price, f_mem_id, mem_id, prod_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShopCartVO other = (ShopCartVO) obj;
		return Objects.equals(cart_qty, other.cart_qty) && Objects.equals(cart_unit_price, other.cart_unit_price)
				&& Objects.equals(f_mem_id, other.f_mem_id) && Objects.equals(mem_id, other.mem_id)
				&& Objects.equals(prod_id, other.prod_id);
	}
	
	
	
}
