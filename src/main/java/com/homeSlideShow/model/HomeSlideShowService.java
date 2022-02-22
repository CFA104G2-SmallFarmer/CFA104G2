package com.homeSlideShow.model;

import java.util.List;

public class HomeSlideShowService {

	private HomeSlideShowDAO_Interface dao;

	public HomeSlideShowService() {
		dao = new HomeSlideShowDAO();
	}

	public HomeSlideShowVO addHSS(Integer admin_id, byte[] hss_img, String hss_text, java.sql.Date hss_time,
			Integer hss_state, java.sql.Date hss_on_shelf, java.sql.Date hss_off_shelf) {
		
		HomeSlideShowVO homeSlideShowVO = new HomeSlideShowVO();
		
		homeSlideShowVO.setAdmin_id(admin_id);
		homeSlideShowVO.setHss_img(hss_img);
		homeSlideShowVO.setHss_text(hss_text);
		homeSlideShowVO.setHss_time(hss_time);
		homeSlideShowVO.setHss_state(hss_state);
		homeSlideShowVO.setHss_on_shelf(hss_on_shelf);
		homeSlideShowVO.setHss_off_shelf(hss_off_shelf);
		dao.insert(homeSlideShowVO);

		return homeSlideShowVO;
	}
	
	public HomeSlideShowVO updateHSS(Integer hss_id, Integer admin_id, byte[] hss_img, String hss_text, java.sql.Date hss_time,
			Integer hss_state, java.sql.Date hss_on_shelf, java.sql.Date hss_off_shelf) {
		
		HomeSlideShowVO homeSlideShowVO = new HomeSlideShowVO();
		
		homeSlideShowVO.setHss_id(hss_id);
		homeSlideShowVO.setAdmin_id(admin_id);
		homeSlideShowVO.setHss_img(hss_img);
		homeSlideShowVO.setHss_text(hss_text);
		homeSlideShowVO.setHss_time(hss_time);
		homeSlideShowVO.setHss_state(hss_state);
		homeSlideShowVO.setHss_on_shelf(hss_on_shelf);
		homeSlideShowVO.setHss_off_shelf(hss_off_shelf);
		dao.update(homeSlideShowVO);

		return homeSlideShowVO;
	}
	
	public void deleteHSS(Integer hss_id) {
		dao.delete(hss_id);
	}
	
	public HomeSlideShowVO getOneHSS(Integer hss_id) {
		return dao.findByPrimaryKey(hss_id);
	}
	
	public List<HomeSlideShowVO> getAll(){
		return dao.getAll();
	}

}
