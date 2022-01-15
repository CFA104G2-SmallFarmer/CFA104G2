package com.pro_diary.model;

import java.sql.Date;

public class ProDairyVO implements java.io.Serializable {
	private Integer dir_id;
	private Integer proj_id;
	private Date dir_upload_date;
	private String dir_procedure;
	private String dir_product;
	private String dir_equipment;
	private String dir_material;
	private String dir_emoji;
	private String dir_notes;
	
	
	
	public Integer getDir_id() {
		return dir_id;
	}
	public void setDir_id(Integer dir_id) {
		this.dir_id = dir_id;
	}
	public Integer getProj_id() {
		return proj_id;
	}
	public void setProj_id(Integer proj_id) {
		this.proj_id = proj_id;
	}
	public Date getDir_upload_date() {
		return dir_upload_date;
	}
	public void setDir_upload_date(Date dir_upload_date) {
		this.dir_upload_date = dir_upload_date;
	}
	public String getDir_procedure() {
		return dir_procedure;
	}
	public void setDir_procedure(String dir_procedure) {
		this.dir_procedure = dir_procedure;
	}
	public String getDir_product() {
		return dir_product;
	}
	public void setDir_product(String dir_product) {
		this.dir_product = dir_product;
	}
	public String getDir_equipment() {
		return dir_equipment;
	}
	public void setDir_equipment(String dir_equipment) {
		this.dir_equipment = dir_equipment;
	}
	public String getDir_material() {
		return dir_material;
	}
	public void setDir_material(String dir_material) {
		this.dir_material = dir_material;
	}
	public String getDir_emoji() {
		return dir_emoji;
	}
	public void setDir_emoji(String dir_emoji) {
		this.dir_emoji = dir_emoji;
	}
	public String getDir_notes() {
		return dir_notes;
	}
	public void setDir_notes(String dir_notes) {
		this.dir_notes = dir_notes;
	}


}
