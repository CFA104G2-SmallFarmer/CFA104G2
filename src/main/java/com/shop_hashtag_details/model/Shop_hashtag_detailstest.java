package com.shop_hashtag_details.model;

import java.util.List;

import org.junit.jupiter.api.Test;


public class Shop_hashtag_detailstest {

	ShopHashtagDetailsJDBCDAO jdbcdao = new ShopHashtagDetailsJDBCDAO();
	ShopHashtagDetailsVO shop = new ShopHashtagDetailsVO();
		
	@Test
	public void testinsert() {
		shop.setHash_no(1);
		shop.setProd_id(1);
		
		jdbcdao.insert(shop);
	}
	
//	public static void main(String[] args) {
//		ShopHashtagDetailsJDBCDAO jdbcdao = new ShopHashtagDetailsJDBCDAO();
//		ShopHashtagDetailsVO shop = new ShopHashtagDetailsVO();
//		shop.setHash_no(1);
//		shop.setProd_id(1);
//		
//		jdbcdao.insert(shop);
//		System.out.println("ok");
//	}
	@Test
	public void testdelete() {
		jdbcdao.delete(1,1);
	}
	
//	@Test
//	public void testfindByHash_no() {
//		List<ShopHashtagDetailsVO> list = jdbcdao.findByHash_no(shop);
//		shop.setHash_no(1);
//		
//		for (ShopHashtagDetailsVO shop : list) {
//			System.out.print(shop.getHash_no() + ",");
//			System.out.print(shop.getProd_id() + ",");
//			
//			System.out.println("okok");
//	}
//	}
	
	@Test
	public void testgetAll() {
		List<ShopHashtagDetailsVO> list = jdbcdao.getAll();
		for (ShopHashtagDetailsVO shop : list) {
			System.out.print(shop.getHash_no() + ",");
			System.out.print(shop.getProd_id() + ",");
			
			System.out.println("okok");
		}
	
}
}
