package com.project.model;

import java.sql.Date;
import java.util.Base64;
import java.util.List;

public class ProjectService {
	private ProjectDAO_interface dao; // 為了將來與框架作結合

	public ProjectService() {
		dao = new ProjectJDBCDAO();
	}

	public ProjectVO addProject(Integer f_mem_id,String proj_name,
			byte[] proj_main_pic,String proj_abstract,
			Integer proj_goal,Date expected_end_date,String  proj_intro,
			String proj_risk,String proj_video,Integer proj_pay) {

		ProjectVO projectVO = new ProjectVO();

		projectVO.setF_mem_id(f_mem_id);
		projectVO.setProj_name(proj_name);
		projectVO.setProj_main_pic(proj_main_pic);
		projectVO.setProj_abstract(proj_abstract);
		projectVO.setProj_goal(proj_goal);
		projectVO.setExpected_end_date(expected_end_date);
		projectVO.setProj_intro(proj_intro);
		projectVO.setProj_risk(proj_risk);
		projectVO.setProj_video(proj_video);
		projectVO.setProj_pay(proj_pay);
		
		dao.insert(projectVO);

//		String proj_name1 = "11111113";	
//		projectVO.setProj_name(proj_name1);	
//		dao.insert(projectVO);
		
		getAllSameFmemProject(f_mem_id);

		int j= 0;
		
		for (int i=0; i<getAllSameFmemProject(f_mem_id).size(); i++) {
			if (getAllSameFmemProject(f_mem_id).get(i).getProj_name().equals(proj_name)) {
				j= i;
//				System.out.println(getAllSameFmemProject(f_mem_id).get(i).getProj_name());
			}
//			System.out.println(i);
		}
//		System.out.println(j);
//		System.out.println(getAllSameFmemProject(f_mem_id).get(j).getProj_name());
		return getOneProject(getAllSameFmemProject(f_mem_id).get(j).getProj_id());
	}

