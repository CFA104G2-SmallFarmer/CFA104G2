package com.administrator.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdministratorDAO implements AdministratorDAO_Interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "0000";

	private static final String INSERT_STMT = "INSERT INTO administrator (admin_id,admin_type_id,admin_acc,admin_pwd,admin_isdeleted,admin_name,admin_email,admin_mobile,admin_zipcode,admin_city,admin_dist,admin_addr,admin_hiredate,admin_leavedate) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT admin_id,admin_type_id,admin_acc,admin_pwd,admin_isdeleted,admin_name,admin_email,,admin_mobile,admin_zipcode,admin_city,admin_dist,admin_addr,admin_hiredate,admin_leavedate FROM administrator ORDER BY admin_id";
	private static final String GET_ONE_STMT = "SELECT admin_type_id,admin_acc,admin_pwd,admin_isdeleted,admin_name,admin_email,admin_mobile,admin_zipcode,admin_city,admin_dist,admin_addr,admin_hiredate,admin_leavedate FROM adminstrator WHERE admin_id = ?";
	private static final String DELETE = "DELETE FROM administrator WHERE admin_id = ?";
	private static final String UPDATE = "UPDATE administrator SET admin_type_id=?, admin_acc=?, admin_pwd=?, admin_isdeleted=?, admin_name=?, admin_email=?, admin_mobile=?, admin_zipcode=?, admin_city=?, admin_dist=?, admin_addr=?, admin_hiredate=?, admin_leavedate=? WHERE admin_id = ?";

	@Override
	public void insert(AdministratorVO administratorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, administratorVO.getAdmin_id());
			pstmt.setInt(2, administratorVO.getAdmin_type_id());
			pstmt.setString(3, administratorVO.getAdmin_acc());
			pstmt.setString(4, administratorVO.getAdmin_pwd());
			pstmt.setInt(5, administratorVO.getAdmin_isdeleted());
			pstmt.setString(6, administratorVO.getAdmin_name());
			pstmt.setString(7, administratorVO.getAdmin_email());
			pstmt.setString(8, administratorVO.getAdmin_mobile());
			pstmt.setInt(9, administratorVO.getAdmin_zipcode());
			pstmt.setString(10, administratorVO.getAdmin_city());
			pstmt.setString(11, administratorVO.getAdmin_dist());
			pstmt.setString(12, administratorVO.getAdmin_addr());
			pstmt.setDate(13, administratorVO.getAdmin_hiredate());
			pstmt.setDate(14, administratorVO.getAdmin_leavedate());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, administratorVO.getAdmin_type_id());
			pstmt.setString(2, administratorVO.getAdmin_acc());
			pstmt.setString(3, administratorVO.getAdmin_pwd());
			pstmt.setInt(4, administratorVO.getAdmin_isdeleted());
			pstmt.setString(5, administratorVO.getAdmin_name());
			pstmt.setString(6, administratorVO.getAdmin_email());
			pstmt.setString(7, administratorVO.getAdmin_mobile()); // 手機欄位新增 !!注意!!
			pstmt.setInt(8, administratorVO.getAdmin_zipcode());
			pstmt.setString(9, administratorVO.getAdmin_city());
			pstmt.setString(10, administratorVO.getAdmin_dist());
			pstmt.setString(11, administratorVO.getAdmin_addr());
			pstmt.setDate(12, administratorVO.getAdmin_hiredate());
			pstmt.setDate(13, administratorVO.getAdmin_leavedate());
			pstmt.setInt(14, administratorVO.getAdmin_id());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, admin_id);
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

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
				list.add(administratorVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
