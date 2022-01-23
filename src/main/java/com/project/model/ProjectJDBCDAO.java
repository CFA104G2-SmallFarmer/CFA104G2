package com.project.model;

import java.util.*;

import com.projCollection.model.ProjCollectionJDBCDAO;

import java.sql.*;

public class ProjectJDBCDAO implements ProjectDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

	private static final String INSERT_STMT = "INSERT INTO PROJECT (PROJ_ID,F_MEM_ID,PROJ_NAME,PROJ_STATE,PROJ_MAIN_PIC,PROJ_ABSTRACT,PROJ_GOAL,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY)"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT PROJ_ID,F_MEM_ID,PROJ_NAME,PROJ_STATE,PROJ_MAIN_PIC,PROJ_ABSTRACT,PROJ_GOAL,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY FROM PROJECT ORDER BY PROJ_ID";
	private static final String GET_ONE_STMT = "SELECT PROJ_ID,F_MEM_ID,PROJ_NAME,PROJ_STATE,PROJ_MAIN_PIC,PROJ_ABSTRACT,PROJ_GOAL,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY FROM PROJECT WHERE PROJ_ID = ?";
	private static final String DELETE = "DELETE FROM PROJECT WHERE PROJ_ID = ?";
	private static final String UPDATE = "UPDATE PROJECT SET PROJ_ID=?,F_MEM_ID=?,PROJ_NAME=?,PROJ_STATE=?,PROJ_MAIN_PIC=?,PROJ_ABSTRACT=?,PROJ_GOAL=?,START_DATE=?,EXCEPTED_END_DATE=?,ACTUAL_END_DATE=?,PROJ_TOTAL_FUND=?,PROJ_INTRO=?,PROJ_RISK=?,PROJ_TOTAL_COUNT=?,PROJ_VIDEO=?,MEM_REPORT_COUNT=?,PROJ_PAY=? WHERE PROJ_ID = ?";

	@Override
	public void insert(ProjectVO projectVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, projectVO.getProj_id());
			pstmt.setInt(2, projectVO.getF_mem_id());
			pstmt.setString(3, projectVO.getProj_name());
			pstmt.setInt(4, projectVO.getProj_state());
			pstmt.setBytes(5, projectVO.getProj_main_pic());
			pstmt.setString(6, projectVO.getProj_abstract());
			pstmt.setInt(7, projectVO.getProj_goal());
			pstmt.setDate(8, projectVO.getStart_date());
			pstmt.setDate(9, projectVO.getExcepted_end_date());
			pstmt.setDate(10, projectVO.getActual_end_date());
			pstmt.setInt(11, projectVO.getProj_total_fund());
			pstmt.setString(12, projectVO.getProj_intro());
			pstmt.setString(13, projectVO.getProj_risk());
			pstmt.setInt(14, projectVO.getProj_total_count());
			pstmt.setString(15, projectVO.getProj_video());
			pstmt.setInt(16, projectVO.getMem_report_count());
			pstmt.setInt(17, projectVO.getProj_pay());
			
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
	public void update(ProjectVO projectVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, projectVO.getProj_id());
			pstmt.setInt(2, projectVO.getF_mem_id());
			pstmt.setString(3, projectVO.getProj_name());
			pstmt.setInt(4, projectVO.getProj_state());
			pstmt.setBytes(5, projectVO.getProj_main_pic());
			pstmt.setString(6, projectVO.getProj_abstract());
			pstmt.setInt(7, projectVO.getProj_goal());
			pstmt.setDate(8, projectVO.getStart_date());
			pstmt.setDate(9, projectVO.getExcepted_end_date());
			pstmt.setDate(10, projectVO.getActual_end_date());
			pstmt.setInt(11, projectVO.getProj_total_fund());
			pstmt.setString(12, projectVO.getProj_intro());
			pstmt.setString(13, projectVO.getProj_risk());
			pstmt.setInt(14, projectVO.getProj_total_count());
			pstmt.setString(15, projectVO.getProj_video());
			pstmt.setInt(16, projectVO.getMem_report_count());
			pstmt.setInt(17, projectVO.getProj_pay());

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
	public void delete(Integer proj_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, proj_id);

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
	public ProjectVO findByPrimaryKey(Integer proj_id) {

		ProjectVO projectVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, proj_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				projectVO = new ProjectVO();
				projectVO.setProj_id(rs.getInt("proj_id"));
				projectVO.setF_mem_id(rs.getInt("f_mem_id"));
				projectVO.setProj_name(rs.getString("proj_name"));
				projectVO.setProj_state(rs.getInt("proj_state"));
				projectVO.setProj_main_pic(rs.getBytes("proj_main_pic"));
				projectVO.setProj_abstract(rs.getString("proj_abstract"));
				projectVO.setProj_goal(rs.getInt("proj_goal"));
				projectVO.setStart_date(rs.getDate("start_date"));
				projectVO.setExcepted_end_date(rs.getDate("excepted_end_date"));
				projectVO.setActual_end_date(rs.getDate("actual_end_date"));
				projectVO.setProj_total_fund(rs.getInt("proj_total_fund"));
				projectVO.setProj_intro(rs.getString("proj_intro"));
				projectVO.setProj_risk(rs.getString("proj_risk"));
				projectVO.setProj_total_count(rs.getInt("proj_total_count"));
				projectVO.setProj_video(rs.getString("proj_video"));
				projectVO.setMem_report_count(rs.getInt("mem_report_count"));
				projectVO.setProj_pay(rs.getInt("proj_pay"));
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
		return projectVO;
	}

	@Override
	public List<ProjectVO> getAll() {
		List<ProjectVO> list = new ArrayList<ProjectVO>();
		ProjectVO projectVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				projectVO = new ProjectVO();
				projectVO.setProj_id(rs.getInt("proj_id"));
				projectVO.setF_mem_id(rs.getInt("f_mem_id"));
				projectVO.setProj_name(rs.getString("proj_name"));
				projectVO.setProj_state(rs.getInt("proj_state"));
				projectVO.setProj_main_pic(rs.getBytes("proj_main_pic"));
				projectVO.setProj_abstract(rs.getString("proj_abstract"));
				projectVO.setProj_goal(rs.getInt("proj_goal"));
				projectVO.setStart_date(rs.getDate("start_date"));
				projectVO.setExcepted_end_date(rs.getDate("excepted_end_date"));
				projectVO.setActual_end_date(rs.getDate("actual_end_date"));
				projectVO.setProj_total_fund(rs.getInt("proj_total_fund"));
				projectVO.setProj_intro(rs.getString("proj_intro"));
				projectVO.setProj_risk(rs.getString("proj_risk"));
				projectVO.setProj_total_count(rs.getInt("proj_total_count"));
				projectVO.setProj_video(rs.getString("proj_video"));
				projectVO.setMem_report_count(rs.getInt("mem_report_count"));
				projectVO.setProj_pay(rs.getInt("proj_pay"));
				list.add(projectVO);
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

		ProjCollectionJDBCDAO dao = new ProjCollectionJDBCDAO();
		/*=====================================================*/
//		// 新增
//		ProjCollectionVO projCollectionVO2 = new ProjCollectionVO();
//		projCollectionVO2.setProj_id(1002);
//		projCollectionVO2.setMem_id(77001);
//		dao.insert(projCollectionVO2);
//		System.out.println("成功");
		
		/*=====================================================*/

		// 刪除
//		int x_setProj_id =1002;
//		int y_setMem_id =77001;
//		
//		dao.delete(x_setProj_id,y_setMem_id);
//		System.out.println("刪除Proj_id="+x_setProj_id+",Mem_id="+y_setMem_id+" 成功");

		/*=====================================================*/

		// 查詢getall
		/*======呈現某會員的所有收藏======*/

//		List<ProjCollectionVO> list = dao.getAll(77000);
//		for (ProjCollectionVO projCollectionVO2 : list) {
//		System.out.print(projCollectionVO2.getProj_id() + ",");
//		System.out.print(projCollectionVO2.getMem_id() + ",");
//		System.out.println();
//		System.out.println("------------");
//		}
		
		/*=====================================================*/
		
	}
	
	
	
}
