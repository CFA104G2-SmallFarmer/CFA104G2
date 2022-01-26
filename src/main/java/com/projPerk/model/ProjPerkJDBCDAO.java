package com.projPerk.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proDiary.model.ProDairyJDBCDAO;
import com.proDiary.model.ProDairyVO;

public class ProjPerkJDBCDAO implements ProjPerkDAO_interface{

//		TODO 新增欄位 not null ：perk_abbr_name 請於下方加入
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

	private static final String INSERT_STMT = //7個問號//DIR_ID是自增主鍵不用打
			                                          //不含PERK_TOTAL_COUNT
			"INSERT INTO PROJ_PERK "
			+ "(PROJ_ID,"
			+ "PERK_PIC,"
			+ "PERK_INTRO,"
			+ "PERK_FUND,"
			+ "PERK_LIMITED,"
			+ "PERK_SHIP_DATE,"
			+ "PERK_SHIP_AREA)"
			+ "VALUES"
			+ "(?,?,?,?,?,?,?)"; 

	private static final String GET_ALL_STMT = ////特定專案下的所有回饋方案
			"SELECT `PERK_ID`,"
			+ "`PROJ_ID`,"
			+ "`PERK_PIC`,"
			+ "`PERK_INTRO`,"
			+ "`PERK_TOTAL_COUNT`,"
			+ "`PERK_FUND`,"
			+ "`PERK_LIMITED`,"
			+ "`PERK_SHIP_DATE`,"
			+ "`PERK_SHIP_AREA`"
			+ "FROM `PROJ_PERK`"
			+ "WHERE `PROJ_ID`=?;";
			
	private static final String GET_ONE_STMT = //找一回饋方案
		"SELECT `PERK_ID`,"
		+ "`PROJ_ID`,"
		+ "`PERK_PIC`,"
		+ "`PERK_INTRO`,"
		+ "`PERK_TOTAL_COUNT`,"
		+ "`PERK_FUND`,"
		+ "`PERK_LIMITED`,"
		+ "`PERK_SHIP_DATE`,"
		+ "`PERK_SHIP_AREA`"
		+ "FROM `PROJ_PERK`"
		+ "WHERE `PERK_ID`=?;";
	private static final String DELETE = 
			"DELETE FROM PROJ_PERK WHERE PERK_ID=?";
	private static final String UPDATE = //更新特定項目//7個問號//不含PERK_TOTAL_COUNT
			"UPDATE `PROJ_PERK`"
			+ "SET"
			+ "`PERK_PIC` = ?,"
			+ "`PERK_INTRO` = ?,"
			+ "`PERK_FUND` = ?,"
			+ "`PERK_LIMITED` = ?,"
			+ "`PERK_SHIP_DATE` =?,"
			+ "`PERK_SHIP_AREA` =?"
			+ "WHERE `PERK_ID` = ?;";
			

//	private static final String GET_PERK_TOTAL_COUNT= //獲得目前回饋方案總人數
//			"SELECT COUNT(*) FROM PROJ_ORDER WHERE PERK_ID=? AND ORDER_STATE !=4;";
	
	private static final String UPDATE_PERK_TOTAL_COUNT=//更新目前回饋方案總人數
			"UPDATE PROJ_PERK SET PERK_TOTAL_COUNT =(SELECT COUNT(*) FROM PROJ_ORDER WHERE PERK_ID=? AND ORDER_STATE !=4) WHERE PERK_ID=?;";
			
	
	
	@Override
	public void autoUpdatePerkTotalCount(Integer perk_id) {

		Connection con = null;
		PreparedStatement pstmt = null;
	
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_PERK_TOTAL_COUNT);
			
			pstmt.setInt(1, perk_id);
			pstmt.setInt(2, perk_id);

