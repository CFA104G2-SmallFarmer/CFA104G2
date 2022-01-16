package com.adminFuncList.model;

import java.util.List;

public interface AdminFuncListDAO {
	
	public void insert(AdminFuncListVO AdminFuncListVO);
    public void update(AdminFuncListVO AdminFuncListVO);
    public void delete(Integer admin_type_id);
    public List<AdminFuncListVO> findByAdminType(Integer admin_type_id);
    public List<AdminFuncListVO> getAll();

}
