package com.projDiscussion.model;

import org.junit.jupiter.api.Test;

public class ProjDiscussionTest {

	ProjDiscussionJDBCDAO jdbcdao = new  ProjDiscussionJDBCDAO();
	ProjDiscussionVO projDiscussion = new ProjDiscussionVO();
	
	@Test
	public void testinsert() {
		projDiscussion.setComment_id(4);
		projDiscussion.setProj_id(1001);
		projDiscussion.setDiscussion_id(1);
		projDiscussion.setMem_id(77000);
		projDiscussion.setF_mem_id(50000);
		projDiscussion.setComment_date(java.sql.Date.valueOf("2022-01-02"));
		projDiscussion.setComment_content("I am 18");
		
		jdbcdao.insert(projDiscussion);
	}
	
//	@Test
//	public void testupdte() {
//		
//		projDiscussion.setDiscussion_id(10);
//		projDiscussion.setMem_id(100);
//		projDiscussion.setF_mem_id(4);
//		projDiscussion.setComment_date(java.sql.Date.valueOf("2022-01-02"));
//		
//		projDiscussion.setComment_id(1);
//		projDiscussion.setProj_id(1);
//		
//		jdbcdao.update(projDiscussion);
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
//		ProjDiscussionVO projDiscussion = jdbcdao.findByPrimaryKey(1);
//		System.out.println(projDiscussion);
//	}
//
//	@Test
//	public void testgetAll() {
//		List<ProjDiscussionVO> list = jdbcdao.getAll();
//		for (ProjDiscussionVO projDiscussion : list) {
//			System.out.print(projDiscussion.getComment_id() + ",");
//			System.out.print(projDiscussion.getProj_id() + ",");
//			System.out.print(projDiscussion.getDiscussion_id() + ",");
//			System.out.print(projDiscussion.getMem_id() + ",");
//			System.out.print(projDiscussion.getF_mem_id() + ",");
//			System.out.print(projDiscussion.getComment_date() + ",");
//			
//			System.out.println("okok");
//		}
//	}
//
}
