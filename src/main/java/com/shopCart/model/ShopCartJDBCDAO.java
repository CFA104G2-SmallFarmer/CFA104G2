package com.shopCart.model;

import java.util.*;
import java.sql.*;


public class ShopCartJDBCDAO implements ShopCartDAO_interface{

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
		"INSERT INTO SHOP_CART"
		+ " (mem_id,"
		+ "prod_id,"
		+ "f_mem_id,"
		+ "cart_qty,"
		+ "cart_unit_price) "
		+ "VALUES (?, ?, ?, ?, ?)";
	
	private static final String GET_ALL_STMT = 
		"SELECT mem_id,"
		+ "prod_id,"
		+ "f_mem_id,"
		+ "cart_qty,"
		+ "cart_unit_price "
		+ "FROM SHOP_CART"
		+ "order by F_MEM_ID";
	
	private static final String GET_ONE_STMT = 
		"SELECT mem_id,"
		+ "prod_id,"
		+ "cart_qty,"
		+ "cart_unit_price "
		+ "FROM SHOP_CART where mem_id = ? and prod_id = ?";

	//取得指定買家的購物車集合	
	private static final String GET_ONE_LIST_STMT = 
			"SELECT mem_id,"
			+ "prod_id,"
			+ "f_mem_id,"
			+ "cart_qty,"
			+ "cart_unit_price "
			+ "FROM SHOP_CART where mem_id = ? ORDER BY F_MEM_ID";
	
	
	private static final String DELETE = 
		"DELETE FROM shop_cart where mem_id = ? and prod_id = ?";
	
	private static final String UPDATE = 
		"UPDATE SHOP_CART set "
		+ "cart_qty=?, "
		+ "cart_unit_price=? "
		+ "where mem_id = ? and prod_id = ?";
	
	//拆單
	private static final String GET_BREAKE_LIST =
			"SELECT mem_id,"
				+ "prod_id,"
				+ "f_mem_id,"
				+ "cart_qty,"
				+ "cart_unit_price "
				+ "FROM SHOP_CART "
				+ "where mem_id = ? and f_mem_id = ?";
	
	//清除購物車商品
	private static final String DELETE_SHOPCART =
			"DELETE FROM shop_cart where mem_id = ? and f_mem_id = ?";
			
	@Override
	public void insert(ShopCartVO shopcarVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, shopcarVO.getMem_id());
			pstmt.setInt(2, shopcarVO.getProd_id());
			pstmt.setInt(3, shopcarVO.getF_mem_id());
			pstmt.setInt(4, shopcarVO.getCart_qty());
			pstmt.setInt(5, shopcarVO.getCart_unit_price());
			
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
	public void update(ShopCartVO shopcarVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, shopcarVO.getCart_qty());
			pstmt.setInt(2, shopcarVO.getCart_unit_price());
			//where 裡面的?
			pstmt.setInt(3, shopcarVO.getMem_id());
			pstmt.setInt(4, shopcarVO.getProd_id());
			
			
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
	public ShopCartVO findByPrimaryKey(Integer mem_id, Integer prod_id) {
		
		ShopCartVO shopcartVO = null;
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
				shopcartVO = new ShopCartVO();
				shopcartVO.setMem_id(rs.getInt("mem_id"));
				shopcartVO.setProd_id(rs.getInt("prod_id"));
				shopcartVO.setCart_qty(rs.getInt("cart_qty"));
				shopcartVO.setCart_unit_price(rs.getInt("cart_unit_price"));
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
		return shopcartVO;
	}

	@Override
	public List<ShopCartVO> getAll() {
		List<ShopCartVO> list = new ArrayList<ShopCartVO>();
		ShopCartVO shopcartVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				shopcartVO = new ShopCartVO();
				shopcartVO.setMem_id(rs.getInt("mem_id"));
				shopcartVO.setProd_id(rs.getInt("prod_id"));
				shopcartVO.setProd_id(rs.getInt("f_mem_id"));
				shopcartVO.setCart_qty(rs.getInt("cart_qty"));
				shopcartVO.setCart_unit_price(rs.getInt("cart_unit_price"));
				list.add(shopcartVO);
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
/////////////////////////////////////////////////////////////////
	
	//取得指定買家的購物車集合
	@Override
	public List<ShopCartVO> getOneList(Integer mem_id) {
		
		List<ShopCartVO> list = new ArrayList<ShopCartVO>();
		ShopCartVO shopcartVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_LIST_STMT);
			
			pstmt.setInt(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {

//		"SELECT mem_id,"
//				+ "prod_id,"
//				+ "cart_qty,"
//				+ "cart_unit_price "
//				+ "FROM SHOP_CART where mem_id = ? ";

				shopcartVO = new ShopCartVO();
				shopcartVO.setMem_id(rs.getInt("mem_id"));
				shopcartVO.setProd_id(rs.getInt("prod_id"));
				shopcartVO.setF_mem_id(rs.getInt("f_mem_id"));
				shopcartVO.setCart_qty(rs.getInt("cart_qty"));
				shopcartVO.setCart_unit_price(rs.getInt("cart_unit_price"));
				list.add(shopcartVO);
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
	
	//拆單
	@Override
	public List<ShopCartVO> getBreakeList(Integer mem_id,Integer f_mem_id) {
		
		List<ShopCartVO> list = new ArrayList<ShopCartVO>();
		ShopCartVO shopcartVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_BREAKE_LIST);
			
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, f_mem_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {

//		"select * from (SELECT a.mem_id,a.prod_id,b.F_MEM_ID,a.cart_qty,a.cart_unit_price"
//				+"FROM SHOP_cart AS a"
//				+"LEFT JOIN SHOP_PRODUCT AS b ON a.prod_id=b.prod_id where mem_id= ? ) t2 where f_mem_id= ?";

				shopcartVO = new ShopCartVO();
				shopcartVO.setMem_id(rs.getInt("mem_id"));
				shopcartVO.setProd_id(rs.getInt("prod_id"));
				shopcartVO.setF_mem_id(rs.getInt("f_mem_id"));
				shopcartVO.setCart_qty(rs.getInt("cart_qty"));
				shopcartVO.setCart_unit_price(rs.getInt("cart_unit_price"));
				list.add(shopcartVO);
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
//清除購物車商品
	@Override
	public void deleteAllShopCart(Integer mem_id, Integer f_mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_SHOPCART);

			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, f_mem_id);

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
	
}
