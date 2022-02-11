package com.announcement.model;

import java.io.Serializable;
import java.sql.Date;

public class AnnouncementVO implements Serializable{

	private Integer announce_id;
	private Integer announce_type;
	private Integer admin_id;
	private Date edit_time;
	private String announce_title;
	private String announce_content;

	public Integer getAnnounce_id() {
		return announce_id;
	}

	public void setAnnounce_id(Integer announce_id) {
		this.announce_id = announce_id;
	}

	public Integer getAnnounce_type() {
		return announce_type;
	}

	public void setAnnounce_type(Integer announce_type) {
		this.announce_type = announce_type;
	}

	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}

	public Date getEdit_time() {
		return edit_time;
	}

	public void setEdit_time(Date edit_time) {
		this.edit_time = edit_time;
	}

	public String getAnnounce_title() {
		return announce_title;
	}

	public void setAnnounce_title(String announce_title) {
		this.announce_title = announce_title;
	}

	public String getAnnounce_content() {
		return announce_content;
	}

	public void setAnnounce_content(String announce_conten) {
		this.announce_content = announce_conten;
	}

	@Override
	public String toString() {
		return "AnnouncementVO [announce_id=" + announce_id + ", announce_type=" + announce_type + ", admin_id="
				+ admin_id + ", edit_time=" + edit_time + ", announce_title=" + announce_title + ", announce_content="
				+ announce_content + "]";
	}
	

}
