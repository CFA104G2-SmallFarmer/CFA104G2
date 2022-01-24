package com.article.model;

import java.util.List;

public interface ArticleDAO {
	void add(ArticleVO articleVO);
    void update(ArticleVO articleVO);
    void delete(Integer article_ID);
    ArticleVO findByPK(Integer article_ID);
    List<ArticleVO> getAll();
}
