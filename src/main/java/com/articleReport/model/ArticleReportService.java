package com.articleReport.model;

import java.sql.Timestamp;
import java.util.List;

public class ArticleReportService {
    private ArticleReportDAO dao;

    public ArticleReportService() {
        dao = new ArticleReportJDBCDAO();
    }

    public ArticleReportVO addArticleReport(Integer mem_id, Integer article_ID,
                                            java.sql.Timestamp report_time, String report_reason, Integer report_state) {
        ArticleReportVO ArticleReportVO = new ArticleReportVO();
        ArticleReportVO.setMem_id(mem_id);
        ArticleReportVO.setArticle_ID(article_ID);
        ArticleReportVO.setReport_time(report_time);
        ArticleReportVO.setReport_reason(report_reason);
        ArticleReportVO.setReport_state(report_state);
        dao.add(ArticleReportVO);

        return ArticleReportVO;
    }

    public ArticleReportVO updateArticleReport(Integer report_state, String report_note, java.sql.Timestamp review_time, Integer article_report_ID) {
        ArticleReportVO ArticleReportVO = new ArticleReportVO();
        ArticleReportVO.setReport_state(report_state);
        ArticleReportVO.setReport_note(report_note);
        ArticleReportVO.setReview_time(review_time);
        ArticleReportVO.setArticle_report_ID(article_report_ID);
        dao.update(ArticleReportVO);

        return ArticleReportVO;
    }

    public ArticleReportVO getOneArticleReport(Integer article_report_ID) {
        return dao.findByPK(article_report_ID);

    }

    public List<ArticleReportVO> getAllArticleReport() {
        return dao.getAll();
    }

}
