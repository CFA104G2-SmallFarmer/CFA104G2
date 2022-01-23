package com.adminTypeFuncList.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminTypeFuncListDAO implements AdminTypeFuncListDAO_Interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "0000";

	private static final String INSERT_STMT = "INSERT INTO admin_type_func_list (admin_type_id,admin_func_id) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT admin_type_id , admin_func_id FROM admin_type_func_list";
	private static final String GET_TYPE_STMT = "SELECT admin_type_id , admin_func_id FROM admin_type_func_list WHERE admin_type_id = ?";
	private static final String DELETE_TYPE_FUNC = "DELETE FROM admin_type_func_list WHERE admin_type_id =?, admin_func_id =?";

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
				list.add(adminTypeFuncListVO); // Store the row in the list
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
				list.add(adminTypeFuncListVO); // Store the row in the list
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

}
