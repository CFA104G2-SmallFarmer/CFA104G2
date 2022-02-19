package com.shopCart.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class ShopCartService {

	Set<Integer> set1 = new HashSet<Integer>();
	
	private ShopCartDAO_interface dao;
	
	public ShopCartService() {
		dao = new ShopCartJDBCDAO();
	}
	
	public ShopCartVO addShopCart(Integer mem_id,Integer prod_id,Integer f_mem_id,
			Integer cart_qty,Integer cart_unit_price) {
		
		ShopCartVO shopCartVO = new ShopCartVO();
		
		shopCartVO.setMem_id(mem_id);
		shopCartVO.setProd_id(prod_id);
		shopCartVO.setF_mem_id(f_mem_id);
		shopCartVO.setCart_qty(cart_qty);
		shopCartVO.setCart_unit_price(cart_unit_price);
		dao.insert(shopCartVO);
		
		return shopCartVO;
		
	}
	
	public ShopCartVO updateShopCart(Integer mem_id,Integer prod_id,
			Integer cart_qty,Integer cart_unit_price) {
		
		ShopCartVO shopCartVO = new ShopCartVO();
		
		shopCartVO.setMem_id(mem_id);
		shopCartVO.setProd_id(prod_id);
		shopCartVO.setCart_qty(cart_qty);
		shopCartVO.setCart_unit_price(cart_unit_price);
		dao.update(shopCartVO);
		
		return shopCartVO;
	}
	
	public void deleteShopCart(Integer mem_id,Integer prod_id) {
		dao.delete(mem_id, prod_id);
	}
	
	//用不大到.測試比對購物車
	public ShopCartVO getOneShopCart(Integer mem_id,Integer prod_id) {
		return dao.findByPrimaryKey(mem_id,prod_id);
	}
	
	public List<ShopCartVO> getALL(){
		return dao.getAll();
	}
	
	
	/////////////////////////////////////////////////////
	//取得指定買家的購物車集合
	public List<ShopCartVO> getOneList(Integer mem_id){
		return dao.getOneList(mem_id);
	}
	
//	拆單
	public List<ShopCartVO> getBreakeList(Integer mem_id,Integer f_mem_id){
		return dao.getBreakeList(mem_id,f_mem_id);
	}
	
	public List<Integer> getF_mem(Integer mem_id){
		List<ShopCartVO> list = getOneList(mem_id);
//		System.out.println(list.get(0));
//		System.out.println(list.get(1));
//		System.out.println("yyy");
		Set<Integer> set = new HashSet<Integer>();
		for (int i=0; i<list.size(); i++) {
//			set = new HashSet<ShopCartVO>(list.get(i).getF_mem_id());
			set.add(list.get(i).getF_mem_id());
		}
//		 for(Integer element : set) {
//		        System.out.println(element);
//		    }
//		 
		Set<Integer> sourceSet = set;
		List<Integer> targetList = new ArrayList<>(sourceSet);
		
//		for(Integer element : targetList) {
//	        System.out.println(element);
//	    }
		
		return targetList;
	}
	
//
//	public Map<String, List<ShopCartVO>> gropMap(Integer f_mem_id){
//		Map<String, List<ShopCartVO>> groupMap = new HashMap<>();
//
//		// Collect CO Executives
//		groupMap = (Map<String, List<ShopCartVO>>) List.stream().collect(Collectors.groupingBy(ShopCartVO::getF_mem_id));
//		groupMap.forEach((k, v) -> {
////			System.out.println("\nDept: " + k);
////			v.forEach(ShopCartVO::printSummary);
//	}
	
//  清除購物車商品
	public void deleteAllShopCart(Integer mem_id,Integer f_mem_id) {
		dao.deleteAllShopCart(mem_id, f_mem_id);
	}
	
	
}
