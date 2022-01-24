package com.articleType.model;

import java.util.List;

public interface ArticleTypeDAO {
    void add(ArticleTypeVO articleTypeVO);
    void update(ArticleTypeVO articleTypeVO);
    void delete(Integer article_type_ID);
    ArticleTypeVO findByPK(Integer article_type_ID);
    List<ArticleTypeVO> getAll();
}
