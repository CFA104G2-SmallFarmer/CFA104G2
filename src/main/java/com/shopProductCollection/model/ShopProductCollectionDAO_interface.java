package com.shopProductCollection.model;

import java.util.List;

public interface ShopProductCollectionDAO_interface {
	 public void insert(ShopProductCollectionVO shopProductCollectionVO);     
 //    public void update(ShopProductCollectionVO shopProductCollectionVO);     
     public void delete(Integer  mem_id,Integer prod_id);
     
     public ShopProductCollectionVO findByPrimaryKey(Integer  mem_id,Integer prod_id);    
     public List<ShopProductCollectionVO> getAll();    
     
//   public List<ShopProductCollectionVO> getAll(Map<String, String[]> map); 

}
