package com.projReport.model;

import java.util.*;
import java.sql.*;

public class ProjReportJDBCDAO implements ProjReportDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

	private static final String INSERT_STMT = "INSERT INTO ProjReport (PROJ_REPORT_ID,PROJ_ID,MEM_ID,REPORT_REASON,REPORT_TIME,REPORT_STATE,REPORT_NOTE,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY)"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT PROJ_REPORT_ID,PROJ_ID,MEM_ID,REPORT_REASON,REPORT_TIME,REPORT_STATE,REPORT_NOTE,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY FROM ProjReport ORDER BY PROJ_REPORT_ID";
	private static final String GET_ONE_STMT = "SELECT PROJ_REPORT_ID,PROJ_ID,MEM_ID,REPORT_REASON,REPORT_TIME,REPORT_STATE,REPORT_NOTE,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY FROM ProjReport WHERE PROJ_REPORT_ID = ?";
	private static final String DELETE = "DELETE FROM ProjReport WHERE PROJ_REPORT_ID = ?";
	private static final String UPDATE = "UPDATE ProjReport SET PROJ_REPORT_ID=?,PROJ_ID=?,MEM_ID=?,REPORT_REASON=?,REPORT_TIME=?,REPORT_STATE=?,REPORT_NOTE=?,START_DATE=?,EXCEPTED_END_DATE=?,ACTUAL_END_DATE=?,PROJ_TOTAL_FUND=?,PROJ_INTRO=?,PROJ_RISK=?,PROJ_TOTAL_COUNT=?,PROJ_VIDEO=?,MEM_REPORT_COUNT=?,PROJ_PAY=? WHERE PROJ_REPORT_ID = ?";

	@Override
	public void insert(ProjReportVO ProjReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, ProjReportVO.getProj_report_id());
			pstmt.setInt(2, ProjReportVO.getProj_id());
			pstmt.setInt(3, ProjReportVO.getMem_id());
			pstmt.setString(4, ProjReportVO.getReport_reason());
			pstmt.setDate(5, ProjReportVO.getReport_time());
			pstmt.setInt(6, ProjReportVO.getReport_state());
			pstmt.setString(7, ProjReportVO.getReport_note());
			
			
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
	public void update(ProjReportVO ProjReportVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, ProjReportVO.getProj_report_id());
			pstmt.setInt(2, ProjReportVO.getProj_id());
			pstmt.setInt(3, ProjReportVO.getMem_id());
			pstmt.setString(4, ProjReportVO.getReport_reason());
			pstmt.setDate(5, ProjReportVO.getReport_time());
			pstmt.setInt(6, ProjReportVO.getReport_state());
			pstmt.setString(7, ProjReportVO.getReport_note());

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
	public void delete(Integer PROJ_REPORT_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, PROJ_REPORT_ID);

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
	public ProjReportVO findByPrimaryKey(Integer PROJ_REPORT_ID) {

		ProjReportVO ProjReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, PROJ_REPORT_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjReportVO = new ProjReportVO();
				ProjReportVO.setProj_report_id(rs.getInt("PROJ_REPORT_ID"));
				ProjReportVO.setProj_id(rs.getInt("PROJ_ID"));
				ProjReportVO.setMem_id(rs.getInt("MEM_ID"));
				ProjReportVO.setReport_reason(rs.getString("REPORT_REASON"));
				ProjReportVO.setReport_time(rs.getDate("REPORT_TIME"));
				ProjReportVO.setReport_state(rs.getInt("REPORT_STATE"));
				ProjReportVO.setReport_note(rs.getString("REPORT_NOTE"));
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
		return ProjReportVO;
	}

	@Override
	public List<ProjReportVO> getAll() {
		List<ProjReportVO> list = new ArrayList<ProjReportVO>();
		ProjReportVO ProjReportVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjReportVO = new ProjReportVO();
				ProjReportVO.setProj_report_id(rs.getInt("PROJ_REPORT_ID"));
				ProjReportVO.setProj_id(rs.getInt("PROJ_ID"));
				ProjReportVO.setMem_id(rs.getInt("MEM_ID"));
				ProjReportVO.setReport_reason(rs.getString("REPORT_REASON"));
				ProjReportVO.setReport_time(rs.getDate("REPORT_TIME"));
				ProjReportVO.setReport_state(rs.getInt("REPORT_STATE"));
				ProjReportVO.setReport_note(rs.getString("REPORT_NOTE"));
				list.add(ProjReportVO);
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
}
