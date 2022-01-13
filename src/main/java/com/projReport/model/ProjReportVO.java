package com.projReport.model;

import java.sql.Date;

public class ProjReportVO {
	private Integer proj_report_ID;
	private Integer proj_ID;
    private Integer mem_ID;
    private String report_reason;
    private Date report_time;
    private Integer report_state;
    private String report_note;
    
	public Integer getProj_report_ID() {
		return proj_report_ID;
	}
	public void setProj_report_ID(Integer proj_report_ID) {
		this.proj_report_ID = proj_report_ID;
	}
	public Integer getProj_ID() {
		return proj_ID;
	}
	public void setProj_ID(Integer proj_ID) {
		this.proj_ID = proj_ID;
	}
	public Integer getMem_ID() {
		return mem_ID;
	}
	public void setMem_ID(Integer mem_ID) {
		this.mem_ID = mem_ID;
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
