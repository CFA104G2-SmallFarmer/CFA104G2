package com.adminType.model;

import java.util.List;

public interface AdminTypeDAO {
	
	public void insert(AdminTypeVO adminTypeVO);
    public void update(AdminTypeVO adminTypeVO);
    public void delete(Integer admin_type_id);
    public AdminTypeVO findByPrimaryKey(Integer admin_type_id);
    public List<AdminTypeVO> getAll();

}
