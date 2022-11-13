package com.projPic.model;

import java.util.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;

public class ProjPicJDBCDAO implements ProjPicDAO_interface {

	String driver = com.sysconfig.SysConfig.getDriver();
	String url = com.sysconfig.SysConfig.getUrl();
	String userid = com.sysconfig.SysConfig.getUserid();
	String passwd = com.sysconfig.SysConfig.getPasswd();;

//	proj_pic_ID is AI
	private static final String INSERT_STMT = "INSERT INTO proj_pic (PROJ_ID,proj_pic)" + "VALUES (?, ?)";

	private static final String DELETE = "DELETE FROM proj_pic WHERE proj_pic_ID = ? ";

//	只會有某專案換圖的情況，不會有圖片在專案間互換的情況
	private static final String UPDATE = "UPDATE proj_pic SET proj_pic=? WHERE proj_pic_ID = ? ";

//	呈現某圖
	private static final String GET_ONE_STMT = "SELECT proj_pic_ID,PROJ_ID,proj_pic FROM proj_pic WHERE proj_pic_ID = ? ;";

//	呈現某專案的所有圖片
	private static final String GET_ALl_SAME_PROJ = "SELECT proj_pic_ID,PROJ_ID,proj_pic FROM proj_pic WHERE PROJ_ID = ?;";

//	底下感覺不會用到
//	private static final String GET_ALL_STMT = "SELECT proj_pic_ID,PROJ_ID,proj_pic FROM PROJPIC ORDER BY PROJ_ID";

	@Override
	public void insert(ProjPicVO ProjPicVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, ProjPicVO.getProj_id());
			pstmt.setBytes(2, ProjPicVO.getProj_pic());

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
	public void update(ProjPicVO ProjPicVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setBytes(1, ProjPicVO.getProj_pic());
			pstmt.setInt(2, ProjPicVO.getProj_pic_id());

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
	public void delete(Integer proj_pic_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, proj_pic_id);

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
	public ProjPicVO findByPrimaryKey(Integer proj_pic_id) {

		ProjPicVO ProjPicVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, proj_pic_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjPicVO = new ProjPicVO();
				ProjPicVO.setProj_pic_id(rs.getInt("proj_pic_id"));
				ProjPicVO.setProj_id(rs.getInt("proj_id"));
				ProjPicVO.setProj_pic(rs.getBytes("proj_pic"));

				byte[] buffer = ProjPicVO.getProj_pic();
				String base64Image = "";
				if (buffer==null) {
					base64Image = "NO_IMAGE_HAS_BEEN_UPLOADED";
				} else {
					base64Image = Base64.getEncoder().encodeToString(buffer);
				}
                ProjPicVO.setBase64Image(base64Image);	
				
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
		return ProjPicVO;
	}

	@Override
	public List<ProjPicVO> getAllSameProj(Integer proj_id) {
		List<ProjPicVO> list = new ArrayList<ProjPicVO>();
		ProjPicVO ProjPicVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALl_SAME_PROJ);

			pstmt.setInt(1, proj_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjPicVO = new ProjPicVO();
				ProjPicVO.setProj_pic_id(rs.getInt("proj_pic_id"));
				ProjPicVO.setProj_id(rs.getInt("proj_id"));
				ProjPicVO.setProj_pic(rs.getBytes("proj_pic"));
				
				byte[] buffer = ProjPicVO.getProj_pic();
				String base64Image = "";
				if (buffer==null) {
					base64Image = "NO_IMAGE_HAS_BEEN_UPLOADED";
				} else {
					base64Image = Base64.getEncoder().encodeToString(buffer);
				}
                ProjPicVO.setBase64Image(base64Image);	
				
				list.add(ProjPicVO);
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

//	@Override
//	public List<ProjPicVO> getAll() {
//		List<ProjPicVO> list = new ArrayList<ProjPicVO>();
//		ProjPicVO ProjPicVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ALL_STMT);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//
//				ProjPicVO = new ProjPicVO();
//				ProjPicVO.setproj_pic_id(rs.getInt("proj_pic_id"));
//				ProjPicVO.setproj_id(rs.getInt("proj_id"));
//				ProjPicVO.setproj_pic(rs.getInt("proj_pic"));
//				ProjPicVO.setReport_reason(rs.getString("REPORT_REASON"));
//				ProjPicVO.setReport_time(rs.getDate("REPORT_TIME"));
//				ProjPicVO.setReport_state(rs.getInt("REPORT_STATE"));
//				ProjPicVO.setReport_note(rs.getString("REPORT_NOTE"));
//				list.add(ProjPicVO);
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//	}

	public static void main(String[] args) {

		ProjPicJDBCDAO dao = new ProjPicJDBCDAO();
////		/*=====================================================*/
//		// 新增
//		ProjPicVO ProjPicVO2 = new ProjPicVO();
//		ProjPicVO2.setProj_id(1002);
//
//		byte[] pic;
//		try {
//			pic = getPictureByteArray("ProjectPic//tomycat.png");// 回傳一個水管
//			ProjPicVO2.setProj_pic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		dao.insert(ProjPicVO2);
//		System.out.println("成功");
//
//		/* ===================================================== */
//		// 修改(換圖)
//
//		ProjPicVO ProjPicVO3 = new ProjPicVO();
//
//		ProjPicVO3.setProj_pic_id(1);
//
//		byte[] pic1;
//		try {
//			pic1 = getPictureByteArray("ProjectPic//tomycat.png");// 回傳一個水管
//			ProjPicVO3.setProj_pic(pic1);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		dao.update(ProjPicVO3);
//		System.out.println("更新成功");
//		/* ===================================================== */
//
////		 刪除
//
////		int y=1002;
////		dao.delete(y);
////		System.out.println("刪除成功");
//
//		/* ===================================================== */
//
//		// 查詢getone，呈現某圖
//
//		ProjPicVO ProjPicVO4 = dao.findByPrimaryKey(1);
//		System.out.print(ProjPicVO4.getProj_pic_id() + ",");
//		System.out.print(ProjPicVO4.getProj_id() + ",");
//		System.out.print(ProjPicVO4.getProj_pic() + ",");
//		System.out.println("---------------------");
//
//		/* ===================================================== */
////		// 查詢getAllSameProj
//		/* =====列出這個專案，所有的圖====== */
//		List<ProjPicVO> list = dao.getAllSameProj(1001);
//		for (ProjPicVO ProjPicVO5 : list) {
//			System.out.print(ProjPicVO5.getProj_pic_id() + ",");
//			System.out.print(ProjPicVO5.getProj_id() + ",");
//			System.out.print(ProjPicVO5.getProj_pic() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}
//
//	}
//
//	// 使用byte[]方式
//	public static byte[] getPictureByteArray(String path) throws IOException {
//		FileInputStream fis = new FileInputStream(path);
//		byte[] buffer = new byte[fis.available()];// 長度，資料流多少bytes
//		fis.read(buffer);// 讀進byte陣列裡
//		fis.close();
//		return buffer; // 回傳byte[]
	}
}
