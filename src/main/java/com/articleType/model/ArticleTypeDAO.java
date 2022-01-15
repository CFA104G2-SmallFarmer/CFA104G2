package com.articleType.model;

import java.util.List;

public interface ArticleTypeDAO {
    void add(ArticleTypeVO articleTypeVO);
    void update(ArticleTypeVO articleTypeVO);
    void delete(int ac_type_ID);
    ArticleTypeVO findByPK(int ac_type_ID);
    List<ArticleTypeVO> getAll();
}
