package com.adminFunction.model;

import java.util.List;

public interface AdminFunctionDAO_Interface {

	public void insert(AdminFunctionVO adminFunctionVO);

	public void update(AdminFunctionVO adminFunctionVO);

	public void delete(Integer admin_func_id);

	public AdminFunctionVO findByPrimaryKey(Integer admin_func_id);

	public List<AdminFunctionVO> getAll();

}
