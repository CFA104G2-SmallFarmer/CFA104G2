package com.shopOrder.model;

import java.util.*;

import java.sql.*;

public class ShopOrderJDBCDAO implements ShopOrderDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
			"INSERT INTO shop_order (mem_id,order_date,order_ship_fee,order_add,order_amount,order_memo,order_ship_date,order_payment,order_state) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT order_id,mem_id,order_date,order_ship_fee,order_add,order_amount,order_memo,order_ship_date,order_payment,order_state FROM shop_order order by order_id";
	private static final String GET_ONE_STMT = 
			"SELECT order_id,mem_id,order_date,order_ship_fee,order_add,order_amount,order_memo,order_ship_date,order_payment,order_state FROM shop_order where order_id = ?";
	private static final String DELETE = 
			"DELETE FROM shop_order where order_id = ?";
	private static final String UPDATE = 
			"UPDATE shop_order set mem_id=?, order_date=?, order_ship_fee=?, order_add=?, order_amount=?, order_memo=?, order_ship_date=?,order_payment=?, order_state=? where order_id = ?";

	@Override
	public void insert(ShopOrderVO shoporderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			
			pstmt.setInt(1, shoporderVO.getMem_id());
			pstmt.setDate(2, shoporderVO.getOrder_date());
			pstmt.setInt(3, shoporderVO.getOrder_ship_fee());
			pstmt.setString(4, shoporderVO.getOrder_add());
			pstmt.setInt(5, shoporderVO.getOrder_amount());
			pstmt.setString(6, shoporderVO.getOrder_memo());
			pstmt.setDate(7, shoporderVO.getOrder_ship_date());
			pstmt.setInt(8, shoporderVO.getOrder_payment());
			pstmt.setInt(9, shoporderVO.getOrder_state());

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
	public void update(ShopOrderVO shoporderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, shoporderVO.getMem_id());
			pstmt.setDate(2, shoporderVO.getOrder_date());
			pstmt.setInt(3, shoporderVO.getOrder_ship_fee());
			pstmt.setString(4, shoporderVO.getOrder_add());
			pstmt.setInt(5, shoporderVO.getOrder_amount());
			pstmt.setString(6, shoporderVO.getOrder_memo());
			pstmt.setDate(7, shoporderVO.getOrder_ship_date());
			pstmt.setInt(8, shoporderVO.getOrder_payment());
			pstmt.setInt(9, shoporderVO.getOrder_state());

			pstmt.setInt(10, shoporderVO.getOrder_id());
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
	public ShopOrderVO findByPrimaryKey(Integer order_id) {

		ShopOrderVO shoporderVO = null;
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
				// empVo �]�٬� Domain objects
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrder_id(rs.getInt("order_id"));
				shoporderVO.setMem_id(rs.getInt("mem_id"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				shoporderVO.setOrder_ship_fee(rs.getInt("order_ship_fee"));
				shoporderVO.setOrder_add(rs.getString("order_add"));
				shoporderVO.setOrder_amount(rs.getInt("order_amount"));
				shoporderVO.setOrder_memo(rs.getString("order_memo"));
				shoporderVO.setOrder_ship_date(rs.getDate("order_ship_date"));
				shoporderVO.setOrder_payment(rs.getInt("order_payment"));
				shoporderVO.setOrder_state(rs.getInt("order_state"));
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
		return shoporderVO;
	}

	@Override
	public List<ShopOrderVO> getAll() {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrder_id(rs.getInt("order_id"));
				shoporderVO.setMem_id(rs.getInt("mem_id"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				shoporderVO.setOrder_ship_fee(rs.getInt("order_ship_fee"));
				shoporderVO.setOrder_add(rs.getString("order_add"));
				shoporderVO.setOrder_amount(rs.getInt("order_amount"));
				shoporderVO.setOrder_memo(rs.getString("order_memo"));
				shoporderVO.setOrder_ship_date(rs.getDate("order_ship_date"));
				shoporderVO.setOrder_payment(rs.getInt("order_payment"));
				shoporderVO.setOrder_state(rs.getInt("order_state"));

				list.add(shoporderVO); // Store the row in the list
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
	
	public static void main(String[] args) {}
}
