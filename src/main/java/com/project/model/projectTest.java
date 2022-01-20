package com.project.model;


import org.junit.jupiter.api.Test;

public class projectTest {

	ProjectJDBCDAO jdbcdao = new  ProjectJDBCDAO();
	ProjectVO project = new ProjectVO();
	
	@Test
	public void testinsert() {
		project.setProj_id(1002);
		project.setF_mem_id(50000);
		project.setProj_name("monalisa");
		project.setProj_state(1);
//		project.setProj_main_pic();
		project.setProj_abstract("masterpiece");
		project.setProj_goal(100000);
		project.setStart_date(java.sql.Date.valueOf("2022-01-03"));
		project.setExcepted_end_date(java.sql.Date.valueOf("2022-01-03"));
		project.setActual_end_date(java.sql.Date.valueOf("2022-01-03"));
		project.setProj_total_fund(1000);
		project.setProj_intro("在文旦樹掛上世界名畫，讓文旦更甜更好吃");
		project.setProj_risk("颱風來了很危險，畫跟文旦都會被吹走");
		project.setProj_total_count(1);
		project.setProj_video("https://www.youtube.com/watch?v=072tU1tamd0");
		project.setMem_report_count(0);
		project.setProj_pay(0);
		
		jdbcdao.insert(project);
	}
	
//	@Test
//	public void testupdte() {
//	// A database error occured. No value specified for parameter 18
//		project.setProj_id(1002);
//		project.setF_mem_id(50000);
//		project.setProj_name("monalisa");
//		project.setProj_state(1);
////		project.setProj_main_pic();
//		project.setProj_abstract("masterpiece");
//		project.setProj_goal(100000);
//		project.setStart_date(java.sql.Date.valueOf("2022-01-03"));
//		project.setExcepted_end_date(java.sql.Date.valueOf("2022-01-03"));
//		project.setActual_end_date(java.sql.Date.valueOf("2022-01-03"));
//		project.setProj_total_fund(1000);
//		project.setProj_intro("在文旦樹掛上世界名畫，讓文旦更甜更好吃");
//		project.setProj_risk("颱風來了很危險，畫跟文旦都會被吹走");
//		project.setProj_total_count(2);
//		project.setProj_video("https://www.youtube.com/watch?v=072tU1tamd0");
//		project.setMem_report_count(0);
//		project.setProj_pay(0);
//		
//		jdbcdao.update(project);
//	}
//	
//	@Test
//	public void testdelete() {
//		jdbcdao.delete(1002);
//	}
//	
//	
//
//	@Test
//	public void testfindByPrimaryKey() {
//		ProjectVO project = jdbcdao.findByPrimaryKey(1001);
//		System.out.println(project);
//	}
//
//	@Test
//	public void testgetAll() {
//		List<ProjectVO> list = jdbcdao.getAll();
//		for (ProjectVO project : list) {
//			System.out.println(project.getProj_id() + ",");
//			System.out.println(project.getF_mem_id() + ",");
//			System.out.println(project.getProj_name() + ",");
//			System.out.println(project.getProj_state() + ",");
//			System.out.println(project.getProj_main_pic() + ",");
//			System.out.println(project.getProj_abstract() + ",");
//			System.out.println(project.getProj_goal() + ",");
//			System.out.println(project.getStart_date() + ",");
//			System.out.println(project.getExcepted_end_date() + ",");
//			System.out.println(project.getActual_end_date() + ",");
//			System.out.println(project.getProj_total_fund() + ",");
//			System.out.println(project.getProj_intro() + ",");
//			System.out.println(project.getProj_risk() + ",");
//			System.out.println(project.getProj_total_count() + ",");
//			System.out.println(project.getProj_video() + ",");
//			System.out.println(project.getMem_report_count() + ",");
//			System.out.println(project.getProj_pay() + ",");
//			
//			System.out.println("okok");
//		}
//	}
//
}
