package com.shopOrderDetails.model;

import org.junit.jupiter.api.Test;

import java.util.List;

public class ShopOrderDetailstest {

	ShopOrderDetailsJDBCDAO jdbcdao = new ShopOrderDetailsJDBCDAO();
	ShopOrderDetailsVO shop = new ShopOrderDetailsVO();
	
	@Test
	public void testinsert() {
		shop.setOrder_id(1);
		shop.setProd_id(5);
		shop.setProd_unit("公斤");
		shop.setOrder_qty(10);
		shop.setOrder_unit_price(20);
		shop.setOrder_unit_amount(200);
		
		jdbcdao.insert(shop);
	}
	
	@Test
	public void testupdte() {
		
		shop.setProd_unit("盒裝");
		shop.setOrder_qty(20);
		shop.setOrder_unit_price(10);
		shop.setOrder_unit_amount(200);
		
		shop.setOrder_id(1);
		shop.setProd_id(5);
		
		jdbcdao.update(shop);
	}
	
	@Test
	public void testdelete() {
		jdbcdao.delete(1,5);
	}
	
	
//	public static void main(String[] args) {
//		ShopOrderDetailsJDBCDAO jdbcdao = new ShopOrderDetailsJDBCDAO();
//
//		jdbcdao.delete(1,1);
//		System.out.println("ok");
//	}
	@Test
	public void testfindByPrimaryKey() {
		ShopOrderDetailsVO shop = jdbcdao.findByPrimaryKey(1,5);
		System.out.println(shop);
	}
//	public static void main(String[] args) {
//		ShopOrderDetailsJDBCDAO jdbcdao = new ShopOrderDetailsJDBCDAO();
//	
//		ShopOrderDetailsVO shop = jdbcdao.findByPrimaryKey(1, 1);
//		System.out.println(shop);
//	}
	@Test
	public void testgetAll() {
		List<ShopOrderDetailsVO> list = jdbcdao.getAll();
		for (ShopOrderDetailsVO shop : list) {
			System.out.print(shop.getOrder_id() + ",");
			System.out.print(shop.getProd_id() + ",");
			System.out.print(shop.getProd_unit() + ",");
			System.out.print(shop.getOrder_qty() + ",");
			System.out.print(shop.getOrder_unit_price() + ",");
			System.out.print(shop.getOrder_unit_amount() + ",");
			
			System.out.println("okok");
		}
	}
//	public static void main(String[] args) {
//		ShopOrderDetailsJDBCDAO jdbcdao = new ShopOrderDetailsJDBCDAO();
//		List<ShopOrderDetailsVO> list = jdbcdao.getAll();
//		for (ShopOrderDetailsVO shop : list) {
//			System.out.print(shop.getOrder_id() + ",");
//			System.out.print(shop.getProd_id() + ",");
//			System.out.print(shop.getOrder_qty() + ",");
//			System.out.print(shop.getOrder_unit_price() + ",");
//			System.out.print(shop.getProd_id_stars() + ",");
//			System.out.print(shop.getMem_id_stars() + ",");
//			
//			System.out.println("okok");
//	}
//	}
	@Test
	public void testgetPKAll() {
		List<ShopOrderDetailsVO> list = jdbcdao.getPKAll(1);
		for (ShopOrderDetailsVO shop : list) {
			System.out.print(shop.getOrder_id() + ",");
			System.out.print(shop.getProd_id() + ",");
			System.out.print(shop.getProd_unit() + ",");
			System.out.print(shop.getOrder_qty() + ",");
			System.out.print(shop.getOrder_unit_price() + ",");
			System.out.print(shop.getOrder_unit_amount() + ",");
			
			
			System.out.println("PKALL查詢成功");
		}
	}
}
