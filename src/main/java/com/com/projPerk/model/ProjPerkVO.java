package com.projPerk.model;

import java.sql.Date;

public class ProjPerkVO implements java.io.Serializable{
	
	private Integer perk_id;
	private Integer proj_id;
	private byte[] perk_pic;
	private String perk_intro;
	private Integer perk_total_count;
	private Integer perk_fund;
	private Integer perk_limited;
	private Date perk_ship_date;
	private String perk_ship_area;
	private String perk_abbr_name;

	
	public String getPerk_abbr_name() {
		return perk_abbr_name;
	}
	public void setPerk_abbr_name(String perk_abbr_name) {
		this.perk_abbr_name = perk_abbr_name;
	}
	public Integer getPerk_id() {
		return perk_id;
	}
	public void setPerk_id(Integer perk_id) {
		this.perk_id = perk_id;
	}
	public Integer getProj_id() {
		return proj_id;
	}
	public void setProj_id(Integer proj_id) {
		this.proj_id = proj_id;
	}
	public byte[] getPerk_pic() {
		return perk_pic;
	}
	public void setPerk_pic(byte[] perk_pic) {
		this.perk_pic = perk_pic;
	}
	public String getPerk_intro() {
		return perk_intro;
	}
	public void setPerk_intro(String perk_intro) {
		this.perk_intro = perk_intro;
	}
	public Integer getPerk_total_count() {
		return perk_total_count;
	}
	public void setPerk_total_count(Integer perk_total_count) {
		this.perk_total_count = perk_total_count;
	}
	public Integer getPerk_fund() {
		return perk_fund;
	}
	public void setPerk_fund(Integer perk_fund) {
		this.perk_fund = perk_fund;
	}
	public Integer getPerk_limited() {
		return perk_limited;
	}
	public void setPerk_limited(Integer perk_limited) {
		this.perk_limited = perk_limited;
	}
	public Date getPerk_ship_date() {
		return perk_ship_date;
	}
	public void setPerk_ship_date(Date perk_ship_date) {
		this.perk_ship_date = perk_ship_date;
	}
	public String getPerk_ship_area() {
		return perk_ship_area;
	}
	public void setPerk_ship_area(String perk_ship_area) {
		this.perk_ship_area = perk_ship_area;
	}
	

}
