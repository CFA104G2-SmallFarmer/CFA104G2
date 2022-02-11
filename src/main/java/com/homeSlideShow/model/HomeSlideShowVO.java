package com.homeSlideShow.model;

import java.io.Serializable;
import java.sql.Date;

public class HomeSlideShowVO implements Serializable{

	private Integer hss_id;
	private Integer admin_id;
	private byte[] hss_img;
	private String hss_text;
	private Date hss_time;
	private Integer hss_state;
	private Date hss_on_shelf;
	private Date hss_off_shelf;

	public Integer getHss_id() {
		return hss_id;
	}

	public void setHss_id(Integer hss_id) {
		this.hss_id = hss_id;
	}

	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}

	public byte[] getHss_img() {
		return hss_img;
	}

	public void setHss_img(byte[] hss_img) {
		this.hss_img = hss_img;
	}

	public String getHss_text() {
		return hss_text;
	}

	public void setHss_text(String hss_text) {
		this.hss_text = hss_text;
	}

	public Date getHss_time() {
		return hss_time;
	}

	public void setHss_time(Date hss_time) {
		this.hss_time = hss_time;
	}

	public Integer getHss_state() {
		return hss_state;
	}

	public void setHss_state(Integer hss_state) {
		this.hss_state = hss_state;
	}

	public Date getHss_on_shelf() {
		return hss_on_shelf;
	}

	public void setHss_on_shelf(Date hss_on_shelf) {
		this.hss_on_shelf = hss_on_shelf;
	}

	public Date getHss_off_shelf() {
		return hss_off_shelf;
	}

	public void setHss_off_shelf(Date hss_off_shelf) {
		this.hss_off_shelf = hss_off_shelf;
	}

	@Override
	public String toString() {
		return "HomeSlideShowVO [hss_id=" + hss_id + ", admin_id=" + admin_id + ", hss_text=" + hss_text + ", hss_time="
				+ hss_time + ", hss_state=" + hss_state + ", hss_on_shelf=" + hss_on_shelf + ", hss_off_shelf="
				+ hss_off_shelf + "]";
	}
	
	
	
	

}
