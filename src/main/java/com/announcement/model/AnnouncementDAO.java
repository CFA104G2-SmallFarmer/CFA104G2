package com.announcement.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AnnouncementDAO implements AnnouncementDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO announcement (announce_type, admin_id, edit_time, announce_title, announce_content) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT announce_id, announce_type, admin_id, edit_time, announce_title, announce_content FROM announcement";
	private static final String GET_ONE_STMT = "SELECT announce_id, announce_type, admin_id, edit_time, announce_title, announce_content FROM announcement WHERE announce_id = ?";
	private static final String DELETE_ANNOUNCEMENT = "DELETE FROM announcement where announce_id = ?";
	private static final String UPDATE = "UPDATE announcement set announce_type=?, admin_id=?, edit_time=?, announce_title=?, announce_content=? WHERE announce_id =?";

	@Override
	public void insert(AnnouncementVO announcementVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, announcementVO.getAnnounce_type());
			pstmt.setInt(2, announcementVO.getAdmin_id());
			pstmt.setDate(3, announcementVO.getEdit_time());
			pstmt.setString(4, announcementVO.getAnnounce_title());
			pstmt.setString(5, announcementVO.getAnnounce_content());
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
	public void update(AnnouncementVO announcementVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, announcementVO.getAnnounce_type());
			pstmt.setInt(2, announcementVO.getAdmin_id());
			pstmt.setDate(3, announcementVO.getEdit_time());
			pstmt.setString(4, announcementVO.getAnnounce_title());
			pstmt.setString(5, announcementVO.getAnnounce_content());
			pstmt.setInt(6, announcementVO.getAnnounce_id());
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
	public void delete(Integer announce_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_ANNOUNCEMENT);
			pstmt.setInt(1, announce_id);
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

	@Override
	public AnnouncementVO findByPrimaryKey(Integer announce_id) {

		AnnouncementVO announcementVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, announce_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				announcementVO = new AnnouncementVO();
				announcementVO.setAnnounce_id(rs.getInt("announce_id"));
				announcementVO.setAnnounce_type(rs.getInt("announce_type"));
				announcementVO.setAdmin_id(rs.getInt("admin_id"));
				announcementVO.setEdit_time(rs.getDate("edit_time"));
				announcementVO.setAnnounce_title(rs.getString("announce_title"));
				announcementVO.setAnnounce_content(rs.getString("announce_content"));

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
		return announcementVO;
	}

	@Override
	public List<AnnouncementVO> getAll() {
		List<AnnouncementVO> list = new ArrayList<AnnouncementVO>();
		AnnouncementVO announcementVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				announcementVO = new AnnouncementVO();
				announcementVO.setAnnounce_id(rs.getInt("announce_id"));
				announcementVO.setAnnounce_type(rs.getInt("announce_type"));
				announcementVO.setAdmin_id(rs.getInt("admin_id"));
				announcementVO.setEdit_time(rs.getDate("edit_time"));
				announcementVO.setAnnounce_title(rs.getString("announce_title"));
				announcementVO.setAnnounce_content(rs.getString("announce_content"));
				list.add(announcementVO);
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
