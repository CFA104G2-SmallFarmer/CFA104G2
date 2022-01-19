package com.shop_order_details.model;

import java.util.*;
import java.sql.*;

public class ShopOrderDetailsJDBCDAO implements ShopOrderDetails_inferface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "OSPER";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO shop_order_details (order_id,prod_id,order_qty,order_unit_price,prod_id_stars,mem_id_stars) "
			+ "VALUES (?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT order_id,prod_id,order_qty,order_unit_price,prod_id_stars,mem_id_stars FROM shop_order_details order by order_id";
	private static final String GET_ONE_STMT = "SELECT order_id,prod_id,order_qty,order_unit_price,prod_id_stars,mem_id_stars FROM shop_order_details where order_id = ? and prod_id = ?";
	private static final String DELETE = "DELETE FROM CFA104G2.shop_order_details where order_id = ? and prod_id = ?";
	private static final String UPDATE = "UPDATE shop_order_details set order_qty=?,order_unit_price=?,prod_id_stars=?,mem_id_stars=? where order_id = ? and prod_id = ?";

	@Override
	public void insert(ShopOrderDetailsVO shoporderdetailVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, shoporderdetailVO.getOrder_id());
			pstmt.setInt(2, shoporderdetailVO.getProd_id());
			pstmt.setInt(3, shoporderdetailVO.getOrder_qty());
			pstmt.setInt(4, shoporderdetailVO.getOrder_unit_price());
			pstmt.setInt(5, shoporderdetailVO.getProd_id_stars());
			pstmt.setInt(6, shoporderdetailVO.getMem_id_stars());

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
	public void update(ShopOrderDetailsVO shoporderdetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, shoporderdetailVO.getOrder_qty());
			pstmt.setInt(2, shoporderdetailVO.getOrder_unit_price());
			pstmt.setInt(3, shoporderdetailVO.getProd_id_stars());
			pstmt.setInt(4, shoporderdetailVO.getMem_id_stars());
			//where 裡面的?
			pstmt.setInt(5, shoporderdetailVO.getOrder_id());
			pstmt.setInt(6, shoporderdetailVO.getProd_id());
			
			
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
	public ShopOrderDetailsVO findByPrimaryKey(Integer order_id, Integer prod_id) {

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

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				shoporderdetailsVO = new ShopOrderDetailsVO();
				shoporderdetailsVO.setOrder_id(rs.getInt("order_id"));
				shoporderdetailsVO.setProd_id(rs.getInt("prod_id"));
				shoporderdetailsVO.setOrder_qty(rs.getInt("order_qty"));
				shoporderdetailsVO.setOrder_unit_price(rs.getInt("order_unit_price"));
				shoporderdetailsVO.setProd_id_stars(rs.getInt("prod_id_stars"));
				shoporderdetailsVO.setMem_id_stars(rs.getInt("mem_id_stars"));
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
				// empVo 也稱為 Domain objects
				shoporderdetailsVO = new ShopOrderDetailsVO();
				shoporderdetailsVO.setOrder_id(rs.getInt("order_id"));
				shoporderdetailsVO.setProd_id(rs.getInt("prod_id"));
				shoporderdetailsVO.setOrder_qty(rs.getInt("order_qty"));
				shoporderdetailsVO.setOrder_unit_price(rs.getInt("order_unit_price"));
				shoporderdetailsVO.setProd_id_stars(rs.getInt("prod_id_stars"));
				shoporderdetailsVO.setMem_id_stars(rs.getInt("mem_id_stars"));
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
