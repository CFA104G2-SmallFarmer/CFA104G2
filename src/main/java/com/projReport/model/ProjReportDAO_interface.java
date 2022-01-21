package com.projReport.model;

import java.util.*;



public interface ProjReportDAO_interface {
	public void insert(ProjReportVO projReportDAO);
    public void update(ProjReportVO projReportDAO);
    public void delete(Integer dir_id);
    public ProjReportVO findByPrimaryKey(Integer dir_id);
    public List<ProjReportVO> getAll();

//  public List<ProjReportDAO> getAll(Map<String, String[]> map); 
}
