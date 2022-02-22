package com.comments.model;

import java.util.List;

public class CommentsService {
    private CommentsDAO dao;

    public CommentsService() {
        dao = new CommentsJDBCDAO();
    }

    public CommentsVO addComments(Integer article_ID, Integer mem_id, String comments_content, byte[] comments_img) {
        CommentsVO CommentsVO = new CommentsVO();
        CommentsVO.setArticle_ID(article_ID);
        CommentsVO.setMem_id(mem_id);
        CommentsVO.setComments_content(comments_content);
        CommentsVO.setComments_img(comments_img);
        dao.add(CommentsVO);
        return CommentsVO;

    }

    public CommentsVO updateComments(String comments_content, Integer comments_like, byte[] comments_img,
                                     Integer comments_state,Integer comment_ID) {
        CommentsVO commentsVO = new CommentsVO();
        commentsVO.setComments_content(comments_content);
        commentsVO.setComments_like(comments_like);
        commentsVO.setComments_img(comments_img);
        commentsVO.setComments_state(comments_state);
        commentsVO.setComments_ID(comment_ID);

        dao.update(commentsVO);
        return commentsVO;

    }

    public void deleteComments(Integer comments_ID) {
        dao.delete(comments_ID);
    }

    public CommentsVO getOneComments(Integer comments_ID) {
        return dao.findByPK(comments_ID);
    }

    public List<CommentsVO> getAllComments(Integer article_ID) {
        return dao.getAll(article_ID); // ?
    }
}
