package com.shopProductCollection.model;

import java.sql.Date;

public class ShopProductCollectionVO {
	private Integer mem_id;
	private Integer prod_id;
	private Date prod_fav_date;
	
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
	public Date getProd_fav_date() {
		return prod_fav_date;
	}
	public void setProd_fav_date(Date prod_fav_date) {
		this.prod_fav_date = prod_fav_date;
	}
	
	




}
