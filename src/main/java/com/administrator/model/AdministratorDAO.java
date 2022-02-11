package com.administrator.model;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AdministratorDAO implements AdministratorDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO administrator (admin_type_id,admin_acc,admin_pwd,admin_isdeleted,admin_name,admin_email,admin_mobile,admin_zipcode,admin_city,admin_dist,admin_addr,admin_hiredate,admin_leavedate,admin_pic) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT admin_id,admin_type_id,admin_acc,admin_pwd,admin_isdeleted,admin_name,admin_email,admin_mobile,admin_zipcode,admin_city,admin_dist,admin_addr,admin_hiredate,admin_leavedate,admin_pic FROM administrator ORDER BY admin_id";
	private static final String GET_ONE_STMT = "SELECT admin_id,admin_type_id,admin_acc,admin_pwd,admin_isdeleted,admin_name,admin_email,admin_mobile,admin_zipcode,admin_city,admin_dist,admin_addr,admin_hiredate,admin_leavedate,admin_pic FROM administrator WHERE admin_id = ?";
	private static final String DELETE = "DELETE FROM administrator WHERE admin_id = ?";
	private static final String UPDATE = "UPDATE administrator SET admin_type_id=?, admin_acc=?, admin_pwd=?, admin_isdeleted=?, admin_name=?, admin_email=?, admin_mobile=?, admin_zipcode=?, admin_city=?, admin_dist=?, admin_addr=?, admin_hiredate=?, admin_leavedate=?, admin_pic=? WHERE admin_id =?";

	@Override
	public void insert(AdministratorVO administratorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, administratorVO.getAdmin_type_id());
			pstmt.setString(2, administratorVO.getAdmin_acc());
			pstmt.setString(3, administratorVO.getAdmin_pwd());
			pstmt.setInt(4, administratorVO.getAdmin_isdeleted());
			pstmt.setString(5, administratorVO.getAdmin_name());
			pstmt.setString(6, administratorVO.getAdmin_email());
			pstmt.setString(7, administratorVO.getAdmin_mobile());
			pstmt.setInt(8, administratorVO.getAdmin_zipcode());
			pstmt.setString(9, administratorVO.getAdmin_city());
			pstmt.setString(10, administratorVO.getAdmin_dist());
			pstmt.setString(11, administratorVO.getAdmin_addr());
			pstmt.setDate(12, administratorVO.getAdmin_hiredate());
			pstmt.setDate(13, administratorVO.getAdmin_leavedate());
			pstmt.setBytes(14, administratorVO.getAdmin_pic());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void update(AdministratorVO administratorVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, administratorVO.getAdmin_type_id());
			pstmt.setString(2, administratorVO.getAdmin_acc());
			pstmt.setString(3, administratorVO.getAdmin_pwd());
			pstmt.setInt(4, administratorVO.getAdmin_isdeleted());
			pstmt.setString(5, administratorVO.getAdmin_name());
			pstmt.setString(6, administratorVO.getAdmin_email());
			pstmt.setString(7, administratorVO.getAdmin_mobile());
			pstmt.setInt(8, administratorVO.getAdmin_zipcode());
			pstmt.setString(9, administratorVO.getAdmin_city());
			pstmt.setString(10, administratorVO.getAdmin_dist());
			pstmt.setString(11, administratorVO.getAdmin_addr());
			pstmt.setDate(12, administratorVO.getAdmin_hiredate());
			pstmt.setDate(13, administratorVO.getAdmin_leavedate());
			pstmt.setBytes(14, administratorVO.getAdmin_pic());
			pstmt.setInt(15, administratorVO.getAdmin_id());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(Integer admin_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, admin_id);
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (SQLException se) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	public AdministratorVO findByPrimaryKey(Integer admin_id) {

		AdministratorVO administratorVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, admin_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				administratorVO = new AdministratorVO();
				administratorVO.setAdmin_id(rs.getInt("admin_id"));
				administratorVO.setAdmin_type_id(rs.getInt("admin_type_id"));
				administratorVO.setAdmin_acc(rs.getString("admin_acc"));
				administratorVO.setAdmin_pwd(rs.getString("admin_pwd"));
				administratorVO.setAdmin_isdeleted(rs.getInt("admin_isdeleted"));
				administratorVO.setAdmin_name(rs.getString("admin_name"));
				administratorVO.setAdmin_email(rs.getString("admin_email"));
				administratorVO.setAdmin_mobile(rs.getString("admin_mobile"));
				administratorVO.setAdmin_zipcode(rs.getInt("admin_zipcode"));
				administratorVO.setAdmin_city(rs.getString("admin_city"));
				administratorVO.setAdmin_dist(rs.getString("admin_dist"));
				administratorVO.setAdmin_addr(rs.getString("admin_addr"));
				administratorVO.setAdmin_hiredate(rs.getDate("admin_hiredate"));
				administratorVO.setAdmin_leavedate(rs.getDate("admin_leavedate"));
				administratorVO.setAdmin_pic(rs.getBytes("admin_pic"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return administratorVO;
	}

	@Override
	public List<AdministratorVO> getAll() {

		List<AdministratorVO> list = new ArrayList<AdministratorVO>();
		AdministratorVO administratorVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();

			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				administratorVO = new AdministratorVO();
				administratorVO.setAdmin_id(rs.getInt("admin_id"));
				administratorVO.setAdmin_type_id(rs.getInt("admin_type_id"));
				administratorVO.setAdmin_acc(rs.getString("admin_acc"));
				administratorVO.setAdmin_pwd(rs.getString("admin_pwd"));
				administratorVO.setAdmin_isdeleted(rs.getInt("admin_isdeleted"));
				administratorVO.setAdmin_name(rs.getString("admin_name"));
				administratorVO.setAdmin_email(rs.getString("admin_email"));
				administratorVO.setAdmin_mobile(rs.getString("admin_mobile"));
				administratorVO.setAdmin_zipcode(rs.getInt("admin_zipcode"));
				administratorVO.setAdmin_city(rs.getString("admin_city"));
				administratorVO.setAdmin_dist(rs.getString("admin_dist"));
				administratorVO.setAdmin_addr(rs.getString("admin_addr"));
				administratorVO.setAdmin_hiredate(rs.getDate("admin_hiredate"));
				administratorVO.setAdmin_leavedate(rs.getDate("admin_leavedate"));
				administratorVO.setAdmin_pic(rs.getBytes("admin_pic"));
				list.add(administratorVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
