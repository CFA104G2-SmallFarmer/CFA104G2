package com.articleType.model;

import java.util.List;

public class ArticleTypeService {
    private ArticleTypeDAO dao;

    public ArticleTypeService() {
        dao = new ArticleTypeJDBCDAO();
    }

    public ArticleTypeVO addArticleType(byte[] article_type_img, String article_type_text) {
        ArticleTypeVO ArticleTypeVO = new ArticleTypeVO();
        ArticleTypeVO.setArticle_type_img(article_type_img);
        ArticleTypeVO.setArticle_type_text(article_type_text);
        dao.add(ArticleTypeVO);
        return ArticleTypeVO;
    }

    public ArticleTypeVO updateArticleType(byte[] article_type_img, String article_type_text) {
        ArticleTypeVO ArticleTypeVO = new ArticleTypeVO();
        ArticleTypeVO.setArticle_type_img(article_type_img);
        ArticleTypeVO.setArticle_type_text(article_type_text);
        dao.update(ArticleTypeVO);

        return ArticleTypeVO;
    }

    public void deleteArticleType(Integer article_type_ID) {
        dao.delete(article_type_ID);
    }

    public ArticleTypeVO getOneArticleType(Integer article_type_ID) {
        return dao.findByPK(article_type_ID);
    }

    public List<ArticleTypeVO> getAllArticleType() {
        return dao.getAll();
    }

}
