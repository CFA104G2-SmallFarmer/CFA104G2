package com.articleReport.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticleReportJDBCDAO implements ArticleReportDAO {

	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	public static final String USER = "root";
	public static final String PASSWORD = "password";

	public static final String INSERT_STMT = "INSERT INTO ARTICLE_REPORT ( MEM_ID, ARTICLE_ID, REPORT_TIME, REPORT_REASON, REPORT_STATE,) VALUES ( ?, ?, NOW(), ?, '0');";
	public static final String UPDATE_STMT = "UPDATE ARTICLE_REPORT SET REPORT_STATE=?, REPORT_NOTE=?, REVIEW_TIME= NOW() WHERE ARTICLE_REPORT_ID = ?;";
// public static final String DELETE_STMT = "DELETE FROM ARTICLE_REPORT WHERE
	public static final String GET_ONE_STMT = "SELECT * FROM ARTICLE_REPORT WHERE ARTICLE_REPORT_ID = ?;";
	public static final String GET_ALL_STMT = "SELECT * FROM ARTICLE_REPORT;";

	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void add(ArticleReportVO articleReport) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, articleReport.getMem_ID());
			pstmt.setInt(2, articleReport.getArticle_ID());
			pstmt.setString(3, articleReport.getReport_reason());

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
	public void update(ArticleReportVO articleReport) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, articleReport.getReport_state());
			pstmt.setString(2, articleReport.getReport_note());
			pstmt.setInt(3, articleReport.getArticle_report_ID());

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

//@Override
//public void delete(Integer report_ID) {}
	@Override
	public ArticleReportVO findByPK(Integer article_report_ID) {
		ArticleReportVO articleReport = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, article_report_ID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				articleReport = new ArticleReportVO();
				articleReport.setArticle_report_ID(rs.getInt("ARTICLE_REPORT_ID"));
				articleReport.setMem_ID(rs.getInt("MEM_ID"));
				articleReport.setArticle_ID(rs.getInt("ARTICLE_ID"));
				articleReport.setReport_time(rs.getTimestamp("REPORT_TIME"));
				articleReport.setReport_reason(rs.getString("REPORT_REASON"));
				articleReport.setReport_state(rs.getInt("REPORT_STATE"));
				articleReport.setReport_note(rs.getString("REPORT_NOTE"));
				articleReport.setReview_time(rs.getTimestamp("REVIEW_TIME"));
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
		return articleReport;
	}

	@Override
	public List<ArticleReportVO> getAll() {
		List<ArticleReportVO> articleReport_list = new ArrayList<>();
		ArticleReportVO articleReport = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				articleReport = new ArticleReportVO();
				articleReport.setArticle_report_ID(rs.getInt("ARTICLE_REPORT_ID"));
				articleReport.setMem_ID(rs.getInt("MEM_ID"));
				articleReport.setArticle_ID(rs.getInt("ARTICLE_ID"));
				articleReport.setReport_time(rs.getTimestamp("REPORT_TIME"));
				articleReport.setReport_reason(rs.getString("REPORT_REASON"));
				articleReport.setReport_state(rs.getInt("REPORT_STATE"));
				articleReport.setReport_note(rs.getString("REPORT_NOTE"));
				articleReport.setReview_time(rs.getTimestamp("REVIEW_TIME"));
				articleReport_list.add(articleReport);
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
		return articleReport_list;
	}
}
