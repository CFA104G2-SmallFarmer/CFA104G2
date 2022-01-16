package com.shopProductReport.model;

import java.sql.Date;

public class ShopProductReportVO {
	private Integer prod_report_no;
	private Integer mem_id;
	private Integer prod_id;
	private String report_reason;
	private Date report_time;
	public Integer getProd_report_no() {
		return prod_report_no;
	}
	public void setProd_report_no(Integer prod_report_no) {
		this.prod_report_no = prod_report_no;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getProd_id() {
		return prod_id;
	}
	public void setProd_id(Integer prod_id) {
		this.prod_id = prod_id;
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
	
	





	

}
