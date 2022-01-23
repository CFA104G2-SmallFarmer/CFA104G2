package com.privateMessage.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class PrivateMessageJDBCDAO implements PrivateMessageDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";
	
	private static final String INSERT_STMT = 
		"INSERT INTO privatemessage ("
		+ "	mem_id, f_mem_id, p_msg_direct, p_msg_time, p_msg_context, p_msg_img)"
		+ " VALUES"
		+ " (?, ?, ?, ?, ?, ?)";
	
	private static final String GET_ALL_STMT =
		"SELECT mem_id, f_mem_id, p_msg_direct, p_msg_time, p_msg_context, p_msg_img"
		+" FROM privatemessage ORDER BY p_msg_id";
	
	private static final String GET_ONE_STMT = 
		"SELECT mem_id, f_mem_id, p_msg_direct, p_msg_time, p_msg_context, p_msg_img"
		+" FROM privatemessage WHERE p_msg_id = ?";
	
	private static final String DELETE = "DELETE FROM privatemessage WHERE  p_msg_id = ?";
	
	private static final String UPDATE = 
			"UPDATE privatemessage set mem_id = ?, f_mem_id = ?, p_msg_direct = ?,"
			+" p_msg_time = ?, p_msg_context = ?, p_msg_img = ? WHERE p_msg_id = ?";


	@Override
	public void insert(PrivateMessageVO privateMessageVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, privateMessageVO.getMem_id());
			pstmt.setInt(2, privateMessageVO.getF_mem_id());
			pstmt.setInt(3, privateMessageVO.getP_msg_direct());
			pstmt.setTimestamp(4, privateMessageVO.getP_msg_time());
			pstmt.setString(5, privateMessageVO.getP_msg_context());
			pstmt.setBytes(6, privateMessageVO.getP_msg_img());
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
	public void update(PrivateMessageVO privateMessageVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, privateMessageVO.getMem_id());
			pstmt.setInt(2, privateMessageVO.getF_mem_id());
			pstmt.setInt(3, privateMessageVO.getP_msg_direct());
			pstmt.setTimestamp(4, privateMessageVO.getP_msg_time());
			pstmt.setString(5, privateMessageVO.getP_msg_context());
			pstmt.setBytes(6, privateMessageVO.getP_msg_img());
			pstmt.setInt(7, privateMessageVO.getP_msg_id());
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
	public void delete(Integer p_msg_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, p_msg_id);

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
	public PrivateMessageVO findByPrimaryKey(Integer p_msg_id) {

		PrivateMessageVO privateMessageVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, p_msg_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				// img尚未處理
				privateMessageVO = new PrivateMessageVO();
				privateMessageVO.setMem_id(rs.getInt("mem_id"));
				privateMessageVO.setF_mem_id(rs.getInt("f_mem_id"));
				privateMessageVO.setP_msg_direct(rs.getInt("p_msg_direct"));
				privateMessageVO.setP_msg_time(rs.getTimestamp("p_msg_time"));
				privateMessageVO.setP_msg_context(rs.getString(" p_msg_context"));
				privateMessageVO.setP_msg_img(rs.getBytes("p_msg_img"));
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
		return privateMessageVO;
	}
	
	@Override
	public List<PrivateMessageVO> getAll() {
		List<PrivateMessageVO> list = new ArrayList<PrivateMessageVO>();
		PrivateMessageVO privateMessageVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// privateMessageVO 也稱為 Domain objects
				privateMessageVO = new PrivateMessageVO();
				privateMessageVO.setMem_id(rs.getInt("mem_id"));
				privateMessageVO.setF_mem_id(rs.getInt("f_mem_id"));
				privateMessageVO.setP_msg_direct(rs.getInt("p_msg_direct"));
				privateMessageVO.setP_msg_time(rs.getTimestamp("p_msg_time"));
				privateMessageVO.setP_msg_context(rs.getString(" p_msg_context"));
				privateMessageVO.setP_msg_img(rs.getBytes("p_msg_img"));
				list.add(privateMessageVO); // Store the row in the list
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

	@Override
	public List<PrivateMessageVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
