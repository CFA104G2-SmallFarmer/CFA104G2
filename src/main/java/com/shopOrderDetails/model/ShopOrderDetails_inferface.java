package com.shopOrderDetails.model;

import java.util.*;

import com.shopOrder.model.ShopOrderVO;



public interface ShopOrderDetails_inferface {
	
	 public void insert( ShopOrderDetailsVO shoporderdetailVO);
     public void update( ShopOrderDetailsVO shoporderdetailVO);
     public void delete(Integer order_id,Integer prod_id);
     public ShopOrderDetailsVO findByPrimaryKey(Integer order_id,Integer prod_id);
     public List<ShopOrderDetailsVO> getAll();
     
     public List<ShopOrderDetailsVO> getPKAll(Integer order_id);
//   public List<ShopOrderDetailsVO> getAll(Map<String, String[]> map);

     //同時新增訂單與訂單明細,可用在訂單主檔與明細檔一次新增成功
     public void insert2 (ShopOrderDetailsVO shopOrderDetailsVO , java.sql.Connection con);
     
}
