package com.articleCollection.model;

import java.sql.Date;

public class ArticleCollectionVO {
	private Integer article_ID;
	private Integer mem_ID;
	private Date ac_follow_date;

	public Integer getArticle_id() {
		return article_ID;
	}

	public void setArticle_id(Integer article_id) {
		this.article_ID = article_id;
	}

	public Integer getMem_ID() {
		return mem_ID;
	}

	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
	}

	public Date getAc_follow_date() {
		return ac_follow_date;
	}

	public void setAc_follow_date(Date ac_follow_date) {
		this.ac_follow_date = ac_follow_date;
	}

}
