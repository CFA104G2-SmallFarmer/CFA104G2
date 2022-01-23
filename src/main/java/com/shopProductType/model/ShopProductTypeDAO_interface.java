package com.shopProductType.model;

import java.util.*;


public interface ShopProductTypeDAO_interface {
	public void insert(ShopProductTypeVO shopProductTypeVO);     
    public void update(ShopProductTypeVO shopProductTypeVO);     
    public void delete(Integer prod_type_id);
     
     public ShopProductTypeVO findByPrimaryKey(Integer prod_type_id);    
     public List<ShopProductTypeVO> getAll();    
     
//   public List<ShopProductTypeVO> getAll(Map<String, String[]> map); 

}
