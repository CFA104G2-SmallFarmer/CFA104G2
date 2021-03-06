package com.adminType.model;

import java.io.Serializable;

public class AdminTypeVO implements Serializable {
	private Integer admin_type_id;
	private String admin_type_name;

	public Integer getAdmin_type_id() {
		return admin_type_id;
	}

	public void setAdmin_type_id(Integer admin_type_id) {
		this.admin_type_id = admin_type_id;
	}

	public String getAdmin_type_name() {
		return admin_type_name;
	}

	public void setAdmin_type_name(String admin_type_name) {
		this.admin_type_name = admin_type_name;
	}

	@Override
	public String toString() {
		return "AdminTypeVO [admin_type_id=" + admin_type_id + ", admin_type_name=" + admin_type_name + "]";
	}

}
