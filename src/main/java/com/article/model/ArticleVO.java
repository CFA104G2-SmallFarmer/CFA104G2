package com.article.model;

import java.sql.Date;

public class ArticleVO {
	private Integer article_ID;
	private String article_title;
	private Integer mem_ID;
	private Integer ac_type_ID;
	private Date article_time;
	private String article_content;
	private byte[] article_img;
	private Integer article_like;
	private Integer comment_num;
	private Integer article_state;

	public Integer getArticle_id() {
		return article_ID;
	}

	public void setArticle_id(Integer article_id) {
		this.article_ID = article_id;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public Integer getMem_id() {
		return mem_ID;
	}

	public void setMem_id(Integer mem_id) {
		this.mem_ID = mem_id;
	}

	public Integer getAc_type_id() {
		return ac_type_ID;
	}

	public void setAc_type_id(Integer ac_type_id) {
		this.ac_type_ID = ac_type_id;
	}

	public Date getArticle_time() {
		return article_time;
	}

	public void setArticle_time(Date article_time) {
		this.article_time = article_time;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public byte[] getArticle_img() {
		return article_img;
	}

	public void setArticle_img(byte[] article_img) {
		this.article_img = article_img;
	}

	public Integer getArticle_like() {
		return article_like;
	}

	public void setArticle_like(Integer article_like) {
		this.article_like = article_like;
	}

	public Integer getComment_num() {
		return comment_num;
	}

	public void setComment_num(Integer comment_num) {
		this.comment_num = comment_num;
	}

	public Integer getArticle_state() {
		return article_state;
	}

	public void setArticle_state(Integer article_state) {
		this.article_state = article_state;
	}

}
