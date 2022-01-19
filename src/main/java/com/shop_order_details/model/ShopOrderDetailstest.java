package com.shop_order_details.model;

import java.time.chrono.MinguoChronology;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.junit.jupiter.api.Test;

public class ShopOrderDetailstest {

	ShopOrderDetailsJDBCDAO jdbcdao = new ShopOrderDetailsJDBCDAO();
	ShopOrderDetailsVO shop = new ShopOrderDetailsVO();
	
	@Test
	public void testinsert() {
		shop.setOrder_id(1);
		shop.setProd_id(1);
		shop.setOrder_qty(20);
		shop.setOrder_unit_price(200);
		shop.setProd_id_stars(5);
		shop.setMem_id_stars(5);
		
		jdbcdao.insert(shop);
	}
	
	@Test
	public void testupdte() {
		
		shop.setOrder_qty(10);
		shop.setOrder_unit_price(100);
		shop.setProd_id_stars(4);
		shop.setMem_id_stars(4);
		
		shop.setOrder_id(1);
		shop.setProd_id(1);
		
		jdbcdao.update(shop);
	}
	
	@Test
	public void testdelete() {
		jdbcdao.delete(1,1);
	}
	
	
//	public static void main(String[] args) {
//		ShopOrderDetailsJDBCDAO jdbcdao = new ShopOrderDetailsJDBCDAO();
//
//		jdbcdao.delete(1,1);
//		System.out.println("ok");
//	}
	@Test
	public void testfindByPrimaryKey() {
		ShopOrderDetailsVO shop = jdbcdao.findByPrimaryKey(1, 1);
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
			System.out.print(shop.getOrder_qty() + ",");
			System.out.print(shop.getOrder_unit_price() + ",");
			System.out.print(shop.getProd_id_stars() + ",");
			System.out.print(shop.getMem_id_stars() + ",");
			
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
}
