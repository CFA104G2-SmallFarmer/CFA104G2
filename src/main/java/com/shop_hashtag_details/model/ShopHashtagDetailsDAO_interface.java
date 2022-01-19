package com.shop_hashtag_details.model;

import java.util.*;


public interface ShopHashtagDetailsDAO_interface {
	
	 public void insert( ShopHashtagDetailsVO shophashtagdetailsVO);
     public void update( ShopHashtagDetailsVO shophashtagdetailsVO);
     public void delete(Integer hash_no,Integer prod_id);
     public ShopHashtagDetailsVO findByHash_no(Integer hash_no);
     public List<ShopHashtagDetailsVO> getAll();
    
     //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//   public List<ShopHashtagDetailsVO> getAll(Map<String, String[]> map);
}

