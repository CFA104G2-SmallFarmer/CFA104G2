package com.article.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class ArticleJDBCDAO implements ArticleDAO {
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	public static final String USER = "root";
	public static final String PASSWORD = "password";

	public static final String INSERT_STMT = "INSERT INTO ARTICLE (ARTICLE_TITLE, MEM_ID, ARTICLE_TYPE_ID, ARTICLE_TIME, ARTICLE_CONTENT, ARTICLE_IMG, ARTICLE_LIKE, COMMENTS_NUM, ARTICLE_STATE,) VALUES (  ?, ?, ?, NOW(), ?, ?,'0','0','0');";
	public static final String UPDATE_STMT = "UPDATE ARTICLE SET ARTICLE_TITLE = ?, ARTICLE_CONTENT= ?, ARTICLE_IMG= ?, ARTICLE_LIKE= ?, COMMENTS_NUM= ?, ARTICLE_STATE= ?, ARTICLE_UPDATE_TIME= NOW() WHERE ARTICLE_ID = ?;";
	public static final String DELETE_STMT = "DELETE FROM ARTICLE WHERE ARTICLE_ID = ?;";
	public static final String GET_ONE_STMT = "SELECT * FROM ARTICLE WHERE ARTICLE_ID = ?;";
	public static final String GET_ALL_STMT = "SELECT * FROM ARTICLE;";

	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void add(ArticleVO article) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, article.getArticle_title());
			pstmt.setInt(2, article.getMem_ID());
			pstmt.setInt(3, article.getArticle_type_ID());
			pstmt.setString(4, article.getArticle_content());
			pstmt.setBytes(5, article.getArticle_img());
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
	public void update(ArticleVO article) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, article.getArticle_title());
			pstmt.setString(2, article.getArticle_content());
			pstmt.setBytes(3, article.getArticle_img());
			pstmt.setInt(4, article.getArticle_like());
			pstmt.setInt(5, article.getComments_num());
			pstmt.setInt(6, article.getArticle_state());
			pstmt.setInt(7, article.getArticle_ID());

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
	public void delete(Integer article_ID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1, article_ID);

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
public ArticleVO findByPK(Integer article_ID) {
	ArticleVO article = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		con = DriverManager.getConnection(URL, USER, PASSWORD);
		pstmt = con.prepareStatement(GET_ONE_STMT);

		pstmt.setInt(1, article_ID);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			article = new ArticleVO();
			article.setArticle_ID(rs.getInt("ARTICLE_ID"));
			article.setArticle_title(rs.getString("ARTICLE_TITLE"));
			article.setMem_ID(rs.getInt("MEM_ID"));
			article.setArticle_type_ID(rs.getInt("ARTICLE_TYPE_ID"));
			article.setArticle_time(rs.getTimestamp("ARTICLE_TIME"));
			article.setArticle_content(rs.getString("ARTICLE_CONTENT"));
			article.setArticle_img(rs.getBytes("ARTICLE_IMG"));
			article.setArticle_like(rs.getInt("ARTICLE_LIKE"));;
			article.setComments_num(rs.getInt("COMMENTS_NUM"));
			article.setArticle_state(rs.getInt("ARTICLE_STATE"));
			article.setArticle_update_time(rs.getTimestamp("ARTICLE_UPDATE_TIME"));

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
	return article;
}
@Override
public List<ArticleVO> getAll() {
    List<ArticleVO> articlel_list = new ArrayList<>();
    ArticleVO article = null;
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        con = DriverManager.getConnection(URL, USER, PASSWORD);
        pstmt = con.prepareStatement(GET_ALL_STMT);

        rs = pstmt.executeQuery();

        while (rs.next()) {
        	article = new ArticleVO();
        	article.setArticle_ID(rs.getInt("ARTICLE_ID"));
			article.setArticle_title(rs.getString("ARTICLE_TITLE"));
			article.setMem_ID(rs.getInt("MEM_ID"));
			article.setArticle_type_ID(rs.getInt("ARTICLE_TYPE_ID"));
			article.setArticle_time(rs.getTimestamp("ARTICLE_TIME"));
			article.setArticle_content(rs.getString("ARTICLE_CONTENT"));
			article.setArticle_img(rs.getBytes("ARTICLE_IMG"));
			article.setArticle_like(rs.getInt("ARTICLE_LIKE"));;
			article.setComments_num(rs.getInt("COMMENTS_NUM"));
			article.setArticle_state(rs.getInt("ARTICLE_STATE"));
			article.setArticle_update_time(rs.getTimestamp("ARTICLE_UPDATE_TIME"));
        	articlel_list.add(article);
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
    return articlel_list;
}
}
