package com.comment.model;

import java.util.List;

public interface CommentDAO {
	void add(CommentVO commentVO);
    void update(CommentVO commentVO);
    void delete(int article_ID,int comment_num);
    CommentVO findByPK(int article_ID,int comment_num);
    List<CommentVO> getAll();

}
