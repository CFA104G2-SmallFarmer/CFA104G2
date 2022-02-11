package com.shopProductPic.model;

import java.util.List;


public class ShopProductPicService {
	private ShopProductPicDAO_interface dao;
	
	public ShopProductPicService() {
		dao = new ShopProductPicJDBCDAO();
	}
	public ShopProductPicVO addPic(Integer prod_id, byte[] prod_pic) {
		
		ShopProductPicVO shopProductPicVO = new ShopProductPicVO();
		
		shopProductPicVO.setProd_id(prod_id);
		shopProductPicVO.setProd_pic(prod_pic);
		dao.insert(shopProductPicVO);
		
		return shopProductPicVO;
		
	}
//	public ShopProductPicVO updatePic(Integer prod_pic_id,Integer prod_id, byte[] prod_pic) {
//		
//		ShopProductPicVO shopProductPicVO = new ShopProductPicVO();
//		
//		shopProductPicVO.setProd_pic_id(prod_pic_id);
//		shopProductPicVO.setProd_id(prod_id);
//		shopProductPicVO.setProd_pic(prod_pic);
//		dao.update(shopProductPicVO);
//		
//		return shopProductPicVO;
//	}
	public void deletePic(Integer prod_pic_id) {
		dao.delete(prod_pic_id); 
	}

	public ShopProductPicVO getOnePic(Integer prod_pic_id) {
		return dao.findByPrimaryKey(prod_pic_id);
	}

	public List<ShopProductPicVO> getAll() {
		return dao.getAll();
	}

}
