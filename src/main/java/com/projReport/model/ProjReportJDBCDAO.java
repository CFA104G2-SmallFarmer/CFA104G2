package com.projReport.model;

import java.util.*;

import java.sql.*;

public class ProjReportJDBCDAO implements ProjReportDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";
	
//	PROJ_REPORT_ID is auto increment，REPORT_NOTE是留給管理員處理完該檢舉單後填的
	private static final String INSERT_STMT = "INSERT INTO Proj_Report (PROJ_ID,MEM_ID,REPORT_REASON,REPORT_TIME,REPORT_STATE)"
			+ "VALUES ( ?, ?, ?, NOW(), 0)";
	private static final String GET_ALL_STMT = "SELECT PROJ_REPORT_ID,PROJ_ID,MEM_ID,REPORT_REASON,REPORT_TIME,REPORT_STATE,REPORT_NOTE FROM Proj_Report ORDER BY PROJ_REPORT_ID";

//	有時間再加列出某使用者的所有檢舉清單
//	private static final String GET_ONE_STMT = "SELECT PROJ_REPORT_ID,PROJ_ID,MEM_ID,REPORT_REASON,REPORT_TIME,REPORT_STATE,REPORT_NOTE FROM Proj_Report WHERE MEM_ID = ?";

//	檢舉單沒必要刪掉
	//	private static final String DELETE = "DELETE FROM ProjReport WHERE PROJ_REPORT_ID = ?";
	
//	只有管理員會針對狀態碼(REPORT_STATE)及處理結果(REPORT_NOTE)去改，其他不會有機會update
	private static final String UPDATE = "UPDATE Proj_Report SET REPORT_STATE=?,REPORT_NOTE=? WHERE PROJ_REPORT_ID = ?";
//	0: 未處理
//	1: 檢舉通過
//	2: 檢舉未通過
	
	
	@Override
	public void insert(ProjReportVO ProjReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, ProjReportVO.getProj_id());
			pstmt.setInt(2, ProjReportVO.getMem_id());
			pstmt.setString(3, ProjReportVO.getReport_reason());
			
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

			pstmt.setInt(1, ProjReportVO.getReport_state());
			pstmt.setString(2, ProjReportVO.getReport_note());
			pstmt.setInt(3, ProjReportVO.getProj_report_id());

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

//	@Override
//	public void delete(Integer PROJ_REPORT_ID) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(DELETE);
//
//			pstmt.setInt(1, PROJ_REPORT_ID);
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//			// Clean up JDBC resources
//		} finally {
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
//
//	}
//
//	@Override
//	public ProjReportVO findByPrimaryKey(Integer PROJ_REPORT_ID) {
//
//		ProjReportVO ProjReportVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ONE_STMT);
//
//			pstmt.setInt(1, PROJ_REPORT_ID);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//
//				ProjReportVO = new ProjReportVO();
//				ProjReportVO.setProj_report_id(rs.getInt("PROJ_REPORT_ID"));
//				ProjReportVO.setProj_id(rs.getInt("PROJ_ID"));
//				ProjReportVO.setMem_id(rs.getInt("MEM_ID"));
//				ProjReportVO.setReport_reason(rs.getString("REPORT_REASON"));
//				ProjReportVO.setReport_time(rs.getDate("REPORT_TIME"));
//				ProjReportVO.setReport_state(rs.getInt("REPORT_STATE"));
//				ProjReportVO.setReport_note(rs.getString("REPORT_NOTE"));
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
//		return ProjReportVO;
//	}

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
	public static void main(String[] args) {
		ProjReportJDBCDAO dao = new ProjReportJDBCDAO();

//		/*=====================================================*/
//////		// 新增
//
//		ProjReportVO projReportVO2 = new ProjReportVO();
//		projReportVO2.setProj_id(1001);
//		projReportVO2.setMem_id(77000);
//		projReportVO2.setReport_reason("文旦 bad");
//		
//		dao.insert(projReportVO2);
//		System.out.println("成功新增");
//		
//		/*=====================================================*/
		// 修改

//		ProjReportVO projReportVO2 = new ProjReportVO();
//		
//		projReportVO2.setReport_state(1);
//		projReportVO2.setReport_note("不合法檢舉");
//		projReportVO2.setProj_report_id(1);
//		
//		dao.update(projReportVO2);
//		System.out.println("更新成功");
//
//		/*=====================================================*/
//
//		 //刪除
//		int x =1;
//		dao.delete(x);
//		System.out.println("刪除dir_id="+x+"成功");
//		
//		/*=====================================================*/

//		// 查詢getAllSameProj
		/* =====列出所有檢舉單====== */
		/* ============================= */// 
//		List<ProjReportVO> list = dao.getAll();
//		for (ProjReportVO projReport : list) {
//			System.out.print(projReport.getProj_report_id() + ",");
//			System.out.print(projReport.getProj_id() + ",");
//			System.out.print(projReport.getMem_id() + ",");
//			System.out.print(projReport.getReport_reason() + ",");
//			System.out.print(projReport.getReport_time() + ",");
//			System.out.print(projReport.getReport_state() + ",");
//			System.out.print(projReport.getReport_note() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}
	}
}
