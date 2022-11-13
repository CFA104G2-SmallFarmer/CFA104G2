package com.articleType.model;

import com.article.model.ArticleVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticleTypeJDBCDAO implements ArticleTypeDAO {

    public static final String DRIVER = com.sysconfig.SysConfig.getDriver();
    public static final String URL = com.sysconfig.SysConfig.getUrl();
    public static final String USER = com.sysconfig.SysConfig.getUserid();
    public static final String PASSWORD = com.sysconfig.SysConfig.getPasswd();;

    public static final String INSERT_STMT = "INSERT INTO article_type (ARTICLE_TYPE_IMG, AC_TYPE_TEXT) VALUES ( ?, ?);";
    public static final String UPDATE_STMT = "UPDATE article_type SET ARTICLE_TYPE_IMG = ?, AC_TYPE_TEXT = ? WHERE ARTICLE_TYPE_ID = ?;";
    public static final String DELETE_STMT = "DELETE FROM article_type WHERE ARTICLE_TYPE_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM article_type WHERE ARTICLE_TYPE_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM article_type;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(ArticleTypeVO articleType) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setBytes(1, articleType.getArticle_type_img());
            pstmt.setString(2, articleType.getArticle_type_text());

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
    public void update(ArticleTypeVO articleType) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);

            pstmt.setBytes(1, articleType.getArticle_type_img());
            pstmt.setString(2, articleType.getArticle_type_text());
            pstmt.setInt(3, articleType.getArticle_type_ID());

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
    public void delete(Integer article_type_ID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, article_type_ID);

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
    public ArticleTypeVO findByPK(Integer article_type_ID) {
        ArticleTypeVO article_type = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, article_type_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                article_type = new ArticleTypeVO();
                article_type.setArticle_type_ID(rs.getInt("ARTICLE_TYPE_ID"));
                article_type.setArticle_type_img(rs.getBytes("ARTICLE_TYPE_IMG"));
                article_type.setArticle_type_text(rs.getString("ARTICLE_TYPE_TEXT"));

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
        return article_type;
    }

    @Override
    public List<ArticleTypeVO> getAll() {
        List<ArticleTypeVO> article_type_list = new ArrayList<>();
        ArticleTypeVO article_type = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                article_type = new ArticleTypeVO();
                article_type.setArticle_type_ID(rs.getInt("ARTICLE_TYPE_ID"));
                article_type.setArticle_type_img(rs.getBytes("ARTICLE_TYPE_IMG"));
                article_type.setArticle_type_text(rs.getString("ARTICLE_TYPE_TEXT"));
                article_type_list.add(article_type);
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
        return article_type_list;
    }
}