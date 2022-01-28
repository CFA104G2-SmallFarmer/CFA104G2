package com.projOrder.model;

import java.sql.Date;
import java.util.List;


public class ProjOrderService {
	private ProjOrderDAO_interface dao; //為了將來與框架作結合

	public ProjOrderService() {
		dao = new ProjOrderJDBCDAO();
	}

	public ProjOrderVO addProjOrder(Integer mem_id,Integer perk_id, Integer order_zipcode,
			String order_addr,String order_receiver,String order_tel, Integer order_pay) {

		ProjOrderVO projOrderVO = new ProjOrderVO();
		
		projOrderVO.setMem_id(mem_id);
		projOrderVO.setPerk_id(perk_id);
		projOrderVO.setOrder_zipcode(order_zipcode);
		projOrderVO.setOrder_addr(order_addr);
		projOrderVO.setOrder_receiver(order_receiver);
		projOrderVO.setOrder_tel(order_tel);
		projOrderVO.setOrder_pay(order_pay);
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
	//這裡對嗎？
	public List<ProjOrderVO> getAllMemOrder(Integer mem_id) {
		return dao.getAllMemOrder(mem_id);
	}
	public List<ProjOrderVO> getAllFmemOrder(Integer f_mem_id) {
		return dao.getAllFmemOrder(f_mem_id);
	}

	public List<ProjOrderVO> getAll() {
		return dao.getAll();
	}

}
