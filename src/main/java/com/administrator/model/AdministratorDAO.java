package com.administrator.model;

import java.util.List;


public interface AdministratorDAO {
	
	public void insert(AdministratorVO administratorVO);
    public void update(AdministratorVO administratorVO);
    public void delete(Integer admin_id);
    public AdministratorVO findByPrimaryKey(Integer admin_id);
    public List<AdministratorVO> getAll();

}
