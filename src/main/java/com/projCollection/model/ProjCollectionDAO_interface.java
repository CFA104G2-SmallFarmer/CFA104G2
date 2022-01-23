package com.projCollection.model;

import java.util.List;

public interface ProjCollectionDAO_interface {
	public void insert(ProjCollectionVO projCollectionVO);
	
//    public void update(ProjCollectionVO projCollectionVO); //不需要
	
    public void delete(Integer proj_id,Integer mem_id);
    
//    public ProjCollectionVO findByPrimaryKey(Integer proj_id,Integer mem_id);//不需要

    
    public List<ProjCollectionVO> getAll(Integer mem_id);//呈現某會員的所有收藏
    
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

	

}
