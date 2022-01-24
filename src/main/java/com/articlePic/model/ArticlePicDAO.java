package com.articlePic.model;

import java.util.List;

public interface ArticlePicDAO {
	void add(ArticlePicVO articlePicVO);
    //void update(ArticlePicVO articlePicVO);
    void delete(Integer article_pic_ID);
    ArticlePicVO findByPK(Integer article_pic_ID);
//    List<ArticlePicVO> getAll();
}
