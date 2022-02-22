package com.adminTypeFuncList.model;

import java.util.ArrayList;
import java.util.List;

import com.adminFunction.model.AdminFunctionDAO;
import com.adminFunction.model.AdminFunctionDAO_Interface;
import com.adminFunction.model.AdminFunctionService;
import com.adminFunction.model.AdminFunctionVO;

public class AdminTypeFuncListService {
	
	private AdminTypeFuncListDAO_Interface dao;
	private AdminFunctionDAO_Interface dao2;
	
	private AdminFunctionService adminFuncSvc;
	
	public AdminTypeFuncListService(){
		dao = new AdminTypeFuncListDAO();
		dao2 = new AdminFunctionDAO();
		adminFuncSvc = new AdminFunctionService();
	}

	public AdminTypeFuncListVO addAdminTypeFuncList(Integer admin_type_id, Integer admin_func_id) {
		AdminTypeFuncListVO adminTypeFuncListVO = new AdminTypeFuncListVO();
		adminTypeFuncListVO.setAdmin_type_id(admin_type_id);
		adminTypeFuncListVO.setAdmin_func_id(admin_func_id);
		dao.insert(adminTypeFuncListVO);
		
		return adminTypeFuncListVO;
	}
	
	public void deleteAdminTypeFuncList(Integer admin_type_id, Integer admin_func_id) {
		AdminTypeFuncListVO adminTypeFuncListVO = new AdminTypeFuncListVO();
		adminTypeFuncListVO.setAdmin_type_id(admin_type_id);
		adminTypeFuncListVO.setAdmin_func_id(admin_func_id);
		dao.delete(adminTypeFuncListVO);
	}
	
	public List<AdminFunctionVO> getOneTypeFuncList(Integer admin_type_id){
		List<AdminFunctionVO> list = new ArrayList<AdminFunctionVO>();
		List<AdminTypeFuncListVO> list2 = dao.findByAdminType(admin_type_id);
		AdminFunctionVO adminFuncVO = null;
		
		for(AdminTypeFuncListVO vo :list2) {
			adminFuncVO = adminFuncSvc.getOneAdminFunction(vo.getAdmin_func_id());
			list.add(adminFuncVO);
		}
		return list;
	
	}
	
	public List<AdminTypeFuncListVO> getAll(){
		return dao.getAll();
	}
	
	
	
}
