package com.articleCollection.model;

import java.util.List;

public interface ArticleCollectionDAO {
	void add(ArticleCollectionVO articleCollectionVO);
    //void update(ArticleCollectionVO articleCollectionVO);
    void delete(Integer article_ID, Integer mem_ID);
//    ArticleCollectionVO findByPK(Integer article_ID, Integer mem_ID);
    List<ArticleCollectionVO> getAll(Integer mem_ID);


}
