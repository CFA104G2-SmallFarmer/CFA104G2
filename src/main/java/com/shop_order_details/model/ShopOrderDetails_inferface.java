package com.shop_order_details.model;

import java.util.*;


public interface ShopOrderDetails_inferface {
	 public void insert( ShopOrderDetailsVO shoporderdetailVO);
     public void update( ShopOrderDetailsVO shoporderdetailVO);
     public void delete(Integer order_id,Integer prod_id);
     public ShopOrderDetailsVO findByPrimaryKey(Integer order_id,Integer prod_id);
     public List<ShopOrderDetailsVO> getAll();
     //萬用複合查詢(傳入參數型態Map)(回傳 List)
//   public List<ShopOrderDetailsVO> getAll(Map<String, String[]> map);
}
