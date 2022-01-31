package com.shopOrder.model;

import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;


public class ShopOrder_test {

	ShopOrderJDBCDAO jdbcdao = new ShopOrderJDBCDAO();
	ShopOrderVO shop = new ShopOrderVO();
	
	@Test
	public void testinsert() {
		
//		shop.setMem_id(1);
//		shop.setOrder_date(java.sql.Date.valueOf("2022-01-01"));
//		shop.setOrder_ship_fee(100);
//		shop.setOrder_add("�x�_���h�L��");
//		shop.setOrder_amount(1200);
//		shop.setOrder_memo("�·бH���");
//		shop.setOrder_ship_date(java.sql.Date.valueOf("2022-02-02"));
//		shop.setOrder_payment(1);
//		shop.setOrder_state(1);
//		
//		jdbcdao.insert(shop);
		
		shop.setMem_id(1);
		shop.setOrder_date(java.sql.Date.valueOf("2022-01-02"));
		shop.setOrder_ship_fee(100);
		shop.setOrder_add("�x�_���H�q��");
		shop.setOrder_amount(1000);
		shop.setOrder_memo("�·бH���");
		shop.setOrder_ship_date(java.sql.Date.valueOf("2022-02-03"));
		shop.setOrder_payment(1);
		shop.setOrder_state(1);
		
		jdbcdao.insert(shop);
	}
	
	@Test
	public void testupdte() {
		
		shop.setMem_id(1);
		shop.setOrder_date(java.sql.Date.valueOf("2022-01-03"));
		shop.setOrder_ship_fee(300);
		shop.setOrder_add("�x�_���j�P��");
		shop.setOrder_amount(2000);
		shop.setOrder_memo("�·бH���!");
		shop.setOrder_ship_date(java.sql.Date.valueOf("2022-02-04"));
		shop.setOrder_payment(0);
		shop.setOrder_state(0);
		
		shop.setOrder_id(1);
		
		
		jdbcdao.update(shop);
	}
	
//	@Test  //只需要更改訂單狀態
//	public void testdelet() {
//		jdbcdao.delete(1);
//	}
	
	@Test
	public void testfindByPrimaryKey(){
		ShopOrderVO shop = jdbcdao.findByPrimaryKey(1);
		System.out.println(shop);
	}
	
	@Test
	public void testgetAll() {
		List<ShopOrderVO> list = jdbcdao.getAll();
		for (ShopOrderVO shop : list) {
			System.out.print(shop.getOrder_id() + ",");
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getOrder_date() + ",");
			System.out.print(shop.getOrder_ship_fee() + ",");
			System.out.print(shop.getOrder_add() + ",");
			System.out.print(shop.getOrder_amount() + ",");
			System.out.print(shop.getOrder_memo() + ",");
			System.out.print(shop.getOrder_ship_date() + ",");
			System.out.print(shop.getOrder_payment() + ",");
			System.out.print(shop.getOrder_state() + ",");
			
			System.out.println("okok");
		}
	}
}
