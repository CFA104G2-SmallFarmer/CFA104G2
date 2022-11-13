package com.articleCollection.model;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ArticleCollectionJDBCDAO implements ArticleCollectionDAO {

    public static final String INSERT_STMT = "INSERT INTO article_collection (ARTICLE_ID, mem_id,ARTICLE_FOLLOW_DATE) VALUES ( ?, ?, NOW());";
    public static final String DELETE_STMT = "DELETE FROM article_collection WHERE mem_id  = ? AND ARTICLE_ID= ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM article_collection WHERE mem_id = ? AND ARTICLE_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM article_collection WHERE mem_id = ?;";

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public void add(Connection con, ArticleCollectionVO articleCollection) {

        try {
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, articleCollection.getArticle_ID());
            pstmt.setInt(2, articleCollection.getMem_id());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

//    @Override
//    public void delete(Integer article_ID, Integer mem_id) {
//
//    }


    @Override
    public void delete(Connection con, Integer article_ID, Integer mem_id) {

        try {

            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, article_ID);
            pstmt.setInt(2, mem_id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public boolean findByPK(Connection con, Integer mem_id, Integer article_ID) {

        ArticleCollectionVO article_collection = null;
        try {
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, mem_id);
            pstmt.setInt(2, article_ID);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return false;
    }

    @Override
    public List<ArticleCollectionVO> getAll(Connection con, Integer mem_id) {
        List<ArticleCollectionVO> article_collection_list = new ArrayList<>();
        ArticleCollectionVO article_collection = null;
        try {
            pstmt = con.prepareStatement(GET_ALL_STMT);

            pstmt.setInt(1,mem_id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                article_collection = new ArticleCollectionVO();
                article_collection.setArticle_ID(rs.getInt("ARTICLE_ID"));
                article_collection.setMem_id(rs.getInt("MEM_ID"));
                article_collection.setArticle_follow_date(rs.getTimestamp("ARTICLE_FOLLOW_DATE"));

                article_collection_list.add(article_collection);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return article_collection_list;
    }
}