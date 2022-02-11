package com.shopProduct.model;

import java.util.List;


public class ShopProductService {

	private ShopProductDAO_interface dao;
	
	public  ShopProductService() {
		dao = new ShopProductJDBCDAO();
	}
	public ShopProductVO addProductVO(Integer f_mem_id,String prod_name,Integer prod_type_id,Integer prod_status,
					Integer prod_price,String prod_unit,Integer prod_qty,java.sql.Date  prod_reg_date,String prod_intro) {
		
		ShopProductVO shopProductVO = new ShopProductVO();
		
		shopProductVO.setF_mem_id(f_mem_id);
		shopProductVO.setProd_name(prod_name);
		shopProductVO.setProd_type_id(prod_type_id);
		shopProductVO.setProd_status(prod_status);
		shopProductVO.setProd_price(prod_price);
		shopProductVO.setProd_unit(prod_unit);
		shopProductVO.setProd_qty(prod_qty);
		shopProductVO.setProd_reg_date(prod_reg_date);
		shopProductVO.setProd_intro(prod_intro);
		
		
		dao.insert(shopProductVO);
		
		return  shopProductVO;
		
	}
	public ShopProductVO updateProductVO(Integer prod_id,Integer f_mem_id,String prod_name,Integer prod_type_id,Integer prod_status,
			Integer prod_price,String prod_unit,Integer prod_qty,java.sql.Date prod_reg_date,String prod_intro) {
		
		ShopProductVO shopProductVO = new ShopProductVO();
		
		shopProductVO.setProd_id(prod_id);
		shopProductVO.setF_mem_id(f_mem_id);
		shopProductVO.setProd_name(prod_name);
		shopProductVO.setProd_type_id(prod_type_id);
		shopProductVO.setProd_status(prod_status);
		shopProductVO.setProd_price(prod_price);
		shopProductVO.setProd_unit(prod_unit);
		shopProductVO.setProd_qty(prod_qty);
		shopProductVO.setProd_reg_date(prod_reg_date);
		shopProductVO.setProd_intro(prod_intro);
		dao.update(shopProductVO);
		
		return  shopProductVO;
		
	}
	public void deleteProduct(Integer prod_id) {
		dao.delete(prod_id);
		
	}
	public ShopProductVO getOneProduct(Integer prod_id) {
		return dao.findByPrimaryKey(prod_id);
	}
	public List<ShopProductVO> getAll() {
		return dao.getAll();
	}
	
}
