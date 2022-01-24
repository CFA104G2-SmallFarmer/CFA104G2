package com.articleType.model;

import java.util.List;

public interface ArticleTypeDAO {
    void add(ArticleTypeVO articleTypeVO);
    void update(ArticleTypeVO articleTypeVO);
    void delete(int article_type_ID);
    ArticleTypeVO findByPK(int article_type_ID);
    List<ArticleTypeVO> getAll();
}
