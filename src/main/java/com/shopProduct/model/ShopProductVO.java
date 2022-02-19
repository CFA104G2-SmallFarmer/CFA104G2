package com.shopProduct.model;

import java.sql.Date;

public class ShopProductVO implements java.io.Serializable{
	private Integer prod_id;
	private Integer f_mem_id;
	private byte[] prod_pic;
	private String prod_name;
	private Integer prod_type_id;
	private Integer prod_status;
	private Integer prod_price;
	private String prod_unit;
	private Integer prod_qty;
	private String prod_intro;
	private Date prod_reg_date;

	
	public Integer getProd_id() {
		return prod_id;
	}
	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}
	
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public Integer getF_mem_id() {
		return f_mem_id;
	}
	public void setF_mem_id(Integer f_mem_id) {
		this.f_mem_id = f_mem_id;
	}
	public Integer getProd_status() {
		return prod_status;
	}
	public void setProd_status(Integer prod_status) {
		this.prod_status = prod_status;
	}
	public Integer getProd_price() {
		return prod_price;
	}
	public void setProd_price(Integer prod_price) {
		this.prod_price = prod_price;
	}
	public Integer getProd_qty() {
		return prod_qty;
	}
	public void setProd_qty(Integer prod_qty) {
		this.prod_qty = prod_qty;
	}
	public String getProd_intro() {
		return prod_intro;
	}
	public void setProd_intro(String prod_intro) {
		this.prod_intro = prod_intro;
	}
	public Date getProd_reg_date() {
		return prod_reg_date;
	}
	public void setProd_reg_date(Date prod_reg_date) {
		this.prod_reg_date = prod_reg_date;
	}
	public String getProd_unit() {
		return prod_unit;
	}
	public void setProd_unit(String prod_unit) {
		this.prod_unit = prod_unit;
	}
	public Integer getProd_type_id() {
		return prod_type_id;
	}
	public void setProd_type_id(Integer prod_type_id) {
		this.prod_type_id = prod_type_id;
	}
	public byte[] getProd_pic() {
		return prod_pic;
	}
	public void setProd_pic(byte[] prod_pic) {
		this.prod_pic = prod_pic;
	}

}
