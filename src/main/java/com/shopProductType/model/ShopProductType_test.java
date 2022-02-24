package com.shopProductType.model;

import java.util.*;

import java.sql.*;

//import org.junit.Test;



public class ShopProductType_test {
	
	public static void main(String[] args) {
	
		ShopProductTypeDAO_interface typedao = new ShopProductTypeJDBCDAO();
	
	
		//新增
		ShopProductTypeVO typevo1 = new ShopProductTypeVO();

//		typevo1.setProd_type_name("水果");

//		typevo1.setProd_type_name("蔬菜");

//		typevo1.setProd_type_name("五穀");

//		typevo1.setProd_type_name("五穀");
//		typedao.insert(typevo1);
//		System.out.println("新增");
		
//		//修改
		ShopProductTypeVO typevo2 = new ShopProductTypeVO();
		
		typevo2.setProd_type_name("五穀根莖類");
		typevo2.setProd_type_id(2);
		typedao.update(typevo2);
		System.out.println("修改");
		
		//刪除
//		typedao.delete(2);
//		System.out.println("刪除");
		
		//查詢
//		ShopProductTypeVO typevo3 = typedao.findByPrimaryKey(1);
//		
//		System.out.println(typevo3.getProd_type_id()+",");
//		System.out.println(typevo3.getProd_type_name());
//		System.out.println("----------");
//		

		//查詢
//		List<ShopProductTypeVO> list = typedao.getAll();
//		for(ShopProductTypeVO type : list) {
//			System.out.println(type.getProd_type_id() + ",");
//			System.out.println(type.getProd_type_name());
//			System.out.println("*********");
		}

	}

