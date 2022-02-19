package com.shopCart.model;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.junit.jupiter.api.Test;

public class ShopCartTest {

	ShopCartJDBCDAO jdbcdao = new ShopCartJDBCDAO();
	ShopCartVO shop = new ShopCartVO();

	@Test
	public void testinsert() {
		shop.setMem_id(77002);
		shop.setProd_id(1);
		shop.setF_mem_id(70000);
		shop.setCart_qty(3);
		shop.setCart_unit_price(200);

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
	public void testupdate() {

		shop.setCart_qty(10);
		shop.setCart_unit_price(100);

		shop.setMem_id(77002);
		shop.setProd_id(1);

		jdbcdao.update(shop);
	}

	@Test
	public void testdelete() {
		jdbcdao.delete(77002, 1);
	}

	@Test
	public void testfindByPrimaryKey() {
		ShopCartVO shop = jdbcdao.findByPrimaryKey(77000, 1);
		System.out.println(shop);
	}

	@Test
	public void testgetAll() {
		List<ShopCartVO> list = jdbcdao.getAll();
		for (ShopCartVO shop : list) {
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getProd_id() + ",");
			System.out.print(shop.getCart_qty() + ",");
			System.out.print(shop.getCart_unit_price() + ",");

			System.out.println("okok");

			assertTrue(list.size() > 0);
		}
//		int row = testgetAll(shop);
//		assertNotEquals(row,0);
	}

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
	@Test
	public void testgetOneList() {
		List<ShopCartVO> list = jdbcdao.getOneList(77000);
		for (ShopCartVO shop : list) {
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getProd_id() + ",");
			System.out.print(shop.getF_mem_id() + ",");
			System.out.print(shop.getCart_qty() + ",");
			System.out.print(shop.getCart_unit_price() + ",");

			System.out.println("okok");

			assertTrue(list.size() > 0);
		}
	}
	
	@Test
	public void testgetBreakeList() {
		List<ShopCartVO> list = jdbcdao.getBreakeList(77000,70000);
		for (ShopCartVO shop : list) {
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getProd_id() + ",");
			System.out.print(shop.getF_mem_id() + ",");
			System.out.print(shop.getCart_qty() + ",");
			System.out.print(shop.getCart_unit_price() + ",");

			System.out.println("okok");

			assertTrue(list.size() > 0);
		}
	}
}