package com.administrator.model;

import java.util.List;

public interface AdministratorDAO_Interface {

	public void insert(AdministratorVO administratorVO);

	public void update(AdministratorVO administratorVO);

	public void delete(Integer admin_id);

	public AdministratorVO findByPrimaryKey(Integer admin_id);
	
	public AdministratorVO findByACC(String admin_acc);

	public List<AdministratorVO> getAll();

}
