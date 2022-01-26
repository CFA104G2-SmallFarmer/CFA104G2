package com.proDiary.model;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;





public class ProDairyJDBCDAO implements ProDairyDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

	private static final String INSERT_STMT = //10個問號//DIR_ID是自增主鍵不用打
			"INSERT INTO PROJ_DIARY (PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EQUIPMENT,DIR_MATERIAL,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
	private static final String GET_ALL_SAME_DAY_STMT = // 列出這個專案，某一天的所有日誌
			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EQUIPMENT,DIR_MATERIAL,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE PROJ_ID=? and DIR_UPLOAD_DATE=?";
	private static final String GET_ALL_STMT = //列出這個專案的所有日誌
			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EQUIPMENT,DIR_MATERIAL,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE PROJ_ID=? ORDER BY DIR_UPLOAD_DATE";
//	TODO
//	GET_ALL_STMT要desc排列
	private static final String GET_ONE_STMT = //找一個日誌
			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EQUIPMENT,DIR_MATERIAL,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE DIR_ID=?";
	private static final String DELETE = 
			"DELETE FROM PROJ_DIARY WHERE DIR_ID=?";
	private static final String UPDATE = //更新特定項目//10個問號
			"UPDATE PROJ_DIARY SET DIR_UPLOAD_DATE = ?, DIR_PROCEDURE = ?,DIR_PRODUCT = ?,DIR_EQUIPMENT = ?,DIR_MATERIAL = ?,DIR_EMOJI = ?,DIR_NOTES = ?,DIR_UPLOAD_STATE = ?,DIR_PIC= ? WHERE DIR_ID = ?";
	@Override
	public void insert(ProDairyVO proDairyVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, proDairyVO.getProj_id());
			pstmt.setDate(2, proDairyVO.getDir_upload_date());
			pstmt.setString(3, proDairyVO.getDir_procedure());
			pstmt.setString(4, proDairyVO.getDir_product());
			pstmt.setString(5, proDairyVO.getDir_equipment());
			pstmt.setString(6, proDairyVO.getDir_material());
			pstmt.setString(7, proDairyVO.getDir_emoji());
			pstmt.setString(8, proDairyVO.getDir_notes());
			pstmt.setInt(9, proDairyVO.getDir_upload_state());
			pstmt.setBytes(10, proDairyVO.getDir_pic());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	@Override
	public void update(ProDairyVO proDairyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setDate(1, proDairyVO.getDir_upload_date());
			pstmt.setString(2, proDairyVO.getDir_procedure());
			pstmt.setString(3, proDairyVO.getDir_product());
			pstmt.setString(4, proDairyVO.getDir_equipment());
			pstmt.setString(5, proDairyVO.getDir_material());
			pstmt.setString(6, proDairyVO.getDir_emoji());
			pstmt.setString(7, proDairyVO.getDir_notes());
			pstmt.setInt(8, proDairyVO.getDir_upload_state());
			pstmt.setBytes(9, proDairyVO.getDir_pic());
			pstmt.setInt(10, proDairyVO.getDir_id());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	@Override
	public void delete(Integer dir_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, dir_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public ProDairyVO findByPrimaryKey(Integer dir_id) {
		ProDairyVO proDairyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, dir_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				proDairyVO = new ProDairyVO();
				proDairyVO.setDir_id(rs.getInt("dir_id"));
				proDairyVO.setProj_id(rs.getInt("proj_id"));
				proDairyVO.setDir_upload_date(rs.getDate("dir_upload_date"));
				proDairyVO.setDir_procedure(rs.getString("dir_procedure"));
				proDairyVO.setDir_product(rs.getString("dir_product"));
				proDairyVO.setDir_equipment(rs.getString("dir_equipment"));
				proDairyVO.setDir_material(rs.getString("dir_material"));
				proDairyVO.setDir_emoji(rs.getString("dir_emoji"));
				proDairyVO.setDir_notes(rs.getString("dir_notes"));
				proDairyVO.setDir_upload_state(rs.getInt("dir_upload_state"));
				proDairyVO.setDir_pic(rs.getBytes("dir_pic"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return proDairyVO;
	}

	@Override
	public List<ProDairyVO> getAllSameDay(Integer proj_id, Date dir_upload_date) {
		List<ProDairyVO> list = new ArrayList<ProDairyVO>();
		ProDairyVO proDairyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
		
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_SAME_DAY_STMT);
			/*=====列出這個專案，某一天的所有日誌======*/
			pstmt.setInt(1, proj_id);
			pstmt.setDate(2, dir_upload_date);
			/*=============================*/
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// proDairyVO 也稱為 Domain objects
				proDairyVO = new ProDairyVO();
				proDairyVO.setDir_id(rs.getInt("dir_id"));
				proDairyVO.setProj_id(rs.getInt("proj_id"));
				proDairyVO.setDir_upload_date(rs.getDate("dir_upload_date"));
				proDairyVO.setDir_procedure(rs.getString("dir_procedure"));
				proDairyVO.setDir_product(rs.getString("dir_product"));
				proDairyVO.setDir_equipment(rs.getString("dir_equipment"));
				proDairyVO.setDir_material(rs.getString("dir_material"));
				proDairyVO.setDir_emoji(rs.getString("dir_emoji"));
				proDairyVO.setDir_notes(rs.getString("dir_notes"));
				proDairyVO.setDir_upload_state(rs.getInt("dir_upload_state"));
				proDairyVO.setDir_pic(rs.getBytes("dir_pic"));
				list.add(proDairyVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	@Override
	public List<ProDairyVO> getAll(Integer proj_id) {
		List<ProDairyVO> list = new ArrayList<ProDairyVO>();
		ProDairyVO proDairyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
		

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			/*=====列出這個專案的所有日誌======*/
			pstmt.setInt(1, proj_id);
			/*=============================*/
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// proDairyVO 也稱為 Domain objects
				proDairyVO = new ProDairyVO();
				proDairyVO.setDir_id(rs.getInt("dir_id"));
				proDairyVO.setProj_id(rs.getInt("proj_id"));
				proDairyVO.setDir_upload_date(rs.getDate("dir_upload_date"));
				proDairyVO.setDir_procedure(rs.getString("dir_procedure"));
				proDairyVO.setDir_product(rs.getString("dir_product"));
				proDairyVO.setDir_equipment(rs.getString("dir_equipment"));
				proDairyVO.setDir_material(rs.getString("dir_material"));
				proDairyVO.setDir_emoji(rs.getString("dir_emoji"));
				proDairyVO.setDir_notes(rs.getString("dir_notes"));
				proDairyVO.setDir_upload_state(rs.getInt("dir_upload_state"));
				proDairyVO.setDir_pic(rs.getBytes("dir_pic"));
				list.add(proDairyVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	public static void main(String[] args) {

		ProDairyJDBCDAO dao = new ProDairyJDBCDAO();
		/*=====================================================*/
//		// 新增
//		ProDairyVO proDairyVO2 = new ProDairyVO();
//		proDairyVO2.setProj_id(1001);
//		proDairyVO2.setDir_upload_date(java.sql.Date.valueOf("2022-01-01"));
//		proDairyVO2.setDir_procedure("整地");
//		proDairyVO2.setDir_product("文旦");
//		proDairyVO2.setDir_equipment(null);
//		proDairyVO2.setDir_material("新SH土壤添加物5公斤/株/年");
//		proDairyVO2.setDir_emoji("開心");
//		proDairyVO2.setDir_notes("柚子種植在播種前，苗圃地要深耕曬土，使土質充分風化，苗圃的周圍要開好排水溝，方便排灌，苗圃起畦要東西方向排列，一般畦寬1.2米，高15-20厘米，溝寬40厘米，畦長看地形而定，畦面要平，土粒要細碎，在播種前幾天，要施草肥（每畝農家肥約1800公斤，草木灰150公斤，和表土拌勻），再進行播種。");
//		proDairyVO2.setDir_upload_state(1);
//
//		byte[] pic;
//		try {
//			pic= getPictureByteArray("ProjectPic/strawberry1.jpg");//回傳一個水管
//			proDairyVO2.setDir_pic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		dao.insert(proDairyVO2);
//		System.out.println("成功");
		
		/*=====================================================*/
		// 修改
	
//		ProDairyVO proDairyVO2 = new ProDairyVO();
//		
//
//		proDairyVO2.setDir_upload_date(java.sql.Date.valueOf("2021-11-10"));
//		proDairyVO2.setDir_procedure("育苗");
//		proDairyVO2.setDir_product("文旦");
//		proDairyVO2.setDir_equipment(null);
//		proDairyVO2.setDir_material(null);
//		proDairyVO2.setDir_emoji("開心");
//		proDairyVO2.setDir_notes("11月中旬，第一次育苗覆蓋。");
//		proDairyVO2.setDir_upload_state(1);
//		proDairyVO2.setDir_id(1);
//
//		byte[] pic;
//		try {
//			pic= getPictureByteArray("ProjectPic/pomelo1.jpg");//回傳一個水管
//			proDairyVO2.setDir_pic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		dao.update(proDairyVO2);
//		System.out.println("更新成功");
		/*=====================================================*/

		// 刪除
//		int x =5;
//		dao.delete(x);
//		System.out.println("刪除dir_id="+x+"成功");
		
		/*=====================================================*/

		// 查詢getone
		
//		ProDairyVO proDairyVO2 = dao.findByPrimaryKey(1);
//		System.out.print(proDairyVO2.getDir_id() + ",");
//		System.out.print(proDairyVO2.getProj_id() + ",");
//		System.out.print(proDairyVO2.getDir_upload_date() + ",");
//		System.out.print(proDairyVO2.getDir_procedure() + ",");
//		System.out.print(proDairyVO2.getDir_product() + ",");
//		System.out.print(proDairyVO2.getDir_equipment() + ",");
//		System.out.print(proDairyVO2.getDir_material() + ",");
//		System.out.print(proDairyVO2.getDir_emoji() + ",");
//		System.out.print(proDairyVO2.getDir_notes() + ",");
//		System.out.print(proDairyVO2.getDir_upload_state() + ",");
//		System.out.print(proDairyVO2.getDir_pic() + ",");
//		System.out.println("---------------------");

		/*=====================================================*/
//		// 查詢getAllSameDay
		/*=====列出這個專案，某一天的所有日誌======*/
//		pstmt.setInt(1, proj_id);
//		pstmt.setDate(2, dir_upload_date);
		/*=============================*///2022-01-01 00:00:00
//		Date spec_date = java.sql.Date.valueOf("2022-01-01");
//		List<ProDairyVO> list = dao.getAllSameDay(1001,spec_date);
//		for (ProDairyVO proDairyVO2 : list) {
//		System.out.print(proDairyVO2.getDir_id() + ",");
//		System.out.print(proDairyVO2.getProj_id() + ",");
//		System.out.print(proDairyVO2.getDir_upload_date() + ",");
//		System.out.print(proDairyVO2.getDir_procedure() + ",");
//		System.out.print(proDairyVO2.getDir_product() + ",");
//		System.out.print(proDairyVO2.getDir_equipment() + ",");
//		System.out.print(proDairyVO2.getDir_material() + ",");
//		System.out.print(proDairyVO2.getDir_emoji() + ",");
//		System.out.print(proDairyVO2.getDir_notes() + ",");
//		System.out.print(proDairyVO2.getDir_upload_state() + ",");
//		System.out.print(proDairyVO2.getDir_pic() + ",");
//		System.out.println();
//		System.out.println("------------");
//	}
		
		
		/*=====================================================*/
		// 查詢getall
		//public List<ProDairyVO> getAll(Integer proj_id)
		/*=====列出這個專案的所有日誌======*/
//		pstmt.setInt(1, proj_id);
		/*=============================*/
		List<ProDairyVO> list = dao.getAll(1001);
		for (ProDairyVO proDairyVO2 : list) {
		System.out.print(proDairyVO2.getDir_id() + ",");
		System.out.print(proDairyVO2.getProj_id() + ",");
		System.out.print(proDairyVO2.getDir_upload_date() + ",");
		System.out.print(proDairyVO2.getDir_procedure() + ",");
		System.out.print(proDairyVO2.getDir_product() + ",");
		System.out.print(proDairyVO2.getDir_equipment() + ",");
		System.out.print(proDairyVO2.getDir_material() + ",");
		System.out.print(proDairyVO2.getDir_emoji() + ",");
		System.out.print(proDairyVO2.getDir_notes() + ",");
		System.out.print(proDairyVO2.getDir_upload_state() + ",");
		System.out.print(proDairyVO2.getDir_pic() + ",");
		System.out.println();
		System.out.println("------------");
	}
		/*=====================================================*/
		
	
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

	
	
