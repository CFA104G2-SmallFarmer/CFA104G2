package com.projCollection.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proDiary.model.ProDairyJDBCDAO;
import com.proDiary.model.ProDairyVO;

public class ProjCollectionJDBCDAO implements ProjCollectionDAO_interface{
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "aaaa";

	private static final String INSERT_STMT = //2個問號
			"INSERT INTO `PROJ_COLLECTION`(`PROJ_ID`,`MEM_ID`)VALUES(?,?);"; 
	private static final String GET_ALL_STMT = //呈現某會員的所有收藏
			"SELECT `PROJ_ID`,`MEM_ID`FROM `PROJ_COLLECTION` WHERE `MEM_ID`=?;";
	private static final String DELETE = 
			"DELETE FROM PROJ_COLLECTION WHERE`PROJ_ID`=? and `MEM_ID`=?;";
	@Override
	public void insert(ProjCollectionVO projCollectionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, projCollectionVO.getProj_id());
			pstmt.setInt(2, projCollectionVO.getMem_id());
	

			pstmt.executeUpdate();
			System.out.println("新增成功");

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
	public void delete(Integer proj_id, Integer mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, proj_id);
			pstmt.setInt(2, mem_id);

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
	public List<ProjCollectionVO> getAll(Integer mem_id) {
		List<ProjCollectionVO> list = new ArrayList<ProjCollectionVO>();
		ProjCollectionVO projCollectionVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
		

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			/*======呈現某會員的所有收藏======*/
			pstmt.setInt(1, mem_id);
			/*=============================*/
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// proDairyVO 也稱為 Domain objects
				projCollectionVO = new ProjCollectionVO();
				projCollectionVO.setProj_id(rs.getInt("proj_id"));
				projCollectionVO.setMem_id(rs.getInt("mem_id"));
				
				list.add(projCollectionVO); // Store the row in the list
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

		ProjCollectionJDBCDAO dao = new ProjCollectionJDBCDAO();
		/*=====================================================*/
//		// 新增
//		ProjCollectionVO projCollectionVO2 = new ProjCollectionVO();
//		projCollectionVO2.setProj_id(1002);
//		projCollectionVO2.setMem_id(77001);
//		dao.insert(projCollectionVO2);
//		System.out.println("成功");
		
		/*=====================================================*/

		// 刪除
//		int x_setProj_id =1002;
//		int y_setMem_id =77001;
//		
//		dao.delete(x_setProj_id,y_setMem_id);
//		System.out.println("刪除Proj_id="+x_setProj_id+",Mem_id="+y_setMem_id+" 成功");

		/*=====================================================*/

		// 查詢getall
		/*======呈現某會員的所有收藏======*/

//		List<ProjCollectionVO> list = dao.getAll(77000);
//		for (ProjCollectionVO projCollectionVO2 : list) {
//		System.out.print(projCollectionVO2.getProj_id() + ",");
//		System.out.print(projCollectionVO2.getMem_id() + ",");
//		System.out.println();
//		System.out.println("------------");
//		}
		
		/*=====================================================*/
		
	}

}
