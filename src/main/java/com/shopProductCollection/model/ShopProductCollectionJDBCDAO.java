package com.shopProductCollection.model;

import java.util.*;
import java.sql.*;



public class ShopProductCollectionJDBCDAO implements ShopProductCollectionDAO_interface {
	
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
		String userid = "root";
		String passwd = "53434976";

		private static final String INSERT_STMT = 
			"INSERT INTO  shop_product_collection(mem_id,prod_id,prod_fav_date) VALUES (?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT * FROM shop_product_collection ";
		private static final String GET_ONE_STMT = 
			"SELECT * FROM shop_product_collection WHERE mem_id= ?";
		private static final String DELETE = 
			"DELETE FROM shop_product_collection WHERE mem_id= ? AND prod_id= ?";
		
		
		@Override
		public void insert(ShopProductCollectionVO shopProductCollectionVO) {
			Connection con =null;
			PreparedStatement pstmt = null;
		
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setInt(1,shopProductCollectionVO.getMem_id());
				pstmt.setInt(2,shopProductCollectionVO.getProd_id());
				pstmt.setDate(3,shopProductCollectionVO.getProd_fav_date());
				
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
		public void delete(Integer mem_id, Integer prod_id) {
			Connection con =null;
			PreparedStatement pstmt = null;
		
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(DELETE);

				
				pstmt.setInt(1,mem_id);
				pstmt.setInt(2,prod_id);

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
		
		@Override //不需要
		public ShopProductCollectionVO findByPrimaryKey(Integer mem_id, Integer prod_id) {
			ShopProductCollectionVO shopProductCollectionVO = null;
			Connection con =null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
//			try {
//				Class.forName(driver);
//				con = DriverManager.getConnection(url, userid, passwd);
//				pstmt = con.prepareStatement(GET_ONE_STMT);
//
//				
//				pstmt.setInt(1,mem_id);
//				pstmt.setInt(2,prod_id);
//
//				rs = pstmt.executeQuery();
//				while(rs.next()) {
//					shopProductCollectionVO = new ShopProductCollectionVO();
//					shopProductCollectionVO.setMem_id(rs.getInt("mem_id"));
//					shopProductCollectionVO.setProd_id(rs.getInt("prod_id"));
//					shopProductCollectionVO.setProd_fav_date(rs.getDate("prod_fav_date"));
//				}
//				
//			} catch (ClassNotFoundException e) {
//				throw new RuntimeException("Couldn't load database driver. "
//						+ e.getMessage());
//				// Handle any SQL errors
//			} catch (SQLException se) {
//				throw new RuntimeException("A database error occured. "
//						+ se.getMessage());
//				// Clean up JDBC resources
//			} finally {
//				if(rs !=null) {
//					try {
//						rs.close();
//					} catch (SQLException se) {
//						// TODO Auto-generated catch block
//						se.printStackTrace(System.err);
//					}
//				}
//				if (pstmt != null) {
//					try {
//						pstmt.close();
//					} catch (SQLException se) {
//						se.printStackTrace(System.err);
//					}
//				}
//				if (con != null) {
//					try {
//						con.close();
//					} catch (Exception e) {
//						e.printStackTrace(System.err);
//					}
//				}
//			}

			return shopProductCollectionVO;
		}
		
		@Override
		public List<ShopProductCollectionVO> getAll() {
			List<ShopProductCollectionVO>list = new ArrayList<ShopProductCollectionVO>();
			ShopProductCollectionVO shopProductCollectionVO = null;
			
			Connection con =null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_ALL_STMT);

				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					shopProductCollectionVO = new ShopProductCollectionVO();
					shopProductCollectionVO.setMem_id(rs.getInt("mem_id"));
					shopProductCollectionVO.setProd_id(rs.getInt("prod_id"));
					shopProductCollectionVO.setProd_fav_date(rs.getDate("prod_fav_date"));
					
					list.add(shopProductCollectionVO);
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
		
