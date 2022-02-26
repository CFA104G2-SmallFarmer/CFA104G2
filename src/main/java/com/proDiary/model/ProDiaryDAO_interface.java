package com.proDiary.model;

import java.sql.Date;
import java.util.*;

public interface ProDiaryDAO_interface {
    public void insert(ProDiaryVO proDiaryVO);
    public void update(ProDiaryVO proDiaryVO);
    public void delete(Integer dir_id);
    public ProDiaryVO findByPrimaryKey(Integer dir_id);
    
    public List<ProDiaryVO> getAllSameDay(Integer proj_id,Date dir_upload_date);
    // 列出某專案同一天的所有日誌
    public List<ProDiaryVO> getAll(Integer proj_id); 
    //列出某專案的所有日誌
    
    public List<ProDiaryVO> getAllByState1(Integer proj_id); 
    //列出某專案的所有日誌
    
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProDiaryVO> getAll(Map<String, String[]> map); 

}