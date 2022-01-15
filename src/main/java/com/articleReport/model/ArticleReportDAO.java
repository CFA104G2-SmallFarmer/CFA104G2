package com.articleReport.model;

import java.util.List;

public interface ArticleReportDAO {
	void add(ArticleReportVO articleReportVO);
    void update(ArticleReportVO articleReportVO);
    void delete(int atc_report_ID);
    ArticleReportVO findByPK(int atc_report_ID);
    List<ArticleReportVO> getAll();


}
