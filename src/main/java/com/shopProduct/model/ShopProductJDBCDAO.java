package com.shopProduct.model;

import java.util.*;
import java.sql.*;

public class ShopProductJDBCDAO implements ShopProductDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
		"INSERT INTO  shop_product(prod_type_id,prod_name,f_mem_id,prod_status, prod_price,prod_qty,prod_intro,prod_reg_date,prod_unit,prod_pic) VALUES ( ?, ?, ?, ?, ?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM shop_product ";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM shop_product WHERE prod_id = ?";
	private static final String DELETE = 
		"DELETE FROM shop_product WHERE prod_id = ?";
	private static final String UPDATE = 
		"UPDATE shop_product SET prod_type_id = ? ,prod_name =?,f_mem_id =?,prod_status =?, prod_price =?,prod_unit =?,prod_qty =?,prod_reg_date =?,prod_intro =?prod_pic=? WHERE prod_id=?";

	

	@Override
	public void insert(ShopProductVO shopProductVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1,shopProductVO.getProd_type_id());
			pstmt.setString(2,shopProductVO.getProd_name());
			pstmt.setInt(3,shopProductVO.getF_mem_id());
			pstmt.setInt(4,shopProductVO.getProd_status());
			pstmt.setInt(5,shopProductVO.getProd_price());
			pstmt.setInt(6,shopProductVO.getProd_qty());
			pstmt.setString(7,shopProductVO.getProd_intro());
			pstmt.setDate(8,shopProductVO.getProd_reg_date());
			pstmt.setString(9,shopProductVO.getProd_unit());
			pstmt.setBytes(10,shopProductVO.getProd_pic());
			
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
	public void update(ShopProductVO shopProductVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1,shopProductVO.getProd_type_id());
			pstmt.setString(2,shopProductVO.getProd_name());
			pstmt.setInt(3,shopProductVO.getF_mem_id());
			pstmt.setInt(4,shopProductVO.getProd_status());
			pstmt.setInt(5,shopProductVO.getProd_price());
			pstmt.setString(6,shopProductVO.getProd_unit());
			pstmt.setInt(7,shopProductVO.getProd_qty());
			pstmt.setDate(8,shopProductVO.getProd_reg_date());
			pstmt.setString(9,shopProductVO.getProd_intro());		
			pstmt.setInt(10,shopProductVO.getProd_id());
			pstmt.setBytes(11,shopProductVO.getProd_pic());
			
			

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
	public void delete(Integer prod_id) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			
			pstmt.setInt(1,prod_id);

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
	public ShopProductVO findByPrimaryKey(Integer prod_id) {
		ShopProductVO shopProductVO = null;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			
			pstmt.setInt(1,prod_id);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				shopProductVO = new ShopProductVO();
				shopProductVO.setProd_id(rs.getInt("prod_id"));
				shopProductVO.setProd_type_id(rs.getInt("prod_type_id"));
				shopProductVO.setProd_name(rs.getString("prod_name"));
				shopProductVO.setF_mem_id(rs.getInt("f_mem_id"));
				shopProductVO.setProd_status(rs.getInt("prod_status"));
				shopProductVO.setProd_price(rs.getInt("prod_price"));
				shopProductVO.setProd_qty(rs.getInt("prod_qty"));
				shopProductVO.setProd_intro(rs.getString("prod_intro"));
				shopProductVO.setProd_reg_date(rs.getDate("prod_reg_date"));
				shopProductVO.setProd_unit(rs.getString("prod_unit"));
				shopProductVO.setProd_pic(rs.getBytes("prod_pic"));
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

		return shopProductVO;
	}

	@Override
	public List<ShopProductVO> getAll() {
		List<ShopProductVO>list = new ArrayList<ShopProductVO>();
		ShopProductVO shopProductVO = null;
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				shopProductVO = new ShopProductVO();
				shopProductVO.setProd_id(rs.getInt("prod_id"));
				shopProductVO.setProd_type_id(rs.getInt("prod_type_id"));
				shopProductVO.setProd_name(rs.getString("prod_name"));
				shopProductVO.setF_mem_id(rs.getInt("f_mem_id"));
				shopProductVO.setProd_status(rs.getInt("prod_status"));
				shopProductVO.setProd_price(rs.getInt("prod_price"));
				shopProductVO.setProd_qty(rs.getInt("prod_qty"));
				shopProductVO.setProd_intro(rs.getString("prod_intro"));
				shopProductVO.setProd_reg_date(rs.getDate("prod_reg_date"));
				shopProductVO.setProd_unit(rs.getString("prod_unit"));
				shopProductVO.setProd_pic(rs.getBytes("prod_pic"));
				
				list.add(shopProductVO);
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
