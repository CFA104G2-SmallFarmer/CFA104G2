package com.homeSlideShow.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HomeSlideShowDAO implements HomeSlideShowDAO_Interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "0000";

	private static final String INSERT_STMT = "INSERT INTO home_slideshow (hss_id, admin_id, hss_text, hss_time, hss_state, hss_on_shelf, hss_off_shelf) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT hss_id, admin_id, hss_text, hss_time, hss_state, hss_on_shelf, hss_off_shelf FROM home_slideshow";
	private static final String GET_ONE_STMT = "SELECT hss_id, admin_id, hss_text, hss_time, hss_state, hss_on_shelf, hss_off_shelf WHERE hss_id = ?";
	private static final String DELETE_HOMESLIDESHOW = "DELETE FROM home_slideshow where hss_id = ?";
	private static final String UPDATE = "UPDATE home_slideshow set admin_id=?, hss_text=?, hss_time=?, hss_state=?, hss_on_shelf=?, hss_off_shelf=? WHERE hss_id =?";

	@Override
	public void insert(HomeSlideShowVO homeSlideShowVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, homeSlideShowVO.getHss_id());
			pstmt.setInt(2, homeSlideShowVO.getAdmin_id());
			pstmt.setString(3, homeSlideShowVO.getHss_text());
			pstmt.setDate(4, homeSlideShowVO.getHss_time());
			pstmt.setInt(5, homeSlideShowVO.getHss_state());
			pstmt.setDate(6, homeSlideShowVO.getHss_on_shelf());
			pstmt.setDate(7, homeSlideShowVO.getHss_off_shelf());
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
	public void update(HomeSlideShowVO homeSlideShowVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, homeSlideShowVO.getAdmin_id());
			pstmt.setString(2, homeSlideShowVO.getHss_text());
			pstmt.setDate(3, homeSlideShowVO.getHss_time());
			pstmt.setInt(4, homeSlideShowVO.getHss_state());
			pstmt.setDate(5, homeSlideShowVO.getHss_on_shelf());
			pstmt.setDate(6, homeSlideShowVO.getHss_off_shelf());
			pstmt.setInt(7, homeSlideShowVO.getHss_id());
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
	public void delete(Integer hss_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_HOMESLIDESHOW);
			pstmt.setInt(1, hss_id);
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
	public HomeSlideShowVO findByPrimaryKey(Integer hss_id) {

		HomeSlideShowVO homeSlideShowVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, hss_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				homeSlideShowVO = new HomeSlideShowVO();
				homeSlideShowVO.setHss_id(rs.getInt("hss_id"));
				homeSlideShowVO.setAdmin_id(rs.getInt("admin_id"));
				homeSlideShowVO.setHss_text(rs.getString("hss_text"));
				homeSlideShowVO.setHss_time(rs.getDate("hss_time"));
				homeSlideShowVO.setHss_state(rs.getInt("hss_state"));
				homeSlideShowVO.setHss_on_shelf(rs.getDate("hss_on_shelf"));
				homeSlideShowVO.setHss_off_shelf(rs.getDate("hss_off_shelf"));

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
		return homeSlideShowVO;
	}

	@Override
	public List<HomeSlideShowVO> getAll() {
		List<HomeSlideShowVO> list = new ArrayList<HomeSlideShowVO>();
		HomeSlideShowVO homeSlideShowVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				homeSlideShowVO = new HomeSlideShowVO();
				homeSlideShowVO.setHss_id(rs.getInt("hss_id"));
				homeSlideShowVO.setAdmin_id(rs.getInt("admin_id"));
				homeSlideShowVO.setHss_text(rs.getString("hss_text"));
				homeSlideShowVO.setHss_time(rs.getDate("hss_time"));
				homeSlideShowVO.setHss_state(rs.getInt("hss_state"));
				homeSlideShowVO.setHss_on_shelf(rs.getDate("hss_on_shelf"));
				homeSlideShowVO.setHss_off_shelf(rs.getDate("hss_off_shelf"));
				list.add(homeSlideShowVO); // Store the row in the list
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
