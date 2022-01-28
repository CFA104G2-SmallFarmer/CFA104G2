package com.projDiscussion.model;

import java.util.List;


public class ProjDiscussionService {
	private ProjDiscussionDAO_interface dao; //為了將來與框架作結合

	public ProjDiscussionService() {
		dao = new ProjDiscussionJDBCDAO();
	}

	public ProjDiscussionVO addProjDiscussion(Integer proj_id,Integer discussion_id, Integer mem_id,
			Integer f_mem_id,String comment_content) {

		ProjDiscussionVO projDiscussionVO = new ProjDiscussionVO();
		
		projDiscussionVO.setProj_id(proj_id);
		projDiscussionVO.setDiscussion_id(discussion_id);
		projDiscussionVO.setMem_id(mem_id);
		projDiscussionVO.setF_mem_id(f_mem_id);
		projDiscussionVO.setComment_content(comment_content);
		
		dao.insert(projDiscussionVO);

		return projDiscussionVO;
	}

	public ProjDiscussionVO updateProjDiscussion(Integer comment_id,
			String comment_content) {
		
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
