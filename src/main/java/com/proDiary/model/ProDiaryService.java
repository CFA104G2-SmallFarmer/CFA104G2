package com.proDiary.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


public class ProDiaryService {
//	private ProDiaryDAO_interface dao; //為了將來與框架作結合
	private ProDiaryDAO_interface dao; //為了將來與框架作結合

	public ProDiaryService() {
		dao = new ProDiaryJDBCDAO();
	}

	public ProDiaryVO addProDiary(Integer proj_id,Date dir_upload_date,String dir_procedure,String dir_product
			,String dir_emoji,String dir_notes,Integer dir_upload_state,byte[] dir_pic) {

		ProDiaryVO proDiaryVO2 = new ProDiaryVO();
		proDiaryVO2.setProj_id(proj_id);
		proDiaryVO2.setDir_upload_date(dir_upload_date);
		proDiaryVO2.setDir_procedure(dir_procedure);
		proDiaryVO2.setDir_product(dir_product);
//		proDiaryVO2.setDir_equipment(dir_equipment);
//		proDiaryVO2.setDir_material(dir_material);
		proDiaryVO2.setDir_emoji(dir_emoji);
		proDiaryVO2.setDir_notes(dir_notes);
		proDiaryVO2.setDir_upload_state(dir_upload_state);
		proDiaryVO2.setDir_pic(dir_pic);
	
		dao.insert(proDiaryVO2);

		return proDiaryVO2;
	}

	public ProDiaryVO updateProDiary(Date dir_upload_date,String dir_procedure,String dir_product
			,String dir_emoji,String dir_notes,Integer dir_upload_state,byte[] dir_pic,Integer dir_id) {
		
		ProDiaryVO proDiaryVO2 = new ProDiaryVO();
		

		proDiaryVO2.setDir_upload_date(dir_upload_date);
		proDiaryVO2.setDir_procedure(dir_procedure);
		proDiaryVO2.setDir_product(dir_product);
//		proDiaryVO2.setDir_equipment(dir_equipment);
//		proDiaryVO2.setDir_material(dir_material);
		proDiaryVO2.setDir_emoji(dir_emoji);
		proDiaryVO2.setDir_notes(dir_notes);
		proDiaryVO2.setDir_upload_state(dir_upload_state);
		proDiaryVO2.setDir_pic(dir_pic);
		proDiaryVO2.setDir_id(dir_id);
	

		dao.update(proDiaryVO2);
		
		return proDiaryVO2;
	}

	public void deleteProDiary(Integer dir_id) {
		dao.delete(dir_id);
	}

	public ProDiaryVO getOneProDiary(Integer dir_id) {

		return dao.findByPrimaryKey(dir_id);
	}
	
	

	public List<ProDiaryVO> getAllSameDay(Integer proj_id, Date dir_upload_date) {

		
		return dao.getAllSameDay(proj_id,dir_upload_date);
	}
	public List<ProDiaryVO> getAll(Integer proj_id) {
		return dao.getAll(proj_id);
	}
	
	public Map<Date, List<ProDiaryVO>> getAll_groupingBy_date(Integer proj_id){
		List<ProDiaryVO> proDiaryList = dao.getAll(proj_id);
		Map<Date, List<ProDiaryVO>> groupMap = new HashMap<>();
		groupMap = proDiaryList.stream().collect(Collectors.groupingBy(ProDiaryVO::getDir_upload_date));
		
		
		return groupMap;
	}
	
	
//	public static void main(String[] args) {
//		ProDiaryJDBCDAO dao = new ProDiaryJDBCDAO();
//		List<ProDiaryVO> proDiaryList = dao.getAll(1001);
//		Map<Date, List<ProDiaryVO>> groupMap = new HashMap<>();
//
//		// Collect CO Executives
//		groupMap = proDiaryList.stream().collect(Collectors.groupingBy(ProDiaryVO::getDir_upload_date));
//
//		System.out.println("\n== ProDiaryVOs by dir_upload_state ==");
//		groupMap.forEach((k, v) -> {
//			System.out.println("\ndir_upload_state: " + k);
//			System.out.println(v);
////			v.forEach(Employee::printSummary);
//		});
//	}
	

	


}
