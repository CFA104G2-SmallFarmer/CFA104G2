package com.articlePic.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ArticlePicJDBCDAO implements ArticlePicDAO {
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	public static final String USER = "root";
	public static final String PASSWORD = "password";

	public static final String INSERT_STMT = "INSERT INTO ARTICLE_PIC ( ARTICLE_ID, ARTICLE_PIC) VALUES ( ?, ?);";
	// public static final String UPDATE_STMT = "";
	public static final String DELETE_STMT = "DELETE FROM ARTICLE_PIC WHERE ARTICLE_PIC_ID = ?;";
	public static final String GET_ONE_STMT = "SELECT * FROM ARTICLE_PIC WHERE ARTICLE_PIC_ID = ?;";
	public static final String GET_ALL_STMT = "SELECT * FROM ARTICLE_PIC;";

	@Override
	public void add(ArticlePicVO articlePic) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, articlePic.getArticle_ID());
			pstmt.setBytes(2, articlePic.getArticle_pic());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
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

//	@Override
//	public void update(ArticlePicVO articlePic) {
//	}

	@Override
	public void delete(Integer article_pic_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1, article_pic_ID);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
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
	public ArticlePicVO findByPK(Integer article_pic_ID) {
		ArticlePicVO article_pic = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, article_pic_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				article_pic = new ArticlePicVO();
				article_pic.setArticle_pic_ID(rs.getInt("ARTICLE_PIC_ID"));
				article_pic.setArticle_ID(rs.getInt("ARTICLE_ID"));
				article_pic.setArticle_pic(rs.getBytes("ARTICLE_PIC"));

			}
		} catch (SQLException se) {
			se.printStackTrace();
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
		return article_pic;
	}

//	@Override
//	public List<ArticlePicVO> getAll() {
//		List<ArticlePicVO> article_pic_list = new ArrayList<>();
//		ArticlePicVO article_pic = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			con = DriverManager.getConnection(URL, USER, PASSWORD);
//			pstmt = con.prepareStatement(GET_ALL_STMT);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				article_pic = new ArticlePicVO();
//				article_pic.setArticle_pic_ID(rs.getInt("ARTICLE_PIC_ID"));
//				article_pic.setArticle_ID(rs.getInt("ARTICLE_ID"));
//				article_pic.setArticle_pic(rs.getBytes("ARTICLE_PIC"));
//
//				article_pic_list.add(article_pic);
//			}
//		} catch (SQLException se) {
//			se.printStackTrace();
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
//		return article_pic_list;
//	}
}
