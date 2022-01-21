package com.projDiscussion.model;

import java.util.*;
import java.sql.*;

public class ProjDiscussionJDBCDAO implements ProjDiscussionDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

	private static final String INSERT_STMT = "INSERT INTO proj_discussion (comment_id,proj_id,discussion_id,mem_id,f_mem_id,comment_date,comment_content)"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT comment_id,proj_id,discussion_id,mem_id,f_mem_id,comment_date,comment_content FROM proj_discussion order by comment_id";
	private static final String GET_ONE_STMT = "SELECT comment_id,proj_id,discussion_id,mem_id,f_mem_id,comment_date,comment_content FROM proj_discussion where comment_id = ?";
	private static final String DELETE = "DELETE FROM proj_discussion where comment_id = ?";
	private static final String UPDATE = "UPDATE proj_discussion set comment_id=?, proj_id=?, discussion_id=?, mem_id=?, f_mem_id=?, comment_date=?, comment_content=? where comment_id = ?";

	@Override
	public void insert(ProjDiscussionVO projDiscussionVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, projDiscussionVO.getComment_id());
			pstmt.setInt(2, projDiscussionVO.getProj_id());
			pstmt.setInt(3, projDiscussionVO.getDiscussion_id());
			pstmt.setInt(4, projDiscussionVO.getMem_id());
			pstmt.setInt(5, projDiscussionVO.getF_mem_id());
			pstmt.setDate(6, projDiscussionVO.getComment_date());
			pstmt.setString(7, projDiscussionVO.getComment_content());

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
	public void update(ProjDiscussionVO projDiscussionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, projDiscussionVO.getComment_id());
			pstmt.setInt(2, projDiscussionVO.getProj_id());
			pstmt.setInt(3, projDiscussionVO.getDiscussion_id());
			pstmt.setInt(4, projDiscussionVO.getMem_id());
			pstmt.setInt(5, projDiscussionVO.getF_mem_id());
			pstmt.setDate(6, projDiscussionVO.getComment_date());
			pstmt.setString(7, projDiscussionVO.getComment_content());

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
	public void delete(Integer comment_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, comment_id);

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
	public ProjDiscussionVO findByPrimaryKey(Integer comment_id) {

		ProjDiscussionVO ProjDiscussionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, comment_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjDiscussionVO = new ProjDiscussionVO();
				ProjDiscussionVO.setComment_id(rs.getInt("comment_id"));
				ProjDiscussionVO.setProj_id(rs.getInt("proj_id"));
				ProjDiscussionVO.setDiscussion_id(rs.getInt("discussion_id"));
				ProjDiscussionVO.setMem_id(rs.getInt("mem_id"));
				ProjDiscussionVO.setF_mem_id(rs.getInt("f_mem_id"));
				ProjDiscussionVO.setComment_date(rs.getDate("comment_date"));
				ProjDiscussionVO.setComment_content(rs.getString("comment_content"));
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
		return ProjDiscussionVO;
	}

	@Override
	public List<ProjDiscussionVO> getAll() {
		List<ProjDiscussionVO> list = new ArrayList<ProjDiscussionVO>();
		ProjDiscussionVO ProjDiscussionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjDiscussionVO = new ProjDiscussionVO();
				ProjDiscussionVO.setComment_id(rs.getInt("comment_id"));
				ProjDiscussionVO.setProj_id(rs.getInt("proj_id"));
				ProjDiscussionVO.setDiscussion_id(rs.getInt("discussion_id"));
				ProjDiscussionVO.setMem_id(rs.getInt("mem_id"));
				ProjDiscussionVO.setF_mem_id(rs.getInt("f_mem_id"));
				ProjDiscussionVO.setComment_date(rs.getDate("comment_date"));
				ProjDiscussionVO.setComment_content(rs.getString("comment_content"));
				list.add(ProjDiscussionVO);
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
		return list;

	}
}
