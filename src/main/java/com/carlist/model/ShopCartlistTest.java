package com.carlist.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.junit.jupiter.api.Test;

public class ShopCartlistTest {
	
	ShopCartlistJDBCDAO jdbcdao = new ShopCartlistJDBCDAO();
	ShopCartlistVO shop = new ShopCartlistVO();
	
	@Test
	public void testinsert() {
		shop.setMem_id(1);
		shop.setProd_id(1);
		shop.setCartlist_qty(20);
		shop.setCartlist_unit_price(200);
		
		jdbcdao.insert(shop);
	}
	
//	public static void main(String[] args) {
//		ShopCartlistJDBCDAO jdbcdao = new ShopCartlistJDBCDAO();
//		ShopCartlistVO shop = new ShopCartlistVO();
//		shop.setMem_id(1);
//		shop.setProd_id(1);
//		shop.setCartlist_qty(10);
//		shop.setCartlist_unit_price(100);
//		
//		jdbcdao.insert(shop);
//		System.out.println("ok");
//	}
	
	@Test
	public void testupdte() {
		
		shop.setCartlist_qty(10);
		shop.setCartlist_unit_price(100);
		
		shop.setMem_id(1);
		shop.setProd_id(1);
		
		jdbcdao.update(shop);
	}
	
	@Test
	public void testdelete() {
		jdbcdao.delete(1,1);
	}
	
	@Test
	public void testfindByPrimaryKey() {
		ShopCartlistVO shop = jdbcdao.findByPrimaryKey(1, 1);
		System.out.println(shop);
	}
	@Test
	public void testgetAll() {
		List<ShopCartlistVO> list = jdbcdao.getAll();
		for (ShopCartlistVO shop : list) {
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getProd_id() + ",");
			System.out.print(shop.getCartlist_qty() + ",");
			System.out.print(shop.getCartlist_unit_price() + ",");
			
			System.out.println("okok");
		}
	}
//	}
//	public static void main(String[] args) {
//		ShopCartlistJDBCDAO jdbcdao = new ShopCartlistJDBCDAO();
//
//		List<ShopCartlistVO> list = jdbcdao.getAll();
//		for (ShopCartlistVO a : list) {
//			System.out.println(a.getMem_id() + "\n");
//			System.out.println(a.getProd_id() + "\n");
//			System.out.println(a.getCartlist_qty() + "\n");
//			System.out.println(a.getCartlist_unit_price() + "\n");
//		}
//	}
}
