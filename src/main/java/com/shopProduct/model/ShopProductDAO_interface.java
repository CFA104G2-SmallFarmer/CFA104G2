package com.shopProduct.model;

import java.util.List;

import com.shopProductPic.model.ShopProductPicVO;

public interface ShopProductDAO_interface {
	public void insert(ShopProductVO shopProductVO);     
    public void update(ShopProductVO shopProductVO);     
    public void delete(Integer prod_id);
    
    public ShopProductVO findByPrimaryKey(Integer prod_id);    
    public List<ShopProductVO> getAll();    
    
//  public List<ShopProductVO> getAll(Map<String, String[]> map); 
	

}
