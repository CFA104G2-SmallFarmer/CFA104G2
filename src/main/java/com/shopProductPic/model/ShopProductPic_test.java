package com.shopProductPic.model;

import java.util.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;

import org.junit.Test;


public class ShopProductPic_test {
	public static void main(String[] args) {

		ShopProductPicDAO_interface dao = new ShopProductPicJDBCDAO();

		// 新增
		ShopProductPicVO vo1 = new ShopProductPicVO();
		
//		vo1.setProd_pic_id(1);
//		vo1.setProd_id(10001);
//		
//		 byte[] pic;
//		  try {
//		   pic= getPictureByteArray("ShopPic/fruit1.jpg");//回傳一個水管
//		   vo1.setProd_pic(pic);
//		  } catch (IOException e) {
//		   // TODO Auto-generated catch block
//		   e.printStackTrace();
//		  }
//		dao.insert(vo1);
		
		
		
//		vo1.setProd_pic_id(3);
		
//		vo1.setProd_id(10001);
//		 byte[] pic;
//		  try {
//		   pic= getPictureByteArray("ShopPic/fruit2.jpg");//回傳一個水管
//		   vo1.setProd_pic(pic);
//		  } catch (IOException e) {
//		   // TODO Auto-generated catch block
//		   e.printStackTrace();
//		  }
//		dao.insert(vo1);
//		
//		System.out.println("新增");


		// 刪除
//		dao.delete(2);
//		System.out.println("刪除");

		// 查詢
//		ShopProductPicVO vo3 = dao.findByPrimaryKey(1);
////		System.out.print(vo3.getProd_pic_id() + ",");
//		System.out.print(vo3.getProd_id() + ",");
//		System.out.println(vo3.getProd_pic());
//		System.out.println("----------");
//
		// 查詢
		List<ShopProductPicVO> list = dao.getAll();
		for (ShopProductPicVO type : list) {
			System.out.print(type.getProd_pic_id() + ",");
			System.out.print(type.getProd_id() + ",");
			System.out.println(type.getProd_pic());
			System.out.println("*********");
		}

	}


	
	// 使用byte[]方式
	 public static byte[] getPictureByteArray(String path) throws IOException {
	  FileInputStream fis = new FileInputStream(path);
	  byte[] buffer = new byte[fis.available()];//長度，資料流多少bytes
	  fis.read(buffer);//讀進byte陣列裡
	  fis.close();
	  return buffer; //回傳byte[]
	 }
	
	
}
