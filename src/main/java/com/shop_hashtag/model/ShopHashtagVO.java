package com.shop_hashtag.model;

public class ShopHashtagVO implements java.io.Serializable{

	@Override
	public String toString() {
		return "ShopHashtagVO [hash_no=" + hash_no + ", hash_word=" + hash_word + "]";
	}

	private Integer hash_no;
	private String hash_word;
	
	//�غc�l1.�Ū�2.���ݰѼƪ�
	public ShopHashtagVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShopHashtagVO(Integer hash_no, String hash_word) {
		super();
		this.hash_no = hash_no;
		this.hash_word = hash_word;
	}
	
	//get�Bset
	public Integer getHash_no() {
		return hash_no;
	}

	public void setHash_no(Integer hash_no) {
		this.hash_no = hash_no;
	}

	public String getHash_word() {
		return hash_word;
	}

	public void setHash_word(String hash_word) {
		this.hash_word = hash_word;
	}
	
	
	
	
}
