package com.homeSlideShow.model;

import java.io.IOException;
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

public class HomeSlideShowDAO implements HomeSlideShowDAO_Interface {

	private static DataSource ds;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}

	private static final String INSERT_STMT = "INSERT INTO home_slideshow (admin_id, hss_img, hss_text, hss_time, hss_state, hss_on_shelf, hss_off_shelf) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT hss_id, admin_id, hss_img, hss_text, hss_time, hss_state, hss_on_shelf, hss_off_shelf FROM home_slideshow";
	private static final String GET_ONE_STMT = "SELECT hss_id, admin_id, hss_img, hss_text, hss_time, hss_state, hss_on_shelf, hss_off_shelf FROM home_slideshow WHERE hss_id = ?";
	private static final String DELETE_HOMESLIDESHOW = "DELETE FROM home_slideshow where hss_id = ?";
	private static final String UPDATE = "UPDATE home_slideshow set admin_id=?, hss_img=?, hss_text=?, hss_time=?, hss_state=?, hss_on_shelf=?, hss_off_shelf=? WHERE hss_id =?";

	@Override
	public void insert(HomeSlideShowVO homeSlideShowVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con =ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, homeSlideShowVO.getAdmin_id());
			pstmt.setBytes(2, homeSlideShowVO.getHss_img());
			pstmt.setString(3, homeSlideShowVO.getHss_text());
			pstmt.setDate(4, homeSlideShowVO.getHss_time());
			pstmt.setInt(5, homeSlideShowVO.getHss_state());
			pstmt.setDate(6, homeSlideShowVO.getHss_on_shelf());
			pstmt.setDate(7, homeSlideShowVO.getHss_off_shelf());
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
	public void update(HomeSlideShowVO homeSlideShowVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, homeSlideShowVO.getAdmin_id());
			pstmt.setBytes(2, homeSlideShowVO.getHss_img());
			pstmt.setString(3, homeSlideShowVO.getHss_text());
			pstmt.setDate(4, homeSlideShowVO.getHss_time());
			pstmt.setInt(5, homeSlideShowVO.getHss_state());
			pstmt.setDate(6, homeSlideShowVO.getHss_on_shelf());
			pstmt.setDate(7, homeSlideShowVO.getHss_off_shelf());
			pstmt.setInt(8, homeSlideShowVO.getHss_id());
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
	public void delete(Integer hss_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_HOMESLIDESHOW);
			pstmt.setInt(1, hss_id);
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
	public HomeSlideShowVO findByPrimaryKey(Integer hss_id) {

		HomeSlideShowVO homeSlideShowVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, hss_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				homeSlideShowVO = new HomeSlideShowVO();
				homeSlideShowVO.setHss_id(rs.getInt("hss_id"));
				homeSlideShowVO.setAdmin_id(rs.getInt("admin_id"));
				homeSlideShowVO.setHss_img(rs.getBytes("hss_img"));
				homeSlideShowVO.setHss_text(rs.getString("hss_text"));
				homeSlideShowVO.setHss_time(rs.getDate("hss_time"));
				homeSlideShowVO.setHss_state(rs.getInt("hss_state"));
				homeSlideShowVO.setHss_on_shelf(rs.getDate("hss_on_shelf"));
				homeSlideShowVO.setHss_off_shelf(rs.getDate("hss_off_shelf"));

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				homeSlideShowVO = new HomeSlideShowVO();
				homeSlideShowVO.setHss_id(rs.getInt("hss_id"));
				homeSlideShowVO.setAdmin_id(rs.getInt("admin_id"));
				homeSlideShowVO.setHss_img(rs.getBytes("hss_img"));
				homeSlideShowVO.setHss_text(rs.getString("hss_text"));
				homeSlideShowVO.setHss_time(rs.getDate("hss_time"));
				homeSlideShowVO.setHss_state(rs.getInt("hss_state"));
				homeSlideShowVO.setHss_on_shelf(rs.getDate("hss_on_shelf"));
				homeSlideShowVO.setHss_off_shelf(rs.getDate("hss_off_shelf"));
				list.add(homeSlideShowVO);
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
