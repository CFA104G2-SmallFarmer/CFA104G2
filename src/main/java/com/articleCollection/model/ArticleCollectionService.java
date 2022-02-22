package com.articleCollection.model;

import com.core.connectionFactory.ConnectionFactory;

import java.sql.Connection;
import java.util.List;


public class ArticleCollectionService {
    private ArticleCollectionDAO dao;

    public ArticleCollectionService() {
        dao = new ArticleCollectionJDBCDAO();
    }

    ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection con = connectionFactory.getConnection();

    public  void  addArticleCollection(Integer mem_id, Integer article_ID) {
        ArticleCollectionVO article_collection = new ArticleCollectionVO();
        article_collection.setMem_id(mem_id);
        article_collection .setArticle_ID(article_ID);
        dao.add(con, article_collection);
    }

    public void deleteArticleCollection(Integer article_ID, Integer mem_id) {
        dao.delete(con,article_ID, mem_id);
    }

    public boolean getOneArticleCollection(Integer mem_id, Integer article_ID) { return dao.findByPK(con, mem_id, article_ID);}

    public List<ArticleCollectionVO> getAllArticleCollection(Integer mem_id) {
        return dao.getAll(con, mem_id);
    }



}
