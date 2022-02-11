package com.adminFunction.model;

import java.util.List;

public class AdminFunctionService {
	
	private AdminFunctionDAO_Interface dao;
	
	public AdminFunctionService() {
		dao = new AdminFunctionDAO();
	}
	
	public AdminFunctionVO addAdminFunction(Integer admin_func_id, 
			String admin_func_name, String admin_func_des ) {
		
		AdminFunctionVO adminFunctionVO = new AdminFunctionVO();
		
		adminFunctionVO.setAdmin_func_id(admin_func_id);
		adminFunctionVO.setAdmin_func_name(admin_func_name);
		adminFunctionVO.setAdmin_func_des(admin_func_des);
		dao.insert(adminFunctionVO);
		
		return adminFunctionVO;
	}

	public AdminFunctionVO updateAdminFunction(Integer admin_func_id, 
			String admin_func_name, String admin_func_des ) {
		
		AdminFunctionVO adminFunctionVO = new AdminFunctionVO();
		
		adminFunctionVO.setAdmin_func_id(admin_func_id);
		adminFunctionVO.setAdmin_func_name(admin_func_name);
		adminFunctionVO.setAdmin_func_des(admin_func_des);
		dao.update(adminFunctionVO);
		
		return adminFunctionVO;
	}
	
	public void deleteAdminFunction(Integer admin_func_id) {
		dao.delete(admin_func_id);
	}
	
	public AdminFunctionVO getOneAdminFunction(Integer admin_func_id) {
		return dao.findByPrimaryKey(admin_func_id);
	}
	
	public List<AdminFunctionVO> getAll(){
		return dao.getAll();
	}
	
}
