package com.shopProductReport.model;

import java.util.*;
import java.sql.*;

public class ShopProductReportJDBCDAO implements ShopProductReportDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
		"INSERT INTO  shop_product_report(prod_report_no,mem_id,prod_id,report_reason,report_time, report_state,report_note) VALUES ( ?, ?, ?, ?,?,?,?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM shop_product_report ";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM shop_product_report WHERE prod_report_no  = ?";
	private static final String DELETE = 
		"DELETE FROM shop_product_report WHERE prod_report_no = ?";
	private static final String UPDATE = 
		"UPDATE shop_product_report SET  mem_id=?,prod_id=?, report_reason=?, report_time=?,report_state=?,report_note=?";

	

	@Override
	public void insert(ShopProductReportVO shopProductReportVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1,shopProductReportVO.getProd_report_no());
			pstmt.setInt(2,shopProductReportVO.getMem_id());
			pstmt.setInt(3,shopProductReportVO.getProd_id());
			pstmt.setString(4,shopProductReportVO.getReport_reason());
			pstmt.setDate(5,shopProductReportVO.getReport_time());
			pstmt.setInt(6,shopProductReportVO.getReport_state());
			pstmt.setString(7,shopProductReportVO.getReport_note());

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
	public void update(ShopProductReportVO shopProductReportVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1,shopProductReportVO.getMem_id());
			pstmt.setInt(2,shopProductReportVO.getProd_id());
			pstmt.setString(3,shopProductReportVO.getReport_reason());
			pstmt.setDate(4,shopProductReportVO.getReport_time());
			pstmt.setInt(5,shopProductReportVO.getReport_state());
			pstmt.setString(6,shopProductReportVO.getReport_note());
			
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
	public void delete(Integer prod_report_no) {
		Connection con =null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			
			pstmt.setInt(1,prod_report_no);

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
	public ShopProductReportVO findByPrimaryKey(Integer prod_report_no) {
		ShopProductReportVO shopProductReportVO  = null;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			
			pstmt.setInt(1,prod_report_no);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				shopProductReportVO = new ShopProductReportVO();
//				shopProductReportVO.setProd_report_no(rs.getInt("prod_report_no"));
				shopProductReportVO.setMem_id(rs.getInt("mem_id"));
				shopProductReportVO.setProd_id(rs.getInt("prod_id"));
				shopProductReportVO.setReport_reason(rs.getString("report_reason"));
				shopProductReportVO.setReport_time(rs.getDate("report_time"));
				shopProductReportVO.setReport_state(rs.getInt("report_state"));
				shopProductReportVO.setReport_note(rs.getString("report_note"));
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

		return shopProductReportVO;
	}

	@Override
	public List<ShopProductReportVO> getAll() {
		List<ShopProductReportVO>list = new ArrayList<ShopProductReportVO>();
		ShopProductReportVO shopProductReportVO = null;
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				shopProductReportVO = new ShopProductReportVO();
				shopProductReportVO.setProd_report_no(rs.getInt("prod_report_no"));
				shopProductReportVO.setMem_id(rs.getInt("mem_id"));
				shopProductReportVO.setProd_id(rs.getInt("prod_id"));
				shopProductReportVO.setReport_reason(rs.getString("report_reason"));
				shopProductReportVO.setReport_time(rs.getDate("report_time"));
				shopProductReportVO.setReport_state(rs.getInt("report_state"));
				shopProductReportVO.setReport_note(rs.getString("report_note"));
				
				list.add(shopProductReportVO);
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
