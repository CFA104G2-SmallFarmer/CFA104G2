package com.fMem.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import com.mem.model.MemVO;

public class FMemTest {
	public static void main(String[] args) {
		FMemJDBCDAO dao = new FMemJDBCDAO();

//		// �s�W
//		FMemVO fMemVO1 = new FMemVO();
//		fMemVO1.setMem_id(77004);
//		fMemVO1.setF_mem_acc("Hitho1979@dayrep.com");
//		fMemVO1.setF_mem_pwd("Hitho1979");
//		fMemVO1.setAcc_state(1);
//		fMemVO1.setF_mem_fname("�z�z�A��");
//		fMemVO1.setF_mem_info(
//				"�z�z�A�����v�y�[�A���b��v�ɥN�A�N�O�x�W���W���u���~���ɩҡv�A" + "�����ب|�]�B�c�ޡA�s���޳N��y�P�ǩӪ����I�A�ܤ����b���|��u�x�_���B�s�_����s" + "�]�د��s���޳N�v�ɡv�C");
//		fMemVO1.setF_mem_mobile("0928396184");
//		fMemVO1.setF_mem_tel("08369430");
//		fMemVO1.setF_mem_zipcode(152);
//		fMemVO1.setF_mem_city("�s�_��");
//		fMemVO1.setF_mem_dist("���M��");
//		fMemVO1.setF_mem_add("�ؤK��80��3��");
//		fMemVO1.setBank_code(437);
//		fMemVO1.setBank_account("046292128293");
//		fMemVO1.setReg_date(java.sql.Date.valueOf("2010-04-25"));
//		// �Ϥ����ղΤ@���B�s�W
//		byte[] pic;
//		try {
//			pic = getPictureByteArray("C:\\Users\\Tibame_T14\\Desktop\\S__25600013.jpg");
//			fMemVO1.setF_mem_pic(pic);
//			fMemVO1.setOrganic_certi(pic);
//			fMemVO1.setEnv_friendly_certi(pic);
//			System.out.println("�Ϥ��s�W���\");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		fMemVO1.setRating_score_mk(326);
//		fMemVO1.setRating_count_mk(66);
//		fMemVO1.setRating_score_tr(557);
//		fMemVO1.setRating_count_tr(121);
//		fMemVO1.setReport_count(0);
//		fMemVO1.setCerti_state(1);
//		dao.insert(fMemVO1);
//		System.out.println("�s�W��Ʀ��\");
//
//		// �ק�
//		// ���ի�mem_id���Ʈw����uk�A�|���ק�
//		FMemVO fMemVO2 = new FMemVO();
//		fMemVO2.setF_mem_id(70001);
//		fMemVO2.setMem_id(77005);
//		fMemVO2.setF_mem_acc("Hitho1979@dayrep.com");
//		fMemVO2.setF_mem_pwd("Hitho1979");
//		fMemVO2.setAcc_state(1);
//		fMemVO2.setF_mem_fname("�z�z�A��");
//		fMemVO2.setF_mem_info(
//				"�z�z�A�����v�y�[�A���b��v�ɥN�A�N�O�x�W���W���u���~���ɩҡv�A" + "�����ب|�]�B�c�ޡA�s���޳N��y�P�ǩӪ����I�A�ܤ����b���|��u�x�_���B�s�_����s" + "�]�د��s���޳N�v�ɡv�C");
//		fMemVO2.setF_mem_mobile("0928396184");
//		fMemVO2.setF_mem_tel("08369430");
//		fMemVO2.setF_mem_zipcode(152);
//		fMemVO2.setF_mem_city("�s�_��");
//		fMemVO2.setF_mem_dist("���M��");
//		fMemVO2.setF_mem_add("�ؤK��80��3��");
//		fMemVO2.setBank_code(437);
//		fMemVO2.setBank_account("046292128293");
//		fMemVO2.setReg_date(java.sql.Date.valueOf("2010-04-25"));
//		// �Ϥ����ղΤ@���B�s�W
//		byte[] pic2;
//		try {
//			pic2 = getPictureByteArray("C:\\Users\\Tibame_T14\\Desktop\\S__25600013.jpg");
//			fMemVO2.setF_mem_pic(pic2);
//			fMemVO2.setOrganic_certi(pic2);
//			fMemVO2.setEnv_friendly_certi(pic2);
//			System.out.println("�Ϥ��s�W���\");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		fMemVO2.setRating_score_mk(326);
//		fMemVO2.setRating_count_mk(66);
//		fMemVO2.setRating_score_tr(557);
//		fMemVO2.setRating_count_tr(121);
//		fMemVO2.setReport_count(0);
//		fMemVO2.setCerti_state(1);
//
//		dao.update(fMemVO2);
//		System.out.println("��ƭק令�\");
//	
//		// �R��
//		dao.delete(70001);
//		System.out.println("�R����Ʀ��\");
		
		
		// �d��
		// img�|���B�z(�w�B�z)
		FMemVO fMemVO3 = dao.findByPrimaryKey(70002);
		System.out.print(fMemVO3.getF_mem_id() + ",");
		System.out.print(fMemVO3.getMem_id() + ",");
		System.out.print(fMemVO3.getF_mem_acc() + ",");
		System.out.print(fMemVO3.getF_mem_pwd() + ",");
		System.out.print(fMemVO3.getAcc_state() + ",");
		System.out.print(fMemVO3.getF_mem_fname() + ",");
		System.out.print(fMemVO3.getF_mem_info() + ",");
		System.out.print(fMemVO3.getF_mem_mobile() + ",");
		System.out.print(fMemVO3.getF_mem_tel() + ",");
		System.out.print(fMemVO3.getF_mem_zipcode() + ",");
		System.out.print(fMemVO3.getF_mem_city() + ",");
		System.out.print(fMemVO3.getF_mem_dist() + ",");
		System.out.print(fMemVO3.getF_mem_add() + ",");
		System.out.print(fMemVO3.getBank_code() + ",");
		System.out.print(fMemVO3.getBank_account() + ",");
		System.out.print(fMemVO3.getReg_date() + ",");
		System.out.print(fMemVO3.getF_mem_pic() + ",");
		System.out.print(fMemVO3.getRating_score_mk() + ",");
		System.out.print(fMemVO3.getRating_count_mk() + ",");
		System.out.print(fMemVO3.getRating_score_tr() + ",");
		System.out.print(fMemVO3.getRating_count_tr() + ",");
		System.out.print(fMemVO3.getReport_count() + ",");
		System.out.print(fMemVO3.getOrganic_certi() + ",");
		System.out.print(fMemVO3.getEnv_friendly_certi() + ",");
		System.out.print(fMemVO3.getCerti_state());
		
		// �d��
		List<FMemVO> list = dao.getAll();

		for (FMemVO aFMem : list) {
			System.out.print(aFMem.getF_mem_id() + ",");
			System.out.print(aFMem.getMem_id() + ",");
			System.out.print(aFMem.getF_mem_acc() + ",");
			System.out.print(aFMem.getF_mem_pwd() + ",");
			System.out.print(aFMem.getAcc_state() + ",");
			System.out.print(aFMem.getF_mem_fname() + ",");
			System.out.print(aFMem.getF_mem_info() + ",");
			System.out.print(aFMem.getF_mem_mobile() + ",");
			System.out.print(aFMem.getF_mem_tel() + ",");
			System.out.print(aFMem.getF_mem_zipcode() + ",");
			System.out.print(aFMem.getF_mem_city() + ",");
			System.out.print(aFMem.getF_mem_dist() + ",");
			System.out.print(aFMem.getF_mem_add() + ",");
			System.out.print(aFMem.getBank_code() + ",");
			System.out.print(aFMem.getBank_account() + ",");
			System.out.print(aFMem.getReg_date() + ",");
			System.out.print(aFMem.getF_mem_pic() + ",");
			System.out.print(aFMem.getRating_score_mk() + ",");
			System.out.print(aFMem.getRating_count_mk() + ",");
			System.out.print(aFMem.getRating_score_tr() + ",");
			System.out.print(aFMem.getRating_count_tr() + ",");
			System.out.print(aFMem.getReport_count() + ",");
			System.out.print(aFMem.getOrganic_certi() + ",");
			System.out.print(aFMem.getEnv_friendly_certi() + ",");
			System.out.print(aFMem.getCerti_state());
			System.out.println();
		}

	
	}

	// �ϥ�byte[]�覡
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()]; // available():��Ƭy���h��bytes��ơA��X���h��bytes
		fis.read(buffer); // Ū���h��bytes��Ʀs�Jbuffer
		fis.close();
		return buffer;
	}
	
	

}