	public ProjectVO updateProjectDetail( String proj_name,
			Integer proj_state,byte[] proj_main_pic,String proj_abstract,
			Integer  proj_goal,Date expected_end_date,
			Date actual_end_date,Integer proj_total_fund,String  proj_intro,
			String proj_risk,Integer  proj_total_count,
			String  proj_video,Integer mem_report_count,Integer proj_pay, Integer proj_id )  {

		ProjectVO projectVO = new ProjectVO();

		projectVO.setProj_name(proj_name);
		projectVO.setProj_state(proj_state);
		projectVO.setProj_main_pic(proj_main_pic);
		projectVO.setProj_abstract(proj_abstract);
		projectVO.setProj_goal(proj_goal);
		projectVO.setExpected_end_date(expected_end_date);
		projectVO.setActual_end_date(actual_end_date);
		projectVO.setProj_total_fund(proj_total_fund);
		projectVO.setProj_intro(proj_intro);
		projectVO.setProj_risk(proj_risk);
		projectVO.setProj_total_count(proj_total_count);
		projectVO.setProj_video(proj_video);
		projectVO.setMem_report_count(mem_report_count);
		projectVO.setProj_pay(proj_pay);
		projectVO.setProj_id(proj_id);


		dao.update(projectVO);

		return projectVO;
	}

//更新PROJ_TOTAL_FUND及PROJ_TOTAL_COUNT(完全體，底下兩個方法用不到了)
	public void UpdateOneProjTotalFund(Integer proj_id) {
		dao.autoUpdateProjTotalFundAndCount(proj_id);
	};

//更新PROJ_TOTAL_COUNT(當有人遞交order時，針對PROJ_TOTAL_COUNT+1)
	public ProjectVO UpdateProjTotalCountByAddOne(String proj_name,
			Integer proj_state,byte[] proj_main_pic,String proj_abstract,
			Integer  proj_goal,Date expected_end_date,
			Date actual_end_date,Integer proj_total_fund,String  proj_intro,
			String proj_risk,Integer  proj_total_count,
			String  proj_video,Integer mem_report_count,Integer proj_pay, Integer proj_id ) {
		ProjectVO projectVO = new ProjectVO();

		projectVO.setProj_name(proj_name);
		projectVO.setProj_state(proj_state);
		projectVO.setProj_main_pic(proj_main_pic);
		projectVO.setProj_abstract(proj_abstract);
		projectVO.setProj_goal(proj_goal);
		projectVO.setExpected_end_date(expected_end_date);
		projectVO.setActual_end_date(actual_end_date);
		projectVO.setProj_total_fund(proj_total_fund);
		projectVO.setProj_intro(proj_intro);
		projectVO.setProj_risk(proj_risk);
		
		proj_total_count=proj_total_count+1;
		projectVO.setProj_total_count(proj_total_count);
		
		projectVO.setProj_video(proj_video);
		projectVO.setMem_report_count(mem_report_count);
		projectVO.setProj_pay(proj_pay);
		projectVO.setProj_id(proj_id);


		dao.update(projectVO);

		return projectVO;
	};

	
	//更新PROJ_TOTAL_COUNT(當有人取消order時，針對PROJ_TOTAL_COUNT-1)
	public ProjectVO UpdateProjTotalCountBySubOne(String proj_name,
			Integer proj_state,byte[] proj_main_pic,String proj_abstract,
			Integer  proj_goal,Date expected_end_date,
			Date actual_end_date,Integer proj_total_fund,String  proj_intro,
			String proj_risk,Integer  proj_total_count,
			String  proj_video,Integer mem_report_count,Integer proj_pay, Integer proj_id ) {
		ProjectVO projectVO = new ProjectVO();

		projectVO.setProj_name(proj_name);
		projectVO.setProj_state(proj_state);
		projectVO.setProj_main_pic(proj_main_pic);
		projectVO.setProj_abstract(proj_abstract);
		projectVO.setProj_goal(proj_goal);
		projectVO.setExpected_end_date(expected_end_date);
		projectVO.setActual_end_date(actual_end_date);
		projectVO.setProj_total_fund(proj_total_fund);
		projectVO.setProj_intro(proj_intro);
		projectVO.setProj_risk(proj_risk);
		
		proj_total_count=proj_total_count-1;
		projectVO.setProj_total_count(proj_total_count);
		
		projectVO.setProj_video(proj_video);
		projectVO.setMem_report_count(mem_report_count);
		projectVO.setProj_pay(proj_pay);
		projectVO.setProj_id(proj_id);


		dao.update(projectVO);

		return projectVO;
	};

	
	
//更新MEM_REPORT_COUNT(當有人遞交report時，針對MEM_REPORT_COUNT+1)
	public ProjectVO autoUpdateMem_report_Count(Integer proj_id, Integer f_mem_id,String proj_name,
			Integer proj_state,byte[] proj_main_pic,String proj_abstract,
			Integer  proj_goal,Date  start_date,Date expected_end_date,
			Date actual_end_date,Integer proj_total_fund,String  proj_intro,
			String proj_risk,Integer  proj_total_count,
			String  proj_video,Integer mem_report_count,Integer  proj_pay) {
		ProjectVO projectVO = new ProjectVO();

		projectVO.setProj_name(proj_name);
		projectVO.setProj_state(proj_state);
		projectVO.setProj_main_pic(proj_main_pic);
		projectVO.setProj_abstract(proj_abstract);
		projectVO.setProj_goal(proj_goal);
		projectVO.setExpected_end_date(expected_end_date);
		projectVO.setActual_end_date(actual_end_date);
		projectVO.setProj_total_fund(proj_total_fund);
		projectVO.setProj_intro(proj_intro);
		projectVO.setProj_risk(proj_risk);
		projectVO.setProj_total_count(proj_total_count);
		projectVO.setProj_video(proj_video);
		
		mem_report_count=mem_report_count+1;
		projectVO.setMem_report_count(mem_report_count);
		
		projectVO.setProj_pay(proj_pay);
		projectVO.setProj_id(proj_id);


		dao.update(projectVO);

		return projectVO;
	};
	
	
	public void deleteProject(Integer proj_id) {
		dao.delete(proj_id);
	}

	public ProjectVO getOneProject(Integer proj_id) {
		return dao.findByPrimaryKey(proj_id);
	}

	public List<ProjectVO> getAllSameFmemProject(Integer f_mem_id) {
		return dao.getAllSameFmem(f_mem_id);
	}

	public List<ProjectVO> getAllProject() {
		return dao.getAll();
	}

}
