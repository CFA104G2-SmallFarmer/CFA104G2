package com.project.model;

import java.util.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;

public class ProjectJDBCDAO implements ProjectDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

//	PROJ_ID is AI, PROJ_STATE df=0, START_DATE is NOW(), 
//	ACTUAL_END_DATE 結束才有 PROJ_TOTAL_FUND df=0, PROJ_TOTAL_COUNT df=0, MEM_REPORT_COUNT 檢舉才有
	private static final String INSERT_STMT = "INSERT INTO PROJECT (F_MEM_ID,PROJ_NAME,PROJ_STATE,PROJ_MAIN_PIC,PROJ_ABSTRACT,PROJ_GOAL,START_DATE,EXCEPTED_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,PROJ_PAY)"
			+ "VALUES (?, ?, 0, ?, ?, ?,NOW(), ?, 0, ?, ?, 0, ?,  ?)";
	private static final String GET_ALL_STMT = "SELECT PROJ_ID,F_MEM_ID,PROJ_NAME,PROJ_STATE,PROJ_MAIN_PIC,PROJ_ABSTRACT,PROJ_GOAL,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY FROM PROJECT ORDER BY PROJ_ID";
	private static final String GET_ONE_STMT = "SELECT PROJ_ID,F_MEM_ID,PROJ_NAME,PROJ_STATE,PROJ_MAIN_PIC,PROJ_ABSTRACT,PROJ_GOAL,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY FROM PROJECT WHERE PROJ_ID = ?";
	private static final String DELETE = "DELETE FROM PROJECT WHERE PROJ_ID = ?";

