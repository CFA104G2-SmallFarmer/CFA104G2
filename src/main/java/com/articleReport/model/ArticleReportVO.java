package com.articleReport.model;

import java.sql.Date;

public class ArticleReportVO {
	private Integer atc_report_ID;
	private Integer mem_ID;
	private Integer article_ID;
	private Date report_time;
	private String report_reason;
	private Integer report_state;
	private String report_note;

	public Integer getAtc_report_ID() {
		return atc_report_ID;
	}

	public void setAtc_report_ID(Integer atc_report_ID) {
		this.atc_report_ID = atc_report_ID;
	}

	public Integer getMem_ID() {
		return mem_ID;
	}

	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
	}

	public Integer getArticle_ID() {
		return article_ID;
	}

	public void setArticle_ID(Integer article_ID) {
		this.article_ID = article_ID;
	}

	public Date getReport_time() {
		return report_time;
	}

	public void setReport_time(Date report_time) {
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

}
