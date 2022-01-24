package com.articleReport.model;

import java.util.List;

public interface ArticleReportDAO {
	void add(ArticleReportVO articleReportVO);
    void update(ArticleReportVO articleReportVO);
    //void delete(int article_report_ID);
    ArticleReportVO findByPK(int article_report_ID);
    List<ArticleReportVO> getAll();


}
