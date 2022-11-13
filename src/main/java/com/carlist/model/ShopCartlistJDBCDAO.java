package com.carlist.model;

import java.util.*;
import java.sql.*;


public class ShopCartlistJDBCDAO implements ShopCartlistDAO_interface{

	String driver = com.sysconfig.SysConfig.getDriver();
	String url = com.sysconfig.SysConfig.getUrl();
	String userid = com.sysconfig.SysConfig.getUserid();
	String passwd = com.sysconfig.SysConfig.getPasswd();

	private static final String INSERT_STMT = 
		"INSERT INTO shop_cartlist (mem_id,prod_id,cartlist_qty,cartlist_unit_price) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM cfa104g2.shop_cartlist";
	private static final String GET_ONE_STMT = 
		"SELECT mem_id,prod_id,cartlist_qty,cartlist_unit_price FROM shop_cartlist where mem_id = ? and prod_id = ?";
	private static final String DELETE = 
		"DELETE FROM shop_cartlist where mem_id = ? and prod_id = ?";
	private static final String UPDATE = 
		"UPDATE shop_cartlist set  cartlist_qty=?, cartlist_unit_price=? where mem_id = ? and prod_id = ?";
	
	
	@Override
	public void insert(ShopCartlistVO shopcarListVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, shopcarListVO.getMem_id());
			pstmt.setInt(2, shopcarListVO.getProd_id());
			pstmt.setInt(3, shopcarListVO.getCartlist_qty());
			pstmt.setInt(4, shopcarListVO.getCartlist_unit_price());
			
			pstmt.executeUpdate();
			// Handle any driver errors
		}catch (ClassNotFoundException e) {
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
	public void update(ShopCartlistVO shopcarlistVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, shopcarlistVO.getCartlist_qty());
			pstmt.setInt(2, shopcarlistVO.getCartlist_unit_price());
			//where �̭���?
			pstmt.setInt(3, shopcarlistVO.getMem_id());
			pstmt.setInt(4, shopcarlistVO.getProd_id());
			
			
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
	public void delete(Integer mem_id, Integer prod_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, prod_id);

			pstmt.executeUpdate();

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
	public ShopCartlistVO findByPrimaryKey(Integer mem_id, Integer prod_id) {
		
		ShopCartlistVO shopcartlistVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, prod_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				shopcartlistVO = new ShopCartlistVO();
				shopcartlistVO.setMem_id(rs.getInt("mem_id"));
				shopcartlistVO.setProd_id(rs.getInt("prod_id"));
				shopcartlistVO.setCartlist_qty(rs.getInt("cartlist_qty"));
				shopcartlistVO.setCartlist_unit_price(rs.getInt("cartlist_unit_price"));
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
		return shopcartlistVO;
	}

	@Override
	public List<ShopCartlistVO> getAll() {
		List<ShopCartlistVO> list = new ArrayList<ShopCartlistVO>();
		ShopCartlistVO shopcartlistVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// empVo �]�٬� Domain objects
				shopcartlistVO = new ShopCartlistVO();
				shopcartlistVO.setMem_id(rs.getInt("mem_id"));
				shopcartlistVO.setProd_id(rs.getInt("prod_id"));
				shopcartlistVO.setCartlist_qty(rs.getInt("cartlist_qty"));
				shopcartlistVO.setCartlist_unit_price(rs.getInt("cartlist_unit_price"));
				list.add(shopcartlistVO);
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
