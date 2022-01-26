package com.project.model;

import java.sql.Date;
import java.util.*;


public interface ProjectDAO_interface {
	public void insert(ProjectVO projectVO);
	
	
    public void update(ProjectVO projectVO);
//  TODO
//  要更新total count 的三個欄位，請寫在JDBC層
    
    public void delete(Integer proj_id);
    public ProjectVO findByPrimaryKey(Integer proj_id);//列出某專案
    public List<ProjectVO> getAllSameFmem(Integer f_mem_id); //列出某小農的所有專案
    public List<ProjectVO> getAll();
//    取出所有專案成細於畫面內，
//    預計在service層已狀態碼區分專案狀態
//    0: 專案募資中
//    1: 專案進行中
//    2: 專案已結束

}
