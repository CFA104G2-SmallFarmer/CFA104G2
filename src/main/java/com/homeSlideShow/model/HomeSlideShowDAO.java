package com.homeSlideShow.model;

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

public class HomeSlideShowDAO implements HomeSlideShowDAO_Interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "0000";

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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, homeSlideShowVO.getAdmin_id());
			pstmt.setBytes(2, homeSlideShowVO.getHss_img());
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
			pstmt.setBytes(2, homeSlideShowVO.getHss_img());
			pstmt.setString(3, homeSlideShowVO.getHss_text());
			pstmt.setDate(4, homeSlideShowVO.getHss_time());
			pstmt.setInt(5, homeSlideShowVO.getHss_state());
			pstmt.setDate(6, homeSlideShowVO.getHss_on_shelf());
			pstmt.setDate(7, homeSlideShowVO.getHss_off_shelf());
			pstmt.setInt(8, homeSlideShowVO.getHss_id());
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
				homeSlideShowVO.setHss_img(rs.getBytes("hss_img"));
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
				homeSlideShowVO.setHss_img(rs.getBytes("hss_img"));
				homeSlideShowVO.setHss_text(rs.getString("hss_text"));
				homeSlideShowVO.setHss_time(rs.getDate("hss_time"));
				homeSlideShowVO.setHss_state(rs.getInt("hss_state"));
				homeSlideShowVO.setHss_on_shelf(rs.getDate("hss_on_shelf"));
				homeSlideShowVO.setHss_off_shelf(rs.getDate("hss_off_shelf"));
				list.add(homeSlideShowVO);
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

	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}

	public static void readPicture(byte[] bytes) throws IOException {
		FileOutputStream fos = new FileOutputStream("images/tomcat2.gif");
		fos.write(bytes);
		fos.flush();
		fos.close();
	}

	public static void main(String[] args) {

		HomeSlideShowDAO dao = new HomeSlideShowDAO();

//測試 insert(HomeSlideShowVO announcementVO);

//		HomeSlideShowVO homeSlideShowVO1 = new HomeSlideShowVO();
//		try {
//			byte[] pic1 = getPictureByteArray("images/tomcat.gif");
//			Date date1 = java.sql.Date.valueOf("2022-01-05");
//			homeSlideShowVO1.setAdmin_id(2);
//			homeSlideShowVO1.setHss_img(pic1);
//			homeSlideShowVO1.setHss_state(1);
//			homeSlideShowVO1.setHss_text("隨便寫寫");
//			homeSlideShowVO1.setHss_time(date1);
//			homeSlideShowVO1.setHss_on_shelf(date1);
//			homeSlideShowVO1.setHss_off_shelf(date1);
//			dao.insert(homeSlideShowVO1);
//			System.out.println("執行正常");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}

//測試 update(HomeSlideShowVO announcementVO);

//		HomeSlideShowVO homeSlideShowVO2 = new HomeSlideShowVO();
//		try {
//			byte[] pic2 = getPictureByteArray("images/blue.gif");
//			Date date2 = java.sql.Date.valueOf("2022-01-15");
//			homeSlideShowVO2.setAdmin_id(2);
//			homeSlideShowVO2.setHss_img(pic2);
//			homeSlideShowVO2.setHss_state(1);
//			homeSlideShowVO2.setHss_text("隨便寫寫XX");
//			homeSlideShowVO2.setHss_time(date2);
//			homeSlideShowVO2.setHss_on_shelf(date2);
//			homeSlideShowVO2.setHss_off_shelf(date2);
//			homeSlideShowVO2.setHss_id(2);
//			dao.update(homeSlideShowVO2);
//			System.out.println("執行正常");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}

//測試 delete(Integer hss_id);

//		dao.delete(6);
//		System.out.println("執行正常");

//測試 findByPrimaryKey(Integer hss_id);

//		HomeSlideShowVO vo2 = dao.findByPrimaryKey(2);
//		byte[] pic3 = vo2.getHss_img();
//		try {
//			readPicture(pic3);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		System.out.println(vo2);

//測試 getAll();

//		List<HomeSlideShowVO> list = dao.getAll();
//		for (HomeSlideShowVO hVo : list) {
//			System.out.println(hVo);
//		}

	}
}
