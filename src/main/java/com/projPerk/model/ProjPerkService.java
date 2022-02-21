package com.projPerk.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import com.project.model.ProjectService;

public class ProjPerkService {
	private ProjPerkDAO_interface dao; // 為了將來與框架作結合

	public ProjPerkService() {
		dao = new ProjPerkJDBCDAO(); // new出工人
	}

	public ProjPerkVO addProjPerk(Integer proj_id, byte[] perk_pic, String perk_intro, Integer perk_fund,
			Integer perk_limited, Date perk_ship_date, String perk_ship_area, String perk_abbr_name) {

		ProjPerkVO projPerkVO2 = new ProjPerkVO();
		projPerkVO2.setProj_id(proj_id);

		projPerkVO2.setPerk_pic(perk_pic);

		projPerkVO2.setPerk_intro(perk_intro);
		projPerkVO2.setPerk_fund(perk_fund);
		projPerkVO2.setPerk_limited(perk_limited);
		projPerkVO2.setPerk_ship_date(perk_ship_date);/////
		projPerkVO2.setPerk_ship_area(perk_ship_area);
		projPerkVO2.setPerk_abbr_name(perk_abbr_name);

		dao.insert(projPerkVO2);

		return projPerkVO2;
	}

	public ProjPerkVO updateProjPerk(byte[] perk_pic, String perk_intro, Integer perk_fund, Integer perk_limited,
			Date perk_ship_date, String perk_ship_area, String perk_abbr_name, Integer perk_id) {

		ProjPerkVO projPerkVO2 = new ProjPerkVO();
		projPerkVO2.setPerk_pic(perk_pic);

		projPerkVO2.setPerk_intro(perk_intro);
		projPerkVO2.setPerk_fund(perk_fund);
		projPerkVO2.setPerk_limited(perk_limited);
		System.out.println("service這邊" + perk_abbr_name);
		projPerkVO2.setPerk_ship_date(perk_ship_date);
		projPerkVO2.setPerk_ship_area(perk_ship_area);
		projPerkVO2.setPerk_abbr_name(perk_abbr_name);
		projPerkVO2.setPerk_id(perk_id);

		dao.update(projPerkVO2);

		return projPerkVO2;
	}

//	更新perk total count、PROJ_TOTAL_FUND及PROJ_TOTAL_COUNT(完全體)
	public void autoUpdateTotalCountAFund(Integer perk_id) {
//		先更perk total count
		dao.autoUpdatePerkTotalCount(perk_id);
		
//		再更PROJ_TOTAL_FUND及PROJ_TOTAL_COUNT
		ProjPerkVO projPerkVO = new ProjPerkVO();
		projPerkVO = dao.findByPrimaryKey(perk_id);

		Integer proj_id = projPerkVO.getProj_id();

		ProjectService projectSvc = new ProjectService();
		projectSvc.UpdateOneProjTotalFund(proj_id);
		
	};

	public void deleteProjPerk(Integer perk_id) {
		dao.delete(perk_id);
	}

	public ProjPerkVO getOneProjPerk(Integer perk_id) {

		return dao.findByPrimaryKey(perk_id);
	}

	public List<ProjPerkVO> getAll(Integer proj_id) {
		return dao.getAll(proj_id);
	}

	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];// 長度，資料流多少bytes
		fis.read(buffer);// 讀進byte陣列裡
		fis.close();
		return buffer; // 回傳byte[]
	}

}
