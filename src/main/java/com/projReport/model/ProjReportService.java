package com.projReport.model;

import java.sql.Date;
import java.util.List;


public class ProjReportService {
	private ProjReportDAO_interface dao; //為了將來與框架作結合

	public ProjReportService() {
		dao = new ProjReportJDBCDAO();
	}

	public ProjReportVO addProjReport(Integer proj_id,Integer mem_id, String report_reason
			) {

		ProjReportVO ProjReportVO = new ProjReportVO();
		
		ProjReportVO.setProj_id(proj_id);
		ProjReportVO.setMem_id(mem_id);
		ProjReportVO.setReport_reason(report_reason);

		dao.insert(ProjReportVO);

		return ProjReportVO;
	}

	public ProjReportVO updateProjReport(Integer report_state,
			String report_note,Integer proj_report_id) {
		
		ProjReportVO ProjReportVO = new ProjReportVO();
		
		ProjReportVO.setReport_state(report_state);
		ProjReportVO.setReport_note(report_note);
		ProjReportVO.setProj_report_id(proj_report_id);

		dao.update(ProjReportVO);
		
		return ProjReportVO;
	}

	public List<ProjReportVO> getAllProjReport() {
		return dao.getAll();
	}

}
