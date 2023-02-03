package com.projDiscussion.model;

import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class ProjDiscussionService {
	private ProjDiscussionDAO_interface dao; // 為了將來與框架作結合

	public ProjDiscussionService() {
		dao = new ProjDiscussionJDBCDAO();
	}

	public List<ProjDiscussionVO> updateFirstLayerProjDiscussion(Integer proj_id) {

		List<ProjDiscussionVO> list = dao.getFirstLayerByID(proj_id);

		for (int i = 0; i < list.size(); i++) {
			ProjDiscussionVO projDiscussionVO = list.get(i);
			Integer comment_id = projDiscussionVO.getComment_id();
			projDiscussionVO.setDiscussion_id(comment_id);
			dao.updateFirstLayer(projDiscussionVO);
			System.out.println("comment_id："+comment_id);
		}

		List<ProjDiscussionVO> list2 = dao.getFirstLayerByID(proj_id);
		
		System.out.println("資料庫更新成功");
		return list2;
	}

	public ProjDiscussionVO addProjDiscussion(Integer proj_id, Integer discussion_id, Integer mem_id, Integer f_mem_id,
			String comment_content) {

		ProjDiscussionVO projDiscussionVO = new ProjDiscussionVO();

		projDiscussionVO.setProj_id(proj_id);
		projDiscussionVO.setDiscussion_id(discussion_id);
		projDiscussionVO.setMem_id(mem_id);
		projDiscussionVO.setF_mem_id(f_mem_id);
		projDiscussionVO.setComment_content(comment_content);

		dao.insert(projDiscussionVO);

		return projDiscussionVO;
	}

	public ProjDiscussionVO updateProjDiscussion(Integer comment_id, String comment_content) {

		ProjDiscussionVO projDiscussionVO = new ProjDiscussionVO();

		projDiscussionVO.setMem_id(comment_id);
		projDiscussionVO.setComment_content(comment_content);

		dao.update(projDiscussionVO);

		return projDiscussionVO;
	}

	public void deleteProjDiscussion(Integer comments_id) {
		dao.delete(comments_id);
	}

	public List<ProjDiscussionVO> getAllSameProjDiscussion(Integer proj_id) {
		return dao.getAll(proj_id);
	}

}
