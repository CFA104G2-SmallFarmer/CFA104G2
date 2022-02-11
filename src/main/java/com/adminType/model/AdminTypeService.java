package com.adminType.model;

import java.util.List;

public class AdminTypeService {

	private AdminTypeDAO_Interface dao;

	public AdminTypeService() {
		dao = new AdminTypeDAO();
	}

	public AdminTypeVO addAdminType(Integer admin_type_id, String admin_type_name) {

		AdminTypeVO adminTypeVO = new AdminTypeVO();

		adminTypeVO.setAdmin_type_id(admin_type_id);
		adminTypeVO.setAdmin_type_name(admin_type_name);
		dao.insert(adminTypeVO);

		return adminTypeVO;

	}

	public AdminTypeVO updateAdminType(Integer admin_type_id, String admin_type_name) {

		AdminTypeVO adminTypeVO = new AdminTypeVO();

		adminTypeVO.setAdmin_type_id(admin_type_id);
		adminTypeVO.setAdmin_type_name(admin_type_name);
		dao.update(adminTypeVO);

		return adminTypeVO;

	}

	public void deleteAdminType(Integer admin_type_id) {
		dao.delete(admin_type_id);
	}

	public AdminTypeVO getOneAdminType(Integer admin_type_id) {
		return dao.findByPrimaryKey(admin_type_id);
	}

	public List<AdminTypeVO> getAll() {
		return dao.getAll();
	}

}
