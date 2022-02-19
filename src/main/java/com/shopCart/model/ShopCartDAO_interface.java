package com.shopCart.model;

import java.util.*;


public interface ShopCartDAO_interface {
	
	public void insert( ShopCartVO shopcarlistVO);
    public void update( ShopCartVO shopcarlistVO);
    public void delete(Integer mem_id,Integer prod_id);
    public ShopCartVO findByPrimaryKey(Integer mem_id,Integer prod_id);
    public List<ShopCartVO> getAll();
  //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ShopCarlistVO> getAll(Map<String, String[]> map);
    
  //取得指定買家的購物車集合	
    public List<ShopCartVO> getOneList(Integer mem_id);

//  拆單
    public List<ShopCartVO> getBreakeList(Integer mem_id,Integer f_mem_id);
//	public Set<ShopCartVO> getF_mem(Integer mem_id);
    //清除購物車商品
	public void deleteAllShopCart(Integer mem_id, Integer f_mem_id);
//	比對購物車是否有商品
//	public List<ShopCartVO> getcompare(Integer prod_id);


}

