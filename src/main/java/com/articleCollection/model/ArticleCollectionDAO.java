package com.articleCollection.model;

import java.sql.Connection;
import java.util.List;

public interface ArticleCollectionDAO {
    //void add(ArticleCollectionVO articleCollectionVO);
    void add(Connection con, ArticleCollectionVO article_collection);

    //void update(ArticleCollectionVO articleCollectionVO);
    void delete(Connection con,Integer article_ID, Integer mem_id);


    boolean findByPK(Connection con, Integer article_ID, Integer mem_id);

    List<ArticleCollectionVO> getAll(Connection con,Integer mem_id);
}
