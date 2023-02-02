package com.projOrder.model;

import com.projPerk.model.ProjPerkDAO_interface;
import com.projPerk.model.ProjPerkJDBCDAO;
import com.projPerk.model.ProjPerkVO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;



public class ProjOrderService {
	private ProjOrderDAO_interface dao; //為了將來與框架作結合

	private ProjPerkDAO_interface perk_dao; //為了將來與框架作結合

	public ProjOrderService() {
		dao = new ProjOrderJDBCDAO();
		perk_dao = new ProjPerkJDBCDAO();
	}

	public ProjOrderVO addProjOrder(Integer mem_id,Integer perk_id, Integer order_zipcode,
			String order_addr,String order_receiver,String order_tel, Integer order_pay, String order_number_str) {

		ProjOrderVO projOrderVO = new ProjOrderVO();
		
		
		projOrderVO.setMem_id(mem_id);
		projOrderVO.setPerk_id(perk_id);
		projOrderVO.setOrder_zipcode(order_zipcode);
		projOrderVO.setOrder_addr(order_addr);
		projOrderVO.setOrder_receiver(order_receiver);
		projOrderVO.setOrder_tel(order_tel);
		projOrderVO.setOrder_pay(order_pay);
		projOrderVO.setOrder_number(order_number_str);
		dao.insert(projOrderVO);

		return projOrderVO;
	}

	public ProjOrderVO updateProjOrder(Integer order_zipcode,
			String order_addr,String order_receiver,String order_tel,Integer  order_state, 
			Date order_ship_time,Date order_completion_time,Date  order_cancel_time,
			Integer order_cancel_reason,Integer order_id) {
		
		ProjOrderVO projOrderVO2 = new ProjOrderVO();
		
		projOrderVO2.setOrder_zipcode(order_zipcode);
		projOrderVO2.setOrder_addr(order_addr);
		projOrderVO2.setOrder_receiver(order_receiver);
		projOrderVO2.setOrder_tel(order_tel);
		projOrderVO2.setOrder_state(order_state);
		
		projOrderVO2.setOrder_ship_time(order_ship_time);
		projOrderVO2.setOrder_completion_time(order_completion_time);
		projOrderVO2.setOrder_cancel_time(order_cancel_time);
		projOrderVO2.setOrder_cancel_reason(order_cancel_reason);

		projOrderVO2.setOrder_id(order_id);
		
		dao.update(projOrderVO2);
		
		return projOrderVO2;
	}

	public void deleteProjOrder(Integer order_id) {
		dao.delete(order_id);
	}

	public ProjOrderVO getOneProjOrder(Integer order_id) {
		return dao.findByPrimaryKey(order_id);
	}

	public ProjOrderVO getOneProjOrderByOrderNumber(String order_number) {
		return dao.findByOrderNumber(order_number);
	}

	public ProjOrderVO getOneProjOrderByMem(Integer order_id, Integer mem_id) {

		List<ProjOrderVO> list = dao.getAllMemOrder(mem_id);
		ProjOrderVO oneResult = new ProjOrderVO(); 
		
		for (int i=0; i<list.size(); i++) {
			if(list.get(i).getOrder_id() == order_id) {
				oneResult=list.get(i);
			}
		}
		return oneResult;
	}
	
	
	public ProjOrderVO getOneProjOrderByFMem(Integer order_id, Integer f_mem_id) {
		System.out.println(order_id+"JDBC");
		System.out.println(f_mem_id+"JDBC");
		List<ProjOrderVO> list = dao.getAllFmemOrder(f_mem_id);
//		System.out.println(list.size());
		ProjOrderVO oneResult = new ProjOrderVO(); 
		
		for (int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i).getOrder_id());
			if(list.get(i).getOrder_id().equals(order_id)) {
				oneResult=list.get(i);
//				System.out.println(list.get(i).getOrder_id());
			}
		}
//		System.out.println(oneResult.getOrder_id());
		return oneResult;
	}


	
	//這裡對嗎？
	public List<ProjOrderVO> getAllMemOrder(Integer mem_id) {
		return dao.getAllMemOrder(mem_id);
	}
	public List<ProjOrderVO> getAllFmemOrder(Integer f_mem_id) {
		return dao.getAllFmemOrder(f_mem_id);
	}
	
	public Map<Integer, List<ProjOrderVO>> getAll_groupingBy_order_state(Integer f_mem_id){
		List<ProjOrderVO> projOrderList = dao.getAllFmemOrder(f_mem_id);
		Map<Integer, List<ProjOrderVO>> groupMap = new HashMap<>();
		groupMap = projOrderList.stream().collect(Collectors.groupingBy(ProjOrderVO::getOrder_state));
	
		return groupMap;
	}
	
	public List<ProjOrderVO> getAll() {
		return dao.getAll();
	}


	public Integer getOrder_price(ProjOrderVO projOrderVO){
		Integer perk_id=projOrderVO.getPerk_id();
		ProjPerkVO projPerkVO = perk_dao.findByPrimaryKey(perk_id);
		return projPerkVO.getPerk_fund();
	}

	public String getPerk_name(ProjOrderVO projOrderVO){
		Integer perk_id=projOrderVO.getPerk_id();
		ProjPerkVO projPerkVO = perk_dao.findByPrimaryKey(perk_id);
		return projPerkVO.getPerk_abbr_name();
	}


	public static void main(String[] args) {
	ProjOrderJDBCDAO dao = new ProjOrderJDBCDAO();
	List<ProjOrderVO> projOrderList = dao.getAllFmemOrder(70003);
	Map<Integer, List<ProjOrderVO>> groupMap = new HashMap<>();

	// Collect CO Executives
	groupMap = projOrderList.stream().collect(Collectors.groupingBy(ProjOrderVO::getOrder_state));

	System.out.println("\n== ProjOrders by Order_state ==");
	groupMap.forEach((k, v) -> {
		System.out.println("\nOrder_state: " + k);
		System.out.println(v);
//		v.forEach(Employee::printSummary);
	});
}

}
