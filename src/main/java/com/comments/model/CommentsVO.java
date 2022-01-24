package com.comments.model;

import java.sql.Timestamp;

public class CommentsVO {

	private Integer comments_ID;
	private Integer article_ID;
	private Integer comments_num;
	private Integer mem_ID;
	private Timestamp comments_time;
	private String comments_content;
	private Integer comments_like;
	private byte[] comments_img;
	private Integer comments_state;
	private Timestamp comments_update_time;

	public Integer getComments_ID() {
		return comments_ID;
	}

	public void setComments_ID(Integer comments_ID) {
		this.comments_ID = comments_ID;
	}

	public Integer getArticle_ID() {
		return article_ID;
	}

	public void setArticle_ID(Integer article_ID) {
		this.article_ID = article_ID;
	}

	public Integer getComments_num() {
		return comments_num;
	}

	public void setComments_num(Integer comments_num) {
		this.comments_num = comments_num;
	}

	public Integer getMem_ID() {
		return mem_ID;
	}

	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
	}

	public Timestamp getComments_time() {
		return comments_time;
	}

	public void setComments_time(Timestamp comments_time) {
		this.comments_time = comments_time;
	}

	public String getComments_content() {
		return comments_content;
	}

	public void setComments_content(String comments_content) {
		this.comments_content = comments_content;
	}

	public Integer getComments_like() {
		return comments_like;
	}

	public void setComments_like(Integer comments_like) {
		this.comments_like = comments_like;
	}

	public byte[] getComments_img() {
		return comments_img;
	}

	public void setComments_img(byte[] comments_img) {
		this.comments_img = comments_img;
	}

	public Integer getComments_state() {
		return comments_state;
	}

	public void setComments_state(Integer comments_state) {
		this.comments_state = comments_state;
	}

	public Timestamp getComments_update_time() {
		return comments_update_time;
	}

	public void setComments_update_time(Timestamp comments_update_time) {
		this.comments_update_time = comments_update_time;
	}
}
