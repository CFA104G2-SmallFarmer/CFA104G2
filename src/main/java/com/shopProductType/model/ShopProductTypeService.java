package com.shopProductType.model;

import java.util.List;
import java.util.Set;

import com.shopProduct.model.ShopProductVO;

public class ShopProductTypeService {
	
	private  ShopProductTypeDAO_interface dao;
	
	public ShopProductTypeService() {
		dao = new ShopProductTypeJDBCDAO();
	}
	
//	public ShopProductTypeVO addType(String prod_type_name) {
//		
//		ShopProductTypeVO shopProductTypeVO = new ShopProductTypeVO();
//		
//		shopProductTypeVO.setProd_type_name(prod_type_name);
//		dao.insert(shopProductTypeVO);
//		
//		return shopProductTypeVO;
//	}
//	public ShopProductTypeVO updateType(Integer prod_type_id,String prod_type_name) {
//		
//		ShopProductTypeVO shopProductTypeVO = new ShopProductTypeVO();
//		
//		shopProductTypeVO.setProd_type_id(prod_type_id);
//		shopProductTypeVO.setProd_type_name(prod_type_name);
//		dao.update(shopProductTypeVO);
//		
//		return shopProductTypeVO;
//	}

	public List<ShopProductTypeVO > getAll() {
		return dao.getAll();
	}
	public ShopProductTypeVO  getOneType(Integer prod_type_id) {
		return dao.findByPrimaryKey(prod_type_id);
	}
	public void deleteType(Integer prod_type_id) {
		dao.delete(prod_type_id);
	}
	public Set<ShopProductVO> getProductByTypeid(Integer prod_type_id){
		return dao.getProductByTypeid(prod_type_id);
	}

}
