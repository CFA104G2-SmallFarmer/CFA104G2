package com.commentsReport.model;

import java.sql.Timestamp;
import java.util.List;

public class CommentsReportService {
    private CommentReportDAO dao;

    public CommentsReportService() {
        dao = new CommentsReportJDBCDAO();
    }

    public CommentsReportVO addCommentReport(Integer comments_ID, Integer mem_id, Integer article_ID,
                                             String report_reason, java.sql.Timestamp report_time, Integer report_state) {
        CommentsReportVO CommentsReportVO = new CommentsReportVO();
        CommentsReportVO.setComments_ID(comments_ID);
        CommentsReportVO.setMem_id(mem_id);
        CommentsReportVO.setArticle_ID(article_ID);
        CommentsReportVO.setReport_reason(report_reason);
        CommentsReportVO.setReport_time(report_time);
        CommentsReportVO.setReport_state(report_state);
        dao.add(CommentsReportVO);
        return CommentsReportVO;

    }

    public CommentsReportVO updateCommentsReport(Integer report_state, String report_note,
                                                 java.sql.Timestamp review_time, Integer comments_report_ID) {
        CommentsReportVO CommentsReportVO = new CommentsReportVO();
        CommentsReportVO.setReport_state(report_state);
        CommentsReportVO.setReport_note(report_note);
        CommentsReportVO.setReview_time(review_time);
        CommentsReportVO.setComments_report_ID(comments_report_ID);
        dao.update(CommentsReportVO);

        return CommentsReportVO;
    }

    public CommentsReportVO getOneCommentsReport(Integer comments_report_ID) {
        return dao.findByPK(comments_report_ID);
    }

    public List<CommentsReportVO> getAllCommentsReport() {
        return dao.getAll();
    }

}
