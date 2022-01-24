package com.articleCollection.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class ArticleCollectionJDBCDAO implements ArticleCollectionDAO {
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	public static final String USER = "root";
	public static final String PASSWORD = "password";

	public static final String INSERT_STMT = "INSERT INTO ARTICLE_COLLECTION (ARTICLE_ID, MEM_ID,ARTICLE_FOLLOW_DATE) VALUES ( ?, ?, ?);";
//	public static final String UPDATE_STMT = "";
	public static final String DELETE_STMT = "DELETE FROM ARTICLE_COLLECTION WHERE ARTICLE_ID = ?,MEM_ID= ?;";
//	public static final String GET_ONE_STMT = "";
	public static final String GET_ALL_STMT = "SELECT * FROM ARTICLE_COLLECTION WHERE MEM_ID = ?;";

	@Override
	public void add(ArticleCollectionVO articleCollection) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, articleCollection.getArticle_ID());
			pstmt.setInt(2, articleCollection.getMem_ID());
			pstmt.setTimestamp(3, articleCollection.getArticle_follow_date());

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
//	public void update(ArticleCollectionVO articleCollectionVO)
//	}

	@Override
	public void delete(Integer article_ID, Integer mem_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1, article_ID);
			pstmt.setInt(2, mem_ID);

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
//	public ArticleCollectionVO findByPK(Integer article_ID, Integer mem_ID) {
//		ArticleCollectionVO article_collection = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			con = DriverManager.getConnection(URL, USER, PASSWORD);
//			pstmt = con.prepareStatement(GET_ONE_STMT);
//
//			pstmt.setInt(1, article_ID);
//			pstmt.setInt(2, mem_ID);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				article_collection = new ArticleCollectionVO();
//				article_collection.setArticle_ID(rs.getInt("ARTICLE_ID"));
//				article_collection.setMem_ID(rs.getInt("MEM_ID"));
//				article_collection.setArticle_follow_date(rs.getTimestamp("ARTICLE_FOLLOW_DATE"));
//
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
//		return article_collection;
//	}

	@Override
	public List<ArticleCollectionVO> getAll(Integer mem_ID) {
		List<ArticleCollectionVO> article_collection_list = new ArrayList<>();
		ArticleCollectionVO article_collection = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			pstmt.setInt(1, mem_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				article_collection = new ArticleCollectionVO();
				article_collection.setArticle_ID(rs.getInt("ARTICLE_ID"));
				article_collection.setMem_ID(rs.getInt("MEM_ID"));
				article_collection.setArticle_follow_date(rs.getTimestamp("ARTICLE_FOLLOW_DATE"));

				article_collection_list.add(article_collection);
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
		return article_collection_list;
	}
}