package com.adminTypeFuncList.model;

import java.io.Serializable;

public class AdminTypeFuncListVO implements Serializable {

	private Integer admin_type_id;
	private Integer admin_func_id;

	public AdminTypeFuncListVO() {
	}

	public AdminTypeFuncListVO(Integer admin_type_id, Integer admin_func_id) {
		super();
		this.admin_type_id = admin_type_id;
		this.admin_func_id = admin_func_id;
	}

	public Integer getAdmin_type_id() {
		return admin_type_id;
	}

	public void setAdmin_type_id(Integer admin_type_id) {
		this.admin_type_id = admin_type_id;
	}

	public Integer getAdmin_func_id() {
		return admin_func_id;
	}

	public void setAdmin_func_id(Integer admin_func_id) {
		this.admin_func_id = admin_func_id;
	}

	@Override
	public String toString() {
		return "AdminTypeFuncListVO [admin_type_id=" + admin_type_id + ", admin_func_id=" + admin_func_id + "]";
	}

}
