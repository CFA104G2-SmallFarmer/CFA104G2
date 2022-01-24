package com.article.model;

import java.util.List;

public interface ArticleDAO {
	void add(ArticleVO articleVO);
    void update(ArticleVO articleVO);
    void delete(int article_ID);
    ArticleVO findByPK(int article_ID);
    List<ArticleVO> getAll();

}
