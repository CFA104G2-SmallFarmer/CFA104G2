package com.projDiscussion.model;

import java.util.*;
import java.sql.*;

public class ProjDiscussionJDBCDAO implements ProjDiscussionDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";
	//COMMENT_ID是自增主鍵不用打
	private static final String INSERT_STMT = "INSERT INTO PROJ_DISCUSSION (PROJ_ID,DISCUSSION_ID,MEM_ID,F_MEM_ID,COMMENT_DATE,COMMENT_CONTENT)"
			+ "VALUES (?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT COMMENT_ID,PROJ_ID,DISCUSSION_ID,MEM_ID,F_MEM_ID,COMMENT_DATE,COMMENT_CONTENT FROM PROJ_DISCUSSION ORDER BY COMMENT_ID";	
	private static final String GET_ONE_STMT = "SELECT COMMENT_ID,PROJ_ID,DISCUSSION_ID,MEM_ID,F_MEM_ID,COMMENT_DATE,COMMENT_CONTENT FROM PROJ_DISCUSSION WHERE COMMENT_ID = ?";
	private static final String DELETE = "DELETE FROM PROJ_DISCUSSION WHERE COMMENT_ID = ?";
	private static final String UPDATE = "UPDATE PROJ_DISCUSSION SET COMMENT_ID=?, PROJ_ID=?, DISCUSSION_ID=?, MEM_ID=?, F_MEM_ID=?, COMMENT_DATE=?, COMMENT_CONTENT=? WHERE COMMENT_ID = ?";
	@Override
	public void insert(ProjDiscussionVO projDiscussionVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

//			pstmt.setInt(1, projDiscussionVO.getComment_id());
			pstmt.setInt(1, projDiscussionVO.getProj_id());
			pstmt.setInt(2, projDiscussionVO.getDiscussion_id());
			pstmt.setInt(3, projDiscussionVO.getMem_id());
			if (projDiscussionVO.getF_mem_id()==null){
				pstmt.setNull(4, Types.NULL);}
			else{pstmt.setInt(4, projDiscussionVO.getF_mem_id());}
			pstmt.setDate(5, projDiscussionVO.getComment_date());
			pstmt.setString(6, projDiscussionVO.getComment_content());

			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void update(ProjDiscussionVO projDiscussionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, projDiscussionVO.getComment_id());
			pstmt.setInt(2, projDiscussionVO.getProj_id());
			pstmt.setInt(3, projDiscussionVO.getDiscussion_id());
			pstmt.setInt(4, projDiscussionVO.getMem_id());
			pstmt.setInt(5, projDiscussionVO.getF_mem_id());
			pstmt.setDate(6, projDiscussionVO.getComment_date());
			pstmt.setString(7, projDiscussionVO.getComment_content());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(Integer comment_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, comment_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public ProjDiscussionVO findByPrimaryKey(Integer comment_id) {

		ProjDiscussionVO ProjDiscussionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, comment_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjDiscussionVO = new ProjDiscussionVO();
				ProjDiscussionVO.setComment_id(rs.getInt("comment_id"));
				ProjDiscussionVO.setProj_id(rs.getInt("proj_id"));
				ProjDiscussionVO.setDiscussion_id(rs.getInt("discussion_id"));
				ProjDiscussionVO.setMem_id(rs.getInt("mem_id"));
				ProjDiscussionVO.setF_mem_id(rs.getInt("f_mem_id"));
				ProjDiscussionVO.setComment_date(rs.getDate("comment_date"));
				ProjDiscussionVO.setComment_content(rs.getString("comment_content"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return ProjDiscussionVO;
	}

	@Override
	public List<ProjDiscussionVO> getAll() {
		List<ProjDiscussionVO> list = new ArrayList<ProjDiscussionVO>();
		ProjDiscussionVO ProjDiscussionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjDiscussionVO = new ProjDiscussionVO();
				ProjDiscussionVO.setComment_id(rs.getInt("comment_id"));
				ProjDiscussionVO.setProj_id(rs.getInt("proj_id"));
				ProjDiscussionVO.setDiscussion_id(rs.getInt("discussion_id"));
				ProjDiscussionVO.setMem_id(rs.getInt("mem_id"));
				ProjDiscussionVO.setF_mem_id(rs.getInt("f_mem_id"));
				ProjDiscussionVO.setComment_date(rs.getDate("comment_date"));
				ProjDiscussionVO.setComment_content(rs.getString("comment_content"));
				list.add(ProjDiscussionVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		ProjDiscussionJDBCDAO dao = new ProjDiscussionJDBCDAO();

//		/*=====================================================*/
//////		// 新增
//
//		ProjDiscussionVO projDiscussionVO2 = new ProjDiscussionVO();
//		projDiscussionVO2.setProj_id(1001);
//		projDiscussionVO2.setDiscussion_id(1);
//		projDiscussionVO2.setMem_id(77000);
//		projDiscussionVO2.setF_mem_id(null);
//		projDiscussionVO2.setComment_date(java.sql.Date.valueOf("2022-05-01"));
//		projDiscussionVO2.setComment_content("disgusting");
//		
//		dao.insert(projDiscussionVO2);
//		System.out.println("成功新增");
//		
//		/*=====================================================*/
		// 修改

		ProjDiscussionVO projDiscussionVO2 = new ProjDiscussionVO();
		projDiscussionVO2.setProj_id(1001);
		projDiscussionVO2.setDiscussion_id(1);
		projDiscussionVO2.setMem_id(77000);
		projDiscussionVO2.setF_mem_id(null);
		projDiscussionVO2.setComment_date(java.sql.Date.valueOf("2022-05-01"));
		projDiscussionVO2.setComment_content("disgusting");
		
		dao.update(projDiscussionVO2);
		System.out.println("更新成功");
//		
//
//
//		/*=====================================================*/
//
//		 //刪除
////		int x =4;
////		dao.delete(x);
////		System.out.println("刪除dir_id="+x+"成功");
//		
//		/*=====================================================*/
//
//		// 查詢getone
//	
////		ProjDiscussionVO projDiscussionVO2 = dao.findByPrimaryKey(5);
////		System.out.print(projDiscussionVO2.getDiscussion_id() + ",");
////		System.out.print(projDiscussionVO2.getProj_id() + ",");
////		System.out.print(projDiscussionVO2.getDiscussion_pic() + ",");
////		System.out.print(projDiscussionVO2.getDiscussion_intro() + ",");
////		System.out.print(projDiscussionVO2.getDiscussion_total_count() + ",");
////		System.out.print(projDiscussionVO2.getDiscussion_fund() + ",");
////		System.out.print(projDiscussionVO2.getDiscussion_limited() + ",");
////		System.out.print(projDiscussionVO2.getDiscussion_ship_date() + ",");
////		System.out.print(projDiscussionVO2.getDiscussion_ship_area() + ",");
////		System.out.println("---------------------");
//
//		/*=====================================================*/
////		// 查詢getAllSameDay
//		/*=====列出這個專案，某一天的所有日誌======*/
////		pstmt.setInt(1, proj_id);
////		pstmt.setDate(2, dir_upload_date);
//		/*=============================*///2022-01-01 00:00:00
////		Date spec_date = java.sql.Date.valueOf("2022-01-01");
////		List<ProDairyVO> list = dao.getAllSameDay(1001,spec_date);
////		for (ProDairyVO proDairyVO2 : list) {
////		System.out.print(proDairyVO2.getDir_id() + ",");
////		System.out.print(proDairyVO2.getProj_id() + ",");
////		System.out.print(proDairyVO2.getDir_upload_date() + ",");
////		System.out.print(proDairyVO2.getDir_procedure() + ",");
////		System.out.print(proDairyVO2.getDir_product() + ",");
////		System.out.print(proDairyVO2.getDir_equipment() + ",");
////		System.out.print(proDairyVO2.getDir_material() + ",");
////		System.out.print(proDairyVO2.getDir_emoji() + ",");
////		System.out.print(proDairyVO2.getDir_notes() + ",");
////		System.out.print(proDairyVO2.getDir_upload_state() + ",");
////		System.out.print(proDairyVO2.getDir_pic() + ",");
////		System.out.println();
////		System.out.println("------------");
////	}
//		
//		
//		/*=====================================================*/
//		// 查詢getall
//		/*=====列出這個專案的所有日誌======*/
////		pstmt.setInt(1, proj_id);
//		/*=============================*/
//		List<ProjDiscussionVO> list = dao.getAll(1001);
//		for (ProjDiscussionVO projDiscussionVO2 : list) {
//		System.out.print(projDiscussionVO2.getDiscussion_id() + ",");
//		System.out.print(projDiscussionVO2.getProj_id() + ",");
//		System.out.print(projDiscussionVO2.getDiscussion_pic() + ",");
//		System.out.print(projDiscussionVO2.getDiscussion_intro() + ",");
//		System.out.print(projDiscussionVO2.getDiscussion_total_count() + ",");
//		System.out.print(projDiscussionVO2.getDiscussion_fund() + ",");
//		System.out.print(projDiscussionVO2.getDiscussion_limited() + ",");
//		System.out.print(projDiscussionVO2.getDiscussion_ship_date() + ",");
//		System.out.print(projDiscussionVO2.getDiscussion_ship_area() + ",");
//		System.out.println();
//		System.out.println("---------------------");
//	}
//		/*=====================================================*/
//		
//	
//}
//
//
//
//	// 使用byte[]方式
//	public static byte[] getPictureByteArray(String path) throws IOException {
//		FileInputStream fis = new FileInputStream(path);
//		byte[] buffer = new byte[fis.available()];//長度，資料流多少bytes
//		fis.read(buffer);//讀進byte陣列裡
//		fis.close();
//		return buffer; //回傳byte[]
//	}
	}
	
}
