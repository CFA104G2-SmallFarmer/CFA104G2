package com.farmTravelReport.model;

import java.util.List;

public interface FarmTravelReportDAO {
    void add(FarmTravelReportVO farm_travel_report);
    void update(FarmTravelReportVO farm_travel_report);
//    void delete(Integer report_ID);
    FarmTravelReportVO findByPK(Integer report_ID);
    List<FarmTravelReportVO> getAll();
}
