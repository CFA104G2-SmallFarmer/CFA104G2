package com.shopOrder.model;

import java.util.*;

import com.shopOrderDetails.model.ShopOrderDetailsVO;



public interface ShopOrderDAO_interface {
	 //新增訂單
	 public void insert(ShopOrderVO shoporderVO);
     //更新訂單
	 public void update(ShopOrderVO shoporderVO);
     //刪除訂單
	 public void delete(Integer order_id);
     //找出特定訂單號碼
	 public ShopOrderVO findByPrimaryKey(Integer order_id);
     
	 //列出會員所有訂單
	 public List<ShopOrderVO> getAllMemOrder(Integer mem_id);
	 //列出小農所有訂單
	 public List<ShopOrderVO> getAllFmemOrder(Integer f_mem_id);
	 
	 //列出所有訂單
	 public List<ShopOrderVO> getAll();
//   public List<ShopOrderVO> getAll(Map<String, String[]> map);

	//同時新增訂單與訂單明細,可用在訂單主檔與明細檔一次新增成功
     public void insertWithOrderDetails(ShopOrderVO shopOrderVO , List<ShopOrderDetailsVO> list);
}
