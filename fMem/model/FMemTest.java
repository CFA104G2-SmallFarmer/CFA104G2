package com.fMem.model;

import java.io.FileInputStream;
import java.io.IOException;

public class FMemTest {
	public static void main(String[] args) {
		FMemJDBCDAO dao = new FMemJDBCDAO();
		

		// �s�W
		FMemVO fMemVO1 = new FMemVO();
		fMemVO1.setMem_id(77004);
		fMemVO1.setF_mem_acc("Hitho1979@dayrep.com");
		fMemVO1.setF_mem_pwd("Hitho1979");
		fMemVO1.setAcc_state(1);
		fMemVO1.setF_mem_fname("�z�z�A��");
		fMemVO1.setF_mem_info("�z�z�A�����v�y�[�A���b��v�ɥN�A�N�O�x�W���W���u���~���ɩҡv�A"
				+ "�����ب|�]�B�c�ޡA�s���޳N��y�P�ǩӪ����I�A�ܤ����b���|��u�x�_���B�s�_����s"
				+ "�]�د��s���޳N�v�ɡv�C");
		fMemVO1.setF_mem_mobile("0928396184");
		fMemVO1.setF_mem_tel("08369430");
		fMemVO1.setF_mem_zipcode(152);
		fMemVO1.setF_mem_city("�s�_��");
		fMemVO1.setF_mem_dist("���M��");
		fMemVO1.setF_mem_add("�ؤK��80��3��");
		fMemVO1.setBank_code(437);
		fMemVO1.setBank_account("046292128293");
		fMemVO1.setReg_date(java.sql.Date.valueOf("2010-04-25"));
		// �Ϥ����ղΤ@���B�s�W
		byte[] pic;
		try {
			pic = getPictureByteArray("C:\\Users\\Tibame_T14\\Desktop\\S__25600013.jpg");
			fMemVO1.setF_mem_pic(pic);
			fMemVO1.setOrganic_certi(pic);
			fMemVO1.setEnv_friendly_certi(pic);
			System.out.println("�Ϥ��s�W���\");
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
		System.out.println("�s�W��Ʀ��\");

	}
	
	// �ϥ�byte[]�覡
		public static byte[] getPictureByteArray(String path) throws IOException {
			FileInputStream fis = new FileInputStream(path);
			byte[] buffer = new byte[fis.available()];		// available():��Ƭy���h��bytes��ơA��X���h��bytes
			fis.read(buffer);	// Ū���h��bytes��Ʀs�Jbuffer
			fis.close();
			return buffer;
		}
	
}
