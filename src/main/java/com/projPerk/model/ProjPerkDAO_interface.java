package com.projPerk.model;

import java.util.List;


public interface ProjPerkDAO_interface {
    public void insert(ProjPerkVO projPerkVO);
    public void update(ProjPerkVO projPerkVO);
    public int getPerkTotalCount(Integer perk_id);
    public void autoUpdatePerkTotalCount(Integer perk_id);
    public void delete(Integer perk_id);
    public ProjPerkVO findByPrimaryKey(Integer perk_id);
    
    public List<ProjPerkVO> getAll(Integer proj_id); //特定專案下的所有回饋方案
    
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

}