package com.fMem.model;

import java.io.FileInputStream;
import java.io.IOException;

public class FMemTest {
	public static void main(String[] args) {
		FMemJDBCDAO dao = new FMemJDBCDAO();
		

		// 新增
		FMemVO fMemVO1 = new FMemVO();
		fMemVO1.setMem_id(77004);
		fMemVO1.setF_mem_acc("Hitho1979@dayrep.com");
		fMemVO1.setF_mem_pwd("Hitho1979");
		fMemVO1.setAcc_state(1);
		fMemVO1.setF_mem_fname("津津農場");
		fMemVO1.setF_mem_info("津津農場歷史悠久，早在日治時代，就是台灣有名的「茶業指導所」，"
				+ "為茶種育苗、繁殖，製茶技術交流與傳承的據點，至今仍在此舉辦「台北市、新北市文山"
				+ "包種茶製茶技術競賽」。");
		fMemVO1.setF_mem_mobile("0928396184");
		fMemVO1.setF_mem_tel("08369430");
		fMemVO1.setF_mem_zipcode(152);
		fMemVO1.setF_mem_city("新北市");
		fMemVO1.setF_mem_dist("中和區");
		fMemVO1.setF_mem_add("建八路80巷3號");
		fMemVO1.setBank_code(437);
		fMemVO1.setBank_account("046292128293");
		fMemVO1.setReg_date(java.sql.Date.valueOf("2010-04-25"));
		// 圖片測試統一此處新增
		byte[] pic;
		try {
			pic = getPictureByteArray("C:\\Users\\Tibame_T14\\Desktop\\S__25600013.jpg");
			fMemVO1.setF_mem_pic(pic);
			fMemVO1.setOrganic_certi(pic);
			fMemVO1.setEnv_friendly_certi(pic);
			System.out.println("圖片新增成功");
		} catch (IOException e) {
			e.printStackTrace();
		}
		fMemVO1.setRating_score_mk(326);
		fMemVO1.setRating_count_mk(66);
		fMemVO1.setRating_score_tr(557);
		fMemVO1.setRating_count_tr(121);
		fMemVO1.setReport_count(0);
		fMemVO1.setCerti_state(1);
		dao.insert(fMemVO1);
		System.out.println("新增資料成功");

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
