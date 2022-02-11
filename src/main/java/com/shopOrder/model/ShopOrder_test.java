package com.shopOrder.model;

import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;


public class ShopOrder_test {

	ShopOrderJDBCDAO jdbcdao = new ShopOrderJDBCDAO();
	ShopOrderVO shop = new ShopOrderVO();
	
	@Test
	public void testinsert() {
		
		
		shop.setMem_id(77006);
		shop.setF_mem_id(70003);
		shop.setOrder_add("台北市萬巒鄉豬腳路1號");
		shop.setOrder_receiver("蛇丸");
		shop.setOrder_tel("09123456789");
		shop.setOrder_amount(1000);
		shop.setOrder_memo("指定到貨時間");
		shop.setOrder_payment(1);
		
		jdbcdao.insert(shop);
	}
	
	@Test
	public void testupdte() {
		
		shop.setOrder_add("新北市板橋區新月路2號");
		shop.setOrder_receiver("蛇丸爸");
		shop.setOrder_tel("0912345678");
		shop.setOrder_memo("越快出貨越好");
		shop.setOrder_state(1);
		shop.setOrder_ship_date(java.sql.Date.valueOf("2022-02-04"));
		shop.setOrder_finish_date(java.sql.Date.valueOf("2022-02-06"));
		shop.setOrder_cancel_date(java.sql.Date.valueOf("2022-02-08"));
		
		shop.setOrder_id(12);

		jdbcdao.update(shop);
	}
	
	@Test  //只需要更改訂單狀態
	public void testdelet() {
		jdbcdao.delete(12);
	}
	
	@Test
	public void testfindByPrimaryKey(){
		ShopOrderVO shop = jdbcdao.findByPrimaryKey(10);
		System.out.println(shop);
	}
	
	@Test
	public void testgetAll() {
		List<ShopOrderVO> list = jdbcdao.getAll();
		for (ShopOrderVO shop : list) {
			System.out.print(shop.getOrder_id() + ",");
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getF_mem_id() + ",");
			System.out.print(shop.getOrder_add() + ",");
			System.out.print(shop.getOrder_receiver() + ",");
			System.out.print(shop.getOrder_tel() + ",");
			System.out.print(shop.getOrder_amount() + ",");
			System.out.print(shop.getOrder_memo() + ",");
			System.out.print(shop.getOrder_payment() + ",");
			System.out.print(shop.getOrder_state() + ",");
			System.out.print(shop.getOrder_date() + ",");
			System.out.print(shop.getOrder_ship_date() + ",");
			System.out.print(shop.getOrder_finish_date() + ",");
			System.out.print(shop.getOrder_cancel_date() + ",");
			
			System.out.println("查詢成功");
		}
	}
	
	@Test
	public void testgetAllMemOrder() {
		List<ShopOrderVO> list = jdbcdao.getAllMemOrder(77000);
		for (ShopOrderVO shop : list) {
			System.out.print(shop.getOrder_id() + ",");
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getF_mem_id() + ",");
			System.out.print(shop.getOrder_add() + ",");
			System.out.print(shop.getOrder_receiver() + ",");
			System.out.print(shop.getOrder_tel() + ",");
			System.out.print(shop.getOrder_amount() + ",");
			System.out.print(shop.getOrder_memo() + ",");
			System.out.print(shop.getOrder_payment() + ",");
			System.out.print(shop.getOrder_state() + ",");
			System.out.print(shop.getOrder_date() + ",");
			System.out.print(shop.getOrder_ship_date() + ",");
			System.out.print(shop.getOrder_finish_date() + ",");
			System.out.print(shop.getOrder_cancel_date() + ",");
			
			System.out.println("查詢成功");
		}
	}
	
	@Test
	public void testgetAllFFmemOrder() {
		List<ShopOrderVO> list = jdbcdao.getAllFmemOrder(70001);
		for (ShopOrderVO shop : list) {
			System.out.print(shop.getOrder_id() + ",");
			System.out.print(shop.getMem_id() + ",");
			System.out.print(shop.getF_mem_id() + ",");
			System.out.print(shop.getOrder_add() + ",");
			System.out.print(shop.getOrder_receiver() + ",");
			System.out.print(shop.getOrder_tel() + ",");
			System.out.print(shop.getOrder_amount() + ",");
			System.out.print(shop.getOrder_memo() + ",");
			System.out.print(shop.getOrder_payment() + ",");
			System.out.print(shop.getOrder_state() + ",");
			System.out.print(shop.getOrder_date() + ",");
			System.out.print(shop.getOrder_ship_date() + ",");
			System.out.print(shop.getOrder_finish_date() + ",");
			System.out.print(shop.getOrder_cancel_date() + ",");
			
			System.out.println("查詢成功");
		}
	}
}
