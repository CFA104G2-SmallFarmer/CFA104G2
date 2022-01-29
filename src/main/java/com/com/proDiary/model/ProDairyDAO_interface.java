package com.proDiary.model;

import java.sql.Date;
import java.util.*;

public interface ProDairyDAO_interface {
    public void insert(ProDairyVO proDairyVO);
    public void update(ProDairyVO proDairyVO);
    public void delete(Integer dir_id);
    public ProDairyVO findByPrimaryKey(Integer dir_id);
    
    public List<ProDairyVO> getAllSameDay(Integer proj_id,Date dir_upload_date);
    // 列出某專案同一天的所有日誌
    public List<ProDairyVO> getAll(Integer proj_id); 
    //列出某專案的所有日誌
    
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

}