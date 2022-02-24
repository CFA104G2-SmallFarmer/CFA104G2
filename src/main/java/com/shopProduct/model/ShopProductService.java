package com.shopProduct.model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.core.connectionFactory.ConnectionFactory;
import com.shopProductCollection.model.ShopProductCollectionVO;




public class ShopProductService {

	private ShopProductDAO_interface dao;
	
	public  ShopProductService() {
		dao = new ShopProductJDBCDAO();
	}
	ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection con = connectionFactory.getConnection();
	
	public ShopProductVO addProductVO(Integer f_mem_id,byte[] prod_pic,String prod_name,Integer prod_type_id,Integer prod_status,
					Integer prod_price,String prod_unit,Integer prod_qty,java.sql.Date  prod_reg_date,String prod_intro) {
		
		ShopProductVO shopProductVO = new ShopProductVO();
		
		shopProductVO.setF_mem_id(f_mem_id);
		shopProductVO.setProd_pic(prod_pic);
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
	public ShopProductVO updateProductVO(Integer prod_id,Integer f_mem_id,byte[] prod_pic,String prod_name,Integer prod_type_id,Integer prod_status,
			Integer prod_price,String prod_unit,Integer prod_qty,java.sql.Date prod_reg_date,String prod_intro) {
		
		ShopProductVO shopProductVO = new ShopProductVO();
		
		shopProductVO.setProd_id(prod_id);
		shopProductVO.setF_mem_id(f_mem_id);
		shopProductVO.setProd_pic(prod_pic);
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
	 public List<ShopProductVO> getAllByFmem(Integer f_mem_id){
		 return dao.getAllByFmem(f_mem_id);
	 }
	 
	 public List<ShopProductVO> getAllCollection(List<ShopProductCollectionVO> collectionList) {
	        List<ShopProductVO> List = new ArrayList<>();
	        ShopProductVO product;
	        for (ShopProductCollectionVO collection : collectionList){
	            product = dao.findByCollectionPrimaryKey(con, collection.getProd_id());
	            List.add(product);
	        }
	        return List;
	    }
	 
	 
	public List<ShopProductVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	public List<ShopProductVO> getPriceByFmem(Integer price1,Integer price2){
		return dao.getPriceByFmem(price1,price2);
	}
	
	
	public Map<Integer, List<ShopProductVO>> getAll_groupingBy_Prod_stataus(){
		  List<ShopProductVO> shopProductList = dao.getAll();
		  Map<Integer, List<ShopProductVO>> groupMap = new HashMap<>();
		  groupMap = shopProductList.stream().collect(Collectors.groupingBy(ShopProductVO::getProd_status));
		 
		  return groupMap;
		 }

		 
		 public static void main(String[] args) {
			 ShopProductJDBCDAO dao = new ShopProductJDBCDAO();
		 List<ShopProductVO> shopProductList = dao.getAll();
		 Map<Integer, List<ShopProductVO>> groupMap = new HashMap<>();

		 // Collect CO Executives
		 groupMap = shopProductList.stream().collect(Collectors.groupingBy(ShopProductVO::getProd_status));
		 
		 System.out.println("\n== ProjOrders by Order_state ==");
		 groupMap.forEach((k, v) -> {
		  System.out.println("\nOrder_state: " + k);
		  System.out.println(v);
		//  v.forEach(Employee::printSummary);
		 });
		}
}
