package com.adminType.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class AdminTypeJDBCDAO implements AdminTypeDAO_Interface {

	String driver = com.sysconfig.SysConfig.getDriver();
	String url = com.sysconfig.SysConfig.getUrl();
	String userid = com.sysconfig.SysConfig.getUserid();
	String passwd = com.sysconfig.SysConfig.getPasswd();

	private static final String INSERT_STMT = "INSERT INTO admin_type (admin_type_id,admin_type_name) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT admin_type_id , admin_type_name FROM admin_type";
	private static final String GET_ONE_STMT = "SELECT admin_type_id , admin_type_name FROM admin_type where admin_type_id =?";
	private static final String DELETE_TYPE = "DELETE FROM admin_type where admin_type_id = ?";
	private static final String UPDATE = "UPDATE admin_type set admin_type_name=? where admin_type_id = ?";

	@Override
	public void insert(AdminTypeVO adminTypeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, adminTypeVO.getAdmin_type_id());
			pstmt.setString(2, adminTypeVO.getAdmin_type_name());

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
	public void update(AdminTypeVO adminTypeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, adminTypeVO.getAdmin_type_name());
			pstmt.setInt(2, adminTypeVO.getAdmin_type_id());

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
	public void delete(Integer admin_type_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			con.setAutoCommit(false);

			pstmt = con.prepareStatement(DELETE_TYPE);
			pstmt.setInt(1, admin_type_id);
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
	public AdminTypeVO findByPrimaryKey(Integer admin_type_id) {

		AdminTypeVO adminTypeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, admin_type_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminTypeVO = new AdminTypeVO();
				adminTypeVO.setAdmin_type_id(rs.getInt("admin_type_id"));
				adminTypeVO.setAdmin_type_name(rs.getString("admin_type_name"));

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
		return adminTypeVO;
	}

	@Override
	public List<AdminTypeVO> getAll() {
		List<AdminTypeVO> list = new ArrayList<AdminTypeVO>();
		AdminTypeVO adminTypeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminTypeVO = new AdminTypeVO();
				adminTypeVO.setAdmin_type_id(rs.getInt("admin_type_id"));
				adminTypeVO.setAdmin_type_name(rs.getString("admin_type_name"));
				list.add(adminTypeVO);
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
		AdminTypeDAO dao = new AdminTypeDAO();

//測試insert(AdminTypeVO adminTypeVO);

		AdminTypeVO adminTypeVO1 = new AdminTypeVO();
		adminTypeVO1.setAdmin_type_id(5);
		adminTypeVO1.setAdmin_type_name("測試類別");
		dao.insert(adminTypeVO1);
		System.out.println("ok");

//測試update(AdminTypeVO adminTypeVO);

//		AdminTypeVO adminTypeVO2 = new AdminTypeVO();
//		adminTypeVO2.setAdmin_type_id(5);
//		adminTypeVO2.setAdmin_type_name("測試類別XXX");
//		dao.update(adminTypeVO2);
//		System.out.println("ok");

//測試delete(Integer admin_type_id);

//		dao.delete(5);
//		System.out.println("ok");

//測試findByPrimaryKey(Integer admin_type_id);

//		AdminTypeVO vo1 = dao.findByPrimaryKey(2);
//		System.out.println(vo1);

//測試List<AdminTypeVO> getAll();

//		List<AdminTypeVO> list = dao.getAll();
//		for (AdminTypeVO vo2 : list) {
//			System.out.println(vo2);
//		}

	}

}
