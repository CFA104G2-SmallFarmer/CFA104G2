package com.commentsReport.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentsReportJDBCDAO implements CommentReportDAO  {

	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO COMMENTS_REPORT (COMMENTS_ID, MEM_ID, ARTICLE_ID, REPORT_REASON, REPORT_TIME, REPORT_STATE) VALUES ( ?, ?, ?, ?, NOW(), '0');";
    public static final String UPDATE_STMT = "UPDATE COMMENTS_REPORT SET REPORT_STATE = ?, REPORT_NOTE = ?, REVIEW_TIME = NOW() WHERE COMMENTS_REPORT_ID = ?;";
   // public static final String DELETE_STMT = "";
    public static final String GET_ONE_STMT = "SELECT * FROM COMMENTS_REPORT WHERE COMMENTS_REPORT_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM COMMENTS_REPORT;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

	
	@Override
	public void add(CommentsReportVO commentsReport) {
		Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);
            pstmt.setInt(1, commentsReport.getComments_ID());
            pstmt.setInt(2, commentsReport.getMem_ID());
            pstmt.setInt(3, commentsReport.getArticle_ID());
            pstmt.setString(4,commentsReport.getReport_reason());
            

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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
	public void update(CommentsReportVO commentsReport) {
		Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);
            
            pstmt.setInt(1,commentsReport.getReport_state());
            pstmt.setString(2, commentsReport.getReport_note());
            pstmt.setInt(3,commentsReport.getComments_report_ID());
  
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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
//	public void delete(Integer cmt_report_ID) {}
	
	@Override
	public CommentsReportVO findByPK(Integer comments_report_ID) {
		CommentsReportVO commentsReport = null; // table-name
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = DriverManager.getConnection(URL, USER, PASSWORD);
	        pstmt = con.prepareStatement(GET_ONE_STMT);
            pstmt.setInt(1, comments_report_ID);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                commentsReport = new CommentsReportVO();
	            commentsReport.setComments_report_ID(rs.getInt("COMMENTS_REPORT_ID"));
	            commentsReport.setComments_ID(rs.getInt("COMMENTS_ID"));
	            commentsReport.setMem_ID(rs.getInt("MEM_ID"));
	            commentsReport.setArticle_ID(rs.getInt("ARTICLE_ID"));
	            commentsReport.setReport_reason(rs.getString("REPORT_REASON"));
	            commentsReport.setReport_time(rs.getTimestamp("REPORT_TIME"));
	            commentsReport.setReport_state(rs.getInt("REPORT_STATE"));
	            commentsReport.setReport_note(rs.getString("REPORT_NOTE"));
	            commentsReport.setReview_time(rs.getTimestamp("REVIEW_TIME"));
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
        return commentsReport;
    }

	@Override
	public List<CommentsReportVO> getAll() {
		List<CommentsReportVO> commentsReport_list = new ArrayList<>();
		CommentsReportVO commentsReport = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
            	commentsReport = new CommentsReportVO();
            	commentsReport.setComments_report_ID(rs.getInt("COMMENTS_REPORT_ID"));
            	commentsReport.setComments_ID(rs.getInt("COMMENTS_ID"));
            	commentsReport.setMem_ID(rs.getInt("MEM_ID"));
            	commentsReport.setArticle_ID(rs.getInt("ARTICLE_ID"));
            	commentsReport.setReport_reason(rs.getString("REPORT_REASON"));
            	commentsReport.setReport_time(rs.getTimestamp("REPORT_TIME"));
            	commentsReport.setReport_state(rs.getInt("REPORT_STATE"));
            	commentsReport.setReport_note(rs.getString("REPORT_NOTE"));
            	commentsReport.setReview_time(rs.getTimestamp("REVIEW_TIME"));
            	commentsReport_list.add(commentsReport);
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
        return commentsReport_list;
    }
}
