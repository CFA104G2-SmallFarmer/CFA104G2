package com.shopProduct.model;

import java.util.*;
import java.sql.*;

import org.junit.Test;


public class ShopProduct_test {
	public static void main(String[] args) {

		ShopProductDAO_interface prodao = new ShopProductJDBCDAO();

		// 新增
//		ShopProductVO provo1 = new ShopProductVO();
//		provo1.setProd_Type_id(1);
//		provo1.setProd_name("大湖草莓");
//		provo1.setF_mem_id(70003);
//		provo1.setProd_status(1);
//		provo1.setProd_price(200);
//		provo1.setProd_qty(50);
//		provo1.setProd_intro("台灣所栽種的草莓多數是耐熱品種，香氣和甜度都在水準之上，但通常體積不會太大、色澤也不夠均勻。");
//		provo1.setProd_reg_date(java.sql.Date.valueOf("2022-01-23"));
//		prodao.insert(provo1);
//		
//		provo1.setProd_Type_id(2);
//		provo1.setProd_name("梨山高麗菜");
//		provo1.setF_mem_id(70003);
//		provo1.setProd_status(1);
//		provo1.setProd_price(20);
//		provo1.setProd_qty(500);
//		provo1.setProd_intro("梨山高麗菜之甜，相比果糖更盛，更添有一絲清脆；相較平地的高麗菜，又多了幾分清爽的甜意，咬下去還會有卡滋卡滋的聲音，實在一吃難忘。");
//		provo1.setProd_reg_date(java.sql.Date.valueOf("2022-01-23"));
//		prodao.insert(provo1);
//		
//		System.out.println("新增");

		// 修改
		ShopProductVO provo2 = new ShopProductVO();
	
		provo2.setProd_type_id(1);
		provo2.setProd_name("柿子");
		provo2.setF_mem_id(70003);
		provo2.setProd_status(1);
		provo2.setProd_price(89);
		provo2.setProd_qty(500);
		provo2.setProd_intro("柿子不僅美麗，還富含蛋白質、脂肪、胡蘿蔔素、維生素C、碘及各種礦物質等，有極高的營養價值，可補充養分、潤肺生津、幫助消化，對缺碘所引起的甲狀腺腫大也有幫助。");
		provo2.setProd_reg_date(java.sql.Date.valueOf("2022-01-05"));
		provo2.setProd_id(20002);
		
		prodao.update(provo2);
		System.out.println("修改");
//
//		// 刪除
//		prodao.delete(2);
//		System.out.println("刪除");

		// 查詢
		ShopProductVO provo3 = prodao.findByPrimaryKey(10001);
//		System.out.print(provo3.getProd_id() + ",");
//		System.out.print(provo3.getProd_Type_id() + ",");
//		System.out.print(provo3.getProd_name() + ",");
//		System.out.print(provo3.getF_mem_id() + ",");
//		System.out.print(provo3.getProd_status() + ",");
//		System.out.print(provo3.getProd_price() + ",");
//		System.out.print(provo3.getProd_qty() + ",");
//		System.out.print(provo3.getProd_intro() + ",");
//		System.out.println(provo3.getProd_reg_date());
		System.out.println("----------");

		// 查詢
		List<ShopProductVO> list = prodao.getAll();
		for (ShopProductVO type : list) {
			System.out.print(type.getProd_id() + ",");
			System.out.print(type.getProd_type_id() + ",");
			System.out.print(type.getProd_name() + ",");
			System.out.print(type.getF_mem_id() + ",");
			System.out.print(type.getProd_status() + ",");
			System.out.print(type.getProd_price() + ",");
			System.out.print(type.getProd_qty() + ",");
			System.out.print(type.getProd_intro() + ",");
			System.out.println(type.getProd_reg_date());
			System.out.println("*********");
		}

	}

}
