package com.articleReport.model;

import java.sql.Timestamp;

public class ArticleReportVO {
    private Integer article_report_ID;
    private Integer mem_id;
    private Integer article_ID;
    private Timestamp report_time;
    private String report_reason;
    private Integer report_state;
    private String report_note;
    private Timestamp review_time;

    public Integer getArticle_report_ID() {
        return article_report_ID;
    }

    public void setArticle_report_ID(Integer article_report_ID) {
        this.article_report_ID = article_report_ID;
    }

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

    public Timestamp getReport_time() {
        return report_time;
    }

    public void setReport_time(Timestamp report_time) {
        this.report_time = report_time;
    }

    public String getReport_reason() {
        return report_reason;
    }

    public void setReport_reason(String report_reason) {
        this.report_reason = report_reason;
    }

    public Integer getReport_state() {
        return report_state;
    }

    public void setReport_state(Integer report_state) {
        this.report_state = report_state;
    }

    public String getReport_note() {
        return report_note;
    }

    public void setReport_note(String report_note) {
        this.report_note = report_note;
    }

    public Timestamp getReview_time() {
        return review_time;
    }

    public void setReview_time(Timestamp review_time) {
        this.review_time = review_time;
    }

}
