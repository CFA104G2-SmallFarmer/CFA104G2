package com.shop_hashtag.model;

import java.util.List;

import org.junit.jupiter.api.Test;




public class ShopHashtagTest {

	ShopHashtagJDBCDAO hashdao = new ShopHashtagJDBCDAO();
	ShopHashtagVO hashvo = new ShopHashtagVO();
	
	@Test
	public void testinsert() {
//		hashvo.setHash_no(1);
//		hashvo.setHash_word("Âù11Àu´f");
		
//		hashvo.setHash_no(2);
		hashvo.setHash_word("ªê¦~Àu´f");
		
//		hashvo.setHash_no(3);
//		hashvo.setHash_word("¸t½ÏÀu´f");
		
		hashdao.insert(hashvo);
	}
	
	@Test
	public void testupdate() {
		hashvo.setHash_word("¥À¿Ë¸`Àu´f");
		hashvo.setHash_no(1);
		
		hashdao.update(hashvo);
	}
	
	@Test
	public void testdelete() {
		hashdao.delete(1);
	}
	
	@Test
	public void testfindByPrimaryKey() {
		ShopHashtagVO shop = hashdao.findByPrimaryKey(1);
		System.out.println(shop);
	}
	@Test
	public void testgetAll() {
		List<ShopHashtagVO> list = hashdao.getAll();
		for (ShopHashtagVO shop : list) {
			System.out.print(shop.getHash_no() + ",");
			System.out.print(shop.getHash_word());
			System.out.println("okok");
		}
	}
}
