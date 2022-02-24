package com.shopOrder.model;

import java.util.List;

import com.shopOrderDetails.model.ShopOrderDetailsVO;

public class ShopOrderService {

	private ShopOrderDAO_interface dao;
	
	public ShopOrderService() {
		dao = new  ShopOrderJDBCDAO();
	}
	
	public ShopOrderVO addShopOrder(Integer order_id,Integer mem_id,Integer f_mem_id,String order_add,
			String order_receiver,String order_tel,Integer order_amount,String order_memo,Integer order_payment) {
	
		ShopOrderVO shopOrderVO = new ShopOrderVO();
		
		shopOrderVO.setMem_id(mem_id);
		shopOrderVO.setF_mem_id(f_mem_id);
		shopOrderVO.setOrder_add(order_add);
		shopOrderVO.setOrder_receiver(order_receiver);
		shopOrderVO.setOrder_tel(order_tel);
		shopOrderVO.setOrder_amount(order_amount);
		shopOrderVO.setOrder_memo(order_memo);
		shopOrderVO.setOrder_payment(order_payment);
		dao.insert(shopOrderVO);
		
		return shopOrderVO;
	}
	
	public ShopOrderVO updateShopOrder(String order_add,String order_receiver,String order_tel,
			String order_memo,Integer order_state,
			java.sql.Date order_ship_date,java.sql.Date order_finish_date,java.sql.Date order_cancel_date,Integer order_id) {
	
		ShopOrderVO shopOrderVO = new ShopOrderVO();
		
		shopOrderVO.setOrder_add(order_add);
		shopOrderVO.setOrder_receiver(order_receiver);
		shopOrderVO.setOrder_tel(order_tel);
		shopOrderVO.setOrder_memo(order_memo);
		shopOrderVO.setOrder_state(order_state);
		shopOrderVO.setOrder_ship_date(order_ship_date);
		shopOrderVO.setOrder_finish_date(order_finish_date);
		shopOrderVO.setOrder_cancel_date(order_cancel_date);
		shopOrderVO.setOrder_id(order_id);
		
		dao.update(shopOrderVO);
		return  getOneOrder(order_id);
	}
	
	public void deleteShopOrder(Integer order_id) {
		dao.delete(order_id);
	}
	//getOne 區域
	public ShopOrderVO getOneShopOrder(Integer order_id) {
		return dao.findByPrimaryKey(order_id);
	}
	public ShopOrderVO getOneShopOrderByFMem(Integer order_id,Integer f_mem_id) {
		System.out.println(order_id+"JDBC");
		System.out.println(f_mem_id+"JDBC");
		List<ShopOrderVO> list = dao.getAllFmemOrder(f_mem_id);
		ShopOrderVO oneResult = new ShopOrderVO();
		
		for (int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i).getOrder_id());
			if(list.get(i).getOrder_id().equals(order_id)) {
				oneResult=list.get(i);
//				System.out.println(list.get(i).getOrder_id());
			}
		}
		return oneResult;
	}
	
	//拿到訂單的集合
	public List<ShopOrderVO> getAll() {
		return dao.getAll();
	}
	
	public List<ShopOrderVO> getAllMemOrder(Integer mem_id) {
		return dao.getAllMemOrder(mem_id);
	}
	public List<ShopOrderVO> getAllFmemOrder(Integer f_mem_id) {
		return dao.getAllFmemOrder(f_mem_id);
	}

	//join
	public ShopOrderVO getOneOrder(Integer order_id) {
		return dao.findByPrimaryKey(order_id);
	}
	
	//自增主鍵
	public void addWithDetails(ShopOrderVO shopOrderVO , List<ShopOrderDetailsVO> list) {
		 dao.insertWithOrderDetails(shopOrderVO,list);
	}
	
	
}
