package com.shop_hashtag_details.model;

import java.util.*;


public interface ShopHashtagDetailsDAO_interface {
	
	 public void insert( ShopHashtagDetailsVO shophashtagdetailsVO);
     public void update( ShopHashtagDetailsVO shophashtagdetailsVO);
     public void delete(Integer hash_no,Integer prod_id);
     public ShopHashtagDetailsVO findByHash_no(Integer hash_no);
     public List<ShopHashtagDetailsVO> getAll();
    
     //萬用複合查詢(傳入參數型態Map)(回傳 List)
//   public List<ShopHashtagDetailsVO> getAll(Map<String, String[]> map);
}

