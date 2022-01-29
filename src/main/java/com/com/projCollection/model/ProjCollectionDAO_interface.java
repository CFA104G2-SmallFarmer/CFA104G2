package com.projCollection.model;

import java.util.List;

public interface ProjCollectionDAO_interface {
	public void insert(ProjCollectionVO projCollectionVO);
	
//    public void update(ProjCollectionVO projCollectionVO); //不需要
	
    public void delete(Integer proj_id,Integer mem_id);
    
//    public ProjCollectionVO findByPrimaryKey(Integer proj_id,Integer mem_id);//不需要

    
    public List<ProjCollectionVO> getAll(Integer mem_id);
    //呈現某會員的所有收藏
//    此處僅能獲得該會員收藏之清單，若要陳列清單內專案之圖片及簡介，
//    則須於service層再迴圈呼叫project的 GET ONE方法
    
//    對小農來說，無法知道自己的專案被收藏了幾次，因為沒有這個欄位
//    只有會員可以知道他收藏了甚麼專案
    
    
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

	

}
