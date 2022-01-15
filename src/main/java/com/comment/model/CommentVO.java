package com.comment.model;

import java.sql.Date;

public class CommentVO {
	private Integer article_ID;
	private Integer comment_num;
	private Integer mem_ID;
	private Date comment_time;
	private String comment_content;
	private Integer comment_like;
	private byte[] comment_img;
	private Integer comment_state;

	public Integer getArticle_ID() {
		return article_ID;
	}

	public void setArticle_ID(Integer article_ID) {
		this.article_ID = article_ID;
	}

	public Integer getComment_num() {
		return comment_num;
	}

	public void setComment_num(Integer comment_num) {
		this.comment_num = comment_num;
	}

	public Integer getMem_ID() {
		return mem_ID;
	}

	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
	}

	public Date getComment_time() {
		return comment_time;
	}

	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Integer getComment_like() {
		return comment_like;
	}

	public void setComment_like(Integer comment_like) {
		this.comment_like = comment_like;
	}

	public byte[] getComment_img() {
		return comment_img;
	}

	public void setComment_img(byte[] comment_img) {
		this.comment_img = comment_img;
	}

	public Integer getComment_state() {
		return comment_state;
	}

	public void setComment_state(Integer comment_state) {
		this.comment_state = comment_state;
	}

}
