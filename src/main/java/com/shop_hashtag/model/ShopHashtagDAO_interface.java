package com.shop_hashtag.model;

import java.util.*;


public interface ShopHashtagDAO_interface {
	
	public void insert( ShopHashtagVO shophashtagVO);
    public void update( ShopHashtagVO shophashtagtVO);
    public void delete(Integer hashno);
    public ShopHashtagVO findByPrimaryKey(Integer hashno);
    public List<ShopHashtagVO> getAll();
    
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<ShopHashtagVO> getAll(Map<String, String[]> map);
}
