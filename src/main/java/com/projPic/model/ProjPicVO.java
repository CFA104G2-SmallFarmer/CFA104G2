package com.projPic.model;

public class ProjPicVO {
	private Integer proj_pic_id;
	private Integer proj_id;
	private byte[] proj_pic;
    private String base64Image;
	 
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public Integer getProj_pic_id() {
		return proj_pic_id;
	}
	public void setProj_pic_id(Integer proj_pic_id) {
		this.proj_pic_id = proj_pic_id;
	}
	public Integer getProj_id() {
		return proj_id;
	}
	public void setProj_id(Integer proj_id) {
		this.proj_id = proj_id;
	}
	public byte[] getProj_pic() {
		return proj_pic;
	}
	public void setProj_pic(byte[] proj_pic) {
		this.proj_pic = proj_pic;
	}
	 
	 
}
