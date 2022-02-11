package com.shopProductPic.model;

import java.util.*;
import java.sql.*;

public class ShopProductPicJDBCDAO implements ShopProductPicDAO_interface{
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
		"INSERT INTO  shop_product_pic(prod_id,prod_pic) VALUES ( ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM shop_product_pic ";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM shop_product_pic WHERE prod_pic_id  = ?";
	private static final String DELETE = 
		"DELETE FROM shop_product_pic WHERE prod_pic_id = ?";
//	private static final String UPDATE = 
//		"UPDATE shop_product_pic SET  prod_pic_id=?,prod_id=?,prod_pic=?";

	

	@Override
	public void insert(ShopProductPicVO shopProductPicVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
//			pstmt.setInt(1,shopProductPicVO.getProd_pic_id());
			pstmt.setInt(1,shopProductPicVO.getProd_id());
			pstmt.setBytes(2,shopProductPicVO.getProd_pic());

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
	public void delete(Integer prod_pic_id) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			
			pstmt.setInt(1,prod_pic_id);

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
	public ShopProductPicVO findByPrimaryKey(Integer prod_pic_id) {
		ShopProductPicVO shopProductPicVO  = null;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			
			pstmt.setInt(1,prod_pic_id);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				shopProductPicVO = new ShopProductPicVO();
//				shopProductPicVO.setProd_pic_id(rs.getInt("prod_pic_id"));
				shopProductPicVO.setProd_id(rs.getInt("prod_id"));
				shopProductPicVO.setProd_pic(rs.getBytes("prod_pic"));
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

		return shopProductPicVO;
	}

	@Override
	public List<ShopProductPicVO> getAll() {
		List<ShopProductPicVO>list = new ArrayList<ShopProductPicVO>();
		ShopProductPicVO shopProductPicVO = null;
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				shopProductPicVO = new ShopProductPicVO();
				shopProductPicVO.setProd_pic_id(rs.getInt("prod_pic_id"));
				shopProductPicVO.setProd_id(rs.getInt("prod_id"));
				shopProductPicVO.setProd_pic(rs.getBytes("prod_pic"));
				
				list.add(shopProductPicVO);
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(rs !=null) {
				try {
					rs.close();
				} catch (SQLException se) {
					// TODO Auto-generated catch block
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
