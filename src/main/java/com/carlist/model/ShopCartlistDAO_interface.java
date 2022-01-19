package com.carlist.model;

import java.util.*;


public interface ShopCartlistDAO_interface {
	public void insert( ShopCartlistVO shopcarlistVO);
    public void update( ShopCartlistVO shopcarlistVO);
    public void delete(Integer mem_id,Integer prod_id);
    public ShopCartlistVO findByPrimaryKey(Integer mem_id,Integer prod_id);
    public List<ShopCartlistVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ShopCarlistVO> getAll(Map<String, String[]> map);
}
