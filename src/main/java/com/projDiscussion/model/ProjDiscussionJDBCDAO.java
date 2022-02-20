package com.projDiscussion.model;

import java.util.*;
import java.sql.*;

public class ProjDiscussionJDBCDAO implements ProjDiscussionDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";
	// COMMENT_ID是自增主鍵不用打
	private static final String INSERT_STMT = "INSERT INTO PROJ_DISCUSSION (PROJ_ID,DISCUSSION_ID,MEM_ID,F_MEM_ID,COMMENT_DATE,COMMENT_CONTENT)"
			+ "VALUES (?, ?, ?, ?, NOW(), ?)";
	private static final String GET_ALL_SAME_PROJ_STMT = "SELECT COMMENT_ID,PROJ_ID,DISCUSSION_ID,MEM_ID,F_MEM_ID,COMMENT_DATE,COMMENT_CONTENT FROM PROJ_DISCUSSION WHERE PROJ_ID = ? ORDER BY COMMENT_ID";
//	private static final String GET_ONE_STMT = "SELECT COMMENT_ID,PROJ_ID,DISCUSSION_ID,MEM_ID,F_MEM_ID,COMMENT_DATE,COMMENT_CONTENT FROM PROJ_DISCUSSION WHERE PROJ_ID = ?";
	private static final String DELETE = "DELETE FROM PROJ_DISCUSSION WHERE COMMENT_ID = ?";
//	只有留言內容有需要更新的機會，有空可以增加"已編輯"的狀態碼
	private static final String UPDATE = "UPDATE PROJ_DISCUSSION SET COMMENT_CONTENT=? WHERE COMMENT_ID = ?";

	private static final String GET_FIRST_LAYER_STMT = "SELECT COMMENT_ID,PROJ_ID,DISCUSSION_ID,MEM_ID,F_MEM_ID,COMMENT_DATE,COMMENT_CONTENT FROM PROJ_DISCUSSION WHERE DISCUSSION_ID = -1 AND PROJ_ID=?   ORDER BY COMMENT_ID";

	private static final String UPLOAD_FIRST_LAYER_STMT = "UPDATE PROJ_DISCUSSION SET DISCUSSION_ID=? WHERE DISCUSSION_ID = -1 AND PROJ_ID IS NOT NULL AND COMMENT_ID=?";

	@Override
	public List<ProjDiscussionVO> getFirstLayerByID(Integer proj_id){
		List<ProjDiscussionVO> list = new ArrayList<ProjDiscussionVO>();
		ProjDiscussionVO ProjDiscussionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_FIRST_LAYER_STMT);
			pstmt.setInt(1, proj_id);
			
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
	
	
	@Override
	public void updateFirstLayer(ProjDiscussionVO projDiscussionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPLOAD_FIRST_LAYER_STMT);

			pstmt.setInt(1, projDiscussionVO.getComment_id());
			pstmt.setInt(2, projDiscussionVO.getComment_id());
			
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
	public void insert(ProjDiscussionVO projDiscussionVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

//			pstmt.setInt(1, projDiscussionVO.getComment_id());
			pstmt.setInt(1, projDiscussionVO.getProj_id());
			pstmt.setInt(2, projDiscussionVO.getDiscussion_id());
			
			if (projDiscussionVO.getMem_id() == -1) {
				pstmt.setNull(3, Types.NULL);
			} else {
				pstmt.setInt(3, projDiscussionVO.getMem_id());
			}
			
			if (projDiscussionVO.getF_mem_id() == -1) {
				pstmt.setNull(4, Types.NULL);
			} else {
				pstmt.setInt(4, projDiscussionVO.getF_mem_id());
			}
			pstmt.setString(5, projDiscussionVO.getComment_content());

			pstmt.executeUpdate();
			// Handle any driver errors
			
			System.out.println(pstmt);
			
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


			pstmt.setString(1, projDiscussionVO.getComment_content());
			pstmt.setInt(2, projDiscussionVO.getComment_id());

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
	public List<ProjDiscussionVO> getAll(Integer proj_id) {
		List<ProjDiscussionVO> list = new ArrayList<ProjDiscussionVO>();
		ProjDiscussionVO ProjDiscussionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_SAME_PROJ_STMT);
			pstmt.setInt(1, proj_id);
			
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

	public static void main(String[] args) {
		ProjDiscussionJDBCDAO dao = new ProjDiscussionJDBCDAO();

//		/*=====================================================*/
//////		// 新增
//
//		ProjDiscussionVO projDiscussionVO2 = new ProjDiscussionVO();
//		projDiscussionVO2.setProj_id(1001);
//		projDiscussionVO2.setDiscussion_id(1);
//		projDiscussionVO2.setMem_id(77000);
//		projDiscussionVO2.setF_mem_id(null);
//		projDiscussionVO2.setComment_content("disgusting");
//		
//		dao.insert(projDiscussionVO2);
//		System.out.println("成功新增");
//		
//		/*=====================================================*/
		// 修改

//		ProjDiscussionVO projDiscussionVO2 = new ProjDiscussionVO();
//		
//		projDiscussionVO2.setComment_content("bad");
//		projDiscussionVO2.setComment_id(7);
//		
//		dao.update(projDiscussionVO2);
//		System.out.println("更新成功");
//
//		/*=====================================================*/
//
//		 //刪除
//		int x =5;
//		dao.delete(x);
//		System.out.println("刪除dir_id="+x+"成功");
//		
//		/*=====================================================*/

//		// 查詢getAllSameProj
		/* =====列出這個專案的所有留言====== */
		/* ============================= */// 1001
//		List<ProjDiscussionVO> list = dao.getAll(1001);
//		for (ProjDiscussionVO projDiscussion : list) {
//			System.out.print(projDiscussion.getComment_id() + ",");
//			System.out.print(projDiscussion.getProj_id() + ",");
//			System.out.print(projDiscussion.getDiscussion_id() + ",");
//			System.out.print(projDiscussion.getMem_id() + ",");
//			System.out.print(projDiscussion.getF_mem_id() + ",");
//			System.out.print(projDiscussion.getComment_date() + ",");
//			System.out.print(projDiscussion.getComment_content() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}
	}
}
