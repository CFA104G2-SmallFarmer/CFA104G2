package com.articleCollection.model;

import java.sql.Date;

public class ArticleCollectionVO {
	private Integer article_ID;
	private Integer mem_ID;
	private Date article_follow_date;

	public Integer getArticle_ID() {
		return article_ID;
	}

	public void setArticle_ID(Integer article_ID) {
		this.article_ID = article_ID;
	}

	public Integer getMem_ID() {
		return mem_ID;
	}

	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
	}

	public Date getArticle_follow_date() {
		return article_follow_date;
	}

	public void setArticle_follow_date(Date article_follow_date) {
		this.article_follow_date = article_follow_date;
	}

}
