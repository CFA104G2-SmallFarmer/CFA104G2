package com.shopProductReport.model;

import java.util.List;

import com.shopProductPic.model.ShopProductPicVO;

public interface  ShopProductReportDAO_interface {
	 public void insert(ShopProductReportVO shopProductReportVO);     
     public void update(ShopProductReportVO shopProductReportVO);     
     public void delete(Integer prod_report_no);
     
     public ShopProductReportVO findByPrimaryKey(Integer prod_report_no);    
     public List<ShopProductReportVO> getAll();    
     
//   public List<ShopProductReportVO> getAll(Map<String, String[]> map); 

}
