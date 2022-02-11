package com.shopOrderDetails.model;

import java.util.*;
import java.sql.*;

public class ShopOrderDetailsJDBCDAO implements ShopOrderDetails_inferface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
			"INSERT INTO shop_order_details "
			+ "(ORDER_ID,"
			+ "PROD_ID,"
			+ "PROD_UNIT,"
			+ "ORDER_QTY,"
			+ "ORDER_UNIT_PRICE,"
			+ "ORDER_UNIT_AMOUNT) "
			+ "VALUES (?, ?, ?, ?, ?, ?)";
	
	private static final String GET_ALL_STMT = 
			"SELECT "
			+ "ORDER_ID,"
			+ "PROD_ID,"
			+ "PROD_UNIT,"
			+ "ORDER_QTY,"
			+ "ORDER_UNIT_PRICE,"
			+ "ORDER_UNIT_AMOUNT "
			+ "FROM shop_order_details order by ORDER_ID";
	
	private static final String GET_ONE_STMT = 
			"SELECT "
					+ "ORDER_ID,"
					+ "PROD_ID,"
					+ "PROD_UNIT,"
					+ "ORDER_QTY,"
					+ "ORDER_UNIT_PRICE,"
					+ "ORDER_UNIT_AMOUNT "
					+ "FROM shop_order_details where ORDER_ID = ? and prod_id = ?";
			
	private static final String DELETE = 
			"DELETE FROM shop_order_details where order_id = ? and prod_id = ?";
			
	private static final String UPDATE = 
			"UPDATE shop_order_details "
			+ "set  "
			+ "PROD_UNIT = ?,"
			+ "ORDER_QTY = ?,"
			+ "ORDER_UNIT_PRICE = ?,"
			+ "ORDER_UNIT_AMOUNT = ? "
			+ "where order_id = ? and prod_id = ?";

	//找出特定訂單顛號的集合
	private static final String GET_PK_ALL_STMT = 
			"SELECT "
					+ "ORDER_ID,"
					+ "PROD_ID,"
					+ "PROD_UNIT,"
					+ "ORDER_QTY,"
					+ "ORDER_UNIT_PRICE,"
					+ "ORDER_UNIT_AMOUNT "
					+ "FROM shop_order_details where ORDER_ID = ?";
	
	@Override
	public void insert(ShopOrderDetailsVO shoporderdetailsVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

//			"INSERT INTO shop_order_details "
//			+ "(ORDER_ID,"
//			+ "PROD_ID,"
//			+ "PROD_UNIT,"
//			+ "ORDER_QTY,"
//			+ "ORDER_UNIT_PRICE,"
//			+ "ORDER_UNIT_AMOUNT) "
//			+ "VALUES (?, ?, ?, ?, ?, ?)";
			
			pstmt.setInt(1, shoporderdetailsVO.getOrder_id());
			pstmt.setInt(2, shoporderdetailsVO.getProd_id());
			pstmt.setString(3, shoporderdetailsVO.getProd_unit());
			pstmt.setInt(4, shoporderdetailsVO.getOrder_qty());
			pstmt.setInt(5, shoporderdetailsVO.getOrder_unit_price());
			pstmt.setInt(6, shoporderdetailsVO.getOrder_unit_amount());

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
	public void update(ShopOrderDetailsVO shoporderdetailsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

//			"UPDATE shop_order_details "
//			+ "set "
//			+ "PROD_UNIT,"
//			+ "ORDER_QTY,"
//			+ "ORDER_UNIT_PRICE,"
//			+ "ORDER_UNIT_AMOUNT "
//			+ "where order_id = ? and prod_id = ?";
			
			
			pstmt.setString(1, shoporderdetailsVO.getProd_unit());
			pstmt.setInt(2, shoporderdetailsVO.getOrder_qty());
			pstmt.setInt(3, shoporderdetailsVO.getOrder_unit_price());
			pstmt.setInt(4, shoporderdetailsVO.getOrder_unit_amount());
			//where
			pstmt.setInt(5, shoporderdetailsVO.getOrder_id());
			pstmt.setInt(6, shoporderdetailsVO.getProd_id());
			
			
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
	public void delete(Integer order_id,Integer prod_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, order_id);
			pstmt.setInt(2, prod_id);

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
	public ShopOrderDetailsVO findByPrimaryKey(Integer order_id,Integer prod_id) {

		ShopOrderDetailsVO shoporderdetailsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, order_id);
			pstmt.setInt(2, prod_id);

			rs = pstmt.executeQuery();

//			"SELECT "
//			+ "ORDER_ID,"
//			+ "PROD_ID,"
//			+ "PROD_UNIT,"
//			+ "ORDER_QTY,"
//			+ "ORDER_UNIT_PRICE,"
//			+ "ORDER_UNIT_AMOUNT "
//			+ "FROM shop_order_details where ORDER_ID = ? and prod_id = ?";
			
			while (rs.next()) {
				
				shoporderdetailsVO = new ShopOrderDetailsVO();
				shoporderdetailsVO.setOrder_id(rs.getInt("order_id"));
				shoporderdetailsVO.setProd_id(rs.getInt("prod_id"));
				shoporderdetailsVO.setProd_unit(rs.getString("prod_unit"));
				shoporderdetailsVO.setOrder_qty(rs.getInt("order_qty"));
				shoporderdetailsVO.setOrder_unit_price(rs.getInt("order_unit_price"));
				shoporderdetailsVO.setOrder_unit_amount(rs.getInt("order_unit_amount"));
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
		return shoporderdetailsVO;
	}

	@Override
	public List<ShopOrderDetailsVO> getAll() {
		List<ShopOrderDetailsVO> list = new ArrayList<ShopOrderDetailsVO>();
		ShopOrderDetailsVO shoporderdetailsVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				shoporderdetailsVO = new ShopOrderDetailsVO();
				shoporderdetailsVO.setOrder_id(rs.getInt("order_id"));
				shoporderdetailsVO.setProd_id(rs.getInt("prod_id"));
				shoporderdetailsVO.setProd_unit(rs.getString("prod_unit"));
				shoporderdetailsVO.setOrder_qty(rs.getInt("order_qty"));
				shoporderdetailsVO.setOrder_unit_price(rs.getInt("order_unit_price"));
				shoporderdetailsVO.setOrder_unit_amount(rs.getInt("order_unit_amount"));
				list.add(shoporderdetailsVO);
			}
			
				// Handle any driver errors
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
	public List<ShopOrderDetailsVO> getPKAll(Integer order_id) {
		List<ShopOrderDetailsVO> list = new ArrayList<ShopOrderDetailsVO>();
		ShopOrderDetailsVO shoporderdetailsVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_PK_ALL_STMT);
			
			pstmt.setInt(1,order_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
//				"SELECT `order_id`,"
//						+ "`prod_id,"
//						+ "`order_qty`,"
//						+ "`order_unit_price`,"
//						+ "`prod_id_stars`,"
//						+ "`mem_id_stars` "
//						+ "FROM `shop_order_details` where `order_id` = ?";
//				
				
				shoporderdetailsVO = new ShopOrderDetailsVO();
				shoporderdetailsVO.setOrder_id(rs.getInt("order_id"));
				shoporderdetailsVO.setProd_id(rs.getInt("prod_id"));
				shoporderdetailsVO.setProd_unit(rs.getString("prod_unit"));
				shoporderdetailsVO.setOrder_qty(rs.getInt("order_qty"));
				shoporderdetailsVO.setOrder_unit_price(rs.getInt("order_unit_price"));
				shoporderdetailsVO.setOrder_unit_amount(rs.getInt("order_unit_amount"));
				list.add(shoporderdetailsVO);
			}
			
				// Handle any driver errors
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
