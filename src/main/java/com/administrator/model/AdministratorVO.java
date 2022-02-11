package com.administrator.model;

import java.io.Serializable;
import java.sql.Date;

public class AdministratorVO implements Serializable {

	private Integer admin_id;
	private Integer admin_type_id;
	private String admin_acc;
	private String admin_pwd;
	private Integer admin_isdeleted;
	private String admin_name;
	private String admin_email;
	private String admin_mobile;
	private Integer admin_zipcode;
	private String admin_city;
	private String admin_dist;
	private String admin_addr;
	private Date admin_hiredate;
	private Date admin_leavedate;
	private byte[] admin_pic;

	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}

	public Integer getAdmin_type_id() {
		return admin_type_id;
	}

	public void setAdmin_type_id(Integer admin_type_id) {
		this.admin_type_id = admin_type_id;
	}

	public String getAdmin_acc() {
		return admin_acc;
	}

	public void setAdmin_acc(String admin_acc) {
		this.admin_acc = admin_acc;
	}

	public String getAdmin_pwd() {
		return admin_pwd;
	}

	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}

	public Integer getAdmin_isdeleted() {
		return admin_isdeleted;
	}

	public void setAdmin_isdeleted(Integer admin_isdeleted) {
		this.admin_isdeleted = admin_isdeleted;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getAdmin_mobile() {
		return admin_mobile;
	}

	public void setAdmin_mobile(String admin_mobile) {
		this.admin_mobile = admin_mobile;
	}

	public Integer getAdmin_zipcode() {
		return admin_zipcode;
	}

	public void setAdmin_zipcode(Integer admin_zipcode) {
		this.admin_zipcode = admin_zipcode;
	}

	public String getAdmin_city() {
		return admin_city;
	}

	public void setAdmin_city(String admin_city) {
		this.admin_city = admin_city;
	}

	public String getAdmin_dist() {
		return admin_dist;
	}

	public void setAdmin_dist(String admin_dist) {
		this.admin_dist = admin_dist;
	}

	public String getAdmin_addr() {
		return admin_addr;
	}

	public void setAdmin_addr(String admin_addr) {
		this.admin_addr = admin_addr;
	}

	public Date getAdmin_hiredate() {
		return admin_hiredate;
	}

	public void setAdmin_hiredate(Date admin_hiredate) {
		this.admin_hiredate = admin_hiredate;
	}

	public Date getAdmin_leavedate() {
		return admin_leavedate;
	}

	public void setAdmin_leavedate(Date admin_leavedate) {
		this.admin_leavedate = admin_leavedate;
	}

	public byte[] getAdmin_pic() {
		return admin_pic;
	}

	public void setAdmin_pic(byte[] admin_pic) {
		this.admin_pic = admin_pic;
	}

	@Override
	public String toString() {
		return "AdministratorVO [admin_id=" + admin_id + ", admin_type_id=" + admin_type_id + ", admin_acc=" + admin_acc
				+ ", admin_pwd=" + admin_pwd + ", admin_isdeleted=" + admin_isdeleted + ", admin_name=" + admin_name
				+ ", admin_email=" + admin_email + ", admin_mobile=" + admin_mobile + ", admin_zipcode=" + admin_zipcode
				+ ", admin_city=" + admin_city + ", admin_dist=" + admin_dist + ", admin_addr=" + admin_addr
				+ ", admin_hiredate=" + admin_hiredate + ", admin_leavedate=" + admin_leavedate + "]";
	}

}
