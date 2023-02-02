package com.projOrder.model;

import java.util.*;

public interface ProjOrderDAO_interface {
	public void insert(ProjOrderVO projOrderVO);
	
    public void update(ProjOrderVO projOrderVO);
//  只有訂單狀態改變或取消時，ORDER_STATE、ORDER_CANCEL_TIME可接受更改
    
//  TODO 還可以改以下4參數
//  ORDER_ZIPCODE 
//	ORDER_RECEIVER
//	ORDER_TEL
  //ORDER_CANCEL_REASON
    
    public void delete(Integer order_id);

// 查看單筆訂單的方法還是留著，有時間可做
//    TODO 需因應欄位增加改寫
    public ProjOrderVO findByPrimaryKey(Integer order_id);
    
    
    
// 列出會員的所有訂單
    public List<ProjOrderVO> getAllMemOrder(Integer mem_id);
    
    
// 列出小農的所有訂單
    public List<ProjOrderVO> getAllFmemOrder(Integer f_mem_id);
    
    
// 可能管理員需要列出資料庫的所有訂單，先留著
    public List<ProjOrderVO> getAll();

    ProjOrderVO findByOrderNumber(String order_number);

//  public List<ProjOrderVO> getAll(Map<String, String[]> map); 
}
