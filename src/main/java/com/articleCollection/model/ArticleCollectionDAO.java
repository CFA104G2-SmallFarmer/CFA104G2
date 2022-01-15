package com.articleCollection.model;

import java.util.List;

public interface ArticleCollectionDAO {
	void add(ArticleCollectionVO articleCollectionVO);
    void update(ArticleCollectionVO articleCollectionVO);
    void delete(int article_ID, int mem_ID);
    ArticleCollectionVO findByPK(int article_ID, int mem_ID);
    List<ArticleCollectionVO> getAll();


}
