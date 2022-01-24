package com.comments.model;

import java.util.List;

public interface CommentsDAO {
	void add(CommentsVO commentsVO);
    void update(CommentsVO commentsVO);
    void delete(Integer comments_ID);
    CommentsVO findByPK(Integer comments_ID);
    List<CommentsVO> getAll(Integer article_ID);

}
