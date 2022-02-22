package com.articlePic.model;

import java.util.List;

public class ArticlePicService {
    private ArticlePicDAO dao;

    public ArticlePicService() {
        dao = new ArticlePicJDBCDAO();
    }

    public ArticlePicVO addArticlePic(Integer article_ID, byte[] article_pic) {

        ArticlePicVO ArticlePicVO = new ArticlePicVO();

        ArticlePicVO.setArticle_ID(article_ID);
        ArticlePicVO.setArticle_pic(article_pic);

        dao.add(ArticlePicVO);
        return ArticlePicVO;
    }

    //	public ArticlePicVO updateArticlePic(Integer article_ID,byte[] article_pic) {
//		ArticlePicVO ArticlePicVO = new ArticlePicVO();
//		
//		ArticlePicVO.setArticle_ID(article_ID);
//		ArticlePicVO.setArticle_pic(article_pic);
//		dao.update(ArticlePicVO);
//		return ArticlePicVO;
//	
//	}
    public void deletArticlePic(Integer article_pic_ID) {
        dao.delete(article_pic_ID);
    }

    public ArticlePicVO getOneArticlePic(Integer article_pic_ID) {
        return dao.findByPK(article_pic_ID);
    }
//	public List<ArticlePicVO>getAllarticlePic(){
//		return dao.getAll();
//	}

}
