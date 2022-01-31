package com.shopOrder.model;

import java.util.List;

public class ShopOrderService {

	private ShopOrderDAO_interface dao;
	
	public ShopOrderService() {
		dao = new  ShopOrderJDBCDAO();
	}
	
	public ShopOrderVO addShopOrder(Integer order_id,Integer mem_id,java.sql.Date order_date,Integer order_ship_fee,String order_add,
			Integer order_amount,String order_memo,java.sql.Date order_ship_date,Integer order_payment,Integer order_state) {
	
		ShopOrderVO shopOrderVO = new ShopOrderVO();
		
		shopOrderVO.setOrder_id(order_id);
		shopOrderVO.setMem_id(mem_id);
		shopOrderVO.setOrder_date(order_date);
		shopOrderVO.setOrder_ship_fee(order_ship_fee);
		shopOrderVO.setOrder_add(order_add);
		shopOrderVO.setOrder_amount(order_amount);
		shopOrderVO.setOrder_memo(order_memo);
		shopOrderVO.setOrder_ship_date(order_ship_date);
		shopOrderVO.setOrder_payment(order_payment);
		shopOrderVO.setOrder_state(order_state);
		dao.insert(shopOrderVO);
		
		return shopOrderVO;
	}
	
	public ShopOrderVO updateShopOrder(Integer order_id,Integer mem_id,java.sql.Date order_date,Integer order_ship_fee,String order_add,
			Integer order_amount,String order_memo,java.sql.Date order_ship_date,Integer order_payment,Integer order_state) {
	
		ShopOrderVO shopOrderVO = new ShopOrderVO();
		
		shopOrderVO.setOrder_id(order_id);
		shopOrderVO.setMem_id(mem_id);
		shopOrderVO.setOrder_date(order_date);
		shopOrderVO.setOrder_ship_fee(order_ship_fee);
		shopOrderVO.setOrder_add(order_add);
		shopOrderVO.setOrder_amount(order_amount);
		shopOrderVO.setOrder_memo(order_memo);
		shopOrderVO.setOrder_ship_date(order_ship_date);
		shopOrderVO.setOrder_payment(order_payment);
		shopOrderVO.setOrder_state(order_state);
		dao.update(shopOrderVO);
		
		return  shopOrderVO;
	}
//	//訂單只需更改訂單狀態
//	public void deleteShopOrder(Integer order_id) {
//		dao.delete(order_id);
//	}
	
	public ShopOrderVO getOneShopOrder(Integer order_id) {
		return dao.findByPrimaryKey(order_id);
	}
	
	public List<ShopOrderVO> getAll() {
		return dao.getAll();
	}
}
