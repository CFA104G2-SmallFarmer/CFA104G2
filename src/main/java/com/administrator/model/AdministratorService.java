package com.administrator.model;

import java.util.List;

public class AdministratorService {

	private AdministratorDAO_Interface dao;

	public AdministratorService() {
		dao = new AdministratorDAO();
	}

	public AdministratorVO addAdmin(Integer admin_type_id, String admin_acc, String admin_pwd, Integer admin_isdeleted,
			String admin_name, String admin_email, String admin_mobile, Integer admin_zipcode, String admin_city,
			String admin_dist, String admin_addr, java.sql.Date admin_hiredate, java.sql.Date admin_leavedate,
			byte[] admin_pic) {

		AdministratorVO administratorVO = new AdministratorVO();

		administratorVO.setAdmin_type_id(admin_type_id);
		administratorVO.setAdmin_acc(admin_acc);
		administratorVO.setAdmin_pwd(admin_pwd);
		administratorVO.setAdmin_isdeleted(admin_isdeleted);
		administratorVO.setAdmin_name(admin_name);
		administratorVO.setAdmin_email(admin_email);
		administratorVO.setAdmin_mobile(admin_mobile);
		administratorVO.setAdmin_zipcode(admin_zipcode);
		administratorVO.setAdmin_city(admin_city);
		administratorVO.setAdmin_dist(admin_dist);
		administratorVO.setAdmin_addr(admin_addr);
		administratorVO.setAdmin_hiredate(admin_hiredate);
		administratorVO.setAdmin_leavedate(admin_leavedate);
		administratorVO.setAdmin_pic(admin_pic);
		dao.insert(administratorVO);

		return administratorVO;
	}

	public AdministratorVO updateAdmin(Integer admin_id, Integer admin_type_id, String admin_acc, String admin_pwd,
			Integer admin_isdeleted, String admin_name, String admin_email, String admin_mobile, Integer admin_zipcode,
			String admin_city, String admin_dist, String admin_addr, java.sql.Date admin_hiredate,
			java.sql.Date admin_leavedate, byte[] admin_pic) {

		AdministratorVO administratorVO = new AdministratorVO();

		administratorVO.setAdmin_id(admin_id);
		administratorVO.setAdmin_type_id(admin_type_id);
		administratorVO.setAdmin_acc(admin_acc);
		administratorVO.setAdmin_pwd(admin_pwd);
		administratorVO.setAdmin_isdeleted(admin_isdeleted);
		administratorVO.setAdmin_name(admin_name);
		administratorVO.setAdmin_email(admin_email);
		administratorVO.setAdmin_mobile(admin_mobile);
		administratorVO.setAdmin_zipcode(admin_zipcode);
		administratorVO.setAdmin_city(admin_city);
		administratorVO.setAdmin_dist(admin_dist);
		administratorVO.setAdmin_addr(admin_addr);
		administratorVO.setAdmin_hiredate(admin_hiredate);
		administratorVO.setAdmin_leavedate(admin_leavedate);
		administratorVO.setAdmin_pic(admin_pic);
		dao.update(administratorVO);

		return administratorVO;
	}

	public void deleteAdmin(Integer admin_id) {
		dao.delete(admin_id);
	}

	public AdministratorVO getOneAdmin(Integer admin_id) {
		return dao.findByPrimaryKey(admin_id);
	}

	public List<AdministratorVO> getAll() {
		return dao.getAll();
	}

}
