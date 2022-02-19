package com.shopOrderDetails.model;

import java.sql.Connection;
import java.util.List;


public class ShopOrderDetailsService {

	private ShopOrderDetails_inferface dao;
	
	public ShopOrderDetailsService() {
		dao = new ShopOrderDetailsJDBCDAO();
	}
	
	public ShopOrderDetailsVO addShopOrderDetails(Integer order_id,Integer prod_id,String prod_unit,Integer order_qty,Integer order_unit_price,Integer order_unit_amount) {
		
		ShopOrderDetailsVO shopOrderDetailsVO = new ShopOrderDetailsVO();
		
		shopOrderDetailsVO.setOrder_id(order_id);
		shopOrderDetailsVO.setProd_id(prod_id);
		shopOrderDetailsVO.setProd_unit(prod_unit);
		shopOrderDetailsVO.setOrder_qty(order_qty);
		shopOrderDetailsVO.setOrder_unit_price(order_unit_price);
		shopOrderDetailsVO.setOrder_unit_amount(order_unit_amount);
		dao.insert(shopOrderDetailsVO);
		
		return shopOrderDetailsVO;
	}
	
	public ShopOrderDetailsVO updateShopOrderDetails(Integer order_id,Integer prod_id,String prod_unit,Integer order_qty,Integer order_unit_price,Integer order_unit_amount) {
		
		
		ShopOrderDetailsVO shopOrderDetailsVO = new ShopOrderDetailsVO();
		
		shopOrderDetailsVO.setOrder_id(order_id);
		shopOrderDetailsVO.setProd_id(prod_id);
		shopOrderDetailsVO.setProd_unit(prod_unit);
		shopOrderDetailsVO.setOrder_qty(order_qty);
		shopOrderDetailsVO.setOrder_unit_price(order_unit_price);
		shopOrderDetailsVO.setOrder_unit_amount(order_unit_amount);
		dao.update(shopOrderDetailsVO);
		
		return shopOrderDetailsVO;
	}
	
	public void deleteshopOrderDetails(Integer order_id,Integer prod_id) {
		dao.delete(order_id, prod_id);
		
	}
	
	public ShopOrderDetailsVO getoneshopOrderDetails(Integer order_id,Integer prod_id) {
		return dao.findByPrimaryKey(order_id,prod_id);
	}
	
	public List<ShopOrderDetailsVO> getAll() {
		return dao.getAll();
	}
	
//	拿到該訂單的所有明細
	public List<ShopOrderDetailsVO> getPKAll(Integer order_id) {
		return dao.getPKAll(order_id); 
}
	//自增主鍵
//	public ShopOrderDetailsVO insert2(ShopOrderDetailsVO shopOrderDetailsVO, Connection con) {
//		
//ShopOrderDetailsVO shopOrderDetailsVO1 = new ShopOrderDetailsVO();
//		
//		shopOrderDetailsVO1.setOrder_id(order_id);
//		shopOrderDetailsVO1.setProd_id(prod_id);
//		shopOrderDetailsVO1.setProd_unit(prod_unit);
//		shopOrderDetailsVO1.setOrder_qty(order_qty);
//		shopOrderDetailsVO1.setOrder_unit_price(order_unit_price);
//		shopOrderDetailsVO1.setOrder_unit_amount(order_unit_amount);
//		dao.insert2(shopOrderDetailsVO1, con);
//		return shopOrderDetailsVO1;
//	}
	
}
