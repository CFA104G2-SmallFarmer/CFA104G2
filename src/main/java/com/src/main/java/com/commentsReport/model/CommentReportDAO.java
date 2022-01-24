package com.commentsReport.model;

import java.util.List;

public interface CommentReportDAO {
	void add(CommentsReportVO commentReportVO); 
    void update(CommentsReportVO commentReportVO);
    //void delete(Integer comments_report_ID);
    CommentsReportVO findByPK(Integer comments_report_ID);
    List<CommentsReportVO> getAll();

}