			pstmt.executeUpdate();
			System.out.println("已更新perk_id:"+perk_id+"的perk_total_count");

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
		
//@Override
//	public int getPerkTotalCount(Integer perk_id) {
//	Connection con = null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
//	int result;
//
//	try {
//
//		Class.forName(driver);
//		con = DriverManager.getConnection(url, userid, passwd);
//		pstmt = con.prepareStatement(GET_PERK_TOTAL_COUNT);
//
//		pstmt.setInt(1, perk_id);
//
//		rs = pstmt.executeQuery();
//
//		rs.next(); // 不可遺漏 rs.next(); 移動游標
//	
//		result = rs.getInt(1);//欄位索引值
//		
//		System.out.println("印出 perk_id:"+perk_id+"的perk_total_count = " + rs.getInt(1));
//			
//		// Handle any driver errors
//	} catch (ClassNotFoundException e) {
//		throw new RuntimeException("Couldn't load database driver. "
//				+ e.getMessage());
//		// Handle any SQL errors
//	} catch (SQLException se) {
//		throw new RuntimeException("A database error occured. "
//				+ se.getMessage());
//		// Clean up JDBC resources
//	} finally {
//		if (rs != null) {
//			try {
//				rs.close();
//			} catch (SQLException se) {
//				se.printStackTrace(System.err);
//			}
//		}
//		if (pstmt != null) {
//			try {
//				pstmt.close();
//			} catch (SQLException se) {
//				se.printStackTrace(System.err);
//			}
//		}
//		if (con != null) {
//			try {
//				con.close();
//			} catch (Exception e) {
//				e.printStackTrace(System.err);
//			}
//		}
//		
//	}
//	return result;
//	
//}





@Override
	public void insert(ProjPerkVO projPerkVO) {
	Connection con = null;
	PreparedStatement pstmt = null;

	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		pstmt = con.prepareStatement(INSERT_STMT);
		
		pstmt.setInt(1, projPerkVO.getProj_id());
		pstmt.setBytes(2, projPerkVO.getPerk_pic());
		pstmt.setString(3, projPerkVO.getPerk_intro());
		pstmt.setInt(4, projPerkVO.getPerk_fund());
		pstmt.setInt(5, projPerkVO.getPerk_limited());
		pstmt.setDate(6, projPerkVO.getPerk_ship_date());
		pstmt.setString(7, projPerkVO.getPerk_ship_area());

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
	public void update(ProjPerkVO projPerkVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setBytes(1, projPerkVO.getPerk_pic());
			pstmt.setString(2, projPerkVO.getPerk_intro());
			pstmt.setInt(3, projPerkVO.getPerk_fund());
			pstmt.setInt(4, projPerkVO.getPerk_limited());
			pstmt.setDate(5, projPerkVO.getPerk_ship_date());
			pstmt.setString(6, projPerkVO.getPerk_ship_area());
			pstmt.setInt(7, projPerkVO.getPerk_id());

			pstmt.executeUpdate();
			System.out.println("成功更新");

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
	public void delete(Integer perk_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, perk_id);

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
	public ProjPerkVO findByPrimaryKey(Integer perk_id) {
		ProjPerkVO projPerkVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, perk_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				projPerkVO = new ProjPerkVO();
				projPerkVO.setPerk_id(rs.getInt("perk_id"));
				projPerkVO.setProj_id(rs.getInt("proj_id"));
				projPerkVO.setPerk_pic(rs.getBytes("perk_pic"));
				projPerkVO.setPerk_intro(rs.getString("perk_intro"));
				projPerkVO.setPerk_total_count(rs.getInt("perk_total_count"));
				projPerkVO.setPerk_fund(rs.getInt("perk_fund"));
				projPerkVO.setPerk_limited(rs.getInt("perk_limited"));
				projPerkVO.setPerk_ship_date(rs.getDate("perk_ship_date"));
				projPerkVO.setPerk_ship_area(rs.getString("perk_ship_area"));
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
		return projPerkVO;
	}






	@Override
	public List<ProjPerkVO> getAll(Integer proj_id) {
		List<ProjPerkVO> list = new ArrayList<ProjPerkVO>();
		ProjPerkVO projPerkVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
		

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			/*=====列出這個專案的所有回饋方案======*/
			pstmt.setInt(1, proj_id);
			/*=============================*/
			
			rs = pstmt.executeQuery();
			System.out.println("成功");

			while (rs.next()) {
				// projPerkVO 也稱為 Domain objects
				projPerkVO = new ProjPerkVO();
				projPerkVO.setPerk_id(rs.getInt("perk_id"));
				projPerkVO.setProj_id(rs.getInt("proj_id"));
				projPerkVO.setPerk_pic(rs.getBytes("perk_pic"));
				projPerkVO.setPerk_intro(rs.getString("perk_intro"));
				projPerkVO.setPerk_total_count(rs.getInt("perk_total_count"));
				projPerkVO.setPerk_fund(rs.getInt("perk_fund"));
				projPerkVO.setPerk_limited(rs.getInt("perk_limited"));
				projPerkVO.setPerk_ship_date(rs.getDate("perk_ship_date"));
				projPerkVO.setPerk_ship_area(rs.getString("perk_ship_area"));
				list.add(projPerkVO); 
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
	
	
	public static void main(String[] args) {

		ProjPerkJDBCDAO dao = new ProjPerkJDBCDAO();
//		
////		/*=======//獲得目前回饋方案總人數==============================================*/
////		int x =1;
////		int result;
////		result= dao.getPerkTotalCount(x); //x是perk_id
////		System.out.println("成功獲得目前回饋方案perk_id="+x+"總人數perk_total_count="+result);
////		
		/*=======//更新目前回饋方案總人數==============================================*/
		int x1 =1;
		dao.autoUpdatePerkTotalCount(x1); //x是perk_id
		System.out.println("成功更新目前回饋方案perk_id="+x1+"總人數perk_total_count");
		
		/*=====================================================*/
////		// 新增

//		ProjPerkVO projPerkVO2 = new ProjPerkVO();
//		projPerkVO2.setProj_id(1002);
//		byte[] pic;
//		try {
//			pic= getPictureByteArray("ProjectPic/strawberry1.jpg");//回傳一個水管
//			projPerkVO2.setPerk_pic(pic);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		projPerkVO2.setPerk_intro("五五666發財米");
//		projPerkVO2.setPerk_fund(6666);
//		projPerkVO2.setPerk_limited(30);
//		projPerkVO2.setPerk_ship_date(java.sql.Date.valueOf("2022-05-01"));
//		projPerkVO2.setPerk_ship_area("Taiwan");
//
//		dao.insert(projPerkVO2);
//		System.out.println("成功新增");
		
		/*=====================================================*/
		// 修改
	
//		ProjPerkVO projPerkVO2 = new ProjPerkVO();
//		
//		byte[] pic;
//		try {
//			pic= getPictureByteArray("ProjectPic/strawberry1.jpg");//回傳一個水管
//			projPerkVO2.setPerk_pic(pic);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		projPerkVO2.setPerk_intro("666發財米");
//		projPerkVO2.setPerk_fund(6666);
//		projPerkVO2.setPerk_limited(66);
//		projPerkVO2.setPerk_ship_date(java.sql.Date.valueOf("2022-05-01"));
//		projPerkVO2.setPerk_ship_area("Taiwan");
//		projPerkVO2.setPerk_id(3);
//		
//		dao.update(projPerkVO2);
//		System.out.println("更新成功");
		


		/*=====================================================*/

		 //刪除
//		int x =4;
//		dao.delete(x);
//		System.out.println("刪除dir_id="+x+"成功");
		
		/*=====================================================*/

		// 查詢getone
	
//		ProjPerkVO projPerkVO2 = dao.findByPrimaryKey(5);
//		System.out.print(projPerkVO2.getPerk_id() + ",");
//		System.out.print(projPerkVO2.getProj_id() + ",");
//		System.out.print(projPerkVO2.getPerk_pic() + ",");
//		System.out.print(projPerkVO2.getPerk_intro() + ",");
//		System.out.print(projPerkVO2.getPerk_total_count() + ",");
//		System.out.print(projPerkVO2.getPerk_fund() + ",");
//		System.out.print(projPerkVO2.getPerk_limited() + ",");
//		System.out.print(projPerkVO2.getPerk_ship_date() + ",");
//		System.out.print(projPerkVO2.getPerk_ship_area() + ",");
//		System.out.println("---------------------");

		/*=====================================================*/
//		// 查詢getAllSameDay
		/*=====列出這個專案，某一天的所有日誌======*/
//		pstmt.setInt(1, proj_id);
//		pstmt.setDate(2, dir_upload_date);
		/*=============================*///2022-01-01 00:00:00
//		Date spec_date = java.sql.Date.valueOf("2022-01-01");
//		List<ProDairyVO> list = dao.getAllSameDay(1001,spec_date);
//		for (ProDairyVO proDairyVO2 : list) {
//		System.out.print(proDairyVO2.getDir_id() + ",");
//		System.out.print(proDairyVO2.getProj_id() + ",");
//		System.out.print(proDairyVO2.getDir_upload_date() + ",");
//		System.out.print(proDairyVO2.getDir_procedure() + ",");
//		System.out.print(proDairyVO2.getDir_product() + ",");
//		System.out.print(proDairyVO2.getDir_equipment() + ",");
//		System.out.print(proDairyVO2.getDir_material() + ",");
//		System.out.print(proDairyVO2.getDir_emoji() + ",");
//		System.out.print(proDairyVO2.getDir_notes() + ",");
//		System.out.print(proDairyVO2.getDir_upload_state() + ",");
//		System.out.print(proDairyVO2.getDir_pic() + ",");
//		System.out.println();
//		System.out.println("------------");
//	}
		
		
		/*=====================================================*/
		// 查詢getall
		/*=====列出這個專案的所有日誌======*/
//		pstmt.setInt(1, proj_id);
		/*=============================*/
//		List<ProjPerkVO> list = dao.getAll(1001);
//		for (ProjPerkVO projPerkVO2 : list) {
//		System.out.print(projPerkVO2.getPerk_id() + ",");
//		System.out.print(projPerkVO2.getProj_id() + ",");
//		System.out.print(projPerkVO2.getPerk_pic() + ",");
//		System.out.print(projPerkVO2.getPerk_intro() + ",");
//		System.out.print(projPerkVO2.getPerk_total_count() + ",");
//		System.out.print(projPerkVO2.getPerk_fund() + ",");
//		System.out.print(projPerkVO2.getPerk_limited() + ",");
//		System.out.print(projPerkVO2.getPerk_ship_date() + ",");
//		System.out.print(projPerkVO2.getPerk_ship_area() + ",");
//		System.out.println();
//		System.out.println("---------------------");
//	}
		/*=====================================================*/
		
	
}



	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];//長度，資料流多少bytes
		fis.read(buffer);//讀進byte陣列裡
		fis.close();
		return buffer; //回傳byte[]
	}
}

	
	

