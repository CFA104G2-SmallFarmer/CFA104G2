package com.projOrder.model;

import java.util.*;
import java.sql.*;

public class ProjOrderJDBCDAO implements ProjOrderDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

	private static final String INSERT_STMT = "INSERT INTO PROJORDER (ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME)"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM PROJORDER ORDER BY ORDER_ID";
	private static final String GET_ONE_STMT = "SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM PROJORDER WHERE ORDER_ID = ?";
	private static final String DELETE = "DELETE FROM PROJORDER WHERE ORDER_ID = ?";
	private static final String UPDATE = "UPDATE PROJORDER SET ORDER_ID=?,MEM_ID=?,PERK_ID=?,ORDER_TIME=?,ORDER_ADDR=?,ORDER_STATE=?,ORDER_CANCEL_TIME=? WHERE ORDER_ID = ?";

	@Override
	public void insert(ProjOrderVO ProjOrderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, ProjOrderVO.getOrder_id());
			pstmt.setInt(2, ProjOrderVO.getMem_id());
			pstmt.setInt(3, ProjOrderVO.getPerk_id());
			pstmt.setDate(4, ProjOrderVO.getOrder_time());
			pstmt.setString(5, ProjOrderVO.getOrder_addr());
			pstmt.setInt(6, ProjOrderVO.getOrder_state());
			pstmt.setDate(7, ProjOrderVO.getOrder_cancel_time());
			
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
	public void update(ProjOrderVO ProjOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, ProjOrderVO.getOrder_id());
			pstmt.setInt(2, ProjOrderVO.getMem_id());
			pstmt.setInt(3, ProjOrderVO.getPerk_id());
			pstmt.setDate(4, ProjOrderVO.getOrder_time());
			pstmt.setString(5, ProjOrderVO.getOrder_addr());
			pstmt.setInt(6, ProjOrderVO.getOrder_state());
			pstmt.setDate(7, ProjOrderVO.getOrder_cancel_time());

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
	public void delete(Integer order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, order_id);

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
	public ProjOrderVO findByPrimaryKey(Integer order_id) {

		ProjOrderVO ProjOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, order_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
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
		return ProjOrderVO;
	}

	@Override
	public List<ProjOrderVO> getAll() {
		List<ProjOrderVO> list = new ArrayList<ProjOrderVO>();
		ProjOrderVO ProjOrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
				list.add(ProjOrderVO);
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
