package com.shop_hashtag_details.model;

public class ShopHashtagDetailsVO implements java.io.Serializable{

	private Integer hash_no;
	private Integer prod_id;
	
	//建構子1.空的2.有帶參數的
	public ShopHashtagDetailsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShopHashtagDetailsVO(Integer hash_no, Integer prod_id) {
		super();
		this.hash_no = hash_no;
		this.prod_id = prod_id;
	}
	
	@Override
	public String toString() {
		return "ShopHashtagDetailsVO [hash_no=" + hash_no + ", prod_id=" + prod_id + "]";
	}

	//get、set
	public Integer getHash_no() {
		return hash_no;
	}

	public void setHash_no(Integer hash_no) {
		this.hash_no = hash_no;
	}

	public Integer getProd_id() {
		return prod_id;
	}

	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
	}
	
	
	
}
