package com.mem.model;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class MemTest {
	public static void main(String[] args) {

		MemJDBCDAO dao = new MemJDBCDAO();

//		// 新增
//		MemVO memVO1 = new MemVO();
//		memVO1.setMem_acc("sue1122334@gmail.com");
//		memVO1.setMem_pwd("sue1122334");
//		memVO1.setAcc_state(1);
//		memVO1.setMem_name("東坡肉");
//		memVO1.setMem_nickname("咚不隆咚");
//		memVO1.setMem_mobile("0933345668");
//		memVO1.setMem_tel("0223456799");
//		memVO1.setMem_zipcode(100);
//		memVO1.setMem_city("台南市");
//		memVO1.setMem_dist("永康區");
//		memVO1.setMem_addr("甚麼路問號");
//		memVO1.setReg_date(java.sql.Date.valueOf("2005-01-01"));
//		
//		byte[] pic;
//		try {
//			pic = getPictureByteArray("C:\\Users\\Tibame_T14\\Desktop\\S__25600013.jpg");
//			memVO1.setMem_pic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println("圖片新增成功");
//		
//		memVO1.setRating_score_mk(0);
//		memVO1.setRating_count_mk(0);
//		memVO1.setRating_score_tr(0);
//		memVO1.setRating_count_tr(0);
//		memVO1.setReport_count(0);
//		memVO1.setMem_id_state(0);
//		
//		dao.insert(memVO1);
//		System.out.println("新增資料成功");
//
//		// 修改
		MemVO memVO2 = new MemVO();
		memVO2.setMem_id(77006);
		memVO2.setMem_acc("lue1122334@gmail.com");
		memVO2.setMem_pwd("lue1122334");
		memVO2.setAcc_state(1);
		memVO2.setMem_name("南坡肉");
		memVO2.setMem_nickname("傻不隆咚");
		memVO2.setMem_mobile("0933345668");
		memVO2.setMem_tel("0223456799");
		memVO2.setMem_zipcode(100);
		memVO2.setMem_city("台北市");
		memVO2.setMem_dist("永康區");
		memVO2.setMem_addr("甚麼路問號");
		memVO2.setReg_date(java.sql.Date.valueOf("2011-01-01"));
		
		byte[] pic;
		try {
			pic = getPictureByteArray("C:\\Users\\Tibame_T14\\Desktop\\S__25600013.jpg");
			memVO2.setMem_pic(pic);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("圖片新增成功");
		
		memVO2.setRating_score_mk(0);
		memVO2.setRating_count_mk(0);
		memVO2.setRating_score_tr(0);
		memVO2.setRating_count_tr(0);
		memVO2.setReport_count(0);
		memVO2.setMem_id_state(0);
		
		dao.update(memVO2);
		System.out.println("資料修改成功");
//
//		// 刪除
//		dao.delete(77008);
//		System.out.println("刪除資料成功");

//		// 查詢
//		// img尚未處理
//		MemVO memVO3 = dao.findByPrimaryKey(77001);
//		System.out.print(memVO3.getMem_id() + ",");
//		System.out.print(memVO3.getMem_acc() + ",");
//		System.out.print(memVO3.getMem_pwd() + ",");
//		System.out.print(memVO3.getAcc_state() + ",");
//		System.out.print(memVO3.getMem_name() + ",");
//		System.out.print(memVO3.getMem_nickname() + ",");
//		System.out.print(memVO3.getMem_mobile() + ",");
//		System.out.print(memVO3.getMem_tel() + ",");
//		System.out.print(memVO3.getMem_zipcode() + ",");
//		System.out.print(memVO3.getMem_city() + ",");
//		System.out.print(memVO3.getMem_dist() + ",");
//		System.out.print(memVO3.getMem_addr() + ",");
//		System.out.print(memVO3.getReg_date() + ",");
//		// 方法一印出如:Bric1937@superrito.com
//		System.out.print(memVO3.getMem_pic() + ",");
//		// 方法二印出如:Bric1937@superrito.com
//		System.out.println(Arrays.toString(memVO3.getMem_pic()));
//		System.out.print(memVO3.getRating_score_mk() + ",");
//		System.out.print(memVO3.getRating_count_mk() + ",");
//		System.out.print(memVO3.getRating_score_tr() + ",");
//		System.out.print(memVO3.getRating_score_mk() + ",");
//		System.out.print(memVO3.getReport_count() + ",");
//		System.out.print(memVO3.getMem_id_state());
		
		
		// 查詢
//		List<MemVO> list = dao.getAll();
//
//		for (MemVO aMem : list) {
//			System.out.print(aMem.getMem_id() + ",");
//			System.out.print(aMem.getMem_acc() + ",");
//			System.out.print(aMem.getMem_pwd() + ",");
//			System.out.print(aMem.getAcc_state() + ",");
//			System.out.print(aMem.getMem_name() + ",");
//			System.out.print(aMem.getMem_nickname() + ",");
//			System.out.print(aMem.getMem_mobile() + ",");
//			System.out.print(aMem.getMem_tel() + ",");
//			System.out.print(aMem.getMem_zipcode() + ",");
//			System.out.print(aMem.getMem_city() + ",");
//			System.out.print(aMem.getMem_dist() + ",");
//			System.out.print(aMem.getMem_addr() + ",");
//			System.out.print(aMem.getReg_date() + ",");
//			// pic僅出現位址，待解決
//			System.out.print(aMem.getMem_pic() + ",");
//			System.out.print(aMem.getRating_score_mk() + ",");
//			System.out.print(aMem.getRating_count_mk() + ",");
//			System.out.print(aMem.getRating_score_tr() + ",");
//			System.out.print(aMem.getRating_score_mk() + ",");
//			System.out.print(aMem.getReport_count() + ",");
//			System.out.print(aMem.getMem_id_state());
//			System.out.println();
//		}
	}
	
	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];		// available():資料流有多少bytes資料，算出有多少bytes
		fis.read(buffer);	// 讀取多少bytes資料存入buffer
		fis.close();
		return buffer;
	}
}
