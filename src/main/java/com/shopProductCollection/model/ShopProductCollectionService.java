package com.shopProductCollection.model;

import java.util.List;




public class ShopProductCollectionService {
	private ShopProductCollectionDAO_interface dao;
	
	public  ShopProductCollectionService() {
		dao = new ShopProductCollectionJDBCDAO();
	}
	public ShopProductCollectionVO addCollectionVO(Integer prod_id,java.sql.Date prod_fav_date) {
		
		ShopProductCollectionVO shopProductCollectionVO = new ShopProductCollectionVO();
		
		shopProductCollectionVO.setProd_id(prod_id);
		shopProductCollectionVO.setProd_fav_date(prod_fav_date);
		
		dao.insert(shopProductCollectionVO);
		return shopProductCollectionVO;		
	}
//	public ShopProductCollectionVO updateCollection(Integer mem_id,Integer prod_id,java.sql.Date prod_fav_date) {
//		ShopProductCollectionVO shopProductCollectionVO = new ShopProductCollectionVO();
//		
//		shopProductCollectionVO.setMem_id(mem_id);
//		shopProductCollectionVO.setProd_id(prod_id);
//		shopProductCollectionVO.setProd_fav_date(prod_fav_date);
//		dao.update(shopProductCollectionVO);
//		
//		return shopProductCollectionVO;
//		
//	}
	public void deleteCollection(Integer mem_id, Integer prod_id) {
		dao.delete(mem_id,prod_id);
	}

//	public ShopProductCollectionVO getOneCollection(Integer mem_id, Integer prod_id) {
//		return dao.findByPrimaryKey(mem_id,prod_id);
//	}

	public List<ShopProductCollectionVO> getAll() {
		return dao.getAll();
	}
	
		

}
