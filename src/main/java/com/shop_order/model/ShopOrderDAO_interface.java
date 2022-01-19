package com.shop_order.model;

import java.util.*;


public interface ShopOrderDAO_interface {
	 public void insert(ShopOrderVO shoporderVO);
     public void update(ShopOrderVO shoporderVO);
     public void delete(Integer order_id);
     public ShopOrderVO findByPrimaryKey(Integer order_id);
     public List<ShopOrderVO> getAll();
     //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//   public List<ShopOrderVO> getAll(Map<String, String[]> map);
}
