package com.shopProductReport.model;

import java.util.*;
import java.sql.*;

import org.junit.Test;

public class ShopProductReport_test {
	public static void main(String[] args) {

		ShopProductReportDAO_interface dao = new ShopProductReportJDBCDAO();

		// 新增
		ShopProductReportVO vo1 = new ShopProductReportVO();
		
//		vo1.setProd_report_no(1);
//		vo1.setMem_id(77000);
//		vo1.setProd_id(10001);
//		vo1.setReport_reason("圖文不符");
//		vo1.setReport_time(java.sql.Date.valueOf("2022-01-23"));
//		vo1.setReport_state(0);
//		vo1.setReport_note("請廠商撤下圖片");
//		dao.insert(vo1);
		
//		vo1.setProd_report_no(2);
//		vo1.setMem_id(77000);
//		vo1.setProd_id(10001);
//		vo1.setReport_reason("價格太貴");
//		vo1.setReport_time(java.sql.Date.valueOf("2022-01-22"));
//		vo1.setReport_state(0);
//		vo1.setReport_note("請廠商降低售價");
//		dao.insert(vo1);
//		
//		System.out.println("新增");

		// 修改
//		ShopProductReportVO vo2 = new ShopProductReportVO();
//	
//		vo2.setProd_report_no(1);
//		vo2.setMem_id(77000);
//		vo2.setProd_id(10001);
//		vo2.setReport_reason("圖片太醜");
//		vo2.setReport_time(java.sql.Date.valueOf("2021-01-23"));
//		vo2.setReport_state(1);
//		vo2.setReport_note("請廠商換圖片");
//		
//		dao.update(vo2);
//		System.out.println("修改");

		// 刪除
		dao.delete(2);
		System.out.println("刪除");

		// 查詢
		ShopProductReportVO vo3 = dao.findByPrimaryKey(1);
//		System.out.print(vo3.getProd_report_no() + ",");
		System.out.print(vo3.getMem_id() + ",");
		System.out.print(vo3.getProd_id() + ",");
		System.out.print(vo3.getReport_reason() + ",");
		System.out.print(vo3.getReport_time() + ",");
		System.out.print(vo3.getReport_state() + ",");
		System.out.println(vo3.getReport_note() );
		System.out.println("----------");

		// 查詢
		List<ShopProductReportVO> list = dao.getAll();
		for (ShopProductReportVO type : list) {
			System.out.print(type.getProd_report_no() + ",");
			System.out.print(type.getMem_id() + ",");
			System.out.print(type.getProd_id() + ",");
			System.out.print(type.getReport_reason() + ",");
			System.out.print(type.getReport_time() + ",");
			System.out.print(type.getReport_state() + ",");
			System.out.println(type.getReport_note() );
			System.out.println("*********");
		}

	}

	

}
