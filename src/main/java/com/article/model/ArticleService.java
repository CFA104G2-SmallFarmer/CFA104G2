package com.article.model;

import com.core.connectionFactory.ConnectionFactory;
import com.articleCollection.model.ArticleCollectionVO;

import com.article.model.ArticleJDBCDAO;
import com.farmTravelCollection.model.FarmTravelCollectionVO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleService {
    private ArticleDAO dao;

    public ArticleService() {
        dao = new ArticleJDBCDAO();
    }

    ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection con = connectionFactory.getConnection();

    public ArticleVO addArticle(String article_title, Integer mem_id, Integer Article_type_ID, String article_content, byte[] article_img) {
        ArticleVO ArticleVO = new ArticleVO();
        ArticleVO.setArticle_title(article_title);
        ArticleVO.setMem_id(mem_id);
        ArticleVO.setArticle_type_ID(Article_type_ID);
        ArticleVO.setArticle_content(article_content);
        ArticleVO.setArticle_img(article_img);
        dao.add(con, ArticleVO);
        return ArticleVO;

    }

    public ArticleVO updateArticle(String article_title, String article_content, byte[] article_img, Integer article_like, Integer comments_num,
                                   Integer article_state, Integer article_ID) {

        ArticleVO ArticleVO = new ArticleVO();
        ArticleVO.setArticle_title(article_title);
        ArticleVO.setArticle_content(article_content);
        ArticleVO.setArticle_img(article_img);
        ArticleVO.setArticle_like(article_like);
        ArticleVO.setComments_num(comments_num);
        ArticleVO.setArticle_state(article_state);
        ArticleVO.setArticle_ID(article_ID);
        dao.update(con, ArticleVO);
        return ArticleVO;

    }

    public void deleteArticle(Integer article_ID) {
        dao.delete(con, article_ID);

    }

    public ArticleVO getOneArticle(Integer article_ID) {
        return dao.findByPK(con, article_ID);
    }

    public List<ArticleVO> getAllArticle() {
        return dao.getAll(con);
    }

    public List<ArticleVO> getAllArticleByMemID(Integer mem_id) {
        return dao.getAllByMemID(con, mem_id);
    }

    public List<ArticleVO> getAllArticleCollection(List<ArticleCollectionVO> articleCollectionList) {
        List<ArticleVO> articleList = new ArrayList<>();
        ArticleVO article;
        for (ArticleCollectionVO articleCollection : articleCollectionList){
            article = dao.findByPK(con, articleCollection.getArticle_ID());
            articleList.add(article);
        }
        return articleList;
    }
	
}
