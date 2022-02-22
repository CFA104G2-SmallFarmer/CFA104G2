package com.article.model;

import java.sql.Connection;
import java.util.List;

public interface ArticleDAO {
    void add(Connection con, ArticleVO articleVO);

    void update(Connection con, ArticleVO articleVO);

    void delete(Connection con, Integer article_ID);

    ArticleVO findByPK(Connection con, Integer article_ID);

    List<ArticleVO> getAll(Connection con);

    List<ArticleVO> getAllByMemID(Connection con, Integer mem_id);
}
