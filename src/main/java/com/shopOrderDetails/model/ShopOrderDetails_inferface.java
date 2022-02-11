package com.shopOrderDetails.model;

import java.util.*;


public interface ShopOrderDetails_inferface {
	
	 public void insert( ShopOrderDetailsVO shoporderdetailVO);
     public void update( ShopOrderDetailsVO shoporderdetailVO);
     public void delete(Integer order_id,Integer prod_id);
     public ShopOrderDetailsVO findByPrimaryKey(Integer order_id,Integer prod_id);
     public List<ShopOrderDetailsVO> getAll();
     
     public List<ShopOrderDetailsVO> getPKAll(Integer order_id);
//   public List<ShopOrderDetailsVO> getAll(Map<String, String[]> map);
}
