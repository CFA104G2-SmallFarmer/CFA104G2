package com.comments.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentsJDBCDAO implements CommentsDAO {
	
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO COMMENTS ( ARTICLE_ID, MEM_ID, COMMENTS_TIME, COMMENTS_CONTENT, COMMENTS_IMG, COMMENTS_NUM, COMMENTS_LIKE, COMMENTS_STATE) VALUES ( ?, ?, ?, ?, ?, '0', '0', '0');";
    public static final String UPDATE_STMT = "UPDATE COMMENTS SET COMMENTS_TIME=?, COMMENTS_CONTENT = ?, COMMENTS_LIKE = ?, COMMENTS_IMG= ?,COMMENTS_STATE= ? WHERE COMMENTS_ID = ?;";
    public static final String DELETE_STMT = "DELETE FROM COMMENTS WHERE COMMENTS_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM COMMENTS WHERE COMMENTS_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM COMMENTS;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

	@Override
	public void add(CommentsVO comments) {
		Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, comments.getArticle_ID());
            pstmt.setInt(2, comments.getMem_ID());
            pstmt.setDate(3, comments.getComments_time());
            pstmt.setString(4, comments.getComments_content());
            pstmt.setBytes(5, comments.getComments_img());           
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
	public void update(CommentsVO comments) {
		Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);
            // ¥hfk
            pstmt.setDate(1,comments.getComments_time());
            pstmt.setString(2, comments.getComments_content());
            pstmt.setInt(3, comments.getComments_like());
            pstmt.setBytes(4, comments.getComments_img());
            pstmt.setInt(5, comments.getComments_state());
            pstmt.setInt(6, comments.getComments_ID());
      

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
	public void delete(int comments_ID) {
		Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, comments_ID);

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
	public CommentsVO findByPK(int comments_ID) {
		CommentsVO comments = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, comments_ID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                comments = new CommentsVO();
                comments .setComments_ID(rs.getInt("COMMENTS_ID"));
                comments.setArticle_ID(rs.getInt("ARTICLE_ID"));
                comments.setComments_num(rs.getInt("COMMENTS_NUM"));
                comments.setMem_ID(rs.getInt("MEM_ID"));
                comments.setComments_time(rs.getDate("COMMENTS_TIME"));
                comments.setComments_content(rs.getString("COMMENT_CONTENT"));
                comments.setComments_like(rs.getInt("COMMENT_LIKE"));
                comments.setComments_img(rs.getBytes("COMMENT_IMG"));
                comments.setComments_state(rs.getInt("COMMENT_STATE"));
                
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
        return comments;
    }


	@Override
	public List<CommentsVO> getAll() {
		List<CommentsVO> comments_list = new ArrayList<>();
		CommentsVO comments = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                comments = new CommentsVO();
                comments.setComments_ID(rs.getInt("COMMENTS_ID"));
                comments.setArticle_ID(rs.getInt("ARTICLE_ID"));
                comments.setComments_num(rs.getInt("COMMENTS_NUM"));
                comments.setMem_ID(rs.getInt("MEM_ID"));
                comments.setComments_time(rs.getDate("COMMENTS_TIME"));
                comments.setComments_content(rs.getString("COMMENTS_CONTENT"));
                comments.setComments_like(rs.getInt("COMMENTS_LIKE"));
                comments.setComments_img(rs.getBytes("COMMENTS_IMG"));
                comments.setComments_state(rs.getInt("COMMENTS_STATE")); 
                comments_list.add(comments);
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
        return comments_list;
    }
}

