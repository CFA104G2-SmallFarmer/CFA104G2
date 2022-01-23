package com.announcement.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnnouncementDAO implements AnnouncementDAO_Interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "0000";

	private static final String INSERT_STMT = "INSERT INTO announcement (announce_id,announce_type,admin_id, edit_time, announce_title, announce_content) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT announce_id, announce_type, admin_id, edit_time, announce_title, announce_content FROM announcement";
	private static final String GET_ONE_STMT = "SELECT announce_id, announce_type, admin_id, edit_time, announce_title, announce_content WHERE announce_id = ?";
	private static final String DELETE_ANNOUNCEMENT = "DELETE FROM announcement where announce_id = ?";
	private static final String UPDATE = "UPDATE announcement set announce_type=?, admin_id=?, edit_time=?, announce_title=?, announce_content=? WHERE announce_id =?";

	@Override
	public void insert(AnnouncementVO announcementVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, announcementVO.getAnnounce_id());
			pstmt.setInt(2, announcementVO.getAnnounce_type());
			pstmt.setInt(3, announcementVO.getAdmin_id());
			pstmt.setDate(4, announcementVO.getEdit_time());
			pstmt.setString(5, announcementVO.getAnnounce_title());
			pstmt.setString(6, announcementVO.getAnnounce_content());
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
	public void update(AnnouncementVO announcementVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, announcementVO.getAnnounce_type());
			pstmt.setInt(2, announcementVO.getAdmin_id());
			pstmt.setDate(3, announcementVO.getEdit_time());
			pstmt.setString(4, announcementVO.getAnnounce_title());
			pstmt.setString(5, announcementVO.getAnnounce_content());
			pstmt.setInt(6, announcementVO.getAnnounce_id());
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
	public void delete(Integer announce_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_ANNOUNCEMENT);
			pstmt.setInt(1, announce_id);
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

	@Override
	public AnnouncementVO findByPrimaryKey(Integer announce_id) {

		AnnouncementVO announcementVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
