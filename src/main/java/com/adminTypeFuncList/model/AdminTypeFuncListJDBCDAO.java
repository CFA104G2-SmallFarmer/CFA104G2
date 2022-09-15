package com.adminTypeFuncList.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminTypeFuncListJDBCDAO implements AdminTypeFuncListDAO_Interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "53434976";

	private static final String INSERT_STMT = "INSERT INTO admin_type_func_list (admin_type_id,admin_func_id) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT admin_type_id , admin_func_id FROM admin_type_func_list ORDER BY admin_type_id";
	private static final String GET_TYPE_STMT = "SELECT admin_type_id , admin_func_id FROM admin_type_func_list WHERE admin_type_id = ?";
	private static final String DELETE_TYPE_FUNC = "DELETE FROM admin_type_func_list WHERE admin_type_id =? AND admin_func_id =?";

	@Override
	public void insert(AdminTypeFuncListVO adminTypeFuncListVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, adminTypeFuncListVO.getAdmin_type_id());
			pstmt.setInt(2, adminTypeFuncListVO.getAdmin_func_id());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(AdminTypeFuncListVO adminTypeFuncListVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_TYPE_FUNC);
			pstmt.setInt(1, adminTypeFuncListVO.getAdmin_type_id());
			pstmt.setInt(2, adminTypeFuncListVO.getAdmin_func_id());
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public List<AdminTypeFuncListVO> findByAdminType(Integer admin_type_id) {

		List<AdminTypeFuncListVO> list = new ArrayList<AdminTypeFuncListVO>();
		AdminTypeFuncListVO adminTypeFuncListVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_TYPE_STMT);

			pstmt.setInt(1, admin_type_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminTypeFuncListVO = new AdminTypeFuncListVO();
				adminTypeFuncListVO.setAdmin_type_id(rs.getInt("admin_type_id"));
				adminTypeFuncListVO.setAdmin_func_id(rs.getInt("admin_func_id"));
				list.add(adminTypeFuncListVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public List<AdminTypeFuncListVO> getAll() {
		List<AdminTypeFuncListVO> list = new ArrayList<AdminTypeFuncListVO>();
		AdminTypeFuncListVO adminTypeFuncListVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminTypeFuncListVO = new AdminTypeFuncListVO();
				adminTypeFuncListVO.setAdmin_type_id(rs.getInt("admin_type_id"));
				adminTypeFuncListVO.setAdmin_func_id(rs.getInt("admin_func_id"));
				list.add(adminTypeFuncListVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		
		AdminTypeFuncListDAO dao = new AdminTypeFuncListDAO();
		
		
//insert(AdminTypeFuncListVO adminTypeFuncListVO);
		
		AdminTypeFuncListVO adminTypeFuncListVO1 = new AdminTypeFuncListVO();
		adminTypeFuncListVO1.setAdmin_type_id(2);
		adminTypeFuncListVO1.setAdmin_func_id(5);
		dao.insert(adminTypeFuncListVO1);
		System.out.println("OK");
		
//delete(AdminTypeFuncListVO adminTypeFuncListVO);
		
//		AdminTypeFuncListVO adminTypeFuncListVO2 = new AdminTypeFuncListVO();
//		adminTypeFuncListVO2.setAdmin_type_id(2);
//		adminTypeFuncListVO2.setAdmin_func_id(4);
//		dao.delete(adminTypeFuncListVO2);
//		System.out.println("OK");

//findByAdminType(Integer admin_type_id);
		
//		List<AdminTypeFuncListVO> list1 = dao.findByAdminType(4);
//		for(AdminTypeFuncListVO vo : list1) {
//			System.out.println(vo);
//		}
		
//getAll();
		
//		int count = 0;
//		List<AdminTypeFuncListVO> list2 = dao.getAll();
//		for(AdminTypeFuncListVO vo : list2) {
//			count++;
//			System.out.println(vo);
//		}
//		System.out.println(count);
		
	}

}

