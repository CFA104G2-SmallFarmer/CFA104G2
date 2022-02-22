package com.articleCollection.model;


import java.sql.Timestamp;

public class ArticleCollectionVO {
    private Integer mem_id;
    private Integer article_ID;
    private Timestamp article_follow_date;


    public Integer getMem_id() {
        return mem_id;
    }
    public void setMem_id(Integer mem_id) {
        this.mem_id = mem_id;
    }


    public Integer getArticle_ID() {
        return article_ID;
    }

    public void setArticle_ID(Integer article_ID) {
        this.article_ID = article_ID;
    }

    public Timestamp getArticle_follow_date() {
        return article_follow_date;
    }

    public void setArticle_follow_date(Timestamp article_follow_date) {this.article_follow_date = article_follow_date;
    }

}
