package com.articlePic.model;

public class ArticlePicVO {
	private Integer article_pic_ID;
	private Integer article_ID;
	private byte[] article_pic;

	public Integer getArticle_pic_ID() {
		return article_pic_ID;
	}

	public void setArticle_pic_ID(Integer article_pic_ID) {
		this.article_pic_ID = article_pic_ID;
	}

	public Integer getArticle_ID() {
		return article_ID;
	}

	public void setArticle_ID(Integer article_ID) {
		this.article_ID = article_ID;
	}

	public byte[] getArticle_pic() {
		return article_pic;
	}

	public void setArticle_pic(byte[] article_pic) {
		this.article_pic = article_pic;
	}

}
