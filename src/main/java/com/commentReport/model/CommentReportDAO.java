package com.commentReport.model;

import java.util.List;

public interface CommentReportDAO {
	void add(CommentReportVO commentReportVO);
    void update(CommentReportVO commentReportVO);
    void delete(int cmt_report_ID);
    CommentReportVO findByPK(int cmt_report_ID);
    List<CommentReportVO> getAll();

}
