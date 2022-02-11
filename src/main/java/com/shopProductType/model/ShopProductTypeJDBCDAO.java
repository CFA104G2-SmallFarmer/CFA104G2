package com.shopProductType.model;

import java.util.*;

import com.shopProduct.model.ShopProductVO;

import java.sql.*;


public class ShopProductTypeJDBCDAO implements ShopProductTypeDAO_interface {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
		"INSERT INTO  shop_product_type(prod_type_name) VALUES (?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM shop_product_type ";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM shop_product_type WHERE prod_type_id = ?";
	private static final String DELETE = 
		"DELETE FROM  shop_product_type WHERE prod_type_id = ?";
	private static final String UPDATE = 
		"UPDATE shop_product_type SET prod_type_name=? WHERE prod_type_id=?";
	private static final String GET_Product_ByTypeid_STMT =
		"SELECT prod_id,f_mem_id,prod_name,prod_status,prod_type_id, prod_price,prod_unit,prod_qty,prod_reg_date,prod_intro FROM shop_product WHERE prod_type_id = ? order by prod_id";	

	private static final String DELETE_Product = "DELETE FROM shop_product WHERE prod_type_id = ?";

	@Override
	public void insert(ShopProductTypeVO shopProductTypeVO) {
		
		Connection con =null;
		PreparedStatement pstmt = null;
	
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(INSERT_STMT);


		pstmt.setString(1,shopProductTypeVO.getProd_type_name());

		pstmt.executeUpdate();
		
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
	public void update(ShopProductTypeVO shopProductTypeVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(UPDATE);

		pstmt.setString(1,shopProductTypeVO.getProd_type_name());
		pstmt.setInt(2,shopProductTypeVO.getProd_type_id());
		

		
		pstmt.executeUpdate();
		
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
	public void delete(Integer prod_type_id) {
		int  update_Product=0;
		
		Connection con =null;
		PreparedStatement pstmt = null;
	
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		
		// 1●設定於 pstm.executeUpdate()之前
		con.setAutoCommit(false);
		
		// 先刪除商品表類別
		pstmt = con.prepareStatement(DELETE_Product);
		pstmt.setInt(1, prod_type_id);
		update_Product = pstmt.executeUpdate();
		// 再刪除類別
		pstmt = con.prepareStatement(DELETE);
		pstmt.setInt(1,prod_type_id);
		pstmt.executeUpdate();
		
		// 2●設定於 pstm.executeUpdate()之後
		con.commit();
		con.setAutoCommit(true);
		System.out.println("刪除類別編號" + prod_type_id + "時,共有商品" + update_Product
				+ "個同時被刪除");
		
	} catch (ClassNotFoundException e) {
		throw new RuntimeException("Couldn't load database driver. "
				+ e.getMessage());
		// Handle any SQL errors
	} catch (SQLException se) {
		if (con != null) {
			try {
				// 3●設定於當有exception發生時之catch區塊內
				con.rollback();
			} catch (SQLException excep) {
				throw new RuntimeException("rollback error occured. "
						+ excep.getMessage());
			}
		}
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
	public ShopProductTypeVO findByPrimaryKey(Integer prod_type_id) {
		
		ShopProductTypeVO shopProductTypeVO = null;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			
			pstmt.setInt(1,prod_type_id);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				shopProductTypeVO = new ShopProductTypeVO();
				shopProductTypeVO.setProd_type_id(rs.getInt("prod_type_id"));
				shopProductTypeVO.setProd_type_name(rs.getString("prod_type_name"));
				
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if(rs !=null) {
				try {
					rs.close();
				} catch (SQLException se) {
					// TODO Auto-generated catch block
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

		return shopProductTypeVO;
	}
	

	@Override
	public List<ShopProductTypeVO> getAll() {
		List<ShopProductTypeVO> list = new ArrayList<ShopProductTypeVO>();
		ShopProductTypeVO shopProductTypeVO = null;
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				shopProductTypeVO = new ShopProductTypeVO();
				shopProductTypeVO.setProd_type_id(rs.getInt("prod_type_id"));
				shopProductTypeVO.setProd_type_name(rs.getString("prod_type_name"));
				list.add(shopProductTypeVO);
				
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if(rs !=null) {
				try {
					rs.close();
				} catch (SQLException se) {
					// TODO Auto-generated catch block
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
	public Set<ShopProductVO> getProductByTypeid(Integer prod_type_id){
		
		Set<ShopProductVO> set = new LinkedHashSet<ShopProductVO>();
		ShopProductVO shopProductVO = null;
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_Product_ByTypeid_STMT);
				pstmt.setInt(1, prod_type_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					shopProductVO = new ShopProductVO();
					shopProductVO.setProd_id(rs.getInt("prod_id"));
					shopProductVO.setF_mem_id(rs.getInt("f_mem_id"));			
					shopProductVO.setProd_name(rs.getString("prod_name"));
					shopProductVO.setProd_type_id(rs.getInt("prod_type_id"));
					shopProductVO.setProd_status(rs.getInt("prod_status"));
					shopProductVO.setProd_price(rs.getInt("prod_price"));
					shopProductVO.setProd_unit(rs.getString("prod_unit"));
					shopProductVO.setProd_qty(rs.getInt("prod_qty"));
					shopProductVO.setProd_reg_date(rs.getDate("prod_reg_date"));
					shopProductVO.setProd_intro(rs.getString("prod_intro"));
					
					set.add(shopProductVO);
				}
				// Handle any driver errors
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
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
			return set;
	}
	

}
