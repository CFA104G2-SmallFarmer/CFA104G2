package com.shopOrder.model;

import java.util.*;


public interface ShopOrderDAO_interface {
	 public void insert(ShopOrderVO shoporderVO);
     public void update(ShopOrderVO shoporderVO);
     public void delete(Integer order_id);
     public ShopOrderVO findByPrimaryKey(Integer order_id);
     public List<ShopOrderVO> getAll();
//   public List<ShopOrderVO> getAll(Map<String, String[]> map);
}
