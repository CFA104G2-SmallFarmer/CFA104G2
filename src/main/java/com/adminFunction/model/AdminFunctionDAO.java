package com.adminFunction.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminFunctionDAO implements AdminFunctionDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G2");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, adminFunctionVO.getAdmin_func_id());
			pstmt.setString(2, adminFunctionVO.getAdmin_func_name());
			pstmt.setString(3, adminFunctionVO.getAdmin_func_des());
			pstmt.executeUpdate();

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, adminFunctionVO.getAdmin_func_name());
			pstmt.setString(2, adminFunctionVO.getAdmin_func_des());
			pstmt.setInt(3, adminFunctionVO.getAdmin_func_id());
			pstmt.executeUpdate();

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

			con = ds.getConnection();

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_FUNC);
			pstmt.setInt(1, admin_func_id);
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, admin_func_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminFunctionVO = new AdminFunctionVO();
				adminFunctionVO.setAdmin_func_id(rs.getInt("admin_func_id"));
				adminFunctionVO.setAdmin_func_name(rs.getString("admin_func_name"));
				adminFunctionVO.setAdmin_func_des(rs.getString("admin_func_des"));

			}

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminFunctionVO = new AdminFunctionVO();
				adminFunctionVO.setAdmin_func_id(rs.getInt("admin_func_id"));
				adminFunctionVO.setAdmin_func_name(rs.getString("admin_func_name"));
				adminFunctionVO.setAdmin_func_des(rs.getString("admin_func_des"));
				list.add(adminFunctionVO);
			}

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
