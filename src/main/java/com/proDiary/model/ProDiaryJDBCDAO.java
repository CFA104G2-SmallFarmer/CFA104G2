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





public class ProDiaryJDBCDAO implements ProDiaryDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "53434976";

	private static final String INSERT_STMT = //8個問號//DIR_ID是自增主鍵不用打
			"INSERT INTO PROJ_DIARY (PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC) VALUES (?, ?, ?, ?, ?, ?, ?,  ?)"; 
	private static final String GET_ALL_SAME_DAY_STMT = // 列出這個專案，某一天的所有日誌
			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE PROJ_ID=? and DIR_UPLOAD_DATE=?";
	private static final String GET_ALL_STMT = //列出這個專案的所有日誌
			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE PROJ_ID=? ORDER BY DIR_UPLOAD_DATE";
//	private static final String GET_ALL_STMT = //列出這個專案的所有未發佈日誌
//			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE PROJ_ID=? ORDER BY DIR_UPLOAD_DATE";
	private static final String GET_ALL_STMT_STATE_1 = //列出這個專案的所有已發佈日誌
			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE PROJ_ID=? AND DIR_UPLOAD_STATE =1 ORDER BY DIR_UPLOAD_DATE";
	
	//	TODO
//	GET_ALL_STMT要desc排列
	private static final String GET_ONE_STMT = //找一個日誌
			"SELECT DIR_ID,PROJ_ID,DIR_UPLOAD_DATE,DIR_PROCEDURE,DIR_PRODUCT,DIR_EMOJI,DIR_NOTES,DIR_UPLOAD_STATE,DIR_PIC FROM PROJ_DIARY WHERE DIR_ID=?";
	private static final String DELETE = 
			"DELETE FROM PROJ_DIARY WHERE DIR_ID=?";
	private static final String UPDATE = //更新特定項目//8個問號
			"UPDATE PROJ_DIARY SET DIR_UPLOAD_DATE = ?, DIR_PROCEDURE = ?,DIR_PRODUCT = ?,DIR_EMOJI = ?,DIR_NOTES = ?,DIR_UPLOAD_STATE = ?,DIR_PIC= ? WHERE DIR_ID = ?";
	@Override
	public void insert(ProDiaryVO proDiaryVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, proDiaryVO.getProj_id());
			pstmt.setDate(2, proDiaryVO.getDir_upload_date());
			pstmt.setString(3, proDiaryVO.getDir_procedure());
			pstmt.setString(4, proDiaryVO.getDir_product());
