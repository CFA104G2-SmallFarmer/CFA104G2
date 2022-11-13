package com.adminFunction.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminFunctionJDBCDAO implements AdminFunctionDAO_Interface {

	String driver = com.sysconfig.SysConfig.getDriver();
	String url = com.sysconfig.SysConfig.getUrl();
	String userid = com.sysconfig.SysConfig.getUserid();
	String passwd = com.sysconfig.SysConfig.getPasswd();

	private static final String INSERT_STMT = "INSERT INTO admin_function (admin_func_id,admin_func_name,admin_func_des) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT admin_func_id, admin_func_name ,admin_func_des FROM admin_function";
	private static final String GET_ONE_STMT = "SELECT admin_func_id, admin_func_name, admin_func_des FROM admin_function WHERE admin_func_id = ?";
	private static final String DELETE_FUNC = "DELETE FROM admin_function where admin_func_id = ?";
	private static final String UPDATE = "UPDATE admin_function set admin_func_name=?, admin_func_des=? WHERE admin_func_id = ?";

	@Override
	public void insert(AdminFunctionVO adminFunctionVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, adminFunctionVO.getAdmin_func_id());
			pstmt.setString(2, adminFunctionVO.getAdmin_func_name());
			pstmt.setString(3, adminFunctionVO.getAdmin_func_des());
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
	public void update(AdminFunctionVO adminFunctionVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, adminFunctionVO.getAdmin_func_name());
			pstmt.setString(2, adminFunctionVO.getAdmin_func_des());
			pstmt.setInt(3, adminFunctionVO.getAdmin_func_id());
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
	public void delete(Integer admin_func_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_FUNC);
			pstmt.setInt(1, admin_func_id);
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
	public AdminFunctionVO findByPrimaryKey(Integer admin_func_id) {

		AdminFunctionVO adminFunctionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, admin_func_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminFunctionVO = new AdminFunctionVO();
				adminFunctionVO.setAdmin_func_id(rs.getInt("admin_func_id"));
				adminFunctionVO.setAdmin_func_name(rs.getString("admin_func_name"));
				adminFunctionVO.setAdmin_func_des(rs.getString("admin_func_des"));

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
		return adminFunctionVO;
	}

	@Override
	public List<AdminFunctionVO> getAll() {
		List<AdminFunctionVO> list = new ArrayList<AdminFunctionVO>();
		AdminFunctionVO adminFunctionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminFunctionVO = new AdminFunctionVO();
				adminFunctionVO.setAdmin_func_id(rs.getInt("admin_func_id"));
				adminFunctionVO.setAdmin_func_name(rs.getString("admin_func_name"));
				adminFunctionVO.setAdmin_func_des(rs.getString("admin_func_des"));
				list.add(adminFunctionVO);
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

		AdminFunctionDAO dao = new AdminFunctionDAO();

//測試insert(AdminFunctionVO adminFunctionVO);

//		AdminFunctionVO adminFunctionVO1 = new AdminFunctionVO();
//		adminFunctionVO1.setAdmin_func_id(11);
//		adminFunctionVO1.setAdmin_func_name("測試");
//		adminFunctionVO1.setAdmin_func_des("青菜寫寫");
//		dao.insert(adminFunctionVO1);
//		System.out.println("ok");

//測試update(AdminFunctionVO adminFunctionVO);

//		AdminFunctionVO adminFunctionVO2 = new AdminFunctionVO();
//		adminFunctionVO2.setAdmin_func_id(11);
//		adminFunctionVO2.setAdmin_func_name("測試改改");
//		adminFunctionVO2.setAdmin_func_des("青菜改改");
//		dao.update(adminFunctionVO2);
//		System.out.println("ok");

//測試delete(Integer admin_func_id);

//		dao.delete(11);
//		System.out.println("ok");

//測試findByPrimaryKey(Integer admin_func_id);

//		AdminFunctionVO vo1 = dao.findByPrimaryKey(2);
//		System.out.println(vo1);

//測試getAll();

//		List<AdminFunctionVO> list = dao.getAll();
//		for (AdminFunctionVO vo2 : list) {
//			System.out.println(vo2);
//		}

	}

}
