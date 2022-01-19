package com.shop_hashtag_details.model;

import java.util.*;

import java.sql.*;


public class ShopHashtagDetailsJDBCDAO implements ShopHashtagDetailsDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "OSPER";
	String passwd = "123456";

	private static final String INSERT_STMT = 
			"INSERT INTO shop_hashtag_details (hash_no,prod_id) VALUES (?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT hash_no,prod_id FROM shop_hashtag_details order by hash_no";
	private static final String GET_ONE_STMT = 
			"SELECT hash_no,prod_id FROM shop_hashtag_details where hash_no = ? ";
	private static final String DELETE = 
			"DELETE FROM shop_hashtag_details where hash_no = ? and prod_id = ?";
	private static final String UPDATE = 
			"UPDATE shop_hashtag_details set  hash_no=?, prod_id=? where hash_no = ?";

	@Override
	public void insert(ShopHashtagDetailsVO shophashtagdetailsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, shophashtagdetailsVO.getHash_no());
			pstmt.setInt(2, shophashtagdetailsVO.getProd_id());
			
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


	@Override  //不需要
	public void update/*不需要*/(ShopHashtagDetailsVO shophashtagdetailsVO) {
		// TODO Auto-generated method stub

	}

	@Override  
	public void delete(Integer hash_no, Integer prod_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, hash_no);
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

	@Override  //不需要
	public ShopHashtagDetailsVO findByHash_no/*不需要*/(Integer hash_no) {
		List<ShopHashtagDetailsVO> list = new ArrayList<ShopHashtagDetailsVO>();
		ShopHashtagDetailsVO shophashtagdetailsVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, hash_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				shophashtagdetailsVO = new ShopHashtagDetailsVO();
				shophashtagdetailsVO.setHash_no(rs.getInt("hash_no"));
				shophashtagdetailsVO.setProd_id(rs.getInt("prod_id"));
				list.add(shophashtagdetailsVO);
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
		return shophashtagdetailsVO;
	}

	@Override
	public List<ShopHashtagDetailsVO> getAll() {
		List<ShopHashtagDetailsVO> list = new ArrayList<ShopHashtagDetailsVO>();
		ShopHashtagDetailsVO shophashtagdetailsVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				shophashtagdetailsVO = new ShopHashtagDetailsVO();
				shophashtagdetailsVO.setHash_no(rs.getInt("hash_no"));
				shophashtagdetailsVO.setProd_id(rs.getInt("prod_id"));
				list.add(shophashtagdetailsVO); // Store the row in the list
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
