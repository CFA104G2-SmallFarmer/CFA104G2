package com.proj_diary_pic.model;

import java.sql.Date;

public class ProjDiaryPicVO implements java.io.Serializable {
	private Integer dir_pic_id;  //PK(AI)
	private Integer dir_id;      //FK
	private byte[] dir_pic;
	
	public Integer getDir_pic_id() {
		return dir_pic_id;
	}
	public void setDir_pic_id(Integer dir_pic_id) {
		this.dir_pic_id = dir_pic_id;
	}
	public Integer getDir_id() {
		return dir_id;
	}
	public void setDir_id(Integer dir_id) {
		this.dir_id = dir_id;
	}
	public byte[] getDir_pic() {
		return dir_pic;
	}
	public void setDir_pic(byte[] dir_pic) {
		this.dir_pic = dir_pic;
	}


}
