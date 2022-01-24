package com.article.model;

import java.sql.Date;

public class ArticleVO {
	private Integer article_ID;
	private String article_title;
	private Integer mem_ID;
	private Integer article_type_ID;
	private Date article_time;
	private String article_content;
	private byte[] article_img;
	private Integer article_like;
	private Integer comments_num;
	private Integer article_state;
	private Date article_change_time;
	
	
	public Integer getArticle_ID() {
		return article_ID;
	}
	public void setArticle_ID(Integer article_ID) {
		this.article_ID = article_ID;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public Integer getMem_ID() {
		return mem_ID;
	}
	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
	}
	public Integer getArticle_type_ID() {
		return article_type_ID;
	}
	public void setArticle_type_ID(Integer article_type_ID) {
		this.article_type_ID = article_type_ID;
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
	public Integer getComments_num() {
		return comments_num;
	}
	public void setComments_num(Integer comments_num) {
		this.comments_num = comments_num;
	}
	public Integer getArticle_state() {
		return article_state;
	}
	public void setArticle_state(Integer article_state) {
		this.article_state = article_state;
	}
	public Date getArticle_change_time() {
		return article_change_time;
	}
	public void setArticle_change_time(Date article_change_time) {
		this.article_change_time = article_change_time;
	}
	
	
}
