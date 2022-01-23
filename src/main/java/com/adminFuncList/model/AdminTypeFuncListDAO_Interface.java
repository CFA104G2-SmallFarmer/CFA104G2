package com.adminTypeFuncList.model;

import java.util.List;

public interface AdminTypeFuncListDAO_Interface {
	
	public void insert(AdminTypeFuncListVO adminTypeFuncListVO);
    
    public void delete(AdminTypeFuncListVO adminTypeFuncListVO);
    public List<AdminTypeFuncListVO> findByAdminType(Integer admin_type_id);
    public List<AdminTypeFuncListVO> getAll();

}
