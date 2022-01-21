package com.projReport.model;


import org.junit.jupiter.api.Test;

public class ProjReportTest {

	ProjReportJDBCDAO jdbcdao = new  ProjReportJDBCDAO();
	ProjReportVO projReport = new ProjReportVO();
	
	@Test
	public void testinsert() {
		projReport.setProj_report_id(1);
		projReport.setProj_id(1001);
		projReport.setMem_id(77000);
		projReport.setReport_reason("這文旦吃起來沒有超現實的感覺");
		projReport.setReport_time(java.sql.Date.valueOf("2022-01-02"));
		projReport.setReport_state(2);
//		projReport.setReport_note("無");
		
		
		jdbcdao.insert(projReport);
	}
	
//	@Test
//	public void testupdte() {

//		projReport.setProj_report_id(1);
//		projReport.setProj_id(1001);
//		projReport.setMem_id(77000);
//		projReport.setReport_reason("這文旦吃起來沒有超現實的感覺");
//  	projReport.setReport_time(java.sql.Date.valueOf("2022-01-02"));
//		projReport.setReport_state(2);
//		projReport.setReport_note("無");
//		
//		
//		jdbcdao.update(projReport);
//	}
//	
//	@Test
//	public void testdelete() {
//		jdbcdao.delete(1);
//	}
//	
//	
//
//	@Test
//	public void testfindByPrimaryKey() {
//		projReportVO projReport = jdbcdao.findByPrimaryKey(1001);
//		System.out.println(projReport);
//	}
//
//	@Test
//	public void testgetAll() {
//		List<projReportVO> list = jdbcdao.getAll();
//		for (projReportVO projReport : list) {
//			System.out.println(projReport.getProj_report_id() + ",");
//			System.out.println(projReport.getProj_id() + ",");
//			System.out.println(projReport.getMem_id() + ",");
//			System.out.println(projReport.getReport_reason() + ",");
//			System.out.println(projReport.getReport_time() + ",");
//			System.out.println(projReport.getReport_state() + ",");
//			System.out.println(projReport.getReport_note() + ",");
//			
//			System.out.println("okok");
//		}
//	}
//
}