//	不可改PROJ_ID, F_MEM_ID, START_DATE
	private static final String UPDATE = "UPDATE PROJECT SET PROJ_NAME=?,PROJ_STATE=?,PROJ_MAIN_PIC=?,PROJ_ABSTRACT=?,PROJ_GOAL=?,EXCEPTED_END_DATE=?,ACTUAL_END_DATE=?,PROJ_TOTAL_FUND=?,PROJ_INTRO=?,PROJ_RISK=?,PROJ_TOTAL_COUNT=?,PROJ_VIDEO=?,MEM_REPORT_COUNT=?,PROJ_PAY=? WHERE PROJ_ID = ?";

	private static final String GET_ALL_SAME_FMEM_STMT = // 列出某小農的所有專案
			"SELECT PROJ_ID,F_MEM_ID,PROJ_NAME,PROJ_STATE,PROJ_MAIN_PIC,PROJ_ABSTRACT,PROJ_GOAL,START_DATE,EXCEPTED_END_DATE,ACTUAL_END_DATE,PROJ_TOTAL_FUND,PROJ_INTRO,PROJ_RISK,PROJ_TOTAL_COUNT,PROJ_VIDEO,MEM_REPORT_COUNT,PROJ_PAY FROM PROJECT WHERE F_MEM_ID=?";

	@Override
	public void insert(ProjectVO projectVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

//			PROJ_ID is AI, PROJ_STATE df=0, START_DATE is NOW(), 
//			ACTUAL_END_DATE 結束才有 PROJ_TOTAL_FUND df=0, PROJ_TOTAL_COUNT df=0, MEM_REPORT_COUNT 檢舉才有

			pstmt.setInt(1, projectVO.getF_mem_id());
			pstmt.setString(2, projectVO.getProj_name());
			pstmt.setBytes(3, projectVO.getProj_main_pic());
			pstmt.setString(4, projectVO.getProj_abstract());
			pstmt.setInt(5, projectVO.getProj_goal());
			pstmt.setDate(6, projectVO.getExcepted_end_date());
			pstmt.setString(7, projectVO.getProj_intro());
			pstmt.setString(8, projectVO.getProj_risk());
			pstmt.setString(9, projectVO.getProj_video());
			pstmt.setInt(10, projectVO.getProj_pay());

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

//			不可改PROJ_ID, F_MEM_ID, START_DATE
			pstmt.setString(1, projectVO.getProj_name());
			pstmt.setInt(2, projectVO.getProj_state());
			pstmt.setBytes(3, projectVO.getProj_main_pic());
			pstmt.setString(4, projectVO.getProj_abstract());
			pstmt.setInt(5, projectVO.getProj_goal());
			pstmt.setDate(6, projectVO.getExcepted_end_date());
			pstmt.setDate(7, projectVO.getActual_end_date());
			pstmt.setInt(8, projectVO.getProj_total_fund());
			pstmt.setString(9, projectVO.getProj_intro());
			pstmt.setString(10, projectVO.getProj_risk());
			pstmt.setInt(11, projectVO.getProj_total_count());
			pstmt.setString(12, projectVO.getProj_video());
			pstmt.setInt(13, projectVO.getMem_report_count());
			pstmt.setInt(14, projectVO.getProj_pay());
			pstmt.setInt(15, projectVO.getProj_id());

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

	// 列出某小農的所有專案
	@Override
	public List<ProjectVO> getAllSameFmem(Integer f_mem_id) {
		List<ProjectVO> list = new ArrayList<ProjectVO>();
		ProjectVO projectVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_SAME_FMEM_STMT);

			pstmt.setInt(1, f_mem_id);

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

		ProjectJDBCDAO dao = new ProjectJDBCDAO();
		/* ===================================================== */
//		// 新增
//		ProjectVO ProjectVO2 = new ProjectVO();
//
//		ProjectVO2.setF_mem_id(70003);
//		ProjectVO2.setProj_name("超現實文旦認養方案2");
//
//		byte[] pic1;
//		try {
//			pic1 = getPictureByteArray("ProjectPic//tomycat.png");// 回傳一個水管
//			ProjectVO2.setProj_main_pic(pic1);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		ProjectVO2.setProj_abstract("來自達利的文旦");
//		ProjectVO2.setProj_goal(100000);
//		ProjectVO2.setExcepted_end_date(java.sql.Date.valueOf("2022-11-10"));
//		ProjectVO2.setProj_intro("在文旦樹掛上知名藝術家達利的作畫，讓文旦更甜更好吃");
//		ProjectVO2.setProj_risk("颱風來了很危險，畫跟文旦都會被吹走");
//		ProjectVO2.setProj_video("https://www.youtube.com/watch?v=072tU1tamd0");
//		ProjectVO2.setProj_pay(0);
//		
//		dao.insert(ProjectVO2);
//		System.out.println("成功");

		/* ===================================================== */

		// 刪除
//		int x_setProj_id =1003;
//		
//		dao.delete(x_setProj_id);
//		System.out.println("刪除Proj_id="+x_setProj_id+"成功");

		/* ===================================================== */

		/* ===================================================== */
		// 修改

//		ProjectVO ProjectVO3 = new ProjectVO();
//
//		ProjectVO3.setProj_id(1002);
//		ProjectVO3.setProj_name("超現實文旦認養方案2");
//		ProjectVO3.setProj_state(1);
//		
//		byte[] pic1;
//		try {
//			pic1 = getPictureByteArray("ProjectPic//tomycat.png");// 回傳一個水管
//			ProjectVO3.setProj_main_pic(pic1);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		ProjectVO3.setProj_abstract("來自達利的文旦");
//		ProjectVO3.setProj_goal(100000);
//		ProjectVO3.setExcepted_end_date(java.sql.Date.valueOf("2022-11-10"));
//		ProjectVO3.setActual_end_date(java.sql.Date.valueOf("2023-11-10"));
//		ProjectVO3.setProj_total_fund(10);
//		ProjectVO3.setProj_intro("在文旦樹掛上知名藝術家達利的作畫，讓文旦更甜更好吃");
//		ProjectVO3.setProj_risk("颱風來了很危險，畫跟文旦都會被吹走");
//		ProjectVO3.setProj_total_count(10);
//		ProjectVO3.setProj_video("https://www.youtube.com/watch?v=072tU1tamd0");
//		ProjectVO3.setMem_report_count(0);
//		ProjectVO3.setProj_pay(0);
//
//		dao.update(ProjectVO3);
//		System.out.println("更新成功");

		/* ===================================================== */
//		
//		// 查詢getone，呈現某圖
//
//		ProjectVO ProjectVO4 = dao.findByPrimaryKey(1001);
//		
//		System.out.println(ProjectVO4.getProj_id() + ",");
//		System.out.println(ProjectVO4.getF_mem_id() + ",");
//		System.out.println(ProjectVO4.getProj_name() + ",");
//		System.out.println(ProjectVO4.getProj_state() + ",");
//		System.out.println(ProjectVO4.getProj_main_pic() + ",");
//		System.out.println(ProjectVO4.getProj_abstract() + ",");
//		System.out.println(ProjectVO4.getProj_goal() + ",");
//		System.out.println(ProjectVO4.getStart_date() + ",");
//		System.out.println(ProjectVO4.getExcepted_end_date() + ",");
//		System.out.println(ProjectVO4.getActual_end_date() + ",");
//		System.out.println(ProjectVO4.getProj_total_fund() + ",");
//		System.out.println(ProjectVO4.getProj_intro() + ",");
//		System.out.println(ProjectVO4.getProj_risk() + ",");
//		System.out.println(ProjectVO4.getProj_total_count() + ",");
//		System.out.println(ProjectVO4.getProj_video() + ",");
//		System.out.println(ProjectVO4.getMem_report_count() + ",");
//		System.out.println(ProjectVO4.getProj_pay() + ",");
//		
//		System.out.println("---------------------");

//		/* ===================================================== */
////		// 查詢getAllSameFmem
//		/* =====列出某小農所有的專案====== */
//		List<ProjectVO> list = dao.getAllSameFmem(70003);
//		for (ProjectVO ProjectVO5 : list) {
//			System.out.println(ProjectVO5.getProj_id() + ",");
//			System.out.println(ProjectVO5.getF_mem_id() + ",");
//			System.out.println(ProjectVO5.getProj_name() + ",");
//			System.out.println(ProjectVO5.getProj_state() + ",");
//			System.out.println(ProjectVO5.getProj_main_pic() + ",");
//			System.out.println(ProjectVO5.getProj_abstract() + ",");
//			System.out.println(ProjectVO5.getProj_goal() + ",");
//			System.out.println(ProjectVO5.getStart_date() + ",");
//			System.out.println(ProjectVO5.getExcepted_end_date() + ",");
//			System.out.println(ProjectVO5.getActual_end_date() + ",");
//			System.out.println(ProjectVO5.getProj_total_fund() + ",");
//			System.out.println(ProjectVO5.getProj_intro() + ",");
//			System.out.println(ProjectVO5.getProj_risk() + ",");
//			System.out.println(ProjectVO5.getProj_total_count() + ",");
//			System.out.println(ProjectVO5.getProj_video() + ",");
//			System.out.println(ProjectVO5.getMem_report_count() + ",");
//			System.out.println(ProjectVO5.getProj_pay() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}

//		// 查詢getall
//		/* ======呈現所有專案====== */
//
//		List<ProjectVO> list = dao.getAll();
//		for (ProjectVO ProjectVO5 : list) {
//			System.out.println(ProjectVO5.getProj_id() + ",");
//			System.out.println(ProjectVO5.getF_mem_id() + ",");
//			System.out.println(ProjectVO5.getProj_name() + ",");
//			System.out.println(ProjectVO5.getProj_state() + ",");
//			System.out.println(ProjectVO5.getProj_main_pic() + ",");
//			System.out.println(ProjectVO5.getProj_abstract() + ",");
//			System.out.println(ProjectVO5.getProj_goal() + ",");
//			System.out.println(ProjectVO5.getStart_date() + ",");
//			System.out.println(ProjectVO5.getExcepted_end_date() + ",");
//			System.out.println(ProjectVO5.getActual_end_date() + ",");
//			System.out.println(ProjectVO5.getProj_total_fund() + ",");
//			System.out.println(ProjectVO5.getProj_intro() + ",");
//			System.out.println(ProjectVO5.getProj_risk() + ",");
//			System.out.println(ProjectVO5.getProj_total_count() + ",");
//			System.out.println(ProjectVO5.getProj_video() + ",");
//			System.out.println(ProjectVO5.getMem_report_count() + ",");
//			System.out.println(ProjectVO5.getProj_pay() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}
//		;
//	}
//	/* ===================================================== */
//
//	// 使用byte[]方式
//	public static byte[] getPictureByteArray(String path) throws IOException {
//		FileInputStream fis = new FileInputStream(path);
//		byte[] buffer = new byte[fis.available()];// 長度，資料流多少bytes
//		fis.read(buffer);// 讀進byte陣列裡
//		fis.close();
//		return buffer; // 回傳byte[]
	};
}
