package com.commentReport.model;

import java.sql.Date;

public class CommentReportVO {
	private Integer cmt_report_ID;
	private Integer comment_ID;
	private Integer mem_ID;
	private Integer article_ID;
	private String report_reason;
	private Date report_time;
	private Integer report_state;
	private String report_note;

	public Integer getCmt_report_ID() {
		return cmt_report_ID;
	}

	public void setCmt_report_ID(Integer cmt_report_ID) {
		this.cmt_report_ID = cmt_report_ID;
	}

	public Integer getComment_ID() {
		return comment_ID;
	}

	public void setComment_ID(Integer comment_ID) {
		this.comment_ID = comment_ID;
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

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public Date getReport_time() {
		return report_time;
	}

	public void setReport_time(Date report_time) {
		this.report_time = report_time;
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
