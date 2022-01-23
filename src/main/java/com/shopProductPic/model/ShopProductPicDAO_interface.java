package com.shopProductPic.model;

import java.util.List;



public interface ShopProductPicDAO_interface {
	 public void insert(ShopProductPicVO shopProductPicVO);     
 //    public void update(ShopProductPicVO shopProductPicVO);     
     public void delete(Integer prod_pic_id);
     
     public ShopProductPicVO findByPrimaryKey(Integer prod_pic_id);    
     public List<ShopProductPicVO> getAll();    
     
//   public List<ShopProductPicVO> getAll(Map<String, String[]> map); 

}
