package com.shopProductCollection.model;

import java.util.*;
import java.sql.*;

import org.junit.Test;

public class ShopProductCollection_test {
	public static void main(String[] args) {

		ShopProductCollectionDAO_interface dao = new ShopProductCollectionJDBCDAO();

		// 新增
		ShopProductCollectionVO vo1 = new ShopProductCollectionVO();
		
//		vo1.setMem_id(77000);
//		vo1.setProd_id(10001);
//		vo1.setProd_fav_date(java.sql.Date.valueOf("2022-01-22"));
//		dao.insert(vo1);
		
//		vo1.setMem_id(77001);
//		vo1.setProd_id(10003);
//		vo1.setProd_fav_date(java.sql.Date.valueOf("2022-01-23"));
//		dao.insert(vo1);
//		
//		System.out.println("新增");

		// 刪除
		dao.delete(77000,10001);
		System.out.println("刪除");

		// 查詢 不需要
//		ShopProductCollectionVO vo3 = dao.findByPrimaryKey(77000,10001);
//		System.out.print(vo3.getMem_id() + ",");
//		System.out.print(vo3.getProd_id() + ",");
//		System.out.println(vo3.getProd_fav_date());
//		System.out.println("----------");

		// 查詢
		List<ShopProductCollectionVO> list = dao.getAll();
		for (ShopProductCollectionVO type : list) {
			System.out.print(type.getMem_id() + ",");
			System.out.print(type.getProd_id() + ",");
			System.out.println(type.getProd_fav_date());
			System.out.println("*********");
		}

	}

}

