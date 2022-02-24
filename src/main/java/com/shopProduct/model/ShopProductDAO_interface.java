package com.shopProduct.model;

import java.sql.Connection;
import java.util.List;
import java.util.Map;
import java.util.Set;



public interface ShopProductDAO_interface {
	public void insert(ShopProductVO shopProductVO);     
    public void update(ShopProductVO shopProductVO);     
    public void delete(Integer prod_id);
    
    public ShopProductVO findByPrimaryKey(Integer prod_id); 
    
    public List<ShopProductVO> getAll();   
    
    public List<ShopProductVO> getAllByFmem(Integer f_mem_id);
    	
    public List<ShopProductVO> getPriceByFmem(Integer price1,Integer price2); 
    
    public List<ShopProductVO> getAll(Map<String, String[]> map);
    
	public ShopProductVO findByCollectionPrimaryKey(Connection con, Integer prod_id); 
	

}
