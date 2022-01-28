package com.projPic.model;

import java.util.List;


public class ProjPicService {
	private ProjPicDAO_interface dao; //為了將來與框架作結合

	public ProjPicService() {
		dao = new ProjPicJDBCDAO();
	}

	public ProjPicVO addProjPic(Integer proj_id, byte[] proj_pic) {

		ProjPicVO ProjPicVO = new ProjPicVO();
		
		ProjPicVO.setProj_id(proj_id);
		ProjPicVO.setProj_pic(proj_pic);
		
		dao.insert(ProjPicVO);

		return ProjPicVO;
	}

	public ProjPicVO updateProjPic(Integer proj_id,
			byte[] proj_pic) {
		
		ProjPicVO ProjPicVO = new ProjPicVO();
		
		ProjPicVO.setProj_id(proj_id);
		ProjPicVO.setProj_pic(proj_pic);

		dao.update(ProjPicVO);
		
		return ProjPicVO;
	}

	public void deleteProjPic(Integer proj_pic_id) {
		dao.delete(proj_pic_id);
	}

	public ProjPicVO getOneProjPic(Integer proj_pic_id ) {
		return dao.findByPrimaryKey(proj_pic_id);
	}
	
	public List<ProjPicVO> getAllSameProjPic(Integer proj_id) {
		return dao.getAllSameProj(proj_id);
	}

}
