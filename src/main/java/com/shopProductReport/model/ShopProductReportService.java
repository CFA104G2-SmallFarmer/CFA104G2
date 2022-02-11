package com.shopProductReport.model;

import java.util.List;

public class ShopProductReportService {
	private ShopProductReportDAO_interface dao;
	
	public ShopProductReportService() {
		dao = new ShopProductReportJDBCDAO();
	}
	public ShopProductReportVO addReportVO(Integer mem_id, Integer prod_id,String report_reason,
			java.sql.Date report_time,Integer report_state,String report_note ) {
		
		ShopProductReportVO shopProductReportVO = new ShopProductReportVO();
		
		shopProductReportVO.setMem_id(mem_id);
		shopProductReportVO.setProd_id(prod_id);
		shopProductReportVO.setReport_reason(report_reason);
		shopProductReportVO.setReport_time(report_time);
		shopProductReportVO.setReport_state(report_state);
		shopProductReportVO.setReport_note(report_note);
		dao.insert(shopProductReportVO);
		
		return shopProductReportVO;
		
	}
	public ShopProductReportVO updateReportVO(Integer prod_report_no,Integer mem_id, Integer prod_id,String report_reason,
			java.sql.Date report_time,Integer report_state,String report_note) {
		
		ShopProductReportVO shopProductReportVO = new ShopProductReportVO();
		
		shopProductReportVO.setProd_report_no(prod_report_no);
		shopProductReportVO.setMem_id(mem_id);
		shopProductReportVO.setProd_id(prod_id);
		shopProductReportVO.setReport_reason(report_reason);
		shopProductReportVO.setReport_time(report_time);
		shopProductReportVO.setReport_state(report_state);
		shopProductReportVO.setReport_note(report_note);
		dao.update(shopProductReportVO);
		
		return shopProductReportVO;
		
	}
	public void deleteReport(Integer prod_report_no) {
		dao.delete(prod_report_no);
	}

	public ShopProductReportVO getOneReport(Integer prod_report_no) {
		return dao.findByPrimaryKey(prod_report_no);
	}

	public List<ShopProductReportVO> getAll() {
		return dao.getAll();
	}
	

}
