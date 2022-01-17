package com.projReport.model;

import java.sql.Date;

public class ProjReportVO {
	private Integer proj_report_id;
	private Integer proj_id;
    private Integer mem_id;
    private String report_reason;
    private Date report_time;
    private Integer report_state;
    private String report_note;
    
	public Integer getProj_report_id() {
		return proj_report_id;
	}
	public void setProj_report_id(Integer proj_report_id) {
		this.proj_report_id = proj_report_id;
	}
	public Integer getProj_id() {
		return proj_id;
	}
	public void setProj_id(Integer proj_id) {
		this.proj_id = proj_id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
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