//			pstmt.setString(5, proDiaryVO.getDir_equipment());
//			pstmt.setString(6, proDiaryVO.getDir_material());
			pstmt.setString(5, proDiaryVO.getDir_emoji());
			pstmt.setString(6, proDiaryVO.getDir_notes());
			pstmt.setInt(7, proDiaryVO.getDir_upload_state());
			pstmt.setBytes(8, proDiaryVO.getDir_pic());

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
	public void update(ProDiaryVO proDiaryVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setDate(1, proDiaryVO.getDir_upload_date());
			pstmt.setString(2, proDiaryVO.getDir_procedure());
			pstmt.setString(3, proDiaryVO.getDir_product());
//			pstmt.setString(4, proDiaryVO.getDir_equipment());
//			pstmt.setString(5, proDiaryVO.getDir_material());
			pstmt.setString(4, proDiaryVO.getDir_emoji());
			pstmt.setString(5, proDiaryVO.getDir_notes());
			pstmt.setInt(6, proDiaryVO.getDir_upload_state());
			pstmt.setBytes(7, proDiaryVO.getDir_pic());
			pstmt.setInt(8, proDiaryVO.getDir_id());

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
	public ProDiaryVO findByPrimaryKey(Integer dir_id) {
		ProDiaryVO proDiaryVO = null;
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
				proDiaryVO = new ProDiaryVO();
				proDiaryVO.setDir_id(rs.getInt("dir_id"));
				proDiaryVO.setProj_id(rs.getInt("proj_id"));
				proDiaryVO.setDir_upload_date(rs.getDate("dir_upload_date"));
				proDiaryVO.setDir_procedure(rs.getString("dir_procedure"));
				proDiaryVO.setDir_product(rs.getString("dir_product"));
//				proDiaryVO.setDir_equipment(rs.getString("dir_equipment"));
//				proDiaryVO.setDir_material(rs.getString("dir_material"));
				proDiaryVO.setDir_emoji(rs.getString("dir_emoji"));
				proDiaryVO.setDir_notes(rs.getString("dir_notes"));
				proDiaryVO.setDir_upload_state(rs.getInt("dir_upload_state"));
				proDiaryVO.setDir_pic(rs.getBytes("dir_pic"));
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
		return proDiaryVO;
	}

	@Override
	public List<ProDiaryVO> getAllSameDay(Integer proj_id, Date dir_upload_date) {
		List<ProDiaryVO> list = new ArrayList<ProDiaryVO>();
		ProDiaryVO proDiaryVO = null;
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
				// proDiaryVO 也稱為 Domain objects
				proDiaryVO = new ProDiaryVO();
				proDiaryVO.setDir_id(rs.getInt("dir_id"));
				proDiaryVO.setProj_id(rs.getInt("proj_id"));
				proDiaryVO.setDir_upload_date(rs.getDate("dir_upload_date"));
				proDiaryVO.setDir_procedure(rs.getString("dir_procedure"));
				proDiaryVO.setDir_product(rs.getString("dir_product"));
//				proDiaryVO.setDir_equipment(rs.getString("dir_equipment"));
//				proDiaryVO.setDir_material(rs.getString("dir_material"));
				proDiaryVO.setDir_emoji(rs.getString("dir_emoji"));
				proDiaryVO.setDir_notes(rs.getString("dir_notes"));
				proDiaryVO.setDir_upload_state(rs.getInt("dir_upload_state"));
				proDiaryVO.setDir_pic(rs.getBytes("dir_pic"));
				list.add(proDiaryVO); // Store the row in the list
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
	public List<ProDiaryVO> getAllByState1(Integer proj_id) {
	
			List<ProDiaryVO> list = new ArrayList<ProDiaryVO>();
			ProDiaryVO proDiaryVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
			

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_ALL_STMT_STATE_1);
				/*=====列出這個專案的所有日誌======*/
				pstmt.setInt(1, proj_id);
				/*=============================*/
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// proDiaryVO 也稱為 Domain objects
					proDiaryVO = new ProDiaryVO();
					proDiaryVO.setDir_id(rs.getInt("dir_id"));
					proDiaryVO.setProj_id(rs.getInt("proj_id"));
					proDiaryVO.setDir_upload_date(rs.getDate("dir_upload_date"));
					proDiaryVO.setDir_procedure(rs.getString("dir_procedure"));
					proDiaryVO.setDir_product(rs.getString("dir_product"));
//					proDiaryVO.setDir_equipment(rs.getString("dir_equipment"));
//					proDiaryVO.setDir_material(rs.getString("dir_material"));
					proDiaryVO.setDir_emoji(rs.getString("dir_emoji"));
					proDiaryVO.setDir_notes(rs.getString("dir_notes"));
					proDiaryVO.setDir_upload_state(rs.getInt("dir_upload_state"));
					proDiaryVO.setDir_pic(rs.getBytes("dir_pic"));
					list.add(proDiaryVO); // Store the row in the list
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
	public List<ProDiaryVO> getAll(Integer proj_id) {
		List<ProDiaryVO> list = new ArrayList<ProDiaryVO>();
		ProDiaryVO proDiaryVO = null;
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
				// proDiaryVO 也稱為 Domain objects
				proDiaryVO = new ProDiaryVO();
				proDiaryVO.setDir_id(rs.getInt("dir_id"));
				proDiaryVO.setProj_id(rs.getInt("proj_id"));
				proDiaryVO.setDir_upload_date(rs.getDate("dir_upload_date"));
				proDiaryVO.setDir_procedure(rs.getString("dir_procedure"));
				proDiaryVO.setDir_product(rs.getString("dir_product"));
//				proDiaryVO.setDir_equipment(rs.getString("dir_equipment"));
//				proDiaryVO.setDir_material(rs.getString("dir_material"));
				proDiaryVO.setDir_emoji(rs.getString("dir_emoji"));
				proDiaryVO.setDir_notes(rs.getString("dir_notes"));
				proDiaryVO.setDir_upload_state(rs.getInt("dir_upload_state"));
				proDiaryVO.setDir_pic(rs.getBytes("dir_pic"));
				list.add(proDiaryVO); // Store the row in the list
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

		ProDiaryJDBCDAO dao = new ProDiaryJDBCDAO();
		/*=====================================================*/
//		// 新增
//		ProDiaryVO proDiaryVO2 = new ProDiaryVO();
//		proDiaryVO2.setProj_id(1001);
//		proDiaryVO2.setDir_upload_date(java.sql.Date.valueOf("2022-01-01"));
//		proDiaryVO2.setDir_procedure("整地");
//		proDiaryVO2.setDir_product("文旦");
////		proDiaryVO2.setDir_equipment(null);
////		proDiaryVO2.setDir_material("新SH土壤添加物5公斤/株/年");
//		proDiaryVO2.setDir_emoji("開心");
//		proDiaryVO2.setDir_notes("柚子種植在播種前，苗圃地要深耕曬土，使土質充分風化，苗圃的周圍要開好排水溝，方便排灌，苗圃起畦要東西方向排列，一般畦寬1.2米，高15-20厘米，溝寬40厘米，畦長看地形而定，畦面要平，土粒要細碎，在播種前幾天，要施草肥（每畝農家肥約1800公斤，草木灰150公斤，和表土拌勻），再進行播種。");
//		proDiaryVO2.setDir_upload_state(1);
//
//		byte[] pic;
//		try {
//			pic= getPictureByteArray("ProjectPic/strawberry1.jpg");//回傳一個水管
//			proDiaryVO2.setDir_pic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		dao.insert(proDiaryVO2);
//		System.out.println("成功");
		
		/*=====================================================*/
		// 修改
	
//		ProDiaryVO proDiaryVO2 = new ProDiaryVO();
//		
//
//		proDiaryVO2.setDir_upload_date(java.sql.Date.valueOf("2021-02-10"));
//		proDiaryVO2.setDir_procedure("育苗");
//		proDiaryVO2.setDir_product("文旦");
//		proDiaryVO2.setDir_equipment(null);
//		proDiaryVO2.setDir_material(null);
//		proDiaryVO2.setDir_emoji("開心");
//		proDiaryVO2.setDir_notes("11月中旬，第一次育苗覆蓋。");
//		proDiaryVO2.setDir_upload_state(1);
//		proDiaryVO2.setDir_id(1);
//
//		byte[] pic;
//		try {
//			pic= getPictureByteArray("ProjectPic/pomelo1.jpg");//回傳一個水管
//			proDiaryVO2.setDir_pic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		dao.update(proDiaryVO2);
//		System.out.println("更新成功");
		/*=====================================================*/

		// 刪除
//		int x =5;
//		dao.delete(x);
//		System.out.println("刪除dir_id="+x+"成功");
		
		/*=====================================================*/

		// 查詢getone
//		System.out.print("....,");
		ProDiaryVO proDiaryVO2 = dao.findByPrimaryKey(1);
		System.out.print(proDiaryVO2.getDir_id() + ",");
		System.out.print(proDiaryVO2.getProj_id() + ",");
		System.out.print(proDiaryVO2.getDir_upload_date() + ",");
		System.out.print(proDiaryVO2.getDir_procedure() + ",");
		System.out.print(proDiaryVO2.getDir_product() + ",");
//		System.out.print(proDiaryVO2.getDir_equipment() + ",");
//		System.out.print(proDiaryVO2.getDir_material() + ",");
		System.out.print(proDiaryVO2.getDir_emoji() + ",");
		System.out.print(proDiaryVO2.getDir_notes() + ",");
		System.out.print(proDiaryVO2.getDir_upload_state() + ",");
		System.out.print(proDiaryVO2.getDir_pic() + ",");
		System.out.println("---------------------");

		/*=====================================================*/
//		// 查詢getAllSameDay
		/*=====列出這個專案，某一天的所有日誌======*/
//		pstmt.setInt(1, proj_id);
//		pstmt.setDate(2, dir_upload_date);
		/*=============================*///2022-01-01 00:00:00
//		Date spec_date = java.sql.Date.valueOf("2022-01-01");
//		List<ProDiaryVO> list = dao.getAllSameDay(1001,spec_date);
//		for (ProDiaryVO proDiaryVO2 : list) {
//		System.out.print(proDiaryVO2.getDir_id() + ",");
//		System.out.print(proDiaryVO2.getProj_id() + ",");
//		System.out.print(proDiaryVO2.getDir_upload_date() + ",");
//		System.out.print(proDiaryVO2.getDir_procedure() + ",");
//		System.out.print(proDiaryVO2.getDir_product() + ",");
////		System.out.print(proDiaryVO2.getDir_equipment() + ",");
////		System.out.print(proDiaryVO2.getDir_material() + ",");
//		System.out.print(proDiaryVO2.getDir_emoji() + ",");
//		System.out.print(proDiaryVO2.getDir_notes() + ",");
//		System.out.print(proDiaryVO2.getDir_upload_state() + ",");
//		System.out.print(proDiaryVO2.getDir_pic() + ",");
//		System.out.println();
//		System.out.println("------------");
//	}
		
		
		/*=====================================================*/
		// 查詢getall
		//public List<ProDiaryVO> getAll(Integer proj_id)
		/*=====列出這個專案的所有日誌======*/
//		pstmt.setInt(1, proj_id);
		/*=============================*/
//		List<ProDiaryVO> list = dao.getAll(1001);
//		for (ProDiaryVO proDiaryVO2 : list) {
//		System.out.print(proDiaryVO2.getDir_id() + ",");
//		System.out.print(proDiaryVO2.getProj_id() + ",");
//		System.out.print(proDiaryVO2.getDir_upload_date() + ",");
//		System.out.print(proDiaryVO2.getDir_procedure() + ",");
//		System.out.print(proDiaryVO2.getDir_product() + ",");
////		System.out.print(proDiaryVO2.getDir_equipment() + ",");
////		System.out.print(proDiaryVO2.getDir_material() + ",");
//		System.out.print(proDiaryVO2.getDir_emoji() + ",");
//		System.out.print(proDiaryVO2.getDir_notes() + ",");
//		System.out.print(proDiaryVO2.getDir_upload_state() + ",");
//		System.out.print(proDiaryVO2.getDir_pic() + ",");
//		System.out.println();
//		System.out.println("------------");
//	}
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

	
	
