package com.projPic.model;

import java.util.*;
import java.sql.*;

public class ProjPicJDBCDAO implements ProjPicDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

	private static final String INSERT_STMT = "INSERT INTO PROJPIC (PROJ_PIC_ID,PROJ_ID,PROJ_PIC)"
			+ "VALUES (?, ?, ?)";

	private static final String DELETE = "DELETE FROM PROJPIC WHERE PROJ_PIC_ID = ? AND PROJ_ID = ?";
	
	private static final String UPDATE = "UPDATE PROJPIC SET PROJ_PIC=? WHERE PROJ_PIC_ID = ? AND PROJ_ID = ?";


	private static final String GET_ONE_STMT = "SELECT PROJ_PIC_ID,PROJ_ID,PROJ_PIC FROM PROJPIC WHERE PROJ_ID = ?;";
	
//	底下感覺不會用到
//	private static final String GET_ALL_STMT = "SELECT PROJ_PIC_ID,PROJ_ID,PROJ_PIC FROM PROJPIC ORDER BY PROJ_ID";
	
	
	@Override
	public void insert(ProjPicVO ProjPicVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, ProjPicVO.getProj_pic_id());
			pstmt.setInt(2, ProjPicVO.getProj_id());
			pstmt.setBytes(3, ProjPicVO.getProj_pic());
			
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
	public void update(ProjPicVO ProjPicVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, ProjPicVO.getProj_pic_id());
			pstmt.setInt(2, ProjPicVO.getProj_id());
			pstmt.setBytes(3, ProjPicVO.getProj_pic());
			
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
	public void delete(Integer proj_pic_id, Integer proj_id ) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, proj_pic_id);
			pstmt.setInt(2, proj_id);
			
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
	public ProjPicVO findByPrimaryKey(Integer proj_pic_id) {

		ProjPicVO ProjPicVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, proj_pic_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjPicVO = new ProjPicVO();
				ProjPicVO.setProj_pic_id(rs.getInt("proj_pic_id"));
				ProjPicVO.setProj_id(rs.getInt("proj_id"));
				ProjPicVO.setProj_pic(rs.getBytes("proj_pic"));

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
		return ProjPicVO;
	}
//
//	@Override
//	public List<ProjPicVO> getAll() {
//		List<ProjPicVO> list = new ArrayList<ProjPicVO>();
//		ProjPicVO ProjPicVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ALL_STMT);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//
//				ProjPicVO = new ProjPicVO();
//				ProjPicVO.setproj_pic_id(rs.getInt("proj_pic_id"));
//				ProjPicVO.setproj_id(rs.getInt("proj_id"));
//				ProjPicVO.setproj_pic(rs.getInt("proj_pic"));
//				ProjPicVO.setReport_reason(rs.getString("REPORT_REASON"));
//				ProjPicVO.setReport_time(rs.getDate("REPORT_TIME"));
//				ProjPicVO.setReport_state(rs.getInt("REPORT_STATE"));
//				ProjPicVO.setReport_note(rs.getString("REPORT_NOTE"));
//				list.add(ProjPicVO);
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//
//	}
}
